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
      <footer className="border-t border-slate-200 dark:border-slate-800 bg-white dark:bg-[#182235] py-8 text-center text-sm font-semibold text-slate-500 dark:text-slate-400 transition-colors duration-200">
        <p>© 2026 CEFR MATERIALS. Barcha huquqlar himoyalangan.</p>
      </footer>
    </>
  );
}
