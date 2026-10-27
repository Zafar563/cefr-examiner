'use client';

import React, { useEffect, useState, useRef, useMemo, useCallback } from 'react';
import { useParams, useRouter } from 'next/navigation';
import {
  apiGetSession,
  apiGetTestDetails,
  apiSaveAnswer,
  apiSubmitSession,
  apiUploadAudio,
  TestSession,
  Test,
  Section,
  Question,
  Answer,
} from '@/lib/api';
import {
  Clock,
  CheckCircle,
  Play,
  Pause,
  Mic,
  Square,
  Send,
  AlertTriangle,
  ChevronLeft,
  ChevronRight,
  Headphones,
  BookOpen,
  Edit3,
  Filter,
  Sparkles,
  Bookmark,
  Menu,
  X,
  Check,
  ArrowLeft,
  ArrowRight,
} from 'lucide-react';
import {
  IELTS_QUESTION_CATEGORIES,
  IeltsQuestionCategory,
  getQuestionCategory,
} from '@/lib/questionTypes';

interface IeltsReadingSectionProps {
  instructionsHtml: string;
  qnumToQuestionId: Record<number, number>;
  initialAnswers: Record<number, { text: string; audioUrl: string }>;
  onSaveAnswer: (questionId: number, text: string) => void;
  onAnswerUpdated?: (questionId: number, text: string) => void;
  activeQnum?: number;
  onActiveQuestionChange?: (qnum: number) => void;
  flaggedQnums?: Set<number>;
  onToggleFlag?: (qnum: number) => void;
  className?: string;
}

function normalizeInstructionsHtml(rawHtml: string): string {
  if (!rawHtml) return '';
  let html = rawHtml;

  // 1. Remove empty question items from scraping that create awkward vertical gaps
  html = html.replace(/<div class="ielts-(?:listening|reading)-question-item">\s*<\/div>/gi, '');

  // 2. Ensure matching table rows have data-qnum and clean radio names
  html = html.replace(/<tr[^>]*class="[^"]*ielts-listening-question-item[^"]*"[^>]*>[\s\S]*?<\/tr>/gi, (row) => {
    const qnumMatch =
      row.match(/id="ielts-listening-question-number-(\d+)"/) ||
      row.match(/class="[^"]*ielts-q-badge[^"]*">(\d+)<\/strong>/) ||
      row.match(/data-qnum="(\d+)"/);
    if (!qnumMatch) return row;
    const qn = qnumMatch[1];
    return row.replace(/<input\s+type="radio"[^>]*>/gi, (radio) => {
      let r = radio;
      if (!r.includes('data-qnum=')) {
        r = r.replace(/<input\s+/i, `<input data-qnum="${qn}" `);
      }
      r = r.replace(/name="[^"]*"/i, `name="question_${qn}"`);
      return r;
    });
  });

  // 3. Transform ielts-headings-group into authentic Engnovate-style DND Matching Headings interface
  html = html.replace(/<div class="ielts-headings-group[^"]*"[^>]*>([\s\S]*?)<\/div>\s*(?=<div class="ielts-(?:reading|listening)|$)/gi, (match) => {
    // A. Collect options from select elements inside this headings group
    const firstSelectMatch = match.match(/<select[^>]*>([\s\S]*?)<\/select>/i);
    const optionsHtml = firstSelectMatch ? firstSelectMatch[1] : '';

    const headingCards: string[] = [];
    const seenValues = new Set<string>();

    const optionRegex = /<option\s+value="([^"]+)"[^>]*>([\s\S]*?)<\/option>/gi;
    let optMatch: RegExpExecArray | null;
    while ((optMatch = optionRegex.exec(optionsHtml)) !== null) {
      const val = optMatch[1].trim();
      const rawText = optMatch[2].replace(/<[^>]+>/g, '').trim();
      if (!val || val.toLowerCase().includes('tanlang') || val.toLowerCase().includes('select') || seenValues.has(val)) {
        continue;
      }
      seenValues.add(val);
      const cleanText = rawText.replace(/^[A-Z0-9ivxlcdm]+\.\s*/i, '').trim();
      headingCards.push(
        `<div class="dnd-card" draggable="true" data-value="${val}" data-text="${val}. ${cleanText}" title="Drag to paragraph in passage or click to select">` +
        `<span class="dnd-label font-bold text-blue-600 dark:text-blue-400">${val}.</span> ` +
        `<span class="dnd-text text-slate-800 dark:text-slate-200">${cleanText}</span>` +
        `</div>`
      );
    }

    let updatedGroup = match;

    // B. Replace the static List of Headings box with draggable heading-dnd-panel matching Engnovate
    if (headingCards.length > 0) {
      const dndPanelHtml =
        `<div class="heading-dnd-panel dnd-panel" data-dnd-group="headings">` +
        `<div class="dnd-panel-title font-bold text-slate-800 dark:text-slate-100 mb-1">List of Headings</div>` +
        `<div class="dnd-panel-instruction text-slate-600 dark:text-slate-400">Drag and drop the headings to the correct paragraphs in the passage.</div>` +
        `<div class="dnd-cards-container">` +
        headingCards.join('') +
        `</div>` +
        `</div>`;

      if (/<div class="bg-slate-50[^"]*border[^"]*rounded-xl[^"]*"[^>]*>[\s\S]*?<\/div>/i.test(updatedGroup)) {
        updatedGroup = updatedGroup.replace(
          /<div class="bg-slate-50[^"]*border[^"]*rounded-xl[^"]*"[^>]*>[\s\S]*?<\/div>/i,
          dndPanelHtml
        );
      }
    }

    // C. Paragraph question items:
    // Drop zones are placed directly above each paragraph in the passage on the left!
    // We keep hidden select elements for data binding and form submission
    updatedGroup = updatedGroup.replace(
      /<div class="space-y-3">([\s\S]*?)<\/div>/i,
      (_match, rowsContent) => {
        const selects: string[] = [];
        const selRegex = /<select[\s\S]*?<\/select>/gi;
        let sm;
        while ((sm = selRegex.exec(rowsContent)) !== null) {
          selects.push(sm[0].replace(/class="[^"]*"/i, 'class="sr-only" style="display:none!important;" tabindex="-1"'));
        }
        return `<div class="ielts-headings-hidden-selects sr-only" style="display:none!important;">${selects.join('')}</div>`;
      }
    );

    return updatedGroup;
  });

  // 4. Transform inline select wraps into dedicated DND dropzones (eliminate dropdown menu)
  html = html.replace(
    /<span class="ielts-inline-select-wrap">[\s\S]*?<strong class="ielts-q-badge">(\d+)<\/strong>[\s\S]*?<select([^>]*)>([\s\S]*?)<\/select>[\s\S]*?<\/span>/gi,
    (_match, qnum, selectAttrs, optionsHtml) => {
      return (
        `<span class="ielts-dnd-slot-wrap" data-qnum="${qnum}">` +
        `<strong class="ielts-q-badge">${qnum}</strong>` +
        `<span class="ielts-dnd-dropzone" data-qnum="${qnum}" role="region" aria-label="Question ${qnum} answer slot">` +
        `<span class="ielts-dnd-placeholder"><span class="dnd-dashed-box">[ ${qnum} ] Drag answer here</span></span>` +
        `<span class="ielts-dnd-placed-card" style="display: none;" draggable="true" data-qnum="${qnum}" title="Drag to move or return to word bank">` +
        `<span class="ielts-dnd-card-text"></span>` +
        `</span>` +
        `</span>` +
        `<select data-qnum="${qnum}" ${selectAttrs} class="ielts-inline-select sr-only" style="display:none!important;" tabindex="-1">${optionsHtml}</select>` +
        `</span>`
      );
    }
  );

  // 5. Clean up Uzbek placeholders and text from legacy scraped content to English
  html = html.replace(/\[(\d+)\]\s*javob\.\.\./gi, '[$1] answer...');
  html = html.replace(/placeholder=["']javob\.\.\.["']/gi, 'placeholder="answer..."');
  html = html.replace(/\bjavob\.\.\./gi, 'answer...');

  return html;
}

const IeltsReadingSection = React.memo(
  React.forwardRef<HTMLDivElement, IeltsReadingSectionProps>(function IeltsReadingSection(
    {
      instructionsHtml,
      qnumToQuestionId,
      initialAnswers,
      onSaveAnswer,
      onAnswerUpdated,
      activeQnum,
      onActiveQuestionChange,
      flaggedQnums,
      onToggleFlag,
      className,
    },
    ref
  ) {
    const localRef = useRef<HTMLDivElement | null>(null);
    const answersRef = useRef(initialAnswers);
    answersRef.current = initialAnswers;

    const qmapRef = useRef(qnumToQuestionId);
    qmapRef.current = qnumToQuestionId;

    const saveRef = useRef(onSaveAnswer);
    saveRef.current = onSaveAnswer;

    const updateRef = useRef(onAnswerUpdated);
    updateRef.current = onAnswerUpdated;

    const onActiveQChangeRef = useRef(onActiveQuestionChange);
    onActiveQChangeRef.current = onActiveQuestionChange;

    const flaggedQnumsRef = useRef(flaggedQnums);
    flaggedQnumsRef.current = flaggedQnums;

    const onToggleFlagRef = useRef(onToggleFlag);
    onToggleFlagRef.current = onToggleFlag;

    const debounceTimersRef = useRef<Record<number, NodeJS.Timeout>>({});

    const sanitizedHtml = useMemo(() => normalizeInstructionsHtml(instructionsHtml), [instructionsHtml]);

    const setRefs = (node: HTMLDivElement | null) => {
      localRef.current = node;
      if (typeof ref === 'function') {
        ref(node);
      } else if (ref) {
        (ref as React.MutableRefObject<HTMLDivElement | null>).current = node;
      }
    };

    // Highlight active question card whenever activeQnum changes
    useEffect(() => {
      const container = localRef.current;
      if (!container || !activeQnum) return;
      container.querySelectorAll('.active-q').forEach((node) => node.classList.remove('active-q'));
      const el = container.querySelector(`[data-qnum="${activeQnum}"], [data-multi-qnums*="${activeQnum}"]`);
      if (el) {
        const card = el.closest('.ielts-standalone-q') || el;
        card.classList.add('active-q');
      }
    }, [activeQnum]);

    // Update bookmark icons whenever flaggedQnums changes
    useEffect(() => {
      const container = localRef.current;
      if (!container) return;
      container.querySelectorAll<HTMLButtonElement>('.ielts-bookmark-btn').forEach((btn) => {
        const qn = Number(btn.getAttribute('data-qnum-bm'));
        const isF = flaggedQnums?.has(qn);
        btn.innerHTML = isF
          ? '<svg class="w-4 h-4 text-amber-500 fill-amber-500" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>'
          : '<svg class="w-4 h-4 text-slate-400 hover:text-amber-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>';
      });
    }, [flaggedQnums]);

    // Pre-fill answers whenever sanitizedHtml changes
    useEffect(() => {
      const container = localRef.current;
      if (!container) return;

      // Wrap any unwrapped tables in responsive containers
      const tables = container.querySelectorAll<HTMLTableElement>('table');
      tables.forEach((tbl) => {
        if (!tbl.parentElement?.classList.contains('overflow-x-auto')) {
          const wrapper = document.createElement('div');
          wrapper.className = 'overflow-x-auto my-4 rounded-xl border border-slate-200 dark:border-slate-800 shadow-xs';
          tbl.parentNode?.insertBefore(wrapper, tbl);
          wrapper.appendChild(tbl);
        }
      });

      // Ensure matching table rows have data-qnum set on radios
      const matchingRows = container.querySelectorAll<HTMLTableRowElement>('tr.ielts-listening-question-item');
      matchingRows.forEach((row) => {
        const badge = row.querySelector('.ielts-q-badge, [id*="question-number"]');
        const qnum = badge?.textContent?.trim() || badge?.id?.match(/\d+/)?.[0];
        if (qnum) {
          const radios = row.querySelectorAll<HTMLInputElement>('input[type="radio"]');
          radios.forEach((r) => {
            if (!r.getAttribute('data-qnum')) {
              r.setAttribute('data-qnum', qnum);
              r.name = `question_${qnum}`;
            }
          });
        }
      });

      const qmap = qmapRef.current;
      const answers = answersRef.current;

      // 1. Text inputs
      const textInputs = container.querySelectorAll<HTMLInputElement>('input[type="text"][data-qnum]');
      textInputs.forEach((input) => {
        const qnum = Number(input.getAttribute('data-qnum'));
        const qId = qmap[qnum];
        if (qId && answers[qId]) {
          const val = answers[qId].text || '';
          input.value = val;
          if (val) input.classList.add('answered');
          else input.classList.remove('answered');
        }
      });

      // 2. Selects & DND dropzones pre-fill
      const renderDropzoneValue = (dz: HTMLElement, val: string) => {
        const placeholder = dz.querySelector<HTMLElement>('.ielts-dnd-placeholder');
        const placed = dz.querySelector<HTMLElement>('.ielts-dnd-placed-card');
        const textSpan = dz.querySelector<HTMLElement>('.ielts-dnd-card-text');
        if (!placeholder || !placed || !textSpan) return;

        const isLong = Boolean(val && (val.trim().length > 20 || val.trim().split(/\s+/).length >= 4));

        if (val && val.trim()) {
          textSpan.textContent = val.trim();
          placeholder.style.display = 'none';
          placed.style.display = 'inline-flex';
          dz.classList.add('has-value', 'answered');
          if (isLong) {
            dz.classList.add('has-long-value');
            dz.parentElement?.classList.add('has-long-value');
          } else {
            dz.classList.remove('has-long-value');
            dz.parentElement?.classList.remove('has-long-value');
          }
        } else {
          textSpan.textContent = '';
          placeholder.style.display = 'inline-flex';
          placed.style.display = 'none';
          dz.classList.remove('has-value', 'answered', 'has-long-value');
          dz.parentElement?.classList.remove('has-long-value');
        }
      };

      const selects = container.querySelectorAll<HTMLSelectElement>('select[data-qnum]');
      selects.forEach((select) => {
        const qnum = Number(select.getAttribute('data-qnum'));
        const qId = qmap[qnum];
        const val = qId && answers[qId] ? answers[qId].text || '' : '';
        select.value = val;
        if (val) select.classList.add('answered');
        else select.classList.remove('answered');

        const dz = select.parentElement?.querySelector<HTMLElement>('.ielts-dnd-dropzone') ||
                   container.querySelector<HTMLElement>(`.ielts-dnd-dropzone[data-qnum="${qnum}"]`);
        if (dz) renderDropzoneValue(dz, val);
      });

      // 3. Radio inputs (including matching table radios)
      const radios = container.querySelectorAll<HTMLInputElement>('input[type="radio"][data-qnum]');
      radios.forEach((radio) => {
        const qnum = Number(radio.getAttribute('data-qnum'));
        const qId = qmap[qnum];
        if (qId && answers[qId]) {
          radio.checked = answers[qId].text === radio.value;
        }
      });

      // 4. Checkboxes
      const checkboxes = container.querySelectorAll<HTMLInputElement>('input[type="checkbox"][data-multi-qnums]');
      checkboxes.forEach((cb) => {
        const multiAttr = cb.getAttribute('data-multi-qnums') || '';
        const qnums = multiAttr.split(',').map(Number);
        const answersForGroup = qnums.map((qn) => {
          const qId = qmap[qn];
          return qId && answers[qId] ? answers[qId].text : '';
        });
        cb.checked = answersForGroup.includes(cb.value);
      });

      // Update .is-selected class on radio button labels for lightblue background
      container.querySelectorAll('label.ielts-radio-btn').forEach((lbl) => {
        const r = lbl.querySelector<HTMLInputElement>('input[type="radio"]');
        if (r?.checked) {
          lbl.classList.add('is-selected');
        } else {
          lbl.classList.remove('is-selected');
        }
      });

      // Update used status on DND cards in word banks
      const updateUsedCards = (root: HTMLElement) => {
        const selects = root.querySelectorAll<HTMLSelectElement>('select[data-qnum]');
        const selectedVals: string[] = [];
        selects.forEach((s) => {
          if (s.value) selectedVals.push(s.value.trim().toLowerCase());
        });
        root.querySelectorAll<HTMLElement>('.dnd-card').forEach((card) => {
          const rawText = (card.getAttribute('data-text') || card.textContent || '').trim().toLowerCase();
          const val = (card.getAttribute('data-value') || '').trim().toLowerCase();
          const isUsed = selectedVals.some(
            (sv) => sv === rawText || (val && (sv.startsWith(val + '.') || sv.startsWith(val + ' ') || sv === val))
          );
          if (isUsed) card.classList.add('is-used');
          else card.classList.remove('is-used');
        });
      };
      updateUsedCards(container);

      // Add bookmark flag button to each question card if not present
      const qCards = container.querySelectorAll('.ielts-standalone-q, tr.ielts-listening-question-item');
      qCards.forEach((card) => {
        const qnumAttr = card.getAttribute('data-qnum');
        if (!qnumAttr || card.querySelector('.ielts-bookmark-btn')) return;
        const qn = Number(qnumAttr);
        const bm = document.createElement('button');
        bm.type = 'button';
        bm.className = 'ielts-bookmark-btn absolute top-2 right-2 p-1 text-slate-400 hover:text-amber-500 cursor-pointer transition-colors';
        bm.setAttribute('data-qnum-bm', String(qn));
        bm.title = 'Bookmark';
        const isF = flaggedQnumsRef.current?.has(qn);
        bm.innerHTML = isF
          ? '<svg class="w-4 h-4 text-amber-500 fill-amber-500" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>'
          : '<svg class="w-4 h-4 text-slate-400 hover:text-amber-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path d="m19 21-7-4-7 4V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"/></svg>';
        bm.onclick = (e) => {
          e.stopPropagation();
          e.preventDefault();
          onToggleFlagRef.current?.(qn);
        };
        card.appendChild(bm);
      });
    }, [sanitizedHtml]);

    // Attach native DOM event listeners
    useEffect(() => {
      const container = localRef.current;
      if (!container) return;

      const updateUsedCards = (root: HTMLElement) => {
        const selects = root.querySelectorAll<HTMLSelectElement>('select[data-qnum]');
        const selectedVals: string[] = [];
        selects.forEach((s) => {
          if (s.value) selectedVals.push(s.value.trim().toLowerCase());
        });
        root.querySelectorAll<HTMLElement>('.dnd-card').forEach((card) => {
          const rawText = (card.getAttribute('data-text') || card.textContent || '').trim().toLowerCase();
          const val = (card.getAttribute('data-value') || '').trim().toLowerCase();
          const isUsed = selectedVals.some(
            (sv) => sv === rawText || (val && (sv.startsWith(val + '.') || sv.startsWith(val + ' ') || sv === val))
          );
          if (isUsed) card.classList.add('is-used');
          else card.classList.remove('is-used');
        });
      };

      const applyOptionToDropzone = (dz: HTMLElement, text?: string, val?: string) => {
        const qnum = Number(dz.getAttribute('data-qnum'));
        const select = dz.parentElement?.querySelector<HTMLSelectElement>('select[data-qnum]') ||
                       container.querySelector<HTMLSelectElement>(`select[data-qnum="${qnum}"]`);
        if (!select || !qnum) return;

        const tLow = (text || '').toLowerCase().trim();
        const vLow = (val || '').toLowerCase().trim();
        let matchedOptionValue = text || '';

        for (let i = 0; i < select.options.length; i++) {
          const opt = select.options[i];
          const optVal = opt.value.trim();
          const optLow = optVal.toLowerCase();
          if (!optVal) continue;

          if (
            (tLow && (optLow === tLow || optLow.startsWith(tLow) || tLow.startsWith(optLow))) ||
            (vLow && (optLow.startsWith(vLow + '.') || optLow.startsWith(vLow + ' ') || optLow === vLow))
          ) {
            matchedOptionValue = optVal;
            break;
          }
        }

        select.value = matchedOptionValue;
        select.classList.add('answered');

        const placeholder = dz.querySelector<HTMLElement>('.ielts-dnd-placeholder');
        const placed = dz.querySelector<HTMLElement>('.ielts-dnd-placed-card');
        const textSpan = dz.querySelector<HTMLElement>('.ielts-dnd-card-text');
        if (placeholder && placed && textSpan) {
          textSpan.textContent = matchedOptionValue;
          placeholder.style.display = 'none';
          placed.style.display = 'inline-flex';
          dz.classList.add('has-value', 'answered');
          dz.setAttribute('draggable', 'true');

          const isLong = Boolean(matchedOptionValue && (matchedOptionValue.trim().length > 20 || matchedOptionValue.trim().split(/\s+/).length >= 4));
          if (isLong) {
            dz.classList.add('has-long-value');
            dz.parentElement?.classList.add('has-long-value');
          } else {
            dz.classList.remove('has-long-value');
            dz.parentElement?.classList.remove('has-long-value');
          }
        }

        const qId = qmapRef.current[qnum];
        if (qId) {
          saveRef.current(qId, matchedOptionValue);
          updateRef.current?.(qId, matchedOptionValue);
        }
        if (qnum) onActiveQChangeRef.current?.(qnum);
        updateUsedCards(container);
      };

      const clearDropzone = (dz: HTMLElement) => {
        const qnum = Number(dz.getAttribute('data-qnum'));
        const select = dz.parentElement?.querySelector<HTMLSelectElement>('select[data-qnum]') ||
                       container.querySelector<HTMLSelectElement>(`select[data-qnum="${qnum}"]`);
        if (select) {
          select.value = '';
          select.classList.remove('answered');
        }

        const placeholder = dz.querySelector<HTMLElement>('.ielts-dnd-placeholder');
        const placed = dz.querySelector<HTMLElement>('.ielts-dnd-placed-card');
        const textSpan = dz.querySelector<HTMLElement>('.ielts-dnd-card-text');
        if (placeholder && placed && textSpan) {
          textSpan.textContent = '';
          placeholder.style.display = 'inline-flex';
          placed.style.display = 'none';
          dz.classList.remove('has-value', 'answered', 'has-long-value');
          dz.parentElement?.classList.remove('has-long-value');
          dz.removeAttribute('draggable');
        }

        const qId = qmapRef.current[qnum];
        if (qId) {
          saveRef.current(qId, '');
          updateRef.current?.(qId, '');
        }
        if (qnum) onActiveQChangeRef.current?.(qnum);
        updateUsedCards(container);
      };

      const handleChange = (e: Event) => {
        const target = e.target as HTMLElement;
        if (!target) return;
        const qmap = qmapRef.current;

        // Radio button change
        if (target instanceof HTMLInputElement && target.type === 'radio') {
          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmap[qnum];
          if (qId) {
            saveRef.current(qId, target.value);
            updateRef.current?.(qId, target.value);
          }
          if (qnum) onActiveQChangeRef.current?.(qnum);

          const group = target.closest('.ielts-radio-group');
          if (group) {
            group.querySelectorAll('.ielts-radio-btn').forEach((lbl) => {
              const r = lbl.querySelector<HTMLInputElement>('input[type="radio"]');
              if (r?.checked) lbl.classList.add('is-selected');
              else lbl.classList.remove('is-selected');
            });
          }
        }

        // Select dropdown change (fallback)
        if (target instanceof HTMLSelectElement) {
          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmap[qnum];
          if (qId) {
            if (target.value) target.classList.add('answered');
            else target.classList.remove('answered');
            saveRef.current(qId, target.value);
            updateRef.current?.(qId, target.value);
            updateUsedCards(container);
          }
        }

        // Checkbox change
        if (target instanceof HTMLInputElement && target.type === 'checkbox') {
          const multiAttr = target.getAttribute('data-multi-qnums');
          if (multiAttr) {
            const qnums = multiAttr.split(',').map(Number);
            const limit = Number(target.getAttribute('data-limit')) || qnums.length;
            const allCheckboxes = Array.from(
              container.querySelectorAll<HTMLInputElement>(`input[type="checkbox"][data-multi-qnums="${multiAttr}"]`)
            );
            const checkedBoxes = allCheckboxes.filter((cb) => cb.checked);

            if (checkedBoxes.length > limit) {
              target.checked = false;
              alert(`You can select a maximum of ${limit} options.`);
              return;
            }

            const selectedValues = checkedBoxes.map((cb) => cb.value);
            qnums.forEach((qn, idx) => {
              const qId = qmap[qn];
              if (qId) {
                const val = selectedValues[idx] || '';
                saveRef.current(qId, val);
                updateRef.current?.(qId, val);
              }
            });
          }
        }
      };

      // Click handling (DND card select, DND slot placement, return to bank, Radio buttons, matching table cells)
      const handleClick = (e: MouseEvent) => {
        const target = e.target as HTMLElement;
        if (!target) return;
        if (target.tagName === 'INPUT') return; // Handled by change listener

        // 1. Click on placed card in slot -> Select it for moving, swapping, or returning
        const placedContainer = target.closest<HTMLElement>('.ielts-dnd-placed-card, .ielts-dnd-dropzone.has-value');
        if (placedContainer) {
          e.stopPropagation();
          const dz = placedContainer.closest<HTMLElement>('.ielts-dnd-dropzone') || placedContainer;
          const text = dz.querySelector('.ielts-dnd-card-text')?.textContent?.trim() || '';
          const qn = dz.getAttribute('data-qnum') || '';

          // If another card from another slot was already selected -> SWAP them on click!
          if (container.dataset.selectedCardText && container.dataset.selectedCardSourceQnum && container.dataset.selectedCardSourceQnum !== qn) {
            const srcQnum = container.dataset.selectedCardSourceQnum;
            const srcDz = container.querySelector<HTMLElement>(`.ielts-dnd-dropzone[data-qnum="${srcQnum}"]`);
            if (srcDz) {
              applyOptionToDropzone(dz, container.dataset.selectedCardText, container.dataset.selectedCardVal);
              applyOptionToDropzone(srcDz, text);
            }
            delete container.dataset.selectedCardText;
            delete container.dataset.selectedCardVal;
            delete container.dataset.selectedCardSourceQnum;
            container.querySelectorAll('.dnd-card.is-card-selected, .ielts-dnd-placed-card.is-card-selected, .ielts-dnd-dropzone.is-card-selected').forEach((c) => c.classList.remove('is-card-selected'));
            return;
          }

          const isAlreadySelected = dz.classList.contains('is-card-selected');
          container.querySelectorAll('.dnd-card.is-card-selected, .ielts-dnd-placed-card.is-card-selected, .ielts-dnd-dropzone.is-card-selected').forEach((c) => c.classList.remove('is-card-selected'));

          if (!isAlreadySelected && text) {
            dz.classList.add('is-card-selected');
            dz.querySelector('.ielts-dnd-placed-card')?.classList.add('is-card-selected');
            container.dataset.selectedCardText = text;
            container.dataset.selectedCardSourceQnum = qn;
          } else {
            delete container.dataset.selectedCardText;
            delete container.dataset.selectedCardVal;
            delete container.dataset.selectedCardSourceQnum;
          }
          return;
        }

        // 2. Click on DND card in word bank (toggle card selection for Click-to-Place)
        const dndCard = target.closest<HTMLElement>('.dnd-card');
        if (dndCard) {
          const isAlreadySelected = dndCard.classList.contains('is-card-selected');
          container.querySelectorAll('.dnd-card.is-card-selected, .ielts-dnd-placed-card.is-card-selected, .ielts-dnd-dropzone.is-card-selected').forEach((c) => c.classList.remove('is-card-selected'));
          if (!isAlreadySelected) {
            dndCard.classList.add('is-card-selected');
            container.dataset.selectedCardText = dndCard.getAttribute('data-text') || dndCard.textContent?.trim() || '';
            container.dataset.selectedCardVal = dndCard.getAttribute('data-value') || '';
            delete container.dataset.selectedCardSourceQnum;
          } else {
            delete container.dataset.selectedCardText;
            delete container.dataset.selectedCardVal;
            delete container.dataset.selectedCardSourceQnum;
          }
          return;
        }

        // 3. Click on DND dropzone slot (Click-to-place, Swap, or question focus)
        const dropzone = target.closest<HTMLElement>('.ielts-dnd-dropzone');
        if (dropzone) {
          e.preventDefault();
          const qnum = Number(dropzone.getAttribute('data-qnum'));
          if (container.dataset.selectedCardText) {
            const srcQnum = container.dataset.selectedCardSourceQnum;
            const targetQnumStr = String(qnum);

            if (srcQnum && srcQnum !== targetQnumStr) {
              const srcDz = container.querySelector<HTMLElement>(`.ielts-dnd-dropzone[data-qnum="${srcQnum}"]`);
              const targetText = dropzone.querySelector('.ielts-dnd-card-text')?.textContent?.trim() || '';
              if (targetText && srcDz) {
                // Swap
                applyOptionToDropzone(dropzone, container.dataset.selectedCardText, container.dataset.selectedCardVal);
                applyOptionToDropzone(srcDz, targetText);
              } else {
                if (srcDz) clearDropzone(srcDz);
                applyOptionToDropzone(dropzone, container.dataset.selectedCardText, container.dataset.selectedCardVal);
              }
            } else if (!srcQnum) {
              applyOptionToDropzone(dropzone, container.dataset.selectedCardText, container.dataset.selectedCardVal);
            }

            delete container.dataset.selectedCardText;
            delete container.dataset.selectedCardVal;
            delete container.dataset.selectedCardSourceQnum;
            container.querySelectorAll('.dnd-card.is-card-selected, .ielts-dnd-placed-card.is-card-selected, .ielts-dnd-dropzone.is-card-selected').forEach((c) => c.classList.remove('is-card-selected'));
          } else {
            if (qnum) onActiveQChangeRef.current?.(qnum);
          }
          return;
        }

        // 4. Click on word bank when a placed card is selected -> return card to bank
        const panel = target.closest<HTMLElement>('.options-dnd-panel');
        if (panel && container.dataset.selectedCardSourceQnum) {
          const srcDz = container.querySelector<HTMLElement>(`.ielts-dnd-dropzone[data-qnum="${container.dataset.selectedCardSourceQnum}"]`);
          if (srcDz) clearDropzone(srcDz);
          delete container.dataset.selectedCardText;
          delete container.dataset.selectedCardVal;
          delete container.dataset.selectedCardSourceQnum;
          container.querySelectorAll('.dnd-card.is-card-selected, .ielts-dnd-placed-card.is-card-selected, .ielts-dnd-dropzone.is-card-selected').forEach((c) => c.classList.remove('is-card-selected'));
          return;
        }

        const radioLabel = target.closest<HTMLLabelElement>('.ielts-radio-btn');
        if (radioLabel) {
          const radio = radioLabel.querySelector<HTMLInputElement>('input[type="radio"]');
          if (radio && !radio.checked) {
            radio.checked = true;
            const qnum = Number(radio.getAttribute('data-qnum'));
            const qId = qmapRef.current[qnum];
            if (qId) {
              saveRef.current(qId, radio.value);
              updateRef.current?.(qId, radio.value);
            }
            if (qnum) onActiveQChangeRef.current?.(qnum);

            const group = radioLabel.closest('.ielts-radio-group');
            if (group) {
              group.querySelectorAll('.ielts-radio-btn').forEach((lbl) => {
                const r = lbl.querySelector<HTMLInputElement>('input[type="radio"]');
                if (r?.checked) lbl.classList.add('is-selected');
                else lbl.classList.remove('is-selected');
              });
            }
          }
          return;
        }

        // Click on matching table option cell
        const matchingCell = target.closest<HTMLTableCellElement>('.ielts-listening-matching-option-cell, .ielts-reading-matching-table td');
        if (matchingCell) {
          const radio = matchingCell.querySelector<HTMLInputElement>('input[type="radio"]');
          if (radio && !radio.checked) {
            radio.checked = true;
            const qnum = Number(radio.getAttribute('data-qnum'));
            const qId = qmapRef.current[qnum];
            if (qId) {
              saveRef.current(qId, radio.value);
              updateRef.current?.(qId, radio.value);
            }
            if (qnum) onActiveQChangeRef.current?.(qnum);
          }
          return;
        }
      };

      // Native HTML5 Drag and Drop handlers
      const handleDragStart = (e: DragEvent) => {
        const target = e.target as HTMLElement;

        // A) Dragging a card from the word bank
        const card = target?.closest('.dnd-card') as HTMLElement | null;
        if (card) {
          const text = card.getAttribute('data-text') || card.textContent?.trim() || '';
          const val = card.getAttribute('data-value') || '';
          if (e.dataTransfer) {
            e.dataTransfer.setData('text/plain', text);
            e.dataTransfer.setData('application/x-dnd-value', val);
            e.dataTransfer.effectAllowed = 'copyMove';
          }
          card.classList.add('is-dragging');
          return;
        }

        // B) Dragging an already placed card from a slot (to move elsewhere or return to bank)
        const placedContainer = target?.closest('.ielts-dnd-placed-card, .ielts-dnd-dropzone.has-value') as HTMLElement | null;
        if (placedContainer) {
          const dz = placedContainer.closest<HTMLElement>('.ielts-dnd-dropzone') || placedContainer;
          const text = dz.querySelector('.ielts-dnd-card-text')?.textContent?.trim() || 
                       dz.parentElement?.querySelector('select')?.value || '';
          const srcQnum = dz.getAttribute('data-qnum') || '';
          if (e.dataTransfer && text) {
            e.dataTransfer.setData('text/plain', text);
            e.dataTransfer.setData('application/x-source-qnum', srcQnum);
            e.dataTransfer.setData('application/x-dnd-value', text);
            e.dataTransfer.effectAllowed = 'copyMove';
          }
          dz.classList.add('is-dragging');
          dz.querySelector('.ielts-dnd-placed-card')?.classList.add('is-dragging');
          return;
        }
      };

      const handleDragEnd = () => {
        container.querySelectorAll('.is-dragging').forEach((c) => c.classList.remove('is-dragging'));
        container.querySelectorAll('.dnd-drop-active').forEach((el) => el.classList.remove('dnd-drop-active'));
        container.querySelectorAll('.dnd-panel-hover').forEach((el) => el.classList.remove('dnd-panel-hover'));
      };

      const handleDragOver = (e: DragEvent) => {
        const target = e.target as HTMLElement;
        const dropZone = target?.closest('.ielts-dnd-dropzone') as HTMLElement | null;
        if (dropZone) {
          e.preventDefault();
          if (e.dataTransfer) e.dataTransfer.dropEffect = 'copy';
          dropZone.classList.add('dnd-drop-active');
          return;
        }

        const panel = target?.closest('.options-dnd-panel') as HTMLElement | null;
        if (panel) {
          e.preventDefault();
          if (e.dataTransfer) e.dataTransfer.dropEffect = 'move';
          panel.classList.add('dnd-panel-hover');
          return;
        }
      };

      const handleDragLeave = (e: DragEvent) => {
        const target = e.target as HTMLElement;
        const dropZone = target?.closest('.ielts-dnd-dropzone') as HTMLElement | null;
        if (dropZone && !dropZone.contains(e.relatedTarget as Node)) {
          dropZone.classList.remove('dnd-drop-active');
        }

        const panel = target?.closest('.options-dnd-panel') as HTMLElement | null;
        if (panel && !panel.contains(e.relatedTarget as Node)) {
          panel.classList.remove('dnd-panel-hover');
        }
      };

      const handleDrop = (e: DragEvent) => {
        const target = e.target as HTMLElement;
        const dropZone = target?.closest('.ielts-dnd-dropzone') as HTMLElement | null;
        const panel = target?.closest('.options-dnd-panel') as HTMLElement | null;

        // 1. Dropped onto the word bank panel -> Return to bank (clear the source slot)
        if (panel) {
          e.preventDefault();
          panel.classList.remove('dnd-panel-hover');
          const srcQnum = e.dataTransfer?.getData('application/x-source-qnum');
          if (srcQnum) {
            const srcDz = container.querySelector<HTMLElement>(`.ielts-dnd-dropzone[data-qnum="${srcQnum}"]`);
            if (srcDz) clearDropzone(srcDz);
          }
          return;
        }

        // 2. Dropped onto a slot
        if (dropZone) {
          e.preventDefault();
          dropZone.classList.remove('dnd-drop-active');

          const text = e.dataTransfer?.getData('text/plain')?.trim();
          const cardVal = e.dataTransfer?.getData('application/x-dnd-value')?.trim();
          const srcQnum = e.dataTransfer?.getData('application/x-source-qnum');
          const targetQnum = dropZone.getAttribute('data-qnum');

          // Dropped on the same slot -> no change
          if (srcQnum && targetQnum && srcQnum === targetQnum) {
            return;
          }

          // If moved from another slot
          if (srcQnum && srcQnum !== targetQnum) {
            const srcDz = container.querySelector<HTMLElement>(`.ielts-dnd-dropzone[data-qnum="${srcQnum}"]`);
            const targetText = dropZone.querySelector('.ielts-dnd-card-text')?.textContent?.trim() || '';

            if (targetText && srcDz) {
              // Both slots have cards -> SWAP them!
              applyOptionToDropzone(dropZone, text, cardVal);
              applyOptionToDropzone(srcDz, targetText);
            } else {
              // Target was empty -> Move card and clear source
              if (srcDz) clearDropzone(srcDz);
              if (text || cardVal) {
                applyOptionToDropzone(dropZone, text, cardVal);
              }
            }
            return;
          }

          // Normal drag from word bank into slot
          if (text || cardVal) {
            applyOptionToDropzone(dropZone, text, cardVal);
          }
        }
      };

      // Text input typing (updates answered style immediately and debounces saving)
      const handleInput = (e: Event) => {
        const target = e.target as HTMLElement;
        if (target instanceof HTMLInputElement && target.type === 'text') {
          const val = target.value;
          if (val.trim()) target.classList.add('answered');
          else target.classList.remove('answered');

          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmapRef.current[qnum];
          if (qId) {
            updateRef.current?.(qId, val);
            if (debounceTimersRef.current[qId]) {
              clearTimeout(debounceTimersRef.current[qId]);
            }
            debounceTimersRef.current[qId] = setTimeout(() => {
              saveRef.current(qId, val.trim());
              delete debounceTimersRef.current[qId];
            }, 600);
          }
          if (qnum) onActiveQChangeRef.current?.(qnum);
        }
      };

      // Focus out (blur) saves immediately and cancels debounce
      const handleFocusOut = (e: FocusEvent) => {
        const target = e.target as HTMLElement;
        if (target instanceof HTMLInputElement && target.type === 'text') {
          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmapRef.current[qnum];
          if (qId) {
            if (debounceTimersRef.current[qId]) {
              clearTimeout(debounceTimersRef.current[qId]);
              delete debounceTimersRef.current[qId];
            }
            const val = target.value.trim();
            saveRef.current(qId, val);
            updateRef.current?.(qId, val);
          }
        }
      };

      const handleFocusIn = (e: FocusEvent) => {
        const target = e.target as HTMLElement;
        const qEl = target.closest('[data-qnum]');
        if (qEl) {
          const qn = Number(qEl.getAttribute('data-qnum'));
          if (qn) onActiveQChangeRef.current?.(qn);
        }
      };

      // Enter key blurs and triggers focusout
      const handleKeyDown = (e: KeyboardEvent) => {
        const target = e.target as HTMLElement;
        if (target instanceof HTMLInputElement && target.type === 'text') {
          if (e.key === 'Enter') {
            e.preventDefault();
            target.blur();
          }
        }
      };

      container.addEventListener('change', handleChange);
      container.addEventListener('click', handleClick);
      container.addEventListener('input', handleInput);
      container.addEventListener('focusin', handleFocusIn);
      container.addEventListener('focusout', handleFocusOut);
      container.addEventListener('keydown', handleKeyDown);
      container.addEventListener('dragstart', handleDragStart);
      container.addEventListener('dragend', handleDragEnd);
      container.addEventListener('dragover', handleDragOver);
      container.addEventListener('dragleave', handleDragLeave);
      container.addEventListener('drop', handleDrop);

      return () => {
        Object.values(debounceTimersRef.current).forEach(clearTimeout);
        debounceTimersRef.current = {};
        container.removeEventListener('change', handleChange);
        container.removeEventListener('click', handleClick);
        container.removeEventListener('input', handleInput);
        container.removeEventListener('focusin', handleFocusIn);
        container.removeEventListener('focusout', handleFocusOut);
        container.removeEventListener('keydown', handleKeyDown);
        container.removeEventListener('dragstart', handleDragStart);
        container.removeEventListener('dragend', handleDragEnd);
        container.removeEventListener('dragover', handleDragOver);
        container.removeEventListener('dragleave', handleDragLeave);
        container.removeEventListener('drop', handleDrop);
      };
    }, []);

    return (
      <div
        ref={setRefs}
        className={className || "bg-white rounded-2xl border border-slate-200 p-6 shadow-sm lg:sticky lg:top-40 max-h-[70vh] overflow-y-auto"}
        dangerouslySetInnerHTML={{ __html: sanitizedHtml }}
      />
    );
  }),
  (prevProps, nextProps) => {
    // Only re-render if the instructions HTML changed (e.g. section switched)
    return prevProps.instructionsHtml === nextProps.instructionsHtml;
  }
);

function getSectionShortLabel(sec: Section, index: number): string {
  if (sec.type === 'listening') {
    const m = sec.title?.match(/(?:Part|Section)\s*(\d+)/i);
    return m ? `Section ${m[1]}` : `Section ${index + 1}`;
  }
  if (sec.type === 'reading') {
    const m = sec.title?.match(/(?:Passage|Part)\s*(\d+)/i);
    return m ? `Passage ${m[1]}` : `Passage ${index + 1}`;
  }
  if (sec.type === 'writing') {
    const m = sec.title?.match(/(?:Task|Part)\s*(\d+)/i);
    return m ? `Task ${m[1]}` : `Task ${index + 1}`;
  }
  if (sec.type === 'speaking') {
    const m = sec.title?.match(/(?:Part|Section)\s*(\d+)/i);
    return m ? `Part ${m[1]}` : `Part ${index + 1}`;
  }
  return sec.title || `Section ${index + 1}`;
}

export default function TestTakingPage() {
  const params = useParams();
  const router = useRouter();
  const rawId = params?.id;
  const sessionId = rawId ? Number(rawId) : NaN;

  const [mounted, setMounted] = useState(false);
  const [session, setSession] = useState<TestSession | null>(null);
  const [test, setTest] = useState<Test | null>(null);
  const [loading, setLoading] = useState(true);
  const [errorMessage, setErrorMessage] = useState('');
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0);
  const [targetSectionFilter, setTargetSectionFilter] = useState<number | null>(null);

  // Answers state mapped by questionId -> { text: string, audioUrl: string }
  const [answersMap, setAnswersMap] = useState<Record<number, { text: string; audioUrl: string }>>({});
  const [savingQuestionId, setSavingQuestionId] = useState<number | null>(null);

  // Options (Contrast & Text Size) Modal State
  type ContrastMode = 'black_on_white' | 'white_on_black' | 'yellow_on_black';
  type TextSizeMode = 'regular' | 'large' | 'extra_large';

  const [contrastMode, setContrastMode] = useState<ContrastMode>('black_on_white');
  const [textSizeMode, setTextSizeMode] = useState<TextSizeMode>('regular');
  const [optionsMenuOpen, setOptionsMenuOpen] = useState(false);
  const [optionsSubView, setOptionsSubView] = useState<'main' | 'contrast' | 'text_size'>('main');

  // Load saved preferences from localStorage on mount
  useEffect(() => {
    try {
      const savedContrast = localStorage.getItem('cefr_contrast_mode') as ContrastMode;
      if (savedContrast && ['black_on_white', 'white_on_black', 'yellow_on_black'].includes(savedContrast)) {
        setContrastMode(savedContrast);
      }
      const savedTextSize = localStorage.getItem('cefr_text_size_mode') as TextSizeMode;
      if (savedTextSize && ['regular', 'large', 'extra_large'].includes(savedTextSize)) {
        setTextSizeMode(savedTextSize);
      }
    } catch (e) {}
  }, []);

  const handleSelectContrast = (mode: ContrastMode) => {
    setContrastMode(mode);
    try {
      localStorage.setItem('cefr_contrast_mode', mode);
    } catch (e) {}
  };

  const handleSelectTextSize = (mode: TextSizeMode) => {
    setTextSizeMode(mode);
    try {
      localStorage.setItem('cefr_text_size_mode', mode);
    } catch (e) {}
  };

  const isWhiteOnBlack = contrastMode === 'white_on_black';
  const isYellowOnBlack = contrastMode === 'yellow_on_black';
  const isDarkContrast = isWhiteOnBlack || isYellowOnBlack;

  // Instructions Modal (shown before starting the test)
  const [showInstructionsModal, setShowInstructionsModal] = useState<boolean>(true);

  // Check if student has already dismissed instructions for this session
  useEffect(() => {
    if (isNaN(sessionId)) return;
    try {
      const seen = sessionStorage.getItem(`cefr_test_instructions_seen_${sessionId}`);
      if (seen === 'true') {
        setShowInstructionsModal(false);
      }
    } catch (e) {}
  }, [sessionId]);

  const handleBeginTest = () => {
    setShowInstructionsModal(false);
    try {
      sessionStorage.setItem(`cefr_test_instructions_seen_${sessionId}`, 'true');
    } catch (e) {}
  };

  // Timer state
  const [secondsRemaining, setSecondsRemaining] = useState<number>(7200);

  // Listening state: audio play limiter (max 2 plays)
  const [audioPlaysLeft, setAudioPlaysLeft] = useState<Record<number, number>>({});
  const [hasStartedCurrentPlay, setHasStartedCurrentPlay] = useState<Record<number, boolean>>({});
  const [isPlayingAudio, setIsPlayingAudio] = useState(false);
  const audioRef = useRef<HTMLAudioElement | null>(null);

  // Speaking state: Web Audio / MediaRecorder
  const [recordingQuestionId, setRecordingQuestionId] = useState<number | null>(null);
  const [recordingSeconds, setRecordingSeconds] = useState(0);
  const mediaRecorderRef = useRef<MediaRecorder | null>(null);
  const audioChunksRef = useRef<Blob[]>([]);
  const [recordedAudios, setRecordedAudios] = useState<Record<number, { blobUrl: string; isSaved: boolean }>>({});
  const [isUploadingVoice, setIsUploadingVoice] = useState(false);

  // Submitting modal
  const [showSubmitModal, setShowSubmitModal] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  // IELTS authentic reading container ref
  const ieltsContainerRef = useRef<HTMLDivElement | null>(null);

  // Resizable split ratio (percentage for left passage pane, 25% - 75%)
  const [splitRatio, setSplitRatio] = useState<number>(50);
  const isResizingRef = useRef(false);

  // Active question number & flagged/bookmarked questions
  const [activeQnum, setActiveQnum] = useState<number>(1);
  const [flaggedQnums, setFlaggedQnums] = useState<Set<number>>(new Set());

  const toggleFlag = (qn: number) => {
    setFlaggedQnums((prev) => {
      const next = new Set(prev);
      if (next.has(qn)) next.delete(qn);
      else next.add(qn);
      return next;
    });
  };

  const handleMouseDownResize = (e: React.MouseEvent) => {
    e.preventDefault();
    isResizingRef.current = true;
    document.body.style.cursor = 'col-resize';
    document.body.style.userSelect = 'none';

    const onMouseMove = (moveEvent: MouseEvent) => {
      if (!isResizingRef.current) return;
      const container = document.getElementById('ielts-reading-split-container');
      if (!container) return;
      const rect = container.getBoundingClientRect();
      const newRatio = ((moveEvent.clientX - rect.left) / rect.width) * 100;
      if (newRatio >= 25 && newRatio <= 75) {
        setSplitRatio(newRatio);
      }
    };

    const onMouseUp = () => {
      isResizingRef.current = false;
      document.body.style.cursor = '';
      document.body.style.userSelect = '';
      window.removeEventListener('mousemove', onMouseMove);
      window.removeEventListener('mouseup', onMouseUp);
    };

    window.addEventListener('mousemove', onMouseMove);
    window.addEventListener('mouseup', onMouseUp);
  };

  const sections = Array.isArray(test?.sections) ? test.sections : [];
  const currentSection = sections[currentSectionIndex] || null;

  // Question type filter state
  const [selectedQuestionTypeFilter, setSelectedQuestionTypeFilter] = useState<IeltsQuestionCategory>('all');

  const sectionQuestions = useMemo(() => {
    return Array.isArray(currentSection?.questions) ? currentSection.questions : [];
  }, [currentSection]);

  const { minQ, maxQ } = useMemo(() => {
    if (sectionQuestions.length === 0) return { minQ: 1, maxQ: 13 };
    const qnums = sectionQuestions.map((q) => q.order_index);
    return {
      minQ: Math.min(...qnums),
      maxQ: Math.max(...qnums),
    };
  }, [sectionQuestions]);

  const activeWritingQ = useMemo(() => {
    return sectionQuestions.find((q) => q.order_index === activeQnum) || sectionQuestions[0];
  }, [sectionQuestions, activeQnum]);

  const activeSpeakingQ = useMemo(() => {
    return sectionQuestions.find((q) => q.order_index === activeQnum) || sectionQuestions[0];
  }, [sectionQuestions, activeQnum]);

  // Set initial activeQnum when section changes
  useEffect(() => {
    if (sectionQuestions.length > 0) {
      const qnums = sectionQuestions.map((q) => q.order_index);
      setActiveQnum(Math.min(...qnums));
    }
  }, [currentSectionIndex, sectionQuestions]);

  const handlePrevQuestion = () => {
    if (activeQnum > minQ) {
      scrollToQuestion(activeQnum - 1);
    } else if (currentSectionIndex > 0) {
      handleSectionChange(currentSectionIndex - 1);
    }
  };

  const handleNextQuestion = () => {
    if (activeQnum < maxQ) {
      scrollToQuestion(activeQnum + 1);
    } else if (currentSectionIndex < sections.length - 1) {
      handleSectionChange(currentSectionIndex + 1);
    }
  };

  const categoryCounts = useMemo(() => {
    const counts: Partial<Record<IeltsQuestionCategory, number>> = { all: sectionQuestions.length };
    sectionQuestions.forEach((q) => {
      const cat = getQuestionCategory(q);
      counts[cat] = (counts[cat] || 0) + 1;
    });
    return counts;
  }, [sectionQuestions]);

  const availableCategories = useMemo(() => {
    const cats: IeltsQuestionCategory[] = ['all'];
    (Object.keys(IELTS_QUESTION_CATEGORIES) as IeltsQuestionCategory[]).forEach((cat) => {
      if (cat !== 'all' && (categoryCounts[cat] || 0) > 0) {
        cats.push(cat);
      }
    });
    return cats;
  }, [categoryCounts]);

  const filteredQuestions = useMemo(() => {
    if (selectedQuestionTypeFilter === 'all') return sectionQuestions;
    return sectionQuestions.filter((q) => getQuestionCategory(q) === selectedQuestionTypeFilter);
  }, [sectionQuestions, selectedQuestionTypeFilter]);

  const filteredQnums = useMemo(() => {
    return new Set(filteredQuestions.map((q) => q.order_index));
  }, [filteredQuestions]);

  // Reset filter when changing section
  useEffect(() => {
    setSelectedQuestionTypeFilter('all');
  }, [currentSectionIndex]);

  // Sync IELTS container highlighting when filter changes
  useEffect(() => {
    if (!ieltsContainerRef.current) return;
    const container = ieltsContainerRef.current;

    const allQuestionNodes = container.querySelectorAll<HTMLElement>(
      '.ielts-reading-question-item, .ielts-listening-question-item, tr[data-qnum], table tr'
    );

    if (selectedQuestionTypeFilter === 'all') {
      allQuestionNodes.forEach((node) => {
        node.style.opacity = '1';
        node.style.filter = 'none';
        node.classList.remove('ring-2', 'ring-emerald-500', 'ring-offset-2', 'bg-emerald-50/40', 'dark:bg-emerald-950/30', 'rounded-xl');
      });
      return;
    }

    let firstMatchedEl: HTMLElement | null = null;

    allQuestionNodes.forEach((node) => {
      const qnums: number[] = [];
      const directQnum = node.getAttribute('data-qnum');
      if (directQnum) qnums.push(Number(directQnum));

      const multiQnums = node.getAttribute('data-multi-qnums');
      if (multiQnums) {
        multiQnums.split(',').forEach((n) => {
          const num = Number(n.trim());
          if (num && !qnums.includes(num)) qnums.push(num);
        });
      }

      const innerInputs = node.querySelectorAll<HTMLInputElement | HTMLSelectElement>('[data-qnum]');
      innerInputs.forEach((inp) => {
        const num = Number(inp.getAttribute('data-qnum'));
        if (num && !qnums.includes(num)) qnums.push(num);
      });

      const badges = node.querySelectorAll('.ielts-q-badge, strong');
      badges.forEach((b) => {
        const num = Number(b.textContent?.trim());
        if (num && !isNaN(num) && num > 0 && num <= 40 && !qnums.includes(num)) {
          qnums.push(num);
        }
      });

      if (qnums.length === 0) return;

      const isMatch = qnums.some((qn) => filteredQnums.has(qn));

      if (isMatch) {
        node.style.opacity = '1';
        node.style.filter = 'none';
        node.style.transition = 'all 0.3s ease';
        node.classList.add('ring-2', 'ring-emerald-500', 'ring-offset-2', 'bg-emerald-50/40', 'dark:bg-emerald-950/30', 'rounded-xl');
        if (!firstMatchedEl) {
          firstMatchedEl = node;
        }
      } else {
        node.style.opacity = '0.25';
        node.style.filter = 'grayscale(80%)';
        node.style.transition = 'all 0.3s ease';
        node.classList.remove('ring-2', 'ring-emerald-500', 'ring-offset-2', 'bg-emerald-50/40', 'dark:bg-emerald-950/30', 'rounded-xl');
      }
    });

    if (firstMatchedEl) {
      (firstMatchedEl as HTMLElement).scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
  }, [selectedQuestionTypeFilter, filteredQnums, currentSectionIndex]);

  // Map question number (1..40) to question ID for the current active section
  const qnumToQuestionId = useMemo(() => {
    const map: Record<number, number> = {};
    if (currentSection && Array.isArray(currentSection.questions)) {
      currentSection.questions.forEach((q) => {
        map[q.order_index] = q.id;
      });
    }
    return map;
  }, [currentSection]);

  // Handler for live answer changes to update UI state immediately
  const handleLiveAnswerUpdate = (questionId: number, text: string) => {
    setAnswersMap((prev) => ({
      ...prev,
      [questionId]: { text, audioUrl: prev[questionId]?.audioUrl || '' },
    }));
  };

  const pendingAnswersRef = useRef<Record<number, { text: string; audioUrl: string }>>({});
  const saveTimeoutRef = useRef<NodeJS.Timeout | null>(null);

  const flushAnswers = useCallback(async () => {
    if (isNaN(sessionId)) return;

    if (ieltsContainerRef.current) {
      const inputs = ieltsContainerRef.current.querySelectorAll<HTMLInputElement>('input[type="text"][data-qnum]');
      inputs.forEach((input) => {
        const qnum = Number(input.getAttribute('data-qnum'));
        const qId = qnumToQuestionId[qnum];
        if (qId && input.value !== undefined) {
          pendingAnswersRef.current[qId] = {
            text: input.value.trim(),
            audioUrl: '',
          };
        }
      });
    }

    if (saveTimeoutRef.current) {
      clearTimeout(saveTimeoutRef.current);
      saveTimeoutRef.current = null;
    }

    const pending = { ...pendingAnswersRef.current };
    pendingAnswersRef.current = {};

    const questionIds = Object.keys(pending).map(Number);
    if (questionIds.length === 0) return;

    const promises = questionIds.map(async (qId) => {
      const item = pending[qId];
      try {
        await apiSaveAnswer(sessionId, qId, item.text, item.audioUrl);
      } catch (e) {
        console.error(`Failed to flush answer for question ${qId}:`, e);
      }
    });

    await Promise.all(promises);
  }, [sessionId, qnumToQuestionId]);

  const handleSectionChange = async (idx: number) => {
    await flushAnswers();
    setCurrentSectionIndex(idx);
  };

  const scrollToQuestion = (qnum: number) => {
    setActiveQnum(qnum);

    // 1. Check if there's a heading drop zone in the passage pane on the left
    const passageDropZone = document.querySelector<HTMLElement>(
      `.heading-drop-zone[data-qnum="${qnum}"], [id="ielts-reading-question-number-${qnum}"]`
    );
    if (passageDropZone) {
      passageDropZone.scrollIntoView({ behavior: 'smooth', block: 'center' });
      passageDropZone.classList.add('ring-2', 'ring-blue-500', 'ring-offset-2');
      setTimeout(() => {
        passageDropZone.classList.remove('ring-2', 'ring-blue-500', 'ring-offset-2');
      }, 1500);
    }

    // 2. Also check right questions pane
    if (ieltsContainerRef.current) {
      const el = ieltsContainerRef.current.querySelector(
        `[data-qnum="${qnum}"], [data-multi-qnums*="${qnum}"]`
      );
      if (el) {
        ieltsContainerRef.current.querySelectorAll('.active-q').forEach((node) => node.classList.remove('active-q'));
        const card = el.closest('.ielts-standalone-q') || el;
        card.classList.add('active-q');
        el.scrollIntoView({ behavior: 'smooth', block: 'center' });
        if (el instanceof HTMLElement) {
          el.focus();
        }
        return;
      }
    }
    const standardEl = document.getElementById(`question-card-${qnum}`);
    if (standardEl) {
      standardEl.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
  };

  useEffect(() => {
    setMounted(true);
    if (typeof window !== 'undefined') {
      const urlParams = new URLSearchParams(window.location.search);
      const secParam = urlParams.get('section');
      if (secParam !== null) {
        const secIdx = parseInt(secParam, 10);
        if (!isNaN(secIdx) && secIdx >= 0) {
          setTargetSectionFilter(secIdx);
          setCurrentSectionIndex(secIdx);
        }
      }
    }
    if (!isNaN(sessionId) && sessionId > 0) {
      loadTestSession(sessionId);
    } else {
      setErrorMessage('Yaroqsiz test sessiya identifikatori.');
      setLoading(false);
    }
  }, [sessionId]);

  // Load session and test data
  const loadTestSession = async (sId: number) => {
    setLoading(true);
    setErrorMessage('');
    try {
      const sess = await apiGetSession(sId);
      if (!sess || !sess.id) {
        throw new Error('Test session not found');
      }

      if (sess.status !== 'in_progress') {
        router.push(`/student/results/${sId}`);
        return;
      }
      setSession(sess);

      const testData = await apiGetTestDetails(sess.test_id);
      setTest(testData);

      // Check if target section was requested in URL query
      if (typeof window !== 'undefined') {
        const urlParams = new URLSearchParams(window.location.search);
        const secParam = urlParams.get('section');
        if (secParam !== null) {
          const secIdx = parseInt(secParam, 10);
          if (!isNaN(secIdx) && secIdx >= 0 && secIdx < (testData.sections?.length || 0)) {
            setCurrentSectionIndex(secIdx);
            setTargetSectionFilter(secIdx);
          }
        }
      }

      // Prepopulate existing answers
      const map: Record<number, { text: string; audioUrl: string }> = {};
      if (Array.isArray(sess.answers)) {
        sess.answers.forEach((ans) => {
          if (ans && ans.question_id) {
            map[ans.question_id] = {
              text: ans.user_answer_text || '',
              audioUrl: ans.audio_file_url || '',
            };
          }
        });
      }
      setAnswersMap(map);

      // Calculate remaining seconds safely
      let diffSecs = 7200;
      if (sess.expires_at) {
        const expiresAt = new Date(sess.expires_at).getTime();
        if (!isNaN(expiresAt)) {
          diffSecs = Math.max(0, Math.floor((expiresAt - Date.now()) / 1000));
        }
      }
      if (diffSecs <= 0) {
        alert('This test session has expired. Redirecting to the results page.');
        router.push(`/student/results/${sId}`);
        return;
      }
      setSecondsRemaining(diffSecs);
    } catch (err: any) {
      setErrorMessage(err.message || 'An error occurred while loading the test session.');
    } finally {
      setLoading(false);
    }
  };

  // Timer countdown
  useEffect(() => {
    if (!mounted || secondsRemaining <= 0 || showInstructionsModal) return;
    const timer = setInterval(() => {
      setSecondsRemaining((prev) => {
        if (prev <= 1) {
          clearInterval(timer);
          handleAutoSubmit();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => clearInterval(timer);
  }, [mounted, secondsRemaining, showInstructionsModal]);

  const handleAutoSubmit = async () => {
    alert('Time is up! Your test is being submitted automatically...');
    await flushAnswers();
    await submitTest();
  };

  const submitTest = async () => {
    if (isNaN(sessionId)) return;
    setSubmitting(true);
    try {
      await flushAnswers();
      await apiSubmitSession(sessionId);
      router.push(`/student/results/${sessionId}`);
    } catch (e: any) {
      alert('Error submitting test: ' + (e.message || 'Server error'));
      setSubmitting(false);
    }
  };

  // Autosave handler with debounce for typing and immediate save for selections
  const handleSaveAnswer = useCallback(
    (questionId: number, text: string, audioUrl: string = '', immediate = false) => {
      if (isNaN(sessionId)) return;
      setAnswersMap((prev) => ({
        ...prev,
        [questionId]: { text, audioUrl: audioUrl || prev[questionId]?.audioUrl || '' },
      }));

      pendingAnswersRef.current[questionId] = {
        text,
        audioUrl: audioUrl || answersMap[questionId]?.audioUrl || '',
      };

      if (saveTimeoutRef.current) {
        clearTimeout(saveTimeoutRef.current);
      }

      if (immediate) {
        const item = pendingAnswersRef.current[questionId];
        delete pendingAnswersRef.current[questionId];
        setSavingQuestionId(questionId);
        apiSaveAnswer(sessionId, questionId, item.text, item.audioUrl)
          .catch((e) => console.error('Failed to autosave answer immediately:', e))
          .finally(() => setSavingQuestionId(null));
      } else {
        setSavingQuestionId(questionId);
        saveTimeoutRef.current = setTimeout(async () => {
          const toSave = { ...pendingAnswersRef.current };
          pendingAnswersRef.current = {};
          try {
            const entries = Object.entries(toSave);
            for (const [qIdStr, val] of entries) {
              await apiSaveAnswer(sessionId, Number(qIdStr), val.text, val.audioUrl);
            }
          } catch (e) {
            console.error('Failed to debounced-save answer:', e);
          } finally {
            setSavingQuestionId(null);
          }
        }, 700);
      }
    },
    [sessionId, answersMap]
  );

  // Listening Audio Player functions
  const playAudioWithLimit = (sectionId: number, audioUrl: string) => {
    const remaining = audioPlaysLeft[sectionId] !== undefined ? audioPlaysLeft[sectionId] : 2;
    if (remaining <= 0 && !isPlayingAudio) {
      alert('The listening limit for this audio (2 plays) has been reached!');
      return;
    }

    if (audioRef.current) {
      if (isPlayingAudio) {
        audioRef.current.pause();
        setIsPlayingAudio(false);
      } else {
        audioRef.current
          .play()
          .then(() => {
            setIsPlayingAudio(true);
            if (!hasStartedCurrentPlay[sectionId]) {
              setAudioPlaysLeft((prev) => ({
                ...prev,
                [sectionId]: Math.max(0, remaining - 1),
              }));
              setHasStartedCurrentPlay((prev) => ({ ...prev, [sectionId]: true }));
            }
          })
          .catch((err) => {
            console.warn('Audio play error:', err);
            setIsPlayingAudio(true);
          });
      }
    }
  };

  // Speaking Recording Functions
  const startRecording = async (questionId: number) => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      audioChunksRef.current = [];
      const mediaRecorder = new MediaRecorder(stream);
      mediaRecorderRef.current = mediaRecorder;

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          audioChunksRef.current.push(event.data);
        }
      };

      mediaRecorder.onstop = () => {
        const audioBlob = new Blob(audioChunksRef.current, { type: 'audio/webm' });
        const blobUrl = URL.createObjectURL(audioBlob);
        setRecordedAudios((prev) => ({
          ...prev,
          [questionId]: { blobUrl, isSaved: false },
        }));
      };

      mediaRecorder.start();
      setRecordingQuestionId(questionId);
      setRecordingSeconds(0);
    } catch (err: any) {
      alert('Microphone access error: ' + (err.message || 'Permission denied'));
    }
  };

  const stopRecording = () => {
    if (mediaRecorderRef.current && recordingQuestionId !== null) {
      mediaRecorderRef.current.stop();
      mediaRecorderRef.current.stream.getTracks().forEach((track) => track.stop());
      setRecordingQuestionId(null);
    }
  };

  const uploadAndSaveSpeakingAnswer = async (questionId: number) => {
    const audioBlob = new Blob(audioChunksRef.current, { type: 'audio/webm' });
    if (!audioBlob || audioBlob.size === 0) {
      alert('No recorded audio available to save!');
      return;
    }

    setIsUploadingVoice(true);
    try {
      const uploadRes = await apiUploadAudio(audioBlob, `speaking_q${questionId}_${sessionId}.webm`);
      await handleSaveAnswer(questionId, 'Speaking audio answer recorded', uploadRes.url, true);
      setRecordedAudios((prev) => ({
        ...prev,
        [questionId]: { ...prev[questionId], isSaved: true },
      }));
      alert('Your speaking audio response has been saved successfully!');
    } catch (err: any) {
      alert('Error uploading audio: ' + err.message);
    } finally {
      setIsUploadingVoice(false);
    }
  };

  // Recording timer
  useEffect(() => {
    let interval: any = null;
    if (recordingQuestionId !== null) {
      interval = setInterval(() => {
        setRecordingSeconds((prev) => prev + 1);
      }, 1000);
    }
    return () => clearInterval(interval);
  }, [recordingQuestionId]);

  // Format seconds to HH:MM:SS
  const formatTimer = (seconds: number) => {
    if (isNaN(seconds) || seconds < 0) return '00:00';
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = seconds % 60;
    return `${h > 0 ? `${h}:` : ''}${m < 10 ? '0' : ''}${m}:${s < 10 ? '0' : ''}${s}`;
  };

  // Word counter helper for writing
  const countWords = (text?: string) => {
    if (!text) return 0;
    const trimmed = text.trim();
    return trimmed ? trimmed.split(/\s+/).length : 0;
  };

  // Safe Options getter
  const getOptions = (options: any): string[] => {
    if (Array.isArray(options)) return options;
    if (typeof options === 'string') {
      try {
        const parsed = JSON.parse(options);
        if (Array.isArray(parsed)) return parsed;
      } catch {}
    }
    return [];
  };

  // Render interactive Question Type Filter Bar
  const renderQuestionTypeFilterBar = () => {
    if (availableCategories.length <= 1) return null;

    return (
      <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-3.5 sm:p-4 shadow-xs mb-4">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2.5 pb-2.5 mb-2.5 border-b border-slate-100 dark:border-slate-800">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-xl bg-emerald-50 dark:bg-emerald-950/60 text-emerald-600 dark:text-emerald-400 flex items-center justify-center flex-shrink-0">
              <Filter className="w-4 h-4" />
            </div>
            <div>
              <h4 className="text-xs sm:text-sm font-bold text-slate-900 dark:text-white flex items-center gap-2">
                <span>Filter by Question Type</span>
                <span className="text-[10px] font-semibold px-2 py-0.5 rounded-full bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                  {sectionQuestions.length} questions
                </span>
              </h4>
              <p className="text-[11px] text-slate-500 dark:text-slate-400">
                Select a question type to focus your practice
              </p>
            </div>
          </div>

          {selectedQuestionTypeFilter !== 'all' && (
            <button
              type="button"
              onClick={() => setSelectedQuestionTypeFilter('all')}
              className="text-xs font-bold text-rose-600 dark:text-rose-400 hover:underline flex items-center gap-1 self-start sm:self-auto cursor-pointer"
            >
              Clear filter (Show all)
            </button>
          )}
        </div>

        {/* Filter Pills */}
        <div className="flex flex-wrap gap-2">
          {availableCategories.map((catKey) => {
            const meta = IELTS_QUESTION_CATEGORIES[catKey];
            const count = categoryCounts[catKey] || 0;
            const isSelected = selectedQuestionTypeFilter === catKey;

            return (
              <button
                key={catKey}
                type="button"
                onClick={() => setSelectedQuestionTypeFilter(catKey)}
                className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-2 border cursor-pointer ${
                  isSelected
                    ? meta.activeClass + ' border-transparent shadow-sm scale-[1.02]'
                    : 'bg-slate-50 dark:bg-slate-800/80 hover:bg-slate-100 dark:hover:bg-slate-800 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700'
                }`}
              >
                <span>{meta.shortLabel}</span>
                <span
                  className={`text-[10px] px-1.5 py-0.5 rounded-md font-mono ${
                    isSelected
                      ? 'bg-white/20 text-white'
                      : 'bg-white dark:bg-slate-900 text-slate-600 dark:text-slate-400 border border-slate-200 dark:border-slate-700'
                  }`}
                >
                  {count}
                </span>
              </button>
            );
          })}
        </div>

        {selectedQuestionTypeFilter !== 'all' && (
          <div className="mt-2.5 pt-2 border-t border-dashed border-slate-200 dark:border-slate-800 text-[11px] text-emerald-700 dark:text-emerald-300 flex items-center justify-between">
            <span className="flex items-center gap-1.5">
              <Sparkles className="w-3.5 h-3.5 text-amber-500 flex-shrink-0" />
              <span>
                <strong>{IELTS_QUESTION_CATEGORIES[selectedQuestionTypeFilter]?.label}</strong> selected ({filteredQuestions.length} questions).
              </span>
            </span>
            <span className="text-slate-400 hidden sm:inline">
              (Other question types are dimmed)
            </span>
          </div>
        )}
      </div>
    );
  };

  // Extract matching headings mapping (Paragraph letter -> qnum)
  const headingsMap = useMemo(() => {
    if (!currentSection?.instructions) return new Map<string, number>();
    const map = new Map<string, number>();
    const regex1 = /Paragraph\s+([A-Z])[:\s]*<\/span[^>]*>[\s\S]*?(?:data-qnum|name)=["'](?:question_)?(\d+)["']/gi;
    let m;
    while ((m = regex1.exec(currentSection.instructions)) !== null) {
      map.set(m[1].toUpperCase(), Number(m[2]));
    }
    if (map.size === 0) {
      const regex2 = /<strong[^>]*badge[^>]*>(\d+)<\/strong>[\s\S]*?Paragraph\s+([A-Z])/gi;
      while ((m = regex2.exec(currentSection.instructions)) !== null) {
        map.set(m[2].toUpperCase(), Number(m[1]));
      }
    }
    return map;
  }, [currentSection?.instructions]);

  // Extract heading options list ({ val, text })
  const headingsOptionsList = useMemo(() => {
    if (!currentSection?.instructions) return [];
    const list: { val: string; text: string }[] = [];
    const seen = new Set<string>();

    const optRegex = /<option\s+value="([^"]+)"[^>]*>([\s\S]*?)<\/option>/gi;
    let om;
    while ((om = optRegex.exec(currentSection.instructions)) !== null) {
      const val = om[1].trim();
      const raw = om[2].replace(/<[^>]+>/g, '').trim();
      if (!val || val.toLowerCase().includes('tanlang') || val.toLowerCase().includes('select') || seen.has(val.toLowerCase())) {
        continue;
      }
      seen.add(val.toLowerCase());
      const clean = raw.replace(/^[A-Z0-9ivxlcdm]+\.\s*/i, '').trim();
      list.push({ val, text: `${val}. ${clean}` });
    }
    return list;
  }, [currentSection?.instructions]);

  const getHeadingDisplayText = useCallback((valOrText: string) => {
    if (!valOrText) return '';
    const item = headingsOptionsList.find(
      (h) => h.val.toLowerCase() === valOrText.toLowerCase() || h.text.toLowerCase() === valOrText.toLowerCase()
    );
    return item ? item.text : valOrText;
  }, [headingsOptionsList]);

  const getHeadingOptionValue = useCallback((valOrText: string) => {
    if (!valOrText) return '';
    const item = headingsOptionsList.find(
      (h) => h.val.toLowerCase() === valOrText.toLowerCase() || h.text.toLowerCase() === valOrText.toLowerCase()
    );
    return item ? item.val : valOrText;
  }, [headingsOptionsList]);

  // Split Container Ref for global DND in Reading test
  const splitContainerRef = useRef<HTMLDivElement | null>(null);

  // Fresh refs for closure safety
  const answersMapFreshRef = useRef(answersMap);
  answersMapFreshRef.current = answersMap;

  const headingsMapFreshRef = useRef(headingsMap);
  headingsMapFreshRef.current = headingsMap;

  const headingsOptionsListFreshRef = useRef(headingsOptionsList);
  headingsOptionsListFreshRef.current = headingsOptionsList;

  const qmapFreshRef = useRef(qnumToQuestionId);
  qmapFreshRef.current = qnumToQuestionId;

  const saveFreshRef = useRef(handleSaveAnswer);
  saveFreshRef.current = handleSaveAnswer;

  const updateFreshRef = useRef(handleLiveAnswerUpdate);
  updateFreshRef.current = handleLiveAnswerUpdate;

  const setActiveQnumFreshRef = useRef(setActiveQnum);
  setActiveQnumFreshRef.current = setActiveQnum;

  useEffect(() => {
    const container = splitContainerRef.current;
    if (!container || currentSection?.type !== 'reading') return;

    const handleDragStart = (e: DragEvent) => {
      const target = e.target as HTMLElement;

      // 1. Dragging card from bank
      const card = target.closest<HTMLElement>('.dnd-card');
      if (card) {
        if (card.classList.contains('dnd-card-used')) {
          e.preventDefault();
          return;
        }
        const val = card.getAttribute('data-value') || '';
        const text = card.getAttribute('data-text') || card.textContent?.trim() || '';
        if (e.dataTransfer) {
          e.dataTransfer.setData('text/plain', text);
          e.dataTransfer.setData('application/x-dnd-value', val);
          e.dataTransfer.effectAllowed = 'copyMove';
        }
        card.classList.add('dnd-card-dragging', 'is-dragging');
        return;
      }

      // 2. Dragging placed heading from a dropzone
      const zone = target.closest<HTMLElement>('.heading-drop-zone.dnd-drop-zone-filled, .dnd-zone.dnd-drop-zone-filled');
      if (zone) {
        const qnum = zone.getAttribute('data-qnum');
        const qId = qnum ? qmapFreshRef.current[Number(qnum)] : null;
        const currentAns = qId && answersMapFreshRef.current[qId] ? answersMapFreshRef.current[qId].text : '';
        const valSpan = zone.querySelector('.dnd-drop-value');
        const displayText = valSpan?.textContent?.trim() || currentAns;
        if (qnum && displayText && e.dataTransfer) {
          e.dataTransfer.setData('text/plain', displayText);
          e.dataTransfer.setData('application/x-source-qnum', qnum);
          e.dataTransfer.setData('application/x-dnd-value', currentAns || displayText);
          e.dataTransfer.effectAllowed = 'copyMove';
          zone.classList.add('dnd-card-dragging', 'is-dragging');
        }
        return;
      }
    };

    const handleDragOver = (e: DragEvent) => {
      const target = e.target as HTMLElement;
      const zone = target.closest<HTMLElement>('.heading-drop-zone, .dnd-zone');
      if (zone) {
        e.preventDefault();
        if (e.dataTransfer) e.dataTransfer.dropEffect = 'copy';
        zone.classList.add('dnd-drop-zone-over', 'dnd-drop-active');
        return;
      }
      const panel = target.closest<HTMLElement>('.heading-dnd-panel, .dnd-panel, .options-dnd-panel');
      if (panel) {
        e.preventDefault();
        if (e.dataTransfer) e.dataTransfer.dropEffect = 'move';
        panel.classList.add('dnd-panel-hover');
        return;
      }
    };

    const handleDragLeave = (e: DragEvent) => {
      const target = e.target as HTMLElement;
      const zone = target.closest<HTMLElement>('.heading-drop-zone, .dnd-zone');
      if (zone && !zone.contains(e.relatedTarget as Node)) {
        zone.classList.remove('dnd-drop-zone-over', 'dnd-drop-active');
      }
      const panel = target.closest<HTMLElement>('.heading-dnd-panel, .dnd-panel, .options-dnd-panel');
      if (panel && !panel.contains(e.relatedTarget as Node)) {
        panel.classList.remove('dnd-panel-hover');
      }
    };

    const handleDrop = (e: DragEvent) => {
      const target = e.target as HTMLElement;
      const zone = target.closest<HTMLElement>('.heading-drop-zone, .dnd-zone');
      const panel = target.closest<HTMLElement>('.heading-dnd-panel, .dnd-panel, .options-dnd-panel');

      // A) Dropped onto Heading Bank / Panel -> return card (clear source zone)
      if (panel) {
        e.preventDefault();
        panel.classList.remove('dnd-panel-hover');
        const srcQnum = e.dataTransfer?.getData('application/x-source-qnum');
        if (srcQnum) {
          const qId = qmapFreshRef.current[Number(srcQnum)];
          if (qId) {
            saveFreshRef.current(qId, '');
            updateFreshRef.current?.(qId, '');
          }
          setActiveQnumFreshRef.current(Number(srcQnum));
        }
        return;
      }

      // B) Dropped onto a Drop Zone
      if (zone) {
        e.preventDefault();
        zone.classList.remove('dnd-drop-zone-over', 'dnd-drop-active');
        const targetQnum = Number(zone.getAttribute('data-qnum'));
        const targetQId = qmapFreshRef.current[targetQnum];
        if (!targetQId || !targetQnum) return;

        const rawText = e.dataTransfer?.getData('text/plain')?.trim() || '';
        const rawVal = e.dataTransfer?.getData('application/x-dnd-value')?.trim() || '';
        const srcQnumStr = e.dataTransfer?.getData('application/x-source-qnum');

        // Heading answer value to save (e.g. 'v' or 'v. Two clear educational goals')
        const valToSave = getHeadingOptionValue(rawVal || rawText) || rawVal || rawText;

        // B1) Dragged from another dropzone
        if (srcQnumStr) {
          const srcQnum = Number(srcQnumStr);
          if (srcQnum === targetQnum) return;

          const srcQId = qmapFreshRef.current[srcQnum];
          const targetCurrentAns = answersMapFreshRef.current[targetQId]?.text || '';

          // Assign to target
          saveFreshRef.current(targetQId, valToSave);
          updateFreshRef.current?.(targetQId, valToSave);

          // If target had answer, swap to source! Else clear source!
          if (srcQId) {
            saveFreshRef.current(srcQId, targetCurrentAns);
            updateFreshRef.current?.(srcQId, targetCurrentAns);
          }
          setActiveQnumFreshRef.current(targetQnum);
          return;
        }

        // B2) Dragged from card bank
        // If this heading was already placed in another question, clear that question (each heading used only once)
        headingsMapFreshRef.current.forEach((mappedQnum) => {
          if (mappedQnum === targetQnum) return;
          const otherQId = qmapFreshRef.current[mappedQnum];
          const otherAns = otherQId && answersMapFreshRef.current[otherQId] ? answersMapFreshRef.current[otherQId].text : '';
          if (otherAns && (otherAns === valToSave || otherAns.toLowerCase() === rawVal.toLowerCase() || otherAns.toLowerCase() === rawText.toLowerCase())) {
            saveFreshRef.current(otherQId, '');
            updateFreshRef.current?.(otherQId, '');
          }
        });

        saveFreshRef.current(targetQId, valToSave);
        updateFreshRef.current?.(targetQId, valToSave);
        setActiveQnumFreshRef.current(targetQnum);
        return;
      }
    };

    const handleDragEnd = () => {
      document.querySelectorAll('.dnd-card-dragging, .is-dragging').forEach((el) => el.classList.remove('dnd-card-dragging', 'is-dragging'));
      document.querySelectorAll('.dnd-drop-zone-over, .dnd-drop-active').forEach((el) => el.classList.remove('dnd-drop-zone-over', 'dnd-drop-active'));
      document.querySelectorAll('.dnd-panel-hover').forEach((el) => el.classList.remove('dnd-panel-hover'));
    };

    const handleClick = (e: MouseEvent) => {
      const target = e.target as HTMLElement;

      // 1. Click card in bank -> toggle selection
      const card = target.closest<HTMLElement>('.dnd-card');
      if (card) {
        if (card.classList.contains('dnd-card-used')) return;
        const isSelected = card.classList.contains('dnd-card-selected');
        document.querySelectorAll('.dnd-card.dnd-card-selected').forEach((c) => c.classList.remove('dnd-card-selected'));
        if (!isSelected) {
          card.classList.add('dnd-card-selected');
        }
        return;
      }

      // 2. Click dropzone
      const zone = target.closest<HTMLElement>('.heading-drop-zone, .dnd-zone');
      if (zone) {
        const qnum = Number(zone.getAttribute('data-qnum'));
        if (qnum) setActiveQnumFreshRef.current(qnum);

        const selectedCard = document.querySelector<HTMLElement>('.dnd-card.dnd-card-selected');
        if (selectedCard) {
          const rawVal = selectedCard.getAttribute('data-value') || '';
          const rawText = selectedCard.getAttribute('data-text') || selectedCard.textContent?.trim() || '';
          const valToSave = getHeadingOptionValue(rawVal || rawText) || rawVal || rawText;
          const qId = qmapFreshRef.current[qnum];

          if (qId && valToSave) {
            headingsMapFreshRef.current.forEach((mappedQnum) => {
              if (mappedQnum === qnum) return;
              const otherQId = qmapFreshRef.current[mappedQnum];
              const otherAns = otherQId && answersMapFreshRef.current[otherQId] ? answersMapFreshRef.current[otherQId].text : '';
              if (otherAns && (otherAns === valToSave || otherAns.toLowerCase() === rawVal.toLowerCase() || otherAns.toLowerCase() === rawText.toLowerCase())) {
                saveFreshRef.current(otherQId, '');
                updateFreshRef.current?.(otherQId, '');
              }
            });

            saveFreshRef.current(qId, valToSave);
            updateFreshRef.current?.(qId, valToSave);
          }
          selectedCard.classList.remove('dnd-card-selected');
          return;
        }
        return;
      }

      // 3. Click elsewhere -> deselect
      document.querySelectorAll('.dnd-card.dnd-card-selected').forEach((c) => c.classList.remove('dnd-card-selected'));
    };

    const handleDblClick = (e: MouseEvent) => {
      const target = e.target as HTMLElement;
      const zone = target.closest<HTMLElement>('.heading-drop-zone, .dnd-zone');
      if (zone) {
        const qnum = Number(zone.getAttribute('data-qnum'));
        const qId = qmapFreshRef.current[qnum];
        if (qId && answersMapFreshRef.current[qId]?.text) {
          saveFreshRef.current(qId, '');
          updateFreshRef.current?.(qId, '');
          setActiveQnumFreshRef.current(qnum);
        }
      }
    };

    container.addEventListener('dragstart', handleDragStart);
    container.addEventListener('dragover', handleDragOver);
    container.addEventListener('dragleave', handleDragLeave);
    container.addEventListener('drop', handleDrop);
    container.addEventListener('dragend', handleDragEnd);
    container.addEventListener('click', handleClick);
    container.addEventListener('dblclick', handleDblClick);

    return () => {
      container.removeEventListener('dragstart', handleDragStart);
      container.removeEventListener('dragover', handleDragOver);
      container.removeEventListener('dragleave', handleDragLeave);
      container.removeEventListener('drop', handleDrop);
      container.removeEventListener('dragend', handleDragEnd);
      container.removeEventListener('click', handleClick);
      container.removeEventListener('dblclick', handleDblClick);
    };
  }, [currentSection?.type, getHeadingOptionValue]);

  // Sync used cards styling in headings bank
  useEffect(() => {
    if (headingsMap.size === 0) return;
    const usedVals = new Set<string>();
    headingsMap.forEach((mappedQnum) => {
      const qId = qnumToQuestionId[mappedQnum];
      const ans = qId && answersMap[qId] ? answersMap[qId].text?.trim() : '';
      if (ans) {
        usedVals.add(ans.toLowerCase());
        const optVal = getHeadingOptionValue(ans);
        if (optVal) usedVals.add(optVal.toLowerCase());
      }
    });

    document.querySelectorAll<HTMLElement>('.heading-dnd-panel .dnd-card').forEach((card) => {
      const val = (card.getAttribute('data-value') || '').trim().toLowerCase();
      const text = (card.getAttribute('data-text') || card.textContent || '').trim().toLowerCase();
      const isUsed = usedVals.has(val) || Array.from(usedVals).some(
        (uv) => uv === text || text.startsWith(uv + '.') || text.startsWith(uv + ' ')
      );
      if (isUsed) {
        card.classList.add('dnd-card-used', 'is-used');
      } else {
        card.classList.remove('dnd-card-used', 'is-used');
      }
    });
  }, [answersMap, headingsMap, qnumToQuestionId, getHeadingOptionValue]);

  if (!mounted || loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-12 h-12 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-semibold">Loading test...</p>
      </div>
    );
  }

  if (errorMessage || !test) {
    return (
      <div className="max-w-md mx-auto my-16 p-6 bg-white rounded-2xl border border-slate-200 text-center space-y-4 shadow-sm">
        <div className="w-12 h-12 rounded-full bg-rose-50 text-rose-600 flex items-center justify-center mx-auto">
          <AlertTriangle className="w-6 h-6" />
        </div>
        <h3 className="text-base font-bold text-slate-900">Something went wrong</h3>
        <p className="text-xs text-slate-600">{errorMessage || 'Failed to load test data.'}</p>
        <button
          onClick={() => router.push('/student')}
          className="px-4 py-2 bg-emerald-600 text-white rounded-xl text-xs font-bold hover:bg-emerald-700 transition-colors"
        >
          Back to Tests
        </button>
      </div>
    );
  }

  if (sections.length === 0 || !currentSection) {
    return (
      <div className="max-w-md mx-auto my-16 p-6 bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 text-center space-y-4 shadow-sm">
        <div className="w-12 h-12 rounded-full bg-amber-50 dark:bg-amber-950/60 text-amber-600 dark:text-amber-400 flex items-center justify-center mx-auto">
          <AlertTriangle className="w-6 h-6" />
        </div>
        <h3 className="text-base font-bold text-slate-900 dark:text-white">No sections found in this test</h3>
        <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
          No sections or questions have been configured for this test yet. Please select another test or contact an administrator.
        </p>
        <button
          onClick={() => router.push('/student')}
          className="px-5 py-2.5 bg-emerald-600 text-white rounded-xl text-xs font-bold hover:bg-emerald-700 transition-colors shadow-sm"
        >
          Back to Tests
        </button>
      </div>
    );
  }

  const renderInstructionsModal = () => {
    if (!showInstructionsModal) return null;
    return (
      <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-xs flex items-center justify-center p-4 animate-in fade-in duration-200 select-none">
        <div className="bg-white dark:bg-slate-900 rounded-[28px] max-w-[700px] w-full p-8 sm:p-10 shadow-2xl border border-slate-200/90 dark:border-slate-800 space-y-6">
          <h2 className="text-2xl sm:text-[30px] font-extrabold text-slate-900 dark:text-white text-center tracking-tight">
            Instructions for taking the test
          </h2>

          <div className="space-y-2 pt-2">
            <h3 className="text-base sm:text-lg font-black text-slate-900 dark:text-white tracking-wide uppercase">
              NOTE BEFORE TAKING THE TEST
            </h3>
            <p className="text-sm sm:text-base font-bold text-slate-900 dark:text-slate-100">
              Device and browser requirements:
            </p>
          </div>

          <ul className="list-disc pl-5 sm:pl-6 space-y-3.5 text-sm sm:text-[15px] text-slate-800 dark:text-slate-200 leading-relaxed marker:text-slate-800 dark:marker:text-slate-200">
            <li>
              Please use <strong className="font-extrabold text-slate-900 dark:text-white">Google Chrome on a desktop or laptop computer</strong> for the most stable experience.
            </li>
            <li>
              For the best experience, do not adjust the font size (always leave it <strong className="font-extrabold text-slate-900 dark:text-white">REGULAR</strong>) and contrast (always leave it <strong className="font-extrabold text-slate-900 dark:text-white">Black on White</strong> ).
            </li>
          </ul>

          <div className="pt-6 border-b border-[#e2d8cb] dark:border-slate-800"></div>

          <div className="flex justify-end pt-1">
            <button
              type="button"
              onClick={handleBeginTest}
              className="px-8 py-2.5 rounded-xl font-bold text-sm sm:text-base text-white bg-[#6a2216] hover:bg-[#581c11] active:scale-95 transition-all shadow-md cursor-pointer"
            >
              Begin
            </button>
          </div>
        </div>
      </div>
    );
  };

  const renderOptionsMenu = () => {
    if (!optionsMenuOpen) return null;

    return (
      <div
        className={`fixed inset-0 z-[120] overflow-y-auto flex flex-col p-6 sm:p-10 select-none transition-colors ${
          isYellowOnBlack
            ? 'bg-[#0c0c0e] text-[#fbbf24]'
            : isWhiteOnBlack
            ? 'bg-[#0c0c0e] text-white'
            : 'bg-white text-slate-900'
        }`}
      >
        {/* Top Header with Back button (if inside subview) and Circular Close button */}
        <div className="flex items-center justify-between w-full max-w-3xl mx-auto">
          {optionsSubView !== 'main' ? (
            <button
              type="button"
              onClick={() => setOptionsSubView('main')}
              className={`flex items-center gap-1.5 font-bold text-sm sm:text-base px-3 py-1.5 rounded-xl transition-colors cursor-pointer ${
                isYellowOnBlack
                  ? 'text-[#fbbf24] hover:bg-yellow-950/40'
                  : isWhiteOnBlack
                  ? 'text-white hover:bg-zinc-800'
                  : 'text-slate-800 hover:bg-slate-100'
              }`}
            >
              <ChevronLeft className="w-5 h-5" />
              <span>Options</span>
            </button>
          ) : (
            <div />
          )}

          {/* Circular Close Button (Image 2) */}
          <button
            type="button"
            onClick={() => setOptionsMenuOpen(false)}
            className="w-10 h-10 rounded-full border border-slate-200 dark:border-zinc-700 bg-white dark:bg-zinc-800 text-slate-900 dark:text-white flex items-center justify-center shadow-sm hover:scale-105 active:scale-95 transition-all cursor-pointer shrink-0"
            title="Close options"
          >
            <X className="w-5 h-5 stroke-[2.5]" />
          </button>
        </div>

        {/* Content Area */}
        <div className="flex-1 flex flex-col items-center justify-center max-w-xl w-full mx-auto py-8">
          {/* 1. MAIN OPTIONS MENU (Image 2) */}
          {optionsSubView === 'main' && (
            <div className="w-full space-y-8 animate-in fade-in zoom-in-95 duration-150">
              <h1 className="text-4xl sm:text-5xl font-extrabold text-center tracking-tight">
                Options
              </h1>

              <div className="space-y-4 pt-4">
                {/* Contrast row */}
                <button
                  type="button"
                  onClick={() => setOptionsSubView('contrast')}
                  className={`w-full flex items-center justify-between p-5 rounded-2xl border transition-all cursor-pointer ${
                    isYellowOnBlack
                      ? 'border-yellow-900/60 hover:bg-yellow-950/30 text-[#fbbf24]'
                      : isWhiteOnBlack
                      ? 'border-zinc-800 hover:bg-zinc-900 text-white'
                      : 'border-slate-200/90 hover:bg-slate-50 text-slate-900'
                  }`}
                >
                  <div className="flex items-center gap-4">
                    {/* Contrast Icon (circle split in half vertically) */}
                    <div className="w-7 h-7 rounded-full border-2 border-current flex overflow-hidden shrink-0">
                      <div className="w-1/2 h-full bg-transparent" />
                      <div className="w-1/2 h-full bg-current" />
                    </div>
                    <span className="text-lg sm:text-xl font-bold">Contrast</span>
                  </div>
                  <ChevronRight className="w-6 h-6 shrink-0 opacity-70" />
                </button>

                {/* Text size row */}
                <button
                  type="button"
                  onClick={() => setOptionsSubView('text_size')}
                  className={`w-full flex items-center justify-between p-5 rounded-2xl border transition-all cursor-pointer ${
                    isYellowOnBlack
                      ? 'border-yellow-900/60 hover:bg-yellow-950/30 text-[#fbbf24]'
                      : isWhiteOnBlack
                      ? 'border-zinc-800 hover:bg-zinc-900 text-white'
                      : 'border-slate-200/90 hover:bg-slate-50 text-slate-900'
                  }`}
                >
                  <div className="flex items-center gap-4">
                    {/* Text Size Icon ([T]) */}
                    <div className="w-7 h-7 border-2 border-dashed border-current rounded flex items-center justify-center shrink-0">
                      <span className="font-serif font-black text-sm leading-none">T</span>
                    </div>
                    <span className="text-lg sm:text-xl font-bold">Text size</span>
                  </div>
                  <ChevronRight className="w-6 h-6 shrink-0 opacity-70" />
                </button>
              </div>
            </div>
          )}

          {/* 2. CONTRAST OPTIONS SUBVIEW (Images 3, 4, 5) */}
          {optionsSubView === 'contrast' && (
            <div className="w-full space-y-8 animate-in fade-in zoom-in-95 duration-150">
              <h1
                className={`text-4xl sm:text-5xl font-extrabold text-center tracking-tight ${
                  isYellowOnBlack ? 'text-[#fbbf24]' : ''
                }`}
              >
                Contrast
              </h1>

              <div className="space-y-3 pt-4 w-full">
                {[
                  { id: 'black_on_white', label: 'Black on white' },
                  { id: 'white_on_black', label: 'White on black' },
                  { id: 'yellow_on_black', label: 'Yellow on black' },
                ].map((opt) => {
                  const isSelected = contrastMode === opt.id;
                  return (
                    <button
                      key={opt.id}
                      type="button"
                      onClick={() => handleSelectContrast(opt.id as ContrastMode)}
                      className={`w-full flex items-center gap-4 px-6 py-4 rounded-xl text-lg font-bold transition-all text-left cursor-pointer ${
                        isSelected
                          ? isDarkContrast
                            ? 'bg-white text-slate-900 shadow-md font-extrabold'
                            : 'bg-[#f8f9fa] border border-slate-200/80 text-slate-900 shadow-2xs font-extrabold'
                          : isYellowOnBlack
                          ? 'text-[#fbbf24] hover:bg-yellow-950/20'
                          : isWhiteOnBlack
                          ? 'text-white hover:bg-zinc-900'
                          : 'text-slate-800 hover:bg-slate-50'
                      }`}
                    >
                      <div className="w-6 h-6 flex items-center justify-center shrink-0">
                        {isSelected && (
                          <Check
                            className={`w-6 h-6 stroke-[3.5] ${
                              isSelected && isYellowOnBlack
                                ? 'text-[#d97706]'
                                : isSelected && isWhiteOnBlack
                                ? 'text-black'
                                : 'text-slate-900'
                            }`}
                          />
                        )}
                      </div>
                      <span
                        className={
                          isSelected && isYellowOnBlack
                            ? 'text-[#d97706]'
                            : isSelected && isWhiteOnBlack
                            ? 'text-black'
                            : ''
                        }
                      >
                        {opt.label}
                      </span>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {/* 3. TEXT SIZE OPTIONS SUBVIEW */}
          {optionsSubView === 'text_size' && (
            <div className="w-full space-y-8 animate-in fade-in zoom-in-95 duration-150">
              <h1
                className={`text-4xl sm:text-5xl font-extrabold text-center tracking-tight ${
                  isYellowOnBlack ? 'text-[#fbbf24]' : ''
                }`}
              >
                Text size
              </h1>

              <div className="space-y-3 pt-4 w-full">
                {[
                  { id: 'regular', label: 'Regular' },
                  { id: 'large', label: 'Large' },
                  { id: 'extra_large', label: 'Extra large' },
                ].map((opt) => {
                  const isSelected = textSizeMode === opt.id;
                  return (
                    <button
                      key={opt.id}
                      type="button"
                      onClick={() => handleSelectTextSize(opt.id as TextSizeMode)}
                      className={`w-full flex items-center gap-4 px-6 py-4 rounded-xl text-lg font-bold transition-all text-left cursor-pointer ${
                        isSelected
                          ? isDarkContrast
                            ? 'bg-white text-slate-900 shadow-md font-extrabold'
                            : 'bg-[#f8f9fa] border border-slate-200/80 text-slate-900 shadow-2xs font-extrabold'
                          : isYellowOnBlack
                          ? 'text-[#fbbf24] hover:bg-yellow-950/20'
                          : isWhiteOnBlack
                          ? 'text-white hover:bg-zinc-900'
                          : 'text-slate-800 hover:bg-slate-50'
                      }`}
                    >
                      <div className="w-6 h-6 flex items-center justify-center shrink-0">
                        {isSelected && (
                          <Check
                            className={`w-6 h-6 stroke-[3.5] ${
                              isSelected && isYellowOnBlack
                                ? 'text-[#d97706]'
                                : isSelected && isWhiteOnBlack
                                ? 'text-black'
                                : 'text-slate-900'
                            }`}
                          />
                        )}
                      </div>
                      <span
                        className={
                          isSelected && isYellowOnBlack
                            ? 'text-[#d97706]'
                            : isSelected && isWhiteOnBlack
                            ? 'text-black'
                            : ''
                        }
                      >
                        {opt.label}
                      </span>
                    </button>
                  );
                })}
              </div>
            </div>
          )}
        </div>
      </div>
    );
  };

  // 1. DEDICATED COMPUTER-DELIVERED TEST INTERFACE (ALL SKILLS)
  if (currentSection) {
    return (
      <div className={`fixed inset-0 w-full h-full flex flex-col overflow-hidden select-none z-30 transition-colors ${
        isYellowOnBlack
          ? 'contrast-yellow-theme bg-black text-[#fbbf24]'
          : isWhiteOnBlack
          ? 'contrast-dark-theme bg-black text-white'
          : 'contrast-white-theme bg-white text-slate-900'
      } ${
        textSizeMode === 'extra_large'
          ? 'text-size-extra-large'
          : textSizeMode === 'large'
          ? 'text-size-large'
          : ''
      }`}>
        <style>{`
          /* PASSAGE BANNER - Always light gray with black text per official IELTS CD exam */
          .ielts-passage-banner {
            background-color: #eeeeee !important;
            border-color: #dcdcdc !important;
          }
          .ielts-passage-banner h2,
          .ielts-passage-banner p,
          .ielts-passage-banner span,
          .ielts-passage-banner strong,
          .ielts-passage-banner * {
            color: #000000 !important;
          }

          /* YELLOW ON BLACK THEME */
          .contrast-yellow-theme { background-color: #000000 !important; color: #fbbf24 !important; }
          .contrast-yellow-theme header { background-color: #000000 !important; border-bottom-color: #000000 !important; }
          .contrast-yellow-theme .passage-container,
          .contrast-yellow-theme .passage-container * {
            color: #fbbf24 !important;
            background-color: transparent !important;
          }
          .contrast-yellow-theme .questions-container {
            background-color: #000000 !important;
            border-left-color: #e5a035 !important;
            border-right-color: #e5a035 !important;
          }
          .contrast-yellow-theme .ielts-reading-container,
          .contrast-yellow-theme .ielts-listening-container {
            background-color: #000000 !important;
            color: #fbbf24 !important;
          }
          .contrast-yellow-theme .ielts-reading-container *:not(.ielts-passage-banner *),
          .contrast-yellow-theme .ielts-listening-container *:not(.ielts-passage-banner *) {
            color: #fbbf24 !important;
          }
          .contrast-yellow-theme .ielts-reading-question-section-heading,
          .contrast-yellow-theme .ielts-reading-question-text,
          .contrast-yellow-theme .ielts-q-badge,
          .contrast-yellow-theme .ielts-reading-question-number {
            color: #fbbf24 !important;
            border-color: #a16207 !important;
            background-color: #000000 !important;
          }
          .contrast-yellow-theme .ielts-radio-btn {
            color: #fbbf24 !important;
            background-color: transparent !important;
          }
          .contrast-yellow-theme .ielts-radio-btn input[type="radio"] {
            accent-color: #e5a035 !important;
          }
          .contrast-yellow-theme .ielts-radio-btn.is-selected {
            background-color: #1a1505 !important;
          }
          .contrast-yellow-theme input[type="text"],
          .contrast-yellow-theme .ielts-inline-input,
          .contrast-yellow-theme textarea,
          .contrast-yellow-theme select {
            background-color: #000000 !important;
            color: #fbbf24 !important;
            border-color: #a16207 !important;
          }
          .contrast-yellow-theme input[type="text"]:focus,
          .contrast-yellow-theme .ielts-inline-input:focus,
          .contrast-yellow-theme textarea:focus {
            border-color: #e5a035 !important;
            outline: none !important;
          }
          .contrast-yellow-theme table,
          .contrast-yellow-theme th,
          .contrast-yellow-theme td,
          .contrast-yellow-theme .ielts-reading-container table td,
          .contrast-yellow-theme .ielts-reading-container table th,
          html.dark .contrast-yellow-theme .ielts-reading-container table td,
          html.dark .contrast-yellow-theme .ielts-reading-container table th {
            background-color: #000000 !important;
            border-color: #78350f !important;
            color: #fbbf24 !important;
          }
          .contrast-yellow-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child th,
          .contrast-yellow-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child td,
          html.dark .contrast-yellow-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child th,
          html.dark .contrast-yellow-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child td {
            background-color: #1f1905 !important;
            border-color: #78350f !important;
            color: #fbbf24 !important;
          }
          .contrast-yellow-theme .ielts-dnd-dropzone {
            background-color: #0c0a02 !important;
            border-color: #a16207 !important;
            color: #fbbf24 !important;
          }
          .contrast-yellow-theme .dnd-card,
          .contrast-yellow-theme .ielts-dnd-placed-card {
            background-color: #1f1905 !important;
            border-color: #e5a035 !important;
            color: #fbbf24 !important;
          }

          /* WHITE ON BLACK THEME */
          .contrast-dark-theme { background-color: #000000 !important; color: #ffffff !important; }
          .contrast-dark-theme header { background-color: #000000 !important; border-bottom-color: #000000 !important; }
          .contrast-dark-theme .passage-container,
          .contrast-dark-theme .passage-container * {
            color: #ffffff !important;
            background-color: transparent !important;
          }
          .contrast-dark-theme .questions-container {
            background-color: #000000 !important;
            border-left-color: #e5a035 !important;
            border-right-color: #e5a035 !important;
          }
          .contrast-dark-theme .ielts-reading-container,
          .contrast-dark-theme .ielts-listening-container {
            background-color: #000000 !important;
            color: #ffffff !important;
          }
          .contrast-dark-theme .ielts-reading-container *:not(.ielts-passage-banner *),
          .contrast-dark-theme .ielts-listening-container *:not(.ielts-passage-banner *) {
            color: #ffffff !important;
          }
          .contrast-dark-theme .ielts-reading-question-section-heading,
          .contrast-dark-theme .ielts-reading-question-text,
          .contrast-dark-theme .ielts-q-badge,
          .contrast-dark-theme .ielts-reading-question-number {
            color: #ffffff !important;
            border-color: #52525b !important;
            background-color: #18181b !important;
          }
          .contrast-dark-theme .ielts-radio-btn {
            color: #ffffff !important;
            background-color: transparent !important;
          }
          .contrast-dark-theme .ielts-radio-btn input[type="radio"] {
            accent-color: #ffffff !important;
          }
          .contrast-dark-theme .ielts-radio-btn.is-selected {
            background-color: #18181b !important;
          }
          .contrast-dark-theme input[type="text"],
          .contrast-dark-theme .ielts-inline-input,
          .contrast-dark-theme textarea,
          .contrast-dark-theme select {
            background-color: #18181b !important;
            color: #ffffff !important;
            border-color: #52525b !important;
          }
          .contrast-dark-theme input[type="text"]:focus,
          .contrast-dark-theme .ielts-inline-input:focus,
          .contrast-dark-theme textarea:focus {
            border-color: #ffffff !important;
            outline: none !important;
          }
          .contrast-dark-theme table,
          .contrast-dark-theme th,
          .contrast-dark-theme td,
          .contrast-dark-theme .ielts-reading-container table td,
          .contrast-dark-theme .ielts-reading-container table th,
          html.dark .contrast-dark-theme .ielts-reading-container table td,
          html.dark .contrast-dark-theme .ielts-reading-container table th {
            background-color: #121212 !important;
            border-color: #3f3f46 !important;
            color: #ffffff !important;
          }
          .contrast-dark-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child th,
          .contrast-dark-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child td,
          html.dark .contrast-dark-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child th,
          html.dark .contrast-dark-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child td {
            background-color: #18181b !important;
            border-color: #3f3f46 !important;
            color: #ffffff !important;
          }
          .contrast-dark-theme .ielts-dnd-dropzone {
            background-color: #18181b !important;
            border-color: #52525b !important;
            color: #ffffff !important;
          }
          .contrast-dark-theme .dnd-card,
          .contrast-dark-theme .ielts-dnd-placed-card {
            background-color: #27272a !important;
            border-color: #71717a !important;
            color: #ffffff !important;
          }

          /* BLACK ON WHITE THEME (Default) - forces crisp contrast regardless of html.dark mode */
          .contrast-white-theme {
            background-color: #ffffff !important;
            color: #000000 !important;
          }
          .contrast-white-theme header {
            background-color: #ffffff !important;
            border-bottom: 1px solid #e2e8f0 !important;
            color: #000000 !important;
          }
          .contrast-white-theme .passage-container,
          .contrast-white-theme .passage-container * {
            color: #000000 !important;
            background-color: transparent !important;
          }
          .contrast-white-theme .questions-container {
            background-color: #ffffff !important;
            border-left-color: #e5a035 !important;
            border-right-color: #e5a035 !important;
          }
          .contrast-white-theme .questions-container,
          .contrast-white-theme .questions-container p,
          .contrast-white-theme .questions-container span:not(.ielts-q-badge),
          .contrast-white-theme .questions-container label,
          .contrast-white-theme .questions-container h1,
          .contrast-white-theme .questions-container h2,
          .contrast-white-theme .questions-container h3,
          .contrast-white-theme .questions-container h4,
          .contrast-white-theme .questions-container li {
            color: #000000 !important;
          }
          .contrast-white-theme .ielts-reading-container,
          .contrast-white-theme .ielts-listening-container {
            background-color: #ffffff !important;
            color: #000000 !important;
          }
          .contrast-white-theme .ielts-reading-container *:not(.ielts-passage-banner *),
          .contrast-white-theme .ielts-listening-container *:not(.ielts-passage-banner *) {
            color: #000000 !important;
          }
          .contrast-white-theme .ielts-reading-question-section-heading,
          .contrast-white-theme .ielts-reading-question-text,
          .contrast-white-theme .ielts-reading-question-number {
            color: #000000 !important;
          }
          .contrast-white-theme .ielts-q-badge {
            background-color: #f1f5f9 !important;
            color: #0f172a !important;
            border-color: #cbd5e1 !important;
          }
          .contrast-white-theme .ielts-radio-btn {
            color: #000000 !important;
            background-color: transparent !important;
          }
          .contrast-white-theme .ielts-radio-btn input[type="radio"] {
            accent-color: #2563eb !important;
          }
          .contrast-white-theme .ielts-radio-btn.is-selected {
            background-color: #f8fafc !important;
          }
          .contrast-white-theme input[type="text"],
          .contrast-white-theme .ielts-inline-input,
          .contrast-white-theme textarea,
          .contrast-white-theme select {
            background-color: #ffffff !important;
            color: #000000 !important;
            border-color: #cbd5e1 !important;
          }
          .contrast-white-theme input[type="text"]:focus,
          .contrast-white-theme .ielts-inline-input:focus,
          .contrast-white-theme textarea:focus {
            border-color: #2563eb !important;
            outline: none !important;
          }
          .contrast-white-theme table,
          .contrast-white-theme th,
          .contrast-white-theme td,
          .contrast-white-theme tr,
          .contrast-white-theme .ielts-reading-container table td,
          .contrast-white-theme .ielts-reading-container table th,
          html.dark .contrast-white-theme .ielts-reading-container table td,
          html.dark .contrast-white-theme .ielts-reading-container table th,
          .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) td,
          .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) th,
          html.dark .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) td,
          html.dark .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) th {
            background-color: #ffffff !important;
            border-color: #cbd5e1 !important;
            color: #000000 !important;
          }
          .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child th,
          .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child td,
          html.dark .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child th,
          html.dark .contrast-white-theme .ielts-reading-container table:not(.ielts-reading-matching-table) tr:first-child td {
            background-color: #f1f5f9 !important;
            border-color: #cbd5e1 !important;
            color: #000000 !important;
            font-weight: 700 !important;
          }
          .contrast-white-theme .ielts-reading-container table tr:first-child td *,
          .contrast-white-theme .ielts-reading-container table tr:first-child th *,
          .contrast-white-theme .ielts-reading-container table td * {
            color: #000000 !important;
          }
          .contrast-white-theme .ielts-dnd-dropzone {
            background-color: #f8fafc !important;
            border-color: #94a3b8 !important;
            color: #000000 !important;
          }
          .contrast-white-theme .dnd-card,
          .contrast-white-theme .ielts-dnd-placed-card {
            background-color: #ffffff !important;
            border-color: #cbd5e1 !important;
            color: #000000 !important;
          }
          .contrast-white-theme .bottom-dock {
            background-color: #f4f4f4 !important;
            border-top-color: #e2e8f0 !important;
          }
          .contrast-white-theme .q-palette-btn {
            background-color: #ffffff !important;
            color: #0f172a !important;
            border-color: #cbd5e1 !important;
          }
          .contrast-white-theme .q-palette-btn.is-active-q {
            background-color: #fef3c7 !important;
            border-color: #f59e0b !important;
            color: #0f172a !important;
          }

          /* SCOPED TEXT SIZES - ONLY scale passage and questions content, never header/dock/banner */
          .text-size-large .passage-container p,
          .text-size-large .passage-container div,
          .text-size-large .passage-container span:not(.ielts-q-badge),
          .text-size-large .passage-container li {
            font-size: 19px !important;
            line-height: 1.8 !important;
          }
          .text-size-large .questions-container p,
          .text-size-large .questions-container span:not(.ielts-q-badge):not(.dnd-card):not(.ielts-dnd-placed-card),
          .text-size-large .questions-container label,
          .text-size-large .questions-container li,
          .text-size-large .ielts-reading-container p,
          .text-size-large .ielts-reading-container span:not(.ielts-q-badge):not(.dnd-card):not(.ielts-dnd-placed-card),
          .text-size-large .ielts-reading-container label,
          .text-size-large .ielts-reading-container td,
          .text-size-large .ielts-reading-container th,
          .text-size-large .questions-container input,
          .text-size-large .questions-container select,
          .text-size-large .questions-container textarea,
          .text-size-large .ielts-reading-container input,
          .text-size-large .ielts-reading-container select,
          .text-size-large .ielts-reading-container textarea {
            font-size: 17px !important;
            line-height: 1.7 !important;
          }
          .text-size-large .ielts-reading-question-section-heading {
            font-size: 20px !important;
            line-height: 1.4 !important;
          }

          .text-size-extra-large .passage-container p,
          .text-size-extra-large .passage-container div,
          .text-size-extra-large .passage-container span:not(.ielts-q-badge),
          .text-size-extra-large .passage-container li {
            font-size: 21px !important;
            line-height: 1.85 !important;
          }
          .text-size-extra-large .questions-container p,
          .text-size-extra-large .questions-container span:not(.ielts-q-badge):not(.dnd-card):not(.ielts-dnd-placed-card),
          .text-size-extra-large .questions-container label,
          .text-size-extra-large .questions-container li,
          .text-size-extra-large .ielts-reading-container p,
          .text-size-extra-large .ielts-reading-container span:not(.ielts-q-badge):not(.dnd-card):not(.ielts-dnd-placed-card),
          .text-size-extra-large .ielts-reading-container label,
          .text-size-extra-large .ielts-reading-container td,
          .text-size-extra-large .ielts-reading-container th,
          .text-size-extra-large .questions-container input,
          .text-size-extra-large .questions-container select,
          .text-size-extra-large .questions-container textarea,
          .text-size-extra-large .ielts-reading-container input,
          .text-size-extra-large .ielts-reading-container select,
          .text-size-extra-large .ielts-reading-container textarea {
            font-size: 19px !important;
            line-height: 1.75 !important;
          }
          .text-size-extra-large .ielts-reading-question-section-heading {
            font-size: 22px !important;
            line-height: 1.4 !important;
          }

          /* BURGER MENU BUTTON: Default transparent, Yellow on hover */
          .ielts-burger-btn {
            background-color: transparent !important;
            border: none !important;
            transition: all 0.15s ease-in-out !important;
          }
          .ielts-burger-btn:hover {
            background-color: #e5a035 !important;
          }
          .ielts-burger-btn .burger-bar {
            transition: all 0.15s ease-in-out !important;
          }
          .ielts-burger-btn:hover .burger-bar {
            background-color: #000000 !important;
          }
        `}</style>

        {/* Top Header (Matches CD IELTS header) */}
        <header
          className={`h-14 min-h-[56px] px-6 flex items-center justify-between shrink-0 select-none z-30 transition-colors ${
            isYellowOnBlack
              ? 'bg-black border-b border-black text-[#fbbf24]'
              : isWhiteOnBlack
              ? 'bg-black border-b border-black text-white'
              : 'bg-white border-b border-slate-200 text-slate-900'
          }`}
        >
          {/* Left: Platform Logo Emblem + Test Title + Countdown Minutes */}
          <div className="flex items-center gap-3 min-w-0">
            <div className={`w-9 h-9 sm:w-10 sm:h-10 rounded-xl p-1 flex items-center justify-center overflow-hidden shrink-0 shadow-xs border transition-colors ${
              isDarkContrast
                ? 'bg-[#18181b] border-zinc-800'
                : 'bg-white border-slate-200'
            }`}>
              <img
                src={isYellowOnBlack ? "/logo-gold.png" : isWhiteOnBlack ? "/logo-dark.png" : "/logo.png"}
                alt="CEFR MATERIALS"
                className="w-full h-full object-contain"
              />
            </div>
            <div className="flex flex-col min-w-0 justify-center">
              <h1
                className={`text-sm sm:text-base font-bold leading-tight truncate ${
                  isYellowOnBlack
                    ? 'text-[#fbbf24]'
                    : isWhiteOnBlack
                    ? 'text-white'
                    : 'text-slate-900'
                }`}
                style={{ fontSize: '15px', lineHeight: '1.2' }}
              >
                {test?.title || 'Examination Test'}
              </h1>
              <span
                className={`text-xs font-medium leading-normal mt-0.5 ${
                  isYellowOnBlack
                    ? 'text-[#fbbf24]/90'
                    : isWhiteOnBlack
                    ? 'text-slate-200'
                    : 'text-slate-500'
                }`}
                style={{ fontSize: '12px', lineHeight: '1.3' }}
              >
                {Math.ceil(secondsRemaining / 60)} minutes remaining
              </span>
            </div>
          </div>

          {/* Right: Hamburger Menu Button (Options) */}
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={() => {
                setOptionsMenuOpen(true);
                setOptionsSubView('main');
              }}
              title="Options"
              className="ielts-burger-btn group w-9 h-9 sm:w-10 sm:h-10 rounded-md flex flex-col items-center justify-center gap-1 cursor-pointer shrink-0 active:scale-95"
            >
              <div
                className={`burger-bar w-5 h-[2.5px] rounded-full ${
                  isYellowOnBlack
                    ? 'bg-[#fbbf24]'
                    : isWhiteOnBlack
                    ? 'bg-white'
                    : 'bg-slate-900'
                }`}
              />
              <div
                className={`burger-bar w-5 h-[2.5px] rounded-full ${
                  isYellowOnBlack
                    ? 'bg-[#fbbf24]'
                    : isWhiteOnBlack
                    ? 'bg-white'
                    : 'bg-slate-900'
                }`}
              />
              <div
                className={`burger-bar w-5 h-[2.5px] rounded-full ${
                  isYellowOnBlack
                    ? 'bg-[#fbbf24]'
                    : isWhiteOnBlack
                    ? 'bg-white'
                    : 'bg-slate-900'
                }`}
              />
            </button>
          </div>
        </header>

        {/* Section Subheader Banner (Always light gray with black text per official IELTS CD exam) */}
        <div
          className={`w-full px-6 py-2 select-none shrink-0 ${
            isDarkContrast ? 'bg-black' : 'bg-white'
          }`}
        >
          <div className="ielts-passage-banner w-full bg-[#eeeeee] rounded-md px-5 py-2.5 border border-[#dcdcdc] shadow-2xs">
            <h2
              className="text-base sm:text-lg font-black text-black tracking-wider uppercase leading-tight"
              style={{ fontSize: '16px', lineHeight: '1.2' }}
            >
              {getSectionShortLabel(currentSection, currentSectionIndex).toUpperCase()}
            </h2>
            <p
              className="text-xs sm:text-sm text-slate-800 font-medium leading-normal mt-0.5"
              style={{ fontSize: '13px', lineHeight: '1.3' }}
            >
              {currentSection.type === 'listening' ? (
                minQ > 0 ? `Listen to the audio and answer questions ${minQ}–${maxQ}` : 'Listen to the audio and answer the questions'
              ) : currentSection.type === 'writing' ? (
                `Write at least ${currentSectionIndex === 0 ? 150 : 250} words. You should spend about ${currentSectionIndex === 0 ? 20 : 40} minutes on this task.`
              ) : currentSection.type === 'speaking' ? (
                'Listen to or read the prompts and record your spoken responses.'
              ) : (
                minQ > 0 ? `Read the text and answer questions ${minQ}–${maxQ}` : 'Read the text and answer the questions'
              )}
            </p>
          </div>
        </div>

        {/* Middle Split-screen Resizable Body */}
        <div
          id="ielts-reading-split-container"
          ref={splitContainerRef}
          className="flex-1 flex flex-row overflow-hidden relative w-full pb-12"
        >
          {/* Left Pane: Passage Text (Clean, marker-free, large font) */}
          <div
            style={{ width: `${splitRatio}%` }}
            className={`h-full overflow-y-auto p-6 md:p-8 scrollbar-thin select-text passage-container ${
              isYellowOnBlack
                ? 'bg-black text-[#fbbf24]'
                : isWhiteOnBlack
                ? 'bg-black text-white'
                : 'bg-white text-slate-900 border-r border-slate-200'
            }`}
          >
            <div className="max-w-3xl mx-auto space-y-4">
              {currentSection.type === 'writing' ? (
                <div className="space-y-6">
                  <div className="flex items-center justify-between border-b pb-3 border-slate-200 dark:border-zinc-800">
                    <span className="font-extrabold uppercase text-sm tracking-wider">
                      {getSectionShortLabel(currentSection, currentSectionIndex).toUpperCase()}
                    </span>
                    <span className="text-xs font-semibold px-2 py-0.5 rounded border border-slate-200 dark:border-zinc-800">
                      Max: {activeWritingQ?.points || currentSection.questions?.[0]?.points || 20} pts
                    </span>
                  </div>

                  <div className="space-y-4">
                    <div className="text-base sm:text-lg font-medium leading-relaxed whitespace-pre-wrap">
                      {activeWritingQ?.question_text || currentSection.questions?.[0]?.question_text}
                    </div>

                    {(() => {
                      const q = activeWritingQ || currentSection.questions?.[0];
                      if (!q) return null;
                      const options = getOptions(q.options);
                      const hasImage = options.length > 0 && typeof options[0] === 'string' && (options[0].startsWith('/') || options[0].startsWith('http') || options[0].includes('/uploads/'));
                      if (!hasImage) return null;
                      return (
                        <div className="p-3 rounded-xl border border-slate-200 dark:border-zinc-800 bg-white dark:bg-zinc-950 inline-block max-w-full shadow-xs">
                          <img
                            src={options[0]}
                            alt="Writing Task Diagram"
                            className="max-h-[480px] w-auto max-w-full object-contain rounded mx-auto"
                            onError={(e) => {
                              if (options[1] && e.currentTarget.src !== options[1]) {
                                e.currentTarget.src = options[1];
                              }
                            }}
                          />
                        </div>
                      );
                    })()}
                  </div>
                </div>
              ) : currentSection.type === 'speaking' ? (
                <div className="space-y-6">
                  <div className="flex items-center justify-between border-b pb-3 border-slate-200 dark:border-zinc-800">
                    <span className="font-extrabold uppercase text-sm tracking-wider">
                      {getSectionShortLabel(currentSection, currentSectionIndex).toUpperCase()}
                    </span>
                    <span className="text-xs font-semibold px-2 py-0.5 rounded border border-slate-200 dark:border-zinc-800">
                      Max: {activeSpeakingQ?.points || currentSection.questions?.[0]?.points || 15} pts
                    </span>
                  </div>

                  <div className={`p-5 rounded-xl border space-y-4 ${
                    isYellowOnBlack
                      ? 'bg-zinc-950 border-yellow-900/60'
                      : isWhiteOnBlack
                      ? 'bg-zinc-900 border-zinc-800'
                      : 'bg-amber-50/20 border-amber-200/60'
                  }`}>
                    <h3 className="text-base sm:text-lg font-bold">
                      Speaking Prompt
                    </h3>
                    <p className="text-base sm:text-lg font-medium leading-relaxed whitespace-pre-wrap">
                      {activeSpeakingQ?.question_text || currentSection.questions?.[0]?.question_text || 'Prepare and record your response.'}
                    </p>
                  </div>

                  {currentSection.instructions && (
                    <div className="text-sm opacity-80 leading-relaxed space-y-2 border-t pt-4 border-slate-200 dark:border-zinc-800">
                      <p className="font-semibold text-xs uppercase tracking-wider">Instructions</p>
                      <p>{currentSection.instructions}</p>
                    </div>
                  )}
                </div>
              ) : currentSection.type === 'listening' ? (
                <div className="space-y-6">
                  {/* Listening Audio Player Card */}
                  <div className={`p-4 rounded-xl border flex flex-col sm:flex-row items-center justify-between gap-4 ${
                    isYellowOnBlack
                      ? 'bg-zinc-950 border-yellow-900/60 text-[#fbbf24]'
                      : isWhiteOnBlack
                      ? 'bg-zinc-900 border-zinc-800 text-white'
                      : 'bg-slate-50 border-slate-200 text-slate-900'
                  }`}>
                    <div className="flex items-center gap-3">
                      <div className={`w-10 h-10 rounded-xl flex items-center justify-center shrink-0 ${
                        isDarkContrast ? 'bg-zinc-800 text-white' : 'bg-blue-100 text-blue-700'
                      }`}>
                        <Headphones className="w-5 h-5" />
                      </div>
                      <div>
                        <h3 className="text-sm font-bold">Listening Audio Track</h3>
                        <p className="text-xs opacity-75">Exam rule: Max 2 plays</p>
                      </div>
                    </div>

                    <div className="flex items-center gap-3">
                      {isPlayingAudio && (
                        <div className="flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-blue-500/20 text-blue-500 text-xs font-bold animate-pulse">
                          <span className="w-2 h-2 rounded-full bg-blue-500" />
                          Playing...
                        </div>
                      )}

                      <div className="text-right">
                        <span className="text-[11px] opacity-75 block">Plays left:</span>
                        <span className="text-xs font-bold font-mono">
                          {audioPlaysLeft[currentSection.id] !== undefined ? audioPlaysLeft[currentSection.id] : 2} / 2
                        </span>
                      </div>

                      <audio
                        ref={audioRef}
                        src={currentSection.audio_url || 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'}
                        onEnded={() => {
                          setIsPlayingAudio(false);
                          setHasStartedCurrentPlay((prev) => ({ ...prev, [currentSection.id]: false }));
                        }}
                        className="hidden"
                      />

                      <button
                        type="button"
                        onClick={() =>
                          playAudioWithLimit(
                            currentSection.id,
                            currentSection.audio_url || 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
                          )
                        }
                        disabled={
                          audioPlaysLeft[currentSection.id] !== undefined &&
                          audioPlaysLeft[currentSection.id] <= 0 &&
                          !isPlayingAudio
                        }
                        className="px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-40 text-white rounded-lg text-xs font-bold shadow-xs transition-all flex items-center gap-1.5 cursor-pointer"
                      >
                        {isPlayingAudio ? (
                          <>
                            <Pause className="w-3.5 h-3.5" /> Pause
                          </>
                        ) : (
                          <>
                            <Play className="w-3.5 h-3.5" /> Play
                          </>
                        )}
                      </button>
                    </div>
                  </div>

                  {/* Listening Examination Instructions & Guidelines (Audio script is hidden during test) */}
                  <div className={`p-5 rounded-2xl border space-y-4 ${
                    isYellowOnBlack
                      ? 'bg-zinc-950 border-yellow-900/60 text-[#fbbf24]'
                      : isWhiteOnBlack
                      ? 'bg-zinc-900 border-zinc-800 text-white'
                      : 'bg-slate-50 border-slate-200 text-slate-800'
                  }`}>
                    <div className="flex items-center gap-2.5 pb-3 border-b border-slate-200 dark:border-zinc-800">
                      <Headphones className="w-5 h-5 text-blue-500" />
                      <h4 className="text-sm font-bold uppercase tracking-wider">
                        Listening Instructions & Rules
                      </h4>
                    </div>

                    <ul className="text-sm space-y-3 leading-relaxed opacity-90">
                      <li className="flex items-start gap-2.5">
                        <span className="font-bold text-blue-500">•</span>
                        <span>
                          <strong>Audio Playback:</strong> Click the Play button above to listen to the recording. In accordance with exam rules, the audio can be played up to <strong>2 times</strong>.
                        </span>
                      </li>
                      <li className="flex items-start gap-2.5">
                        <span className="font-bold text-blue-500">•</span>
                        <span>
                          <strong>Answer As You Listen:</strong> Read the questions on the right carefully and write your answers while the audio is playing. Check word limits (e.g. <em>ONE WORD AND/OR A NUMBER</em>).
                        </span>
                      </li>
                      <li className="flex items-start gap-2.5">
                        <span className="font-bold text-blue-500">•</span>
                        <span>
                          <strong>Official Exam Security:</strong> In authentic IELTS / CEFR examination format, the audioscript is strictly confidential and not visible during the test. You will be able to review the full audio transcript and detailed explanations after submitting the exam.
                        </span>
                      </li>
                    </ul>
                  </div>
                </div>
              ) : currentSection.passage_text ? (
                /<[a-z][\s\S]*>/i.test(currentSection.passage_text) ? (
                  <div
                    className="text-slate-800 dark:text-slate-200 text-[18px] sm:text-[19px] leading-[1.9] space-y-5"
                    dangerouslySetInnerHTML={{ __html: currentSection.passage_text }}
                  />
                ) : (
                  <div className="text-slate-800 dark:text-slate-200 text-[18px] sm:text-[19px] leading-[1.9] space-y-5">
                    {(() => {
                      const raw = currentSection.passage_text.trim();
                      const lines = (raw.includes('\n\n') || raw.includes('\r\n\r\n'))
                        ? raw.split(/\r?\n\s*\r?\n/).map((p) => p.trim()).filter(Boolean)
                        : raw.split(/\r?\n+/).map((p) => p.trim()).filter(Boolean);

                      const renderedItems: React.ReactNode[] = [];
                      let idx = 0;

                      while (idx < lines.length) {
                        const line = lines[idx];
                        const low = line.toLowerCase();

                        // Advice
                        if (low.startsWith('you should spend about')) {
                          renderedItems.push(
                            <p
                              key={`advice-${idx}`}
                              className="text-slate-500 italic text-[15px] sm:text-[16px] border-b border-slate-200 pb-3 mb-4"
                            >
                              {line}
                            </p>
                          );
                          idx++;
                          continue;
                        }

                        // Title or subhead
                        if (idx === 0 || (idx <= 2 && line.length < 80 && !line.includes('.'))) {
                          renderedItems.push(
                            <h2
                              key={`head-${idx}`}
                              className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight my-4"
                            >
                              {line}
                            </h2>
                          );
                          idx++;
                          continue;
                        }

                        // Check if paragraph letter starts this line (for Matching Headings)
                        const mStandalone = line.match(/^(?:Paragraph\s+)?([A-Z])\.?$/i);
                        const mInline = line.match(/^([A-Z])\.\s+([\s\S]+)$/i) || line.match(/^([A-Z])\s+([A-Z][a-z][\s\S]+)$/);
                        const pLetter = mStandalone ? mStandalone[1].toUpperCase() : (mInline ? mInline[1].toUpperCase() : null);

                        if (pLetter && headingsMap.has(pLetter)) {
                          const qnum = headingsMap.get(pLetter)!;
                          const qId = qnumToQuestionId[qnum];
                          const answerVal = qId && answersMap[qId] ? answersMap[qId].text || '' : '';
                          const hasVal = Boolean(answerVal && answerVal.trim());
                          const displayText = hasVal ? getHeadingDisplayText(answerVal) : '';

                          // 1. Heading Drop Zone directly above paragraph
                          renderedItems.push(
                            <div
                              key={`heading-dropzone-item-${qnum}`}
                              className="ielts-reading-question-item my-3"
                            >
                              <div
                                className={`heading-drop-zone dnd-zone ${hasVal ? 'dnd-drop-zone-filled' : ''} ${
                                  activeQnum === qnum ? 'ring-2 ring-blue-500 ring-offset-2' : ''
                                }`}
                                data-qnum={qnum}
                                id={`ielts-reading-question-number-${qnum}`}
                                draggable={hasVal}
                                onClick={() => setActiveQnum(qnum)}
                                title={hasVal ? "Drag to another paragraph, double-click to remove, or drag back to headings bank" : "Drop heading here or click after selecting a heading"}
                              >
                                <strong className="ielts-reading-question-number">{qnum}</strong>
                                <span
                                  className="dnd-drop-placeholder"
                                  style={{ display: hasVal ? 'none' : 'inline' }}
                                >
                                  Drop heading here
                                </span>
                                <span
                                  className="dnd-drop-value"
                                  style={{ display: hasVal ? 'inline' : 'none' }}
                                >
                                  {displayText}
                                </span>
                              </div>
                            </div>
                          );

                          // 2. Paragraph content
                          if (mStandalone) {
                            renderedItems.push(
                              <p key={`p-${idx}`} className="leading-[1.9] text-slate-800 dark:text-slate-200">
                                <strong className="font-bold text-slate-900 dark:text-slate-100 mr-2">{pLetter}.</strong>
                              </p>
                            );
                          } else if (mInline) {
                            renderedItems.push(
                              <p key={`p-${idx}`} className="leading-[1.9] text-slate-800 dark:text-slate-200">
                                <strong className="font-bold text-slate-900 dark:text-slate-100 mr-2">{pLetter}.</strong>
                                {mInline[2]}
                              </p>
                            );
                          }
                          idx++;
                          continue;
                        }

                        // Normal line
                        renderedItems.push(
                          <p key={`p-${idx}`} className="leading-[1.9] text-slate-800 dark:text-slate-200">
                            {line}
                          </p>
                        );
                        idx++;
                      }

                      return renderedItems;
                    })()}
                  </div>
                )
              ) : (
                <p className="text-slate-500 italic text-base">No passage text provided.</p>
              )}
            </div>
          </div>

          {/* Draggable Resizer Handle */}
          <div
            onMouseDown={handleMouseDownResize}
            className="w-2.5 bg-[#e5e7eb] hover:bg-amber-400 active:bg-amber-500 cursor-col-resize flex items-center justify-center shrink-0 z-20 select-none transition-colors"
            title="Drag to resize"
          >
            <span className="text-[10px] font-bold text-slate-600 bg-white border border-slate-300 rounded px-0.5 shadow-xs">
              ↔
            </span>
          </div>

          {/* Right Pane: Questions */}
          <div
            style={{ width: `${100 - splitRatio}%` }}
            className={`h-full overflow-y-auto p-6 md:p-8 relative scrollbar-thin questions-container border-l-[4px] border-r-[4px] border-[#e5a035] ${
              isYellowOnBlack
                ? 'bg-black text-[#fbbf24]'
                : isWhiteOnBlack
                ? 'bg-black text-white'
                : 'bg-white text-slate-900'
            }`}
          >
            {currentSection.type === 'writing' ? (
              <div className="h-full flex flex-col space-y-4">
                {(() => {
                  const q = activeWritingQ || currentSection.questions?.[0];
                  if (!q) return <p className="text-slate-500 italic">No question found.</p>;
                  const currentText = answersMap[q.id]?.text || '';
                  const wordCount = countWords(currentText);
                  const targetWords = currentSectionIndex === 0 ? 150 : 250;
                  const isTargetReached = wordCount >= targetWords;

                  return (
                    <div className="h-full flex flex-col space-y-3">
                      <div className="flex items-center justify-between pb-2 border-b border-slate-200 dark:border-zinc-800">
                        <span className="text-xs font-bold uppercase tracking-wider">
                          Essay Response
                        </span>
                        <div
                          className={`font-mono font-bold px-2.5 py-1 rounded text-xs ${
                            isTargetReached
                              ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950/80 dark:text-emerald-300'
                              : 'bg-amber-100 text-amber-800 dark:bg-amber-950/80 dark:text-amber-300'
                          }`}
                        >
                          Word count: {wordCount} / min {targetWords}
                        </div>
                      </div>

                      <textarea
                        value={currentText}
                        onChange={(e) => handleSaveAnswer(q.id, e.target.value)}
                        placeholder={`Start typing your response here (at least ${targetWords} words)...`}
                        className="flex-1 w-full p-4 rounded-xl border border-slate-300 dark:border-zinc-700 bg-transparent text-inherit text-base sm:text-lg focus:outline-none focus:ring-1 focus:ring-amber-500 leading-relaxed resize-none font-sans"
                        style={{ minHeight: '380px' }}
                      />
                    </div>
                  );
                })()}
              </div>
            ) : currentSection.type === 'speaking' ? (
              <div className="h-full flex flex-col justify-center max-w-xl mx-auto space-y-6">
                {(() => {
                  const q = activeSpeakingQ || currentSection.questions?.[0];
                  if (!q) return <p className="text-slate-500 italic">No prompt found.</p>;
                  const isRecordingThis = recordingQuestionId === q.id;
                  const existingRecording = recordedAudios[q.id];
                  const savedAudioUrl = answersMap[q.id]?.audioUrl;

                  return (
                    <div className="space-y-6">
                      <div className="p-6 rounded-2xl border flex flex-col items-center justify-center text-center space-y-4 border-slate-200 dark:border-zinc-800">
                        <div
                          className={`w-20 h-20 rounded-full flex items-center justify-center transition-all ${
                            isRecordingThis
                              ? 'bg-rose-500 text-white animate-pulse ring-8 ring-rose-500/20'
                              : 'bg-purple-100 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300'
                          }`}
                        >
                          <Mic className="w-10 h-10" />
                        </div>

                        <div>
                          <h3 className="text-base font-bold">
                            {isRecordingThis
                              ? 'Recording in progress...'
                              : savedAudioUrl
                              ? 'Response saved successfully'
                              : 'Record your spoken response'}
                          </h3>
                          <p className="text-sm font-mono opacity-75 mt-1">
                            {isRecordingThis ? `Time: ${recordingSeconds}s` : 'Click below when ready to speak'}
                          </p>
                        </div>

                        <div>
                          {isRecordingThis ? (
                            <button
                              type="button"
                              onClick={stopRecording}
                              className="px-6 py-3 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-sm font-bold shadow-md transition-all flex items-center gap-2 cursor-pointer"
                            >
                              <Square className="w-4 h-4" /> Stop Recording
                            </button>
                          ) : (
                            <button
                              type="button"
                              onClick={() => startRecording(q.id)}
                              className="px-6 py-3 bg-purple-600 hover:bg-purple-700 text-white rounded-xl text-sm font-bold shadow-md transition-all flex items-center gap-2 cursor-pointer"
                            >
                              <Mic className="w-4 h-4" /> Start Recording
                            </button>
                          )}
                        </div>
                      </div>

                      {/* Recorded Audio Preview and Save */}
                      {(existingRecording || savedAudioUrl) && (
                        <div className="p-4 rounded-xl border flex flex-col sm:flex-row items-center justify-between gap-3 bg-emerald-50/30 dark:bg-emerald-950/20 border-emerald-300 dark:border-emerald-800">
                          <div className="flex items-center gap-2">
                            <CheckCircle className="w-5 h-5 text-emerald-600 shrink-0" />
                            <span className="text-xs font-semibold">
                              {savedAudioUrl ? 'Audio saved' : 'Recording ready'}
                            </span>
                          </div>

                          <audio
                            controls
                            src={existingRecording?.blobUrl || savedAudioUrl}
                            className="h-9 w-full sm:w-60"
                          />

                          {existingRecording && !existingRecording.isSaved && (
                            <button
                              type="button"
                              onClick={() => uploadAndSaveSpeakingAnswer(q.id)}
                              disabled={isUploadingVoice}
                              className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-50 text-white rounded-lg text-xs font-bold shadow-xs transition-all whitespace-nowrap cursor-pointer"
                            >
                              {isUploadingVoice ? 'Saving...' : 'Save Audio'}
                            </button>
                          )}
                        </div>
                      )}
                    </div>
                  );
                })()}
              </div>
            ) : currentSection.instructions?.includes('ielts-reading-container') || currentSection.instructions?.includes('ielts-listening-container') ? (
              <IeltsReadingSection
                ref={ieltsContainerRef}
                instructionsHtml={currentSection.instructions}
                qnumToQuestionId={qnumToQuestionId}
                initialAnswers={answersMap}
                onSaveAnswer={handleSaveAnswer}
                onAnswerUpdated={handleLiveAnswerUpdate}
                activeQnum={activeQnum}
                onActiveQuestionChange={(qn) => setActiveQnum(qn)}
                flaggedQnums={flaggedQnums}
                onToggleFlag={toggleFlag}
                className="text-slate-800"
              />
            ) : (
              <div className="space-y-4">
                {(currentSection.questions || []).map((q) => {
                  const options = getOptions(q.options);
                  const isImageQuestion = options.length === 1 && typeof options[0] === 'string' && (options[0].startsWith('http') || options[0].startsWith('/') || options[0].includes('/uploads/'));
                  const isActive = activeQnum === q.order_index;
                  const isFlagged = flaggedQnums.has(q.order_index);

                  return (
                    <div
                      key={q.id}
                      id={`question-card-${q.order_index}`}
                      onClick={() => setActiveQnum(q.order_index)}
                      className={`p-3 rounded transition-all relative ${
                        isActive ? 'border-l-4 border-amber-500 pl-3 bg-amber-50/20' : 'border-l-4 border-transparent'
                      }`}
                    >
                      <div className="flex items-start justify-between gap-3 mb-2">
                        <div className="flex items-start gap-2.5">
                          <span
                            className={`font-bold text-base min-w-[32px] h-[30px] flex items-center justify-center rounded ${
                              isActive
                                ? 'border border-amber-500 text-amber-900 bg-amber-50'
                                : 'bg-slate-900 text-white'
                            }`}
                          >
                            {q.order_index}
                          </span>
                          <span className="text-base sm:text-lg font-semibold text-slate-800 leading-snug whitespace-pre-wrap">
                            {q.question_text}
                          </span>
                        </div>
                        <button
                          type="button"
                          onClick={(e) => {
                            e.stopPropagation();
                            toggleFlag(q.order_index);
                          }}
                          className="text-slate-400 hover:text-amber-500 cursor-pointer p-1"
                          title="Bookmark"
                        >
                          <Bookmark
                            className={`w-4 h-4 ${
                              isFlagged ? 'text-amber-500 fill-amber-500' : 'text-slate-400'
                            }`}
                          />
                        </button>
                      </div>

                      {options.length > 0 && !isImageQuestion ? (
                        <div className="flex flex-col gap-1.5 w-full pl-5">
                          {options.map((opt, optIdx) => {
                            const isChecked = answersMap[q.id]?.text === opt;
                            return (
                              <label
                                key={optIdx}
                                className={`flex items-center gap-3 p-2.5 rounded cursor-pointer transition-colors ${
                                  isChecked
                                    ? 'bg-[#e8f0fe] text-[#1e3a8a] font-semibold'
                                    : 'hover:bg-slate-100 text-slate-800'
                                }`}
                              >
                                <input
                                  type="radio"
                                  name={`question_${q.id}`}
                                  checked={isChecked}
                                  onChange={() => handleSaveAnswer(q.id, opt, "", true)}
                                  className="accent-[#2563eb] w-4 h-4 cursor-pointer"
                                />
                                <span className="text-base">{opt}</span>
                              </label>
                            );
                          })}
                        </div>
                      ) : (
                        <div className="pl-5 pt-1 space-y-3">
                          {isImageQuestion && (
                            <div className="max-w-xl rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900 p-2 shadow-xs">
                              <img
                                src={options[0]}
                                alt="Table/Diagram"
                                className="w-full h-auto max-h-96 object-contain rounded-lg"
                              />
                            </div>
                          )}
                          <input
                            type="text"
                            value={answersMap[q.id]?.text || ''}
                            placeholder="Type answer..."
                            onChange={(e) => {
                              const val = e.target.value;
                              setAnswersMap((prev) => ({
                                ...prev,
                                [q.id]: { text: val, audioUrl: '' },
                              }));
                            }}
                            onBlur={(e) => handleSaveAnswer(q.id, e.target.value)}
                            className="border border-slate-300 rounded px-3.5 py-2 text-base focus:outline-none focus:border-amber-500 focus:ring-1 focus:ring-amber-500 w-56 font-medium"
                          />
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            )}

            {/* Floating Navigation Arrows */}
            <div className="sticky bottom-4 right-4 flex justify-end gap-1.5 z-20 pointer-events-none mt-6">
              <div className="flex items-center gap-1.5 pointer-events-auto shadow-lg rounded">
                <button
                  type="button"
                  onClick={handlePrevQuestion}
                  title="Previous question"
                  className={`w-9 h-9 sm:w-10 sm:h-10 rounded flex items-center justify-center cursor-pointer transition-all ${
                    isDarkContrast
                      ? 'bg-[#27272a] hover:bg-[#3f3f46] text-[#9ca3af]'
                      : 'bg-[#6b7280] hover:bg-slate-700 text-white'
                  }`}
                >
                  <ArrowLeft className="w-5 h-5" />
                </button>
                <button
                  type="button"
                  onClick={handleNextQuestion}
                  title="Next question"
                  className={`w-9 h-9 sm:w-10 sm:h-10 rounded flex items-center justify-center cursor-pointer transition-all font-bold ${
                    isDarkContrast
                      ? 'bg-[#ffffff] hover:bg-slate-100 text-[#18181b]'
                      : 'bg-[#18181b] hover:bg-black text-white'
                  }`}
                >
                  <ArrowRight className="w-5 h-5" />
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Docked Bar */}
        <div
          className={`fixed bottom-0 left-0 right-0 h-12 flex items-center justify-between px-4 z-30 select-none bottom-dock ${
            isDarkContrast
              ? 'bg-black border-t border-black'
              : 'bg-[#f4f4f4] border-t border-slate-200'
          }`}
        >
          {/* Left: Passages & question numbers palette */}
          <div className="flex items-center gap-4 overflow-x-auto py-1 scrollbar-none">
            {(targetSectionFilter !== null && sections[targetSectionFilter]
              ? [{ sec: sections[targetSectionFilter], secIdx: targetSectionFilter }]
              : sections.map((sec, secIdx) => ({ sec, secIdx }))
            ).map(({ sec, secIdx }) => {
              const isActivePassage = secIdx === currentSectionIndex;
              const secQuestions = sec.questions || [];
              const secAnsCount = secQuestions.filter((q) => Boolean(answersMap[q.id]?.text || answersMap[q.id]?.audioUrl)).length;
              const secLabel = getSectionShortLabel(sec, secIdx).toUpperCase();

              if (isActivePassage) {
                return (
                  <div
                    key={sec.id || secIdx}
                    className="relative flex items-center gap-2 shrink-0"
                  >
                    <span
                      className={`font-black text-xs sm:text-sm tracking-wider uppercase mr-1 ${
                        isYellowOnBlack
                          ? 'text-[#fbbf24]'
                          : isWhiteOnBlack
                          ? 'text-white'
                          : 'text-slate-900'
                      }`}
                    >
                      {secLabel}
                    </span>
                    <div className="flex items-center gap-1.5">
                      {secQuestions.map((q) => {
                        const isAns = Boolean(answersMap[q.id]?.text || answersMap[q.id]?.audioUrl);
                        const isActiveQ = activeQnum === q.order_index;
                        const isFlagged = flaggedQnums.has(q.order_index);

                        return (
                          <button
                            key={q.id}
                            type="button"
                            onClick={() => {
                              setActiveQnum(q.order_index);
                              scrollToQuestion(q.order_index);
                            }}
                            title={`Question #${q.order_index} ${isAns ? '(Answered)' : ''} ${isFlagged ? '(Flagged)' : ''}`}
                            className={`w-7 h-7 sm:w-8 sm:h-8 rounded-xs flex items-center justify-center font-bold text-xs sm:text-sm cursor-pointer relative shrink-0 transition-all q-palette-btn ${
                              isYellowOnBlack
                                ? isActiveQ
                                  ? 'bg-black text-[#fbbf24] border-2 border-white ring-1 ring-white is-active-q'
                                  : 'bg-black text-[#fbbf24] border border-zinc-700 hover:border-zinc-500'
                                : isWhiteOnBlack
                                ? isActiveQ
                                  ? 'bg-black text-white border-2 border-white ring-1 ring-white is-active-q'
                                  : 'bg-black text-white border border-zinc-700 hover:border-zinc-500'
                                : isActiveQ
                                ? 'bg-amber-50/60 text-slate-900 border-2 border-amber-500 ring-1 ring-amber-400/20 is-active-q'
                                : 'bg-white text-slate-800 border border-slate-300 hover:border-slate-500'
                            } ${isAns ? 'underline decoration-2 underline-offset-2' : ''}`}
                          >
                            <span>{q.order_index}</span>
                            {isFlagged && (
                              <span className="absolute top-0.5 right-0.5 w-1.5 h-1.5 bg-amber-500 rounded-full" />
                            )}
                          </button>
                        );
                      })}
                    </div>
                  </div>
                );
              }

              return (
                <button
                  key={sec.id || secIdx}
                  type="button"
                  onClick={() => handleSectionChange(secIdx)}
                  className={`text-xs sm:text-sm font-semibold flex items-center gap-1.5 px-2 py-1 rounded transition-colors shrink-0 cursor-pointer ${
                    isYellowOnBlack
                      ? 'text-[#fbbf24]/80 hover:text-[#fbbf24]'
                      : isWhiteOnBlack
                      ? 'text-white/80 hover:text-white'
                      : 'text-slate-600 hover:text-slate-900 hover:bg-slate-200'
                  }`}
                >
                  <span className="font-extrabold uppercase">{secLabel}</span>
                  <span
                    className={
                      isYellowOnBlack
                        ? 'text-[#fbbf24]/60'
                        : isWhiteOnBlack
                        ? 'text-zinc-400'
                        : 'text-slate-500'
                    }
                  >
                    {secAnsCount} of {secQuestions.length}
                  </span>
                </button>
              );
            })}
          </div>

          {/* Right: Submit Checkmark Button */}
          <div className="flex items-center gap-2 shrink-0">
            <button
              type="button"
              onClick={() => setShowSubmitModal(true)}
              title="Submit Test"
              className={`w-9 h-9 rounded-md flex items-center justify-center cursor-pointer transition-colors shadow-xs ${
                isDarkContrast
                  ? 'bg-[#27272a] hover:bg-[#3f3f46] text-[#71717a] hover:text-white'
                  : 'bg-[#e2e8f0] hover:bg-[#cbd5e1] text-slate-800'
              }`}
            >
              <Check
                className={`w-5 h-5 stroke-[3] ${
                  isYellowOnBlack
                    ? 'text-[#71717a]'
                    : isWhiteOnBlack
                    ? 'text-white'
                    : 'text-slate-800'
                }`}
              />
            </button>
          </div>
        </div>

{/* Options Menu (Contrast & Text Size) */}
        {renderOptionsMenu()}

        {/* Instructions Modal Before Test */}
        {renderInstructionsModal()}

        {/* Submit Confirmation Modal */}
        {showSubmitModal && (
          <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
            <div className={`rounded-2xl max-w-md w-full p-6 space-y-4 shadow-xl border ${
              isDarkContrast
                ? 'bg-[#18181b] border-zinc-800 text-white'
                : 'bg-white border-slate-100 text-slate-900'
            }`}>
              <div className="w-12 h-12 rounded-2xl bg-amber-50 dark:bg-amber-950/60 text-amber-600 dark:text-amber-400 flex items-center justify-center mx-auto">
                <AlertTriangle className="w-6 h-6" />
              </div>

              <h3 className="text-lg font-bold text-center">
                Are you sure you want to submit?
              </h3>
              <p className={`text-xs text-center leading-relaxed ${
                isDarkContrast ? 'text-zinc-400' : 'text-slate-600'
              }`}>
                All your submitted answers will be recorded and graded.
              </p>

              <div className="flex gap-2 pt-2">
                <button
                  type="button"
                  onClick={() => setShowSubmitModal(false)}
                  disabled={submitting}
                  className={`flex-1 py-2.5 rounded-xl border text-xs font-bold transition-all cursor-pointer ${
                    isDarkContrast
                      ? 'border-zinc-700 text-zinc-300 hover:bg-zinc-800'
                      : 'border-slate-300 text-slate-700 hover:bg-slate-50'
                  }`}
                >
                  Cancel
                </button>
                <button
                  type="button"
                  onClick={submitTest}
                  disabled={submitting}
                  className="flex-1 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all disabled:opacity-50 cursor-pointer"
                >
                  {submitting ? 'Submitting...' : 'Yes, Submit'}
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    );
  }

  return (
    <div className="w-full min-h-screen flex items-center justify-center p-8 text-center bg-slate-50 dark:bg-slate-900">
      <div className="p-8 max-w-md bg-white dark:bg-slate-800 rounded-2xl border border-slate-200 dark:border-slate-700 shadow-md space-y-4">
        <AlertTriangle className="w-10 h-10 text-amber-500 mx-auto" />
        <h2 className="text-lg font-bold text-slate-900 dark:text-white">No Section Found</h2>
        <p className="text-xs text-slate-500 dark:text-slate-400">
          No sections were found in this test.
        </p>
        <button
          onClick={() => router.push('/student')}
          className="px-5 py-2.5 bg-slate-900 dark:bg-emerald-600 text-white rounded-xl text-xs font-bold hover:bg-slate-800 transition-all cursor-pointer"
        >
          Back to Tests
        </button>
      </div>
    </div>
  );
}
