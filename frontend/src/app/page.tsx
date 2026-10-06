'use client';

import React from 'react';
import Link from 'next/link';
import {
  Headphones,
  BookOpen,
  Mic,
  Edit3,
} from 'lucide-react';

export default function HomePage() {
  return (
    <div className="space-y-12 sm:space-y-16 py-6 sm:py-10 max-w-6xl mx-auto">
      {/* 1. Hero Header Pill */}
      <section className="text-center space-y-4 pt-2">
        <div className="inline-block p-1 bg-white/80 dark:bg-slate-900/80 border border-slate-200 dark:border-slate-800 rounded-3xl shadow-sm backdrop-blur-md">
          <div className="flex items-center gap-3 px-6 sm:px-10 py-3 sm:py-3.5 bg-gradient-to-b from-white to-slate-50 dark:from-slate-900 dark:to-slate-900/90 rounded-2xl border border-slate-200/80 dark:border-slate-800">
            <span className="px-3 py-1 rounded-lg bg-gradient-to-r from-blue-600 to-indigo-600 text-white text-xs font-black tracking-wider uppercase shadow-xs">
              START
            </span>
            <h1 className="text-2xl sm:text-4xl md:text-5xl font-black text-slate-900 dark:text-white tracking-tight">
              Choose Your <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600">Test Section</span>
            </h1>
          </div>
        </div>

        <p className="text-sm sm:text-base text-slate-600 dark:text-slate-400 max-w-2xl mx-auto leading-relaxed px-4">
          O‘zingizga kerakli bo‘limni tanlang va topshirishni boshlang. Har bir modul mustaqil va to‘liq formatda baholanadi.
        </p>
      </section>

      {/* 2. Main Test Modules Tray (4 Core Distinct Cards) */}
      <section className="bg-slate-100/70 dark:bg-slate-900/40 rounded-3xl border border-slate-200/80 dark:border-slate-800/80 p-4 sm:p-7 backdrop-blur-sm shadow-xs">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 pt-6">
          {/* Card 1: Listening Module (Royal Blue) */}
          <div className="bg-white dark:bg-slate-900 rounded-2xl sm:rounded-3xl border border-slate-200/80 dark:border-slate-800 p-6 flex flex-col items-center text-center justify-between shadow-sm hover:border-blue-400 dark:hover:border-blue-700 hover:shadow-xl hover:shadow-blue-500/10 hover:-translate-y-1 transition-all duration-200 relative group">
            <div className="w-14 h-14 rounded-full bg-gradient-to-tr from-blue-600 to-indigo-600 text-white flex items-center justify-center -mt-12 shadow-lg shadow-blue-500/25 ring-4 ring-blue-50 dark:ring-slate-900 transition-transform group-hover:scale-105">
              <Headphones className="w-6 h-6" />
            </div>

            <div className="space-y-3 mt-4 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3 py-0.5 rounded-full bg-blue-600 text-white text-[10px] font-black uppercase tracking-wider">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> AUDIO
                </span>
              </div>

              <h2 className="text-lg sm:text-xl font-black text-slate-900 dark:text-white group-hover:text-blue-600 transition-colors">
                Listening module
              </h2>

              <div className="text-xs text-slate-500 dark:text-slate-400 font-bold space-y-0.5 pt-1">
                <div>30 minutes</div>
                <div>40 questions (4 sections)</div>
              </div>
            </div>

            <div className="mt-6 w-full pt-2">
              <Link
                href="/student?tab=listening"
                className="w-full inline-block py-2.5 px-4 rounded-full border border-blue-200 dark:border-blue-800 text-blue-700 dark:text-blue-300 bg-blue-50/50 dark:bg-blue-950/30 hover:bg-blue-600 hover:text-white hover:border-blue-600 text-xs font-black uppercase tracking-wider transition-all shadow-xs"
              >
                OPEN SECTION
              </Link>
            </div>
          </div>

          {/* Card 2: Reading Module (Emerald Green) */}
          <div className="bg-white dark:bg-slate-900 rounded-2xl sm:rounded-3xl border border-slate-200/80 dark:border-slate-800 p-6 flex flex-col items-center text-center justify-between shadow-sm hover:border-emerald-400 dark:hover:border-emerald-700 hover:shadow-xl hover:shadow-emerald-500/10 hover:-translate-y-1 transition-all duration-200 relative group">
            <div className="w-14 h-14 rounded-full bg-gradient-to-tr from-emerald-600 to-teal-600 text-white flex items-center justify-center -mt-12 shadow-lg shadow-emerald-500/25 ring-4 ring-emerald-50 dark:ring-slate-900 transition-transform group-hover:scale-105">
              <BookOpen className="w-6 h-6" />
            </div>

            <div className="space-y-3 mt-4 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3 py-0.5 rounded-full bg-emerald-600 text-white text-[10px] font-black uppercase tracking-wider">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> TEXTS
                </span>
              </div>

              <h2 className="text-lg sm:text-xl font-black text-slate-900 dark:text-white group-hover:text-emerald-600 transition-colors">
                Reading module
              </h2>

              <div className="text-xs text-slate-500 dark:text-slate-400 font-bold space-y-0.5 pt-1">
                <div>60 minutes</div>
                <div>40 questions (3 passages)</div>
              </div>
            </div>

            <div className="mt-6 w-full pt-2">
              <Link
                href="/student?tab=reading"
                className="w-full inline-block py-2.5 px-4 rounded-full border border-emerald-200 dark:border-emerald-800 text-emerald-700 dark:text-emerald-300 bg-emerald-50/50 dark:bg-emerald-950/30 hover:bg-emerald-600 hover:text-white hover:border-emerald-600 text-xs font-black uppercase tracking-wider transition-all shadow-xs"
              >
                OPEN SECTION
              </Link>
            </div>
          </div>

          {/* Card 3: Speaking Module (Vibrant Purple) */}
          <div className="bg-white dark:bg-slate-900 rounded-2xl sm:rounded-3xl border border-slate-200/80 dark:border-slate-800 p-6 flex flex-col items-center text-center justify-between shadow-sm hover:border-purple-400 dark:hover:border-purple-700 hover:shadow-xl hover:shadow-purple-500/10 hover:-translate-y-1 transition-all duration-200 relative group">
            <div className="w-14 h-14 rounded-full bg-gradient-to-tr from-purple-600 to-violet-600 text-white flex items-center justify-center -mt-12 shadow-lg shadow-purple-500/25 ring-4 ring-purple-50 dark:ring-slate-900 transition-transform group-hover:scale-105">
              <Mic className="w-6 h-6" />
            </div>

            <div className="space-y-3 mt-4 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3 py-0.5 rounded-full bg-purple-600 text-white text-[10px] font-black uppercase tracking-wider">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> VOICE
                </span>
              </div>

              <h2 className="text-lg sm:text-xl font-black text-slate-900 dark:text-white group-hover:text-purple-600 transition-colors">
                Speaking module
              </h2>

              <div className="text-xs text-slate-500 dark:text-slate-400 font-bold space-y-0.5 pt-1">
                <div>12–15 minutes</div>
                <div>3 parts (Audio record)</div>
              </div>
            </div>

            <div className="mt-6 w-full pt-2">
              <Link
                href="/student?tab=speaking"
                className="w-full inline-block py-2.5 px-4 rounded-full border border-purple-200 dark:border-purple-800 text-purple-700 dark:text-purple-300 bg-purple-50/50 dark:bg-purple-950/30 hover:bg-purple-600 hover:text-white hover:border-purple-600 text-xs font-black uppercase tracking-wider transition-all shadow-xs"
              >
                OPEN SECTION
              </Link>
            </div>
          </div>

          {/* Card 4: Writing Module (Warm Amber) */}
          <div className="bg-white dark:bg-slate-900 rounded-2xl sm:rounded-3xl border border-slate-200/80 dark:border-slate-800 p-6 flex flex-col items-center text-center justify-between shadow-sm hover:border-amber-400 dark:hover:border-amber-700 hover:shadow-xl hover:shadow-amber-500/10 hover:-translate-y-1 transition-all duration-200 relative group">
            <div className="w-14 h-14 rounded-full bg-gradient-to-tr from-amber-600 to-orange-600 text-white flex items-center justify-center -mt-12 shadow-lg shadow-amber-500/25 ring-4 ring-amber-50 dark:ring-slate-900 transition-transform group-hover:scale-105">
              <Edit3 className="w-6 h-6" />
            </div>

            <div className="space-y-3 mt-4 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3 py-0.5 rounded-full bg-amber-600 text-white text-[10px] font-black uppercase tracking-wider">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> ESSAY
                </span>
              </div>

              <h2 className="text-lg sm:text-xl font-black text-slate-900 dark:text-white group-hover:text-amber-600 transition-colors">
                Writing module
              </h2>

              <div className="text-xs text-slate-500 dark:text-slate-400 font-bold space-y-0.5 pt-1">
                <div>60 minutes</div>
                <div>2 tasks (Task 1 & Task 2)</div>
              </div>
            </div>

            <div className="mt-6 w-full pt-2">
              <Link
                href="/student?tab=writing"
                className="w-full inline-block py-2.5 px-4 rounded-full border border-amber-200 dark:border-amber-800 text-amber-700 dark:text-amber-300 bg-amber-50/50 dark:bg-amber-950/30 hover:bg-amber-600 hover:text-white hover:border-amber-600 text-xs font-black uppercase tracking-wider transition-all shadow-xs"
              >
                OPEN SECTION
              </Link>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
