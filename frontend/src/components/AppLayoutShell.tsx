'use client';

import React from 'react';
import { usePathname } from 'next/navigation';
import Navbar from '@/components/Navbar';

export default function AppLayoutShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const isTestTakingPage = pathname?.startsWith('/student/test/');

  if (isTestTakingPage) {
    return (
      <div className="w-screen h-screen overflow-hidden bg-white dark:bg-[#141c2b] text-slate-900 dark:text-slate-100 flex flex-col">
        {children}
      </div>
    );
  }

  return (
    <>
      <Navbar />
      <main className="flex-1 w-full mx-auto px-4 sm:px-6 lg:px-8 xl:px-12 py-4 sm:py-6">
        {children}
      </main>
      <footer className="border-t border-slate-200/60 dark:border-white/10 bg-white/70 dark:bg-[#0b1120]/80 backdrop-blur-xl py-8 text-center text-sm font-semibold text-slate-500 dark:text-slate-400 transition-colors duration-200">
        <p>© 2026 CEFR MATERIALS. All rights reserved.</p>
      </footer>
    </>
  );
}
