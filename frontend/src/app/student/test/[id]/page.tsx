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

  const flushAnswers = () => {
    if (!ieltsContainerRef.current) return;
    const inputs = ieltsContainerRef.current.querySelectorAll<HTMLInputElement>('input[type="text"][data-qnum]');
    inputs.forEach((input) => {
      const qnum = Number(input.getAttribute('data-qnum'));
      const qId = qnumToQuestionId[qnum];
      if (qId && input.value.trim()) {
        handleSaveAnswer(qId, input.value.trim());
      }
    });
  };

  const handleSectionChange = (idx: number) => {
    flushAnswers();
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
        throw new Error('Sessiya topilmadi');
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
    if (!mounted || secondsRemaining <= 0) return;
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
  }, [mounted, secondsRemaining]);

  const handleAutoSubmit = async () => {
    alert('Time is up! Your test is being submitted automatically...');
    flushAnswers();
    await submitTest();
  };

  const submitTest = async () => {
    if (isNaN(sessionId)) return;
    flushAnswers();
    setSubmitting(true);
    try {
      await apiSubmitSession(sessionId);
      router.push(`/student/results/${sessionId}`);
    } catch (e: any) {
      alert('Error submitting test: ' + (e.message || 'Server error'));
      setSubmitting(false);
    }
  };

  // Autosave handler
  const handleSaveAnswer = async (questionId: number, text: string, audioUrl: string = '') => {
    if (isNaN(sessionId)) return;
    setAnswersMap((prev) => ({
      ...prev,
      [questionId]: { text, audioUrl: audioUrl || prev[questionId]?.audioUrl || '' },
    }));

    setSavingQuestionId(questionId);
    try {
      await apiSaveAnswer(sessionId, questionId, text, audioUrl || answersMap[questionId]?.audioUrl || '');
    } catch (e) {
      console.error('Failed to autosave answer:', e);
    } finally {
      setSavingQuestionId(null);
    }
  };

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
      await handleSaveAnswer(questionId, 'Speaking audio answer recorded', uploadRes.url);
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

  // 1. DEDICATED COMPUTER-DELIVERED READING TEST INTERFACE
  if (currentSection?.type === 'reading') {
    return (
      <div className="w-full h-full flex flex-col overflow-hidden bg-white text-slate-900 select-none relative">
        {/* Top Header */}
        <header className="h-14 bg-[#f2f2f0] border-b border-slate-300 px-6 flex items-center justify-between shrink-0 select-none z-30">
          <div>
            <h1 className="text-base sm:text-lg font-extrabold text-slate-900 tracking-wide uppercase">
              PASSAGE {currentSectionIndex + 1}
            </h1>
            <p className="text-sm sm:text-base text-slate-600 font-medium">
              Read the text and answer questions {minQ}–{maxQ}
            </p>
          </div>

          <div className="flex items-center gap-3">
            <div className="flex items-center gap-2 font-mono text-sm sm:text-base font-bold text-slate-800 bg-white/80 border border-slate-300 px-3.5 py-1.5 rounded shadow-2xs">
              <Clock className="w-4 h-4 text-slate-600" />
              <span>{formatTimer(secondsRemaining)} left</span>
            </div>
          </div>
        </header>

        {/* Middle Split-screen Resizable Body */}
        <div
          id="ielts-reading-split-container"
          ref={splitContainerRef}
          className="flex-1 flex flex-row overflow-hidden relative w-full pb-12"
        >
          {/* Left Pane: Passage Text (Clean, marker-free, large font) */}
          <div
            style={{ width: `${splitRatio}%` }}
            className="h-full overflow-y-auto bg-white border-r border-slate-200 p-6 md:p-8 scrollbar-thin select-text"
          >
            <div className="max-w-3xl mx-auto space-y-4">
              {currentSection.passage_text ? (
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
            className="h-full overflow-y-auto p-6 md:p-8 bg-white relative scrollbar-thin"
          >
            {currentSection.instructions?.includes('ielts-reading-container') ? (
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
                          <span className="text-base sm:text-lg font-semibold text-slate-800 leading-snug">
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

                      {options.length > 0 ? (
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
                                  onChange={() => handleSaveAnswer(q.id, opt)}
                                  className="accent-[#2563eb] w-4 h-4 cursor-pointer"
                                />
                                <span className="text-base">{opt}</span>
                              </label>
                            );
                          })}
                        </div>
                      ) : (
                        <div className="pl-5 pt-1">
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
                  className="w-9 h-9 rounded bg-[#18181b] hover:bg-slate-700 active:bg-black text-white flex items-center justify-center cursor-pointer transition-colors"
                >
                  <ChevronLeft className="w-5 h-5 text-white" />
                </button>
                <button
                  type="button"
                  onClick={handleNextQuestion}
                  title="Next question"
                  className="w-9 h-9 rounded bg-[#18181b] hover:bg-slate-700 active:bg-black text-white flex items-center justify-center cursor-pointer transition-colors"
                >
                  <ChevronRight className="w-5 h-5 text-white" />
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Docked Bar */}
        <div className="fixed bottom-0 left-0 right-0 h-12 bg-[#f1f3f5] border-t border-slate-300 flex items-center justify-between px-4 z-30 select-none">
          {/* Left: Passages & question numbers palette */}
          <div className="flex items-center gap-4 overflow-x-auto py-1 scrollbar-none">
            {sections.map((sec, secIdx) => {
              const isActivePassage = secIdx === currentSectionIndex;
              const secQuestions = sec.questions || [];
              const secAnsCount = secQuestions.filter((q) => Boolean(answersMap[q.id]?.text)).length;

              if (isActivePassage) {
                return (
                  <div
                    key={sec.id || secIdx}
                    className="relative flex items-center gap-1.5 shrink-0 after:absolute after:-top-[7px] after:left-0 after:right-0 after:h-[3px] after:bg-emerald-600"
                  >
                    <span className="font-extrabold text-sm sm:text-base text-slate-900 tracking-wide uppercase mr-1">
                      PASSAGE {secIdx + 1}
                    </span>
                    <div className="flex items-center gap-1.5">
                      {secQuestions.map((q) => {
                        const isAns = Boolean(answersMap[q.id]?.text);
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
                            className={`w-8 h-8 min-w-[32px] min-h-[32px] sm:w-[34px] sm:h-[34px] sm:min-w-[34px] sm:min-h-[34px] rounded bg-white flex items-center justify-center font-bold text-sm cursor-pointer relative shrink-0 transition-all ${
                              isActiveQ
                                ? 'border-2 border-amber-500 bg-amber-50/60 text-slate-900 shadow-xs ring-1 ring-amber-400/20'
                                : 'border border-slate-300 text-slate-800 hover:border-slate-500 hover:bg-slate-50'
                            } ${isAns ? 'underline decoration-2 underline-offset-2 decoration-slate-900 font-extrabold' : ''}`}
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
                  className="text-xs sm:text-sm font-semibold text-slate-600 hover:text-slate-900 flex items-center gap-1.5 px-2 py-1 rounded hover:bg-slate-200 transition-colors shrink-0 cursor-pointer"
                >
                  <span className="font-extrabold uppercase">PASSAGE {secIdx + 1}</span>
                  <span className="text-slate-500 font-medium">
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
              className="w-9 h-9 rounded bg-slate-200 hover:bg-slate-300 active:bg-slate-400 text-slate-800 flex items-center justify-center cursor-pointer transition-colors shadow-xs"
            >
              <CheckCircle className="w-5 h-5 text-slate-800" />
            </button>
          </div>
        </div>

        {/* Submit Confirmation Modal */}
        {showSubmitModal && (
          <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
            <div className="bg-white rounded-2xl max-w-md w-full p-6 space-y-4 shadow-xl border border-slate-100">
              <div className="w-12 h-12 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center mx-auto">
                <AlertTriangle className="w-6 h-6" />
              </div>

              <h3 className="text-lg font-bold text-center text-slate-900">
                Are you sure you want to submit?
              </h3>
              <p className="text-xs text-slate-600 text-center leading-relaxed">
                All your submitted answers will be recorded and graded.
              </p>

              <div className="flex gap-2 pt-2">
                <button
                  onClick={() => setShowSubmitModal(false)}
                  disabled={submitting}
                  className="flex-1 py-2.5 rounded-xl border border-slate-300 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-all"
                >
                  Cancel
                </button>
                <button
                  onClick={submitTest}
                  disabled={submitting}
                  className="flex-1 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all disabled:opacity-50"
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
    <div className="space-y-6 pb-20">
      {/* Top Test Header Bar */}
      <div className="glass-panel rounded-2xl border border-slate-200/90 dark:border-slate-800 p-4 sm:p-5 shadow-md shadow-slate-200/40 dark:shadow-none sticky top-20 z-40 transition-all">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div>
            <h1 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white line-clamp-1">
              {test.title}
            </h1>
            <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 font-semibold flex items-center gap-1.5 mt-0.5">
              <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
              CEFR Examination Standard
            </p>
          </div>

          <div className="flex items-center gap-3">
            {/* Live Timer */}
            <div
              className={`flex items-center gap-2 px-4 py-2 rounded-xl font-mono text-sm font-black border shadow-xs ${
                secondsRemaining < 300
                  ? 'bg-rose-50 dark:bg-rose-950/60 text-rose-700 dark:text-rose-300 border-rose-300 dark:border-rose-800 animate-pulse ring-2 ring-rose-400/20'
                  : 'bg-slate-900 dark:bg-slate-800 text-white border-slate-800 dark:border-slate-700'
              }`}
            >
              <Clock className={`w-4 h-4 ${secondsRemaining < 300 ? 'text-rose-600 dark:text-rose-400' : 'text-emerald-400'}`} />
              <span>{formatTimer(secondsRemaining)}</span>
            </div>

            {/* Submit Button */}
            <button
              onClick={() => setShowSubmitModal(true)}
              className="py-2 px-5 bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white rounded-xl text-xs sm:text-sm font-bold transition-all shadow-md shadow-emerald-600/20 hover:scale-[1.02] flex items-center gap-1.5"
            >
              <Send className="w-3.5 h-3.5" />
              Submit Test
            </button>
          </div>
        </div>

        {/* Section Navigation Tabs */}
        <div className="flex gap-2 overflow-x-auto pt-3 mt-3 border-t border-slate-200/70 dark:border-slate-800">
          {(targetSectionFilter !== null && sections[targetSectionFilter]
            ? [{ sec: sections[targetSectionFilter], idx: targetSectionFilter }]
            : sections.map((sec, idx) => ({ sec, idx }))
          ).map(({ sec, idx }) => {
            const isSelected = idx === currentSectionIndex;
            let icon = <BookOpen className="w-4 h-4" />;
            if (sec.type === 'listening') icon = <Headphones className="w-4 h-4" />;
            if (sec.type === 'writing') icon = <Edit3 className="w-4 h-4" />;
            if (sec.type === 'speaking') icon = <Mic className="w-4 h-4" />;
            const tabLabel = getSectionShortLabel(sec, idx);

            return (
              <button
                key={sec.id || idx}
                onClick={() => handleSectionChange(idx)}
                className={`flex items-center gap-2 px-4 py-2 rounded-xl text-xs sm:text-sm font-bold whitespace-nowrap transition-all ${
                  isSelected
                    ? 'bg-slate-900 dark:bg-emerald-600 text-white shadow-sm ring-1 ring-slate-800 dark:ring-emerald-500'
                    : 'bg-white dark:bg-slate-800/90 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-700'
                }`}
              >
                {icon}
                <span>{tabLabel}</span>
              </button>
            );
          })}
        </div>
      </div>

      {/* Main Section Content Area */}
      {currentSection ? (
        <div className="space-y-6">
          {/* Section Instructions Card (only if custom non-IELTS instructions exist) */}
          {!currentSection.instructions?.includes('ielts-') && currentSection.instructions && (
            <div className="border rounded-2xl p-4 sm:p-5 flex flex-col sm:flex-row sm:items-center justify-between gap-3 bg-slate-50 dark:bg-slate-800/50 border-slate-200 dark:border-slate-700">
              <div>
                <h2 className="text-base font-bold text-slate-900 dark:text-white flex items-center gap-2">
                  <span className="w-2.5 h-2.5 rounded-full bg-blue-600"></span>
                  {currentSection.title}
                </h2>
                <p className="text-xs sm:text-sm mt-1 text-slate-600 dark:text-slate-300 leading-relaxed">
                  {currentSection.instructions}
                </p>
              </div>
            </div>
          )}

          {/* 1. LISTENING SECTION */}
          {currentSection.type === 'listening' && (
            <div className="space-y-6">
              {/* Audio Player Card with Limit (1-2 plays) */}
              <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm flex flex-col sm:flex-row items-center justify-between gap-4">
                <div className="flex items-center gap-3">
                  <div className="w-12 h-12 rounded-2xl bg-blue-50 dark:bg-blue-950/60 text-blue-600 dark:text-blue-400 flex items-center justify-center">
                    <Headphones className="w-6 h-6" />
                  </div>
                  <div>
                    <h3 className="text-sm font-bold text-slate-900 dark:text-white">Listening Audio Track</h3>
                    <p className="text-xs text-slate-500 dark:text-slate-400">
                      Exam Rule: Audio can be played at most 2 times.
                    </p>
                  </div>
                </div>

                <div className="flex items-center gap-3">
                  {isPlayingAudio && (
                    <div className="flex items-center gap-1.5 px-3 py-1 rounded-full bg-blue-100 dark:bg-blue-900/60 text-blue-700 dark:text-blue-300 text-xs font-bold animate-pulse">
                      <span className="w-2 h-2 rounded-full bg-blue-600"></span>
                      Playing audio...
                    </div>
                  )}

                  <div className="text-right">
                    <span className="text-xs font-semibold text-slate-500 dark:text-slate-400 block">Plays left:</span>
                    <span className="text-sm font-bold text-blue-700 dark:text-blue-400">
                      {audioPlaysLeft[currentSection.id] !== undefined
                        ? audioPlaysLeft[currentSection.id]
                        : 2}{' '}
                      / 2 plays
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
                    className="px-4 py-2.5 bg-blue-600 hover:bg-blue-700 disabled:opacity-40 text-white rounded-xl text-sm font-bold shadow-sm transition-all flex items-center gap-2 cursor-pointer"
                  >
                    {isPlayingAudio ? (
                      <>
                        <Pause className="w-4 h-4" /> Pause
                      </>
                    ) : (
                      <>
                        <Play className="w-4 h-4" /> Play
                      </>
                    )}
                  </button>
                </div>
              </div>

              {/* Question Type Filter Bar */}
              {renderQuestionTypeFilterBar()}

              {/* Questions for Listening */}
              {currentSection.instructions?.includes('ielts-reading-container') || currentSection.instructions?.includes('ielts-listening-container') ? (
                <div className="space-y-4">
                  <IeltsReadingSection
                    ref={ieltsContainerRef}
                    instructionsHtml={currentSection.instructions}
                    qnumToQuestionId={qnumToQuestionId}
                    initialAnswers={answersMap}
                    onSaveAnswer={handleSaveAnswer}
                    onAnswerUpdated={handleLiveAnswerUpdate}
                    className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm"
                  />

                  {/* Question Navigator Palette */}
                  <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm">
                    <div className="flex items-center justify-between mb-2">
                      <span className="text-xs font-bold text-slate-700 dark:text-slate-300 uppercase tracking-wider">
                        Questions in this section ({currentSection.questions?.length || 0})
                      </span>
                      <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300">
                        Completed:{' '}
                        {(currentSection.questions || []).filter((q) => Boolean(answersMap[q.id]?.text)).length} /{' '}
                        {currentSection.questions?.length || 0}
                      </span>
                    </div>

                    <div className="flex flex-wrap gap-1.5 pt-2 border-t border-slate-100 dark:border-slate-800">
                      {(currentSection.questions || []).map((q) => {
                        const isAnswered = Boolean(answersMap[q.id]?.text);
                        const isMatchFilter = filteredQnums.has(q.order_index);
                        const isDimmed = selectedQuestionTypeFilter !== 'all' && !isMatchFilter;

                        return (
                          <button
                            key={q.id}
                            type="button"
                            onClick={() => scrollToQuestion(q.order_index)}
                            title={`Question #${q.order_index}`}
                            className={`w-8 h-8 rounded-lg text-xs font-bold transition-all flex items-center justify-center border cursor-pointer ${
                              isDimmed
                                ? 'opacity-25 grayscale border-dashed border-slate-300 dark:border-slate-700 scale-90'
                                : isAnswered
                                ? 'bg-blue-600 text-white border-blue-600 shadow-xs'
                                : 'bg-white dark:bg-slate-800 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 hover:border-blue-400 hover:bg-blue-50/50 dark:hover:bg-slate-700'
                            } ${selectedQuestionTypeFilter !== 'all' && isMatchFilter ? 'ring-2 ring-emerald-500 ring-offset-1' : ''}`}
                          >
                            {q.order_index}
                          </button>
                        );
                      })}
                    </div>
                  </div>
                </div>
              ) : (
                <div className="space-y-4">
                  {filteredQuestions.length === 0 ? (
                    <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-8 text-center text-slate-500">
                      No questions match the selected filter.
                    </div>
                  ) : (
                    filteredQuestions.map((q) => {
                      const options = getOptions(q.options);
                      const qCat = getQuestionCategory(q);
                      const catMeta = IELTS_QUESTION_CATEGORIES[qCat];

                      return (
                        <div
                          key={q.id}
                          id={`question-card-${q.order_index}`}
                          className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 sm:p-6 shadow-sm scroll-mt-28"
                        >
                          <div className="flex items-center justify-between mb-3">
                            <div className="flex items-center gap-2">
                              <span className="text-xs font-bold uppercase text-slate-500 dark:text-slate-400">
                                Question #{q.order_index}
                              </span>
                              {catMeta && catMeta.id !== 'all' && (
                                <span className={`text-[10px] font-semibold px-2 py-0.5 rounded-full border ${catMeta.badgeClass}`}>
                                  {catMeta.shortLabel}
                                </span>
                              )}
                            </div>
                            <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                              {q.points} pts
                            </span>
                          </div>

                          <h4 className="text-base font-semibold text-slate-900 dark:text-white mb-4">{q.question_text}</h4>

                          {options.length > 0 ? (
                            <div className="space-y-2">
                              {options.map((opt, optIdx) => {
                                const isChecked = answersMap[q.id]?.text === opt;
                                return (
                                  <label
                                    key={optIdx}
                                    className={`flex items-center gap-3 p-3.5 rounded-xl border text-sm cursor-pointer transition-all ${
                                      isChecked
                                        ? 'border-emerald-600 bg-emerald-50/60 dark:bg-emerald-950/40 font-semibold text-emerald-950 dark:text-emerald-300'
                                        : 'border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-800/60 text-slate-700 dark:text-slate-300'
                                    }`}
                                  >
                                    <input
                                      type="radio"
                                      name={`question_${q.id}`}
                                      checked={isChecked}
                                      onChange={() => handleSaveAnswer(q.id, opt)}
                                      className="text-emerald-600 focus:ring-emerald-500 w-4 h-4"
                                    />
                                    <span>{opt}</span>
                                  </label>
                                );
                              })}
                            </div>
                          ) : (
                            <div>
                              <input
                                type="text"
                                placeholder="Type your answer here..."
                                value={answersMap[q.id]?.text || ''}
                                onChange={(e) => {
                                  const val = e.target.value;
                                  setAnswersMap((prev) => ({
                                    ...prev,
                                    [q.id]: { text: val, audioUrl: '' },
                                  }));
                                }}
                                onBlur={(e) => handleSaveAnswer(q.id, e.target.value)}
                                className="w-full px-4 py-3 border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 text-slate-800 dark:text-slate-100 placeholder:text-slate-400 dark:placeholder:text-slate-500"
                              />
                            </div>
                          )}
                        </div>
                      );
                    })
                  )}
                </div>
              )}
            </div>
          )}

          {/* 3. WRITING SECTION */}
          {currentSection.type === 'writing' && (
            <div className="space-y-6">
              {(Array.isArray(currentSection.questions) ? currentSection.questions : []).map((q, qIdx) => {
                const currentText = answersMap[q.id]?.text || '';
                const wordCount = countWords(currentText);
                const targetWords = qIdx === 0 ? 150 : 250;
                const isTargetReached = wordCount >= targetWords;

                return (
                  <div key={q.id || qIdx} className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-amber-700 dark:text-amber-400 bg-amber-50 dark:bg-amber-950/60 px-2.5 py-1 rounded-md border border-amber-200 dark:border-amber-800">
                        Writing Task #{qIdx + 1}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                        Max: {q.points} pts
                      </span>
                    </div>

                    <div className="bg-slate-50 dark:bg-slate-800/80 p-4 rounded-xl border border-slate-200 dark:border-slate-700 space-y-3">
                      <div className="text-slate-800 dark:text-slate-200 text-sm font-semibold leading-relaxed whitespace-pre-wrap">
                        {q.question_text}
                      </div>
                      {Array.isArray(q.options) && q.options.length > 0 && typeof q.options[0] === 'string' && (q.options[0].startsWith('/') || q.options[0].startsWith('http')) && (
                        <div className="bg-white dark:bg-slate-900 p-3 rounded-xl border border-slate-200 dark:border-slate-700 shadow-xs inline-block max-w-full">
                          <img
                            src={q.options[0]}
                            alt={`Writing Task ${qIdx + 1} Diagram`}
                            className="max-h-[500px] w-auto max-w-full object-contain rounded-lg mx-auto"
                            onError={(e) => {
                              if (Array.isArray(q.options) && q.options[1] && e.currentTarget.src !== q.options[1]) {
                                e.currentTarget.src = q.options[1];
                              }
                            }}
                          />
                        </div>
                      )}
                    </div>

                    <div>
                      <div className="flex items-center justify-between text-xs mb-2">
                        <span className="text-slate-500 dark:text-slate-400 font-medium">Type your essay response here:</span>
                        <div
                          className={`font-mono font-bold px-2 py-1 rounded-md text-xs ${
                            isTargetReached
                              ? 'bg-emerald-100 dark:bg-emerald-950/80 text-emerald-800 dark:text-emerald-300'
                              : 'bg-amber-100 dark:bg-amber-950/80 text-amber-800 dark:text-amber-300'
                          }`}
                        >
                          Words: {wordCount} / min {targetWords}
                        </div>
                      </div>

                      <textarea
                        rows={12}
                        value={currentText}
                        onChange={(e) => handleSaveAnswer(q.id, e.target.value)}
                        placeholder={`Start writing your essay (at least ${targetWords} words)...`}
                        className="w-full p-4 rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 font-sans leading-relaxed placeholder:text-slate-400 dark:placeholder:text-slate-500"
                      />
                    </div>
                  </div>
                );
              })}
            </div>
          )}

          {/* 4. SPEAKING SECTION */}
          {currentSection.type === 'speaking' && (
            <div className="space-y-6">
              {(Array.isArray(currentSection.questions) ? currentSection.questions : []).map((q, qIdx) => {
                const isRecordingThis = recordingQuestionId === q.id;
                const existingRecording = recordedAudios[q.id];
                const savedAudioUrl = answersMap[q.id]?.audioUrl;

                return (
                  <div key={q.id || qIdx} className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-purple-700 dark:text-purple-400 bg-purple-50 dark:bg-purple-950/60 px-2.5 py-1 rounded-md border border-purple-200 dark:border-purple-800">
                        Speaking Part #{qIdx + 1}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                        Max: {q.points} pts
                      </span>
                    </div>

                    <p className="text-slate-900 dark:text-purple-100 text-sm font-bold leading-relaxed bg-purple-50/50 dark:bg-purple-950/30 p-4 rounded-xl border border-purple-100 dark:border-purple-900/50">
                      {q.question_text}
                    </p>

                    {/* Microphone Controls */}
                    <div className="p-5 bg-slate-50 dark:bg-slate-800/80 rounded-xl border border-slate-200 dark:border-slate-700 flex flex-col sm:flex-row items-center justify-between gap-4">
                      <div className="flex items-center gap-3">
                        <div
                          className={`w-12 h-12 rounded-2xl flex items-center justify-center transition-all ${
                            isRecordingThis
                              ? 'bg-rose-500 text-white animate-pulse'
                              : 'bg-purple-100 dark:bg-purple-900/60 text-purple-700 dark:text-purple-300'
                          }`}
                        >
                          <Mic className="w-6 h-6" />
                        </div>
                        <div>
                          <div className="text-sm font-bold text-slate-800 dark:text-slate-200">
                            {isRecordingThis
                              ? 'Recording in progress...'
                              : savedAudioUrl
                              ? 'Response saved successfully'
                              : 'Record your response'}
                          </div>
                          <div className="text-xs text-slate-500 dark:text-slate-400 font-mono">
                            {isRecordingThis ? `Time: ${recordingSeconds}s` : 'Click record to start speaking'}
                          </div>
                        </div>
                      </div>

                      <div className="flex items-center gap-2">
                        {isRecordingThis ? (
                          <button
                            onClick={stopRecording}
                            className="px-4 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                          >
                            <Square className="w-4 h-4" /> Stop Recording
                          </button>
                        ) : (
                          <button
                            onClick={() => startRecording(q.id)}
                            className="px-4 py-2.5 bg-purple-600 hover:bg-purple-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                          >
                            <Mic className="w-4 h-4" /> Start Recording
                          </button>
                        )}
                      </div>
                    </div>

                    {/* Recorded Audio Preview */}
                    {(existingRecording || savedAudioUrl) && (
                      <div className="p-4 bg-emerald-50 dark:bg-emerald-950/40 rounded-xl border border-emerald-200 dark:border-emerald-800/80 flex flex-col sm:flex-row items-center justify-between gap-3">
                        <div className="flex items-center gap-2">
                          <CheckCircle className="w-5 h-5 text-emerald-600 dark:text-emerald-400 flex-shrink-0" />
                          <span className="text-xs font-semibold text-emerald-900 dark:text-emerald-200">
                            Recorded audio ready. Listen below:
                          </span>
                        </div>

                        <audio
                          controls
                          src={existingRecording?.blobUrl || savedAudioUrl}
                          className="h-9 w-full sm:w-64"
                        />

                        {existingRecording && !existingRecording.isSaved && (
                          <button
                            onClick={() => uploadAndSaveSpeakingAnswer(q.id)}
                            disabled={isUploadingVoice}
                            className="px-3.5 py-2 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-50 text-white rounded-lg text-xs font-bold shadow-sm transition-all whitespace-nowrap"
                          >
                            {isUploadingVoice ? 'Uploading...' : 'Save Audio'}
                          </button>
                        )}
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          )}

          {/* Bottom Section Navigator */}
          <div className="flex items-center justify-between pt-6 border-t border-slate-200 dark:border-slate-800">
            {targetSectionFilter !== null ? (
              <>
                <button
                  onClick={() => router.push('/student')}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-xs font-semibold text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800 transition-all flex items-center gap-1.5"
                >
                  <ChevronLeft className="w-4 h-4" /> Back to Tests
                </button>

                <button
                  onClick={() => setShowSubmitModal(true)}
                  className="px-5 py-2.5 rounded-xl bg-emerald-700 hover:bg-emerald-800 text-white text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                >
                  Finish Section <Send className="w-4 h-4" />
                </button>
              </>
            ) : (
              <>
                <button
                  onClick={() => handleSectionChange(Math.max(0, currentSectionIndex - 1))}
                  disabled={currentSectionIndex === 0}
                  className="px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-xs font-semibold text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800 disabled:opacity-30 transition-all flex items-center gap-1.5"
                >
                  <ChevronLeft className="w-4 h-4" /> Previous Section
                </button>

                {currentSectionIndex < sections.length - 1 ? (
                  <button
                    onClick={() => handleSectionChange(Math.min(sections.length - 1, currentSectionIndex + 1))}
                    className="px-5 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                  >
                    Next Section <ChevronRight className="w-4 h-4" />
                  </button>
                ) : (
                  <button
                    onClick={() => setShowSubmitModal(true)}
                    className="px-5 py-2.5 rounded-xl bg-emerald-700 hover:bg-emerald-800 text-white text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                  >
                    Finish Test <Send className="w-4 h-4" />
                  </button>
                )}
              </>
            )}
          </div>
        </div>
      ) : (
        <div className="p-8 text-center bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 text-slate-500 dark:text-slate-400">
          No sections found in this test.
        </div>
      )}

      {/* Submit Confirmation Modal */}
      {showSubmitModal && (
        <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-white dark:bg-slate-900 rounded-2xl max-w-md w-full p-6 space-y-4 shadow-xl border border-slate-100 dark:border-slate-800">
            <div className="w-12 h-12 rounded-2xl bg-amber-50 dark:bg-amber-950/60 text-amber-600 dark:text-amber-400 flex items-center justify-center mx-auto">
              <AlertTriangle className="w-6 h-6" />
            </div>

            <h3 className="text-lg font-bold text-center text-slate-900 dark:text-white">
              Are you sure you want to submit?
            </h3>
            <p className="text-xs text-slate-600 dark:text-slate-400 text-center leading-relaxed">
              All your submitted answers will be recorded and graded.
            </p>

            <div className="flex gap-2 pt-2">
              <button
                onClick={() => setShowSubmitModal(false)}
                disabled={submitting}
                className="flex-1 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-slate-700 dark:text-slate-300 text-xs font-bold hover:bg-slate-50 dark:hover:bg-slate-800 transition-all"
              >
                Cancel
              </button>
              <button
                onClick={submitTest}
                disabled={submitting}
                className="flex-1 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all disabled:opacity-50"
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
