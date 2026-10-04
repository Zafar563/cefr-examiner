'use client';

import React, { useEffect, useRef, useState, useCallback } from 'react';
import { BookOpen, Highlighter, Trash2, X, Check } from 'lucide-react';

export const HIGHLIGHT_COLORS = {
  yellow: { name: 'Sariq', bg: '#fef08a', border: '#eab308', text: '#713f12' },
  green: { name: 'Yashil', bg: '#bbf7d0', border: '#22c55e', text: '#14532d' },
  blue: { name: 'Moviy', bg: '#bae6fd', border: '#0ea5e9', text: '#0c4a6e' },
  purple: { name: 'Binafsha', bg: '#e9d5ff', border: '#a855f7', text: '#581c87' },
  orange: { name: 'To‘q sariq', bg: '#fed7aa', border: '#f97316', text: '#7c2d12' },
} as const;

export type HighlightColorKey = keyof typeof HIGHLIGHT_COLORS;

interface ReadingPassageHighlighterProps {
  passageText?: string;
  sessionId: number;
  sectionId: number;
  className?: string;
}

export function clearSessionHighlights(sessionId: number) {
  if (typeof window === 'undefined') return;
  const prefix = `cefr_passage_hl_${sessionId}_`;
  const keysToRemove: string[] = [];
  for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    if (key && key.startsWith(prefix)) {
      keysToRemove.push(key);
    }
  }
  keysToRemove.forEach((k) => localStorage.removeItem(k));
}

export default function ReadingPassageHighlighter({
  passageText,
  sessionId,
  sectionId,
  className = '',
}: ReadingPassageHighlighterProps) {
  const containerRef = useRef<HTMLDivElement | null>(null);
  const scrollWrapperRef = useRef<HTMLDivElement | null>(null);

  const [activeColor, setActiveColor] = useState<HighlightColorKey>('yellow');
  const [highlightCount, setHighlightCount] = useState<number>(0);
  const [activeRange, setActiveRange] = useState<Range | null>(null);
  const [selectedMark, setSelectedMark] = useState<HTMLElement | null>(null);

  const [floatingMenu, setFloatingMenu] = useState<{
    top: number;
    left: number;
    placement: 'above' | 'below';
    mode: 'new' | 'existing';
    currentColor?: string;
  } | null>(null);

  const storageKey = `cefr_passage_hl_${sessionId}_${sectionId}`;

  const updateHighlightCount = useCallback(() => {
    if (!containerRef.current) return;
    const count = containerRef.current.querySelectorAll('.cefr-highlight').length;
    setHighlightCount(count);
  }, []);

  const saveHighlights = useCallback(() => {
    if (!containerRef.current) return;
    try {
      localStorage.setItem(storageKey, containerRef.current.innerHTML);
      updateHighlightCount();
    } catch (e) {
      console.error('Error saving highlights:', e);
    }
  }, [storageKey, updateHighlightCount]);

  // Load content (saved highlights or initial formatted text)
  useEffect(() => {
    if (!containerRef.current) return;
    setFloatingMenu(null);
    setActiveRange(null);
    setSelectedMark(null);

    const saved = localStorage.getItem(storageKey);
    if (saved && saved.trim()) {
      containerRef.current.innerHTML = saved;
    } else {
      const raw = (passageText || 'Matn taqdim etilmagan.').trim();
      const paragraphs = raw.split(/\n\s*\n/).filter(Boolean);
      if (paragraphs.length > 1) {
        containerRef.current.innerHTML = paragraphs
          .map((p) => `<p class="mb-4 leading-relaxed">${p.replace(/\n/g, '<br/>')}</p>`)
          .join('');
      } else {
        containerRef.current.innerHTML = `<p class="leading-relaxed">${raw.replace(/\n/g, '<br/>')}</p>`;
      }
    }
    updateHighlightCount();
  }, [passageText, sessionId, sectionId, storageKey, updateHighlightCount]);

  // Close floating menu on scroll or resize so it doesn't float detached
  useEffect(() => {
    if (!floatingMenu) return;
    const handleScrollOrResize = () => {
      setFloatingMenu(null);
      setSelectedMark(null);
    };
    const wrapper = scrollWrapperRef.current;
    wrapper?.addEventListener('scroll', handleScrollOrResize, { passive: true });
    window.addEventListener('scroll', handleScrollOrResize, { passive: true });
    window.addEventListener('resize', handleScrollOrResize, { passive: true });
    return () => {
      wrapper?.removeEventListener('scroll', handleScrollOrResize);
      window.removeEventListener('scroll', handleScrollOrResize);
      window.removeEventListener('resize', handleScrollOrResize);
    };
  }, [floatingMenu]);

  // Handle text selection in passage
  const handleSelection = useCallback(() => {
    const selection = window.getSelection();
    if (!selection || selection.rangeCount === 0 || selection.isCollapsed) {
      return;
    }

    const text = selection.toString().trim();
    if (!text || text.length === 0) return;

    const range = selection.getRangeAt(0);
    const container = containerRef.current;
    if (!container) return;

    // Check if selection is inside this passage container
    if (!container.contains(range.commonAncestorContainer)) {
      return;
    }

    const rect = range.getBoundingClientRect();
    if (rect.width === 0 && rect.height === 0) return;

    // Viewport position calculation for fixed positioning
    const centerX = rect.left + rect.width / 2;
    const clampedX = Math.max(140, Math.min(window.innerWidth - 140, centerX));

    // If rect.top is near top of screen (or near sticky elements), place below selection
    const placeBelow = rect.top < 140;
    const top = placeBelow ? rect.bottom + 8 : rect.top - 8;

    setActiveRange(range.cloneRange());
    setSelectedMark(null);
    setFloatingMenu({
      top,
      left: clampedX,
      placement: placeBelow ? 'below' : 'above',
      mode: 'new',
      currentColor: activeColor,
    });
  }, [activeColor]);

  // Handle clicking on existing highlight or empty space
  const handlePassageClick = (e: React.MouseEvent) => {
    const target = (e.target as HTMLElement).closest('.cefr-highlight') as HTMLElement | null;

    if (target) {
      e.stopPropagation();
      const rect = target.getBoundingClientRect();
      const centerX = rect.left + rect.width / 2;
      const clampedX = Math.max(140, Math.min(window.innerWidth - 140, centerX));

      const placeBelow = rect.top < 140;
      const top = placeBelow ? rect.bottom + 8 : rect.top - 8;

      setSelectedMark(target);
      setActiveRange(null);
      setFloatingMenu({
        top,
        left: clampedX,
        placement: placeBelow ? 'below' : 'above',
        mode: 'existing',
        currentColor: (target.getAttribute('data-color') as HighlightColorKey) || 'yellow',
      });
      return;
    }

    // If clicked elsewhere without selecting
    const selection = window.getSelection();
    if (!selection || selection.isCollapsed) {
      setFloatingMenu(null);
      setActiveRange(null);
      setSelectedMark(null);
    }
  };

  // Apply highlight with chosen color
  const applyHighlight = (colorKey: HighlightColorKey) => {
    setActiveColor(colorKey);
    const col = HIGHLIGHT_COLORS[colorKey];

    // Case 1: Editing existing highlight
    if (selectedMark) {
      selectedMark.setAttribute('data-color', colorKey);
      selectedMark.style.backgroundColor = col.bg;
      selectedMark.style.color = col.text;
      saveHighlights();
      setFloatingMenu(null);
      setSelectedMark(null);
      return;
    }

    // Case 2: New selection
    if (!activeRange) return;

    const mark = document.createElement('mark');
    mark.className = 'cefr-highlight';
    mark.setAttribute('data-color', colorKey);
    mark.style.backgroundColor = col.bg;
    mark.style.color = col.text;
    mark.style.padding = '1px 3px';
    mark.style.borderRadius = '4px';
    mark.style.cursor = 'pointer';
    mark.style.transition = 'filter 0.15s ease';
    mark.title = 'Metkani o‘chirish yoki rangini o‘zgartirish uchun bosing';

    try {
      activeRange.surroundContents(mark);
    } catch {
      // Fallback for cross-node selection
      const fragment = activeRange.extractContents();
      mark.appendChild(fragment);
      activeRange.insertNode(mark);
    }

    // Clean up any nested marks
    mark.querySelectorAll('.cefr-highlight').forEach((child) => {
      child.replaceWith(...Array.from(child.childNodes));
    });

    window.getSelection()?.removeAllRanges();
    setActiveRange(null);
    setSelectedMark(null);
    setFloatingMenu(null);
    saveHighlights();
  };

  // Remove existing highlight
  const removeSelectedMark = () => {
    if (selectedMark) {
      selectedMark.replaceWith(...Array.from(selectedMark.childNodes));
      containerRef.current?.normalize();
      saveHighlights();
      setFloatingMenu(null);
      setSelectedMark(null);
    }
  };

  // Clear all highlights in current passage
  const clearAllHighlights = () => {
    if (!confirm('Ushbu matndagi barcha belgilangan metkalarni o‘chirmoqchimisiz?')) return;
    if (!containerRef.current) return;
    const marks = containerRef.current.querySelectorAll('.cefr-highlight');
    marks.forEach((m) => m.replaceWith(...Array.from(m.childNodes)));
    containerRef.current.normalize();
    saveHighlights();
    setFloatingMenu(null);
  };

  return (
    <div className={`bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 sm:p-6 shadow-sm flex flex-col ${className}`}>
      {/* Passage Header & Highlighter Control Bar */}
      <div className="flex flex-wrap items-center justify-between pb-3 border-b border-slate-100 dark:border-slate-800 mb-4 gap-2">
        <div className="flex items-center gap-2">
          <BookOpen className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
          <h3 className="text-sm font-bold text-slate-900 dark:text-slate-100 uppercase tracking-wider">
            Reading Passage (Matn)
          </h3>
        </div>

        {/* Right tools: Color selector & highlight counter */}
        <div className="flex items-center gap-2">
          {/* Active Highlight Color Selector */}
          <div className="flex items-center gap-1 bg-slate-50 dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700 px-2 py-1 rounded-xl shadow-xs">
            <Highlighter className="w-3.5 h-3.5 text-slate-500 dark:text-slate-400 mr-0.5" />
            <span className="text-[11px] font-semibold text-slate-500 dark:text-slate-400 hidden sm:inline mr-1">Rang:</span>
            {(Object.keys(HIGHLIGHT_COLORS) as HighlightColorKey[]).map((key) => {
              const c = HIGHLIGHT_COLORS[key];
              const isSelected = activeColor === key;
              return (
                <button
                  key={key}
                  type="button"
                  onClick={() => setActiveColor(key)}
                  title={`Faol rang: ${c.name} (Matndan so‘zni belgilang)`}
                  className={`w-4 h-4 rounded-full transition-transform flex items-center justify-center ${
                    isSelected ? 'ring-2 ring-slate-700 dark:ring-white scale-110' : 'hover:scale-110 opacity-80 hover:opacity-100'
                  }`}
                  style={{ backgroundColor: c.bg, border: `1px solid ${c.border}` }}
                >
                  {isSelected && <span className="w-1.5 h-1.5 rounded-full bg-slate-800" />}
                </button>
              );
            })}
          </div>

          {/* Highlight Count & Clear All */}
          {highlightCount > 0 && (
            <div className="flex items-center gap-1.5 bg-amber-50 dark:bg-amber-950/40 border border-amber-200 dark:border-amber-800/80 px-2.5 py-1 rounded-xl text-xs font-bold text-amber-900 dark:text-amber-300 shadow-xs">
              <span>{highlightCount} ta metka</span>
              <button
                type="button"
                onClick={clearAllHighlights}
                title="Barcha metkalarni tozalash"
                className="text-amber-700 dark:text-amber-400 hover:text-rose-600 dark:hover:text-rose-400 ml-1 p-0.5 rounded transition-colors"
              >
                <Trash2 className="w-3.5 h-3.5" />
              </button>
            </div>
          )}
        </div>
      </div>

      {/* Quick Helper Badge */}
      <div className="mb-3 px-3 py-1.5 rounded-xl bg-slate-50 dark:bg-slate-800/70 border border-slate-100 dark:border-slate-800 text-[11px] text-slate-500 dark:text-slate-400 flex items-center justify-between">
        <span>💡 <strong>Eslatma:</strong> Matndan istalgan so‘zni sichqoncha bilan belgilang — fon rangi avtomatik o‘zgaradi. O‘chirish uchun belgilangan so‘z ustiga bosing.</span>
      </div>

      {/* Scrollable Passage Body */}
      <div
        ref={scrollWrapperRef}
        className="relative max-h-[72vh] overflow-y-auto pr-2 scrollbar-thin select-text"
        onMouseUp={handleSelection}
        onTouchEnd={handleSelection}
        onClick={handlePassageClick}
      >
        {/* Text Container */}
        <div
          ref={containerRef}
          className="text-slate-800 dark:text-slate-200 text-sm leading-relaxed space-y-3 font-normal"
        />
      </div>

      {/* Floating Toolbar when text is selected or highlight is clicked */}
      {floatingMenu && (
        <div
          style={{
            position: 'fixed',
            top: `${floatingMenu.top}px`,
            left: `${floatingMenu.left}px`,
            transform: floatingMenu.placement === 'below' ? 'translate(-50%, 0%)' : 'translate(-50%, -100%)',
            zIndex: 99999,
          }}
          onMouseDown={(e) => e.preventDefault()} // Keeps text selection intact when clicking colors!
          className="bg-slate-900/95 backdrop-blur-md text-white px-3 py-1.5 rounded-2xl shadow-2xl border border-slate-700 flex items-center gap-1.5 animate-in fade-in zoom-in-95 duration-100 select-none pointer-events-auto"
        >
          <span className="text-[11px] font-semibold text-slate-300 mr-1 flex items-center gap-1">
            <Highlighter className="w-3 h-3 text-emerald-400" />
            {floatingMenu.mode === 'existing' ? 'O‘zgartirish:' : 'Metka:'}
          </span>

          {(Object.keys(HIGHLIGHT_COLORS) as HighlightColorKey[]).map((key) => {
            const c = HIGHLIGHT_COLORS[key];
            const isCurrent = floatingMenu.currentColor === key;
            return (
              <button
                key={key}
                type="button"
                onClick={() => applyHighlight(key)}
                title={c.name}
                className="w-5 h-5 rounded-full transition-transform hover:scale-125 focus:scale-125 flex items-center justify-center shadow-xs"
                style={{
                  backgroundColor: c.bg,
                  border: isCurrent ? '2px solid #ffffff' : `1.5px solid ${c.border}`,
                }}
              >
                {isCurrent && <Check className="w-3 h-3 text-slate-800" />}
              </button>
            );
          })}

          {floatingMenu.mode === 'existing' && (
            <button
              type="button"
              onClick={removeSelectedMark}
              title="Metkani o‘chirish"
              className="ml-1 pl-1.5 border-l border-slate-700 text-rose-400 hover:text-rose-300 transition-colors p-1 flex items-center gap-1 text-[11px] font-bold"
            >
              <Trash2 className="w-3.5 h-3.5" />
              <span>O‘chirish</span>
            </button>
          )}

          <button
            type="button"
            onClick={() => {
              setFloatingMenu(null);
              setSelectedMark(null);
              window.getSelection()?.removeAllRanges();
            }}
            title="Yopish"
            className="ml-0.5 text-slate-400 hover:text-white p-0.5"
          >
            <X className="w-3.5 h-3.5" />
          </button>

          {/* Pointer triangle */}
          {floatingMenu.placement === 'above' ? (
            <div className="absolute left-1/2 -bottom-1.5 -translate-x-1/2 w-0 h-0 border-x-4 border-x-transparent border-t-4 border-t-slate-900/95" />
          ) : (
            <div className="absolute left-1/2 -top-1.5 -translate-x-1/2 w-0 h-0 border-x-4 border-x-transparent border-b-4 border-b-slate-900/95" />
          )}
        </div>
      )}
    </div>
  );
}
