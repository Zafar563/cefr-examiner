'use client';

import React, { useEffect, useState } from 'react';
import { Sun, Moon } from 'lucide-react';

interface ThemeToggleProps {
  className?: string;
  showLabel?: boolean;
}

export default function ThemeToggle({ className = '', showLabel = false }: ThemeToggleProps) {
  const [isDark, setIsDark] = useState<boolean>(false);
  const [mounted, setMounted] = useState<boolean>(false);

  useEffect(() => {
    setMounted(true);
    const hasDark = document.documentElement.classList.contains('dark');
    setIsDark(hasDark);

    const observer = new MutationObserver(() => {
      setIsDark(document.documentElement.classList.contains('dark'));
    });
    observer.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] });

    return () => observer.disconnect();
  }, []);

  const toggleTheme = () => {
    const nextDark = !isDark;
    setIsDark(nextDark);
    if (nextDark) {
      document.documentElement.classList.add('dark');
      try {
        localStorage.setItem('cefr_theme', 'dark');
      } catch {}
    } else {
      document.documentElement.classList.remove('dark');
      try {
        localStorage.setItem('cefr_theme', 'light');
      } catch {}
    }
  };

  if (!mounted) {
    return (
      <div className={`w-9 h-9 rounded-xl bg-slate-100 dark:bg-slate-800 animate-pulse ${className}`} />
    );
  }

  return (
    <button
      type="button"
      onClick={toggleTheme}
      title={isDark ? 'Kunduzgi rejimga o‘tish' : 'Tungi rejimga o‘tish'}
      aria-label={isDark ? 'Kunduzgi rejimga o‘tish' : 'Tungi rejimga o‘tish'}
      className={`relative inline-flex items-center gap-2 p-2 rounded-xl border transition-all duration-200 select-none ${
        isDark
          ? 'bg-slate-800/90 hover:bg-slate-700/90 text-amber-400 border-slate-700 shadow-xs hover:border-amber-400/50'
          : 'bg-slate-100 hover:bg-slate-200/80 text-slate-700 border-slate-200/80 shadow-xs hover:border-slate-300'
      } ${className}`}
    >
      <div className="relative w-4 h-4 flex items-center justify-center">
        {isDark ? (
          <Sun className="w-4 h-4 text-amber-400 transition-transform duration-300 rotate-0 scale-100" />
        ) : (
          <Moon className="w-4 h-4 text-slate-700 transition-transform duration-300 rotate-0 scale-100" />
        )}
      </div>
      {showLabel && (
        <span className="text-xs font-semibold">
          {isDark ? 'Kunduzgi' : 'Tungi'}
        </span>
      )}
    </button>
  );
}
