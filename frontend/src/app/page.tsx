'use client';

import React from 'react';
import Link from 'next/link';
import {
  Headphones,
  BookOpen,
  Mic,
  Edit3,
  Clock,
  HelpCircle,
  ArrowRight,
} from 'lucide-react';

export default function HomePage() {
  return (
    <div className="space-y-16 sm:space-y-20 py-6 sm:py-12 w-full mx-auto px-2 sm:px-4">
      {/* 1. Hero Header Section */}
      <section className="text-center space-y-5 pt-2 sm:pt-4">
        <div className="inline-flex items-center gap-2.5 px-4 py-1.5 rounded-full bg-blue-50 dark:bg-blue-950/60 border border-blue-200/80 dark:border-blue-800 shadow-xs">
          <span className="w-2.5 h-2.5 rounded-full bg-blue-600 animate-pulse"></span>
          <span className="text-xs sm:text-sm font-black text-blue-700 dark:text-blue-300 uppercase tracking-widest">
            CEFR PRACTICE & ASSESSMENT
          </span>
        </div>

        <h1 className="text-3xl sm:text-5xl lg:text-6xl font-black text-slate-900 dark:text-white tracking-tight leading-tight">
          Choose Your <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600">Test Section</span>
        </h1>

        <p className="text-base sm:text-lg lg:text-xl text-slate-600 dark:text-slate-300 max-w-3xl mx-auto font-medium leading-relaxed px-4">
          O‘zingizga kerakli bo‘limni tanlang va topshirishni boshlang. Har bir modul mustaqil va to‘liq formatda baholanadi.
        </p>
      </section>

      {/* 2. Main Test Modules (Crisp, High-Clarity Cards) */}
      <section className="pt-6 sm:pt-10">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8 xl:gap-8">
          {/* Card 1: Listening Module (Royal Blue) */}
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-8 flex flex-col items-center text-center justify-between shadow-xl shadow-slate-200/60 dark:shadow-none hover:border-blue-500 dark:hover:border-blue-500 hover:shadow-2xl hover:shadow-blue-500/15 hover:-translate-y-2 transition-all duration-300 relative group">
            <div className="w-18 h-18 sm:w-20 sm:h-20 rounded-3xl bg-gradient-to-tr from-blue-600 to-indigo-600 text-white flex items-center justify-center -mt-16 sm:-mt-18 shadow-xl shadow-blue-500/30 ring-4 ring-white dark:ring-slate-900 transition-transform group-hover:scale-110">
              <Headphones className="w-9 h-9 sm:w-10 sm:h-10" />
            </div>

            <div className="space-y-4 mt-5 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-blue-600 text-white text-xs font-black uppercase tracking-wider shadow-xs">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> AUDIO
                </span>
              </div>

              <h2 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white group-hover:text-blue-600 transition-colors">
                Listening module
              </h2>

              <div className="text-sm sm:text-base text-slate-600 dark:text-slate-300 font-semibold space-y-1.5 pt-1">
                <div className="flex items-center justify-center gap-1.5">
                  <Clock className="w-4 h-4 text-blue-500" />
                  <span>30 minutes</span>
                </div>
                <div className="flex items-center justify-center gap-1.5 text-slate-500 dark:text-slate-400">
                  <HelpCircle className="w-4 h-4 text-slate-400" />
                  <span>40 questions (4 sections)</span>
                </div>
              </div>
            </div>

            <div className="mt-8 w-full pt-2">
              <Link
                href="/student?tab=listening"
                className="w-full inline-flex items-center justify-center gap-2 py-3.5 px-6 rounded-2xl border-2 border-blue-600 text-blue-700 dark:text-blue-300 bg-blue-50 dark:bg-blue-950/40 hover:bg-blue-600 hover:text-white text-sm sm:text-base font-black uppercase tracking-wider transition-all shadow-sm hover:shadow-md cursor-pointer group-hover:bg-blue-600 group-hover:text-white"
              >
                <span>OPEN SECTION</span>
                <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          </div>

          {/* Card 2: Reading Module (Emerald Green) */}
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-8 flex flex-col items-center text-center justify-between shadow-xl shadow-slate-200/60 dark:shadow-none hover:border-emerald-500 dark:hover:border-emerald-500 hover:shadow-2xl hover:shadow-emerald-500/15 hover:-translate-y-2 transition-all duration-300 relative group">
            <div className="w-18 h-18 sm:w-20 sm:h-20 rounded-3xl bg-gradient-to-tr from-emerald-600 to-teal-600 text-white flex items-center justify-center -mt-16 sm:-mt-18 shadow-xl shadow-emerald-500/30 ring-4 ring-white dark:ring-slate-900 transition-transform group-hover:scale-110">
              <BookOpen className="w-9 h-9 sm:w-10 sm:h-10" />
            </div>

            <div className="space-y-4 mt-5 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-emerald-600 text-white text-xs font-black uppercase tracking-wider shadow-xs">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> TEXTS
                </span>
              </div>

              <h2 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white group-hover:text-emerald-600 transition-colors">
                Reading module
              </h2>

              <div className="text-sm sm:text-base text-slate-600 dark:text-slate-300 font-semibold space-y-1.5 pt-1">
                <div className="flex items-center justify-center gap-1.5">
                  <Clock className="w-4 h-4 text-emerald-500" />
                  <span>60 minutes</span>
                </div>
                <div className="flex items-center justify-center gap-1.5 text-slate-500 dark:text-slate-400">
                  <HelpCircle className="w-4 h-4 text-slate-400" />
                  <span>40 questions (3 passages)</span>
                </div>
              </div>
            </div>

            <div className="mt-8 w-full pt-2">
              <Link
                href="/student?tab=reading"
                className="w-full inline-flex items-center justify-center gap-2 py-3.5 px-6 rounded-2xl border-2 border-emerald-600 text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-950/40 hover:bg-emerald-600 hover:text-white text-sm sm:text-base font-black uppercase tracking-wider transition-all shadow-sm hover:shadow-md cursor-pointer group-hover:bg-emerald-600 group-hover:text-white"
              >
                <span>OPEN SECTION</span>
                <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          </div>

          {/* Card 3: Speaking Module (Vibrant Purple) */}
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-8 flex flex-col items-center text-center justify-between shadow-xl shadow-slate-200/60 dark:shadow-none hover:border-purple-500 dark:hover:border-purple-500 hover:shadow-2xl hover:shadow-purple-500/15 hover:-translate-y-2 transition-all duration-300 relative group">
            <div className="w-18 h-18 sm:w-20 sm:h-20 rounded-3xl bg-gradient-to-tr from-purple-600 to-violet-600 text-white flex items-center justify-center -mt-16 sm:-mt-18 shadow-xl shadow-purple-500/30 ring-4 ring-white dark:ring-slate-900 transition-transform group-hover:scale-110">
              <Mic className="w-9 h-9 sm:w-10 sm:h-10" />
            </div>

            <div className="space-y-4 mt-5 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-purple-600 text-white text-xs font-black uppercase tracking-wider shadow-xs">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> VOICE
                </span>
              </div>

              <h2 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white group-hover:text-purple-600 transition-colors">
                Speaking module
              </h2>

              <div className="text-sm sm:text-base text-slate-600 dark:text-slate-300 font-semibold space-y-1.5 pt-1">
                <div className="flex items-center justify-center gap-1.5">
                  <Clock className="w-4 h-4 text-purple-500" />
                  <span>12–15 minutes</span>
                </div>
                <div className="flex items-center justify-center gap-1.5 text-slate-500 dark:text-slate-400">
                  <HelpCircle className="w-4 h-4 text-slate-400" />
                  <span>3 parts (Audio record)</span>
                </div>
              </div>
            </div>

            <div className="mt-8 w-full pt-2">
              <Link
                href="/student?tab=speaking"
                className="w-full inline-flex items-center justify-center gap-2 py-3.5 px-6 rounded-2xl border-2 border-purple-600 text-purple-700 dark:text-purple-300 bg-purple-50 dark:bg-purple-950/40 hover:bg-purple-600 hover:text-white text-sm sm:text-base font-black uppercase tracking-wider transition-all shadow-sm hover:shadow-md cursor-pointer group-hover:bg-purple-600 group-hover:text-white"
              >
                <span>OPEN SECTION</span>
                <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          </div>

          {/* Card 4: Writing Module (Warm Amber) */}
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-8 flex flex-col items-center text-center justify-between shadow-xl shadow-slate-200/60 dark:shadow-none hover:border-amber-500 dark:hover:border-amber-500 hover:shadow-2xl hover:shadow-amber-500/15 hover:-translate-y-2 transition-all duration-300 relative group">
            <div className="w-18 h-18 sm:w-20 sm:h-20 rounded-3xl bg-gradient-to-tr from-amber-600 to-orange-600 text-white flex items-center justify-center -mt-16 sm:-mt-18 shadow-xl shadow-amber-500/30 ring-4 ring-white dark:ring-slate-900 transition-transform group-hover:scale-110">
              <Edit3 className="w-9 h-9 sm:w-10 sm:h-10" />
            </div>

            <div className="space-y-4 mt-5 w-full">
              <div>
                <span className="inline-flex items-center gap-1.5 px-3.5 py-1 rounded-full bg-amber-600 text-white text-xs font-black uppercase tracking-wider shadow-xs">
                  <span className="w-1.5 h-1.5 rounded-full bg-white"></span> ESSAY
                </span>
              </div>

              <h2 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white group-hover:text-amber-600 transition-colors">
                Writing module
              </h2>

              <div className="text-sm sm:text-base text-slate-600 dark:text-slate-300 font-semibold space-y-1.5 pt-1">
                <div className="flex items-center justify-center gap-1.5">
                  <Clock className="w-4 h-4 text-amber-500" />
                  <span>60 minutes</span>
                </div>
                <div className="flex items-center justify-center gap-1.5 text-slate-500 dark:text-slate-400">
                  <HelpCircle className="w-4 h-4 text-slate-400" />
                  <span>2 tasks (Task 1 & Task 2)</span>
                </div>
              </div>
            </div>

            <div className="mt-8 w-full pt-2">
              <Link
                href="/student?tab=writing"
                className="w-full inline-flex items-center justify-center gap-2 py-3.5 px-6 rounded-2xl border-2 border-amber-600 text-amber-700 dark:text-amber-300 bg-amber-50 dark:bg-amber-950/40 hover:bg-amber-600 hover:text-white text-sm sm:text-base font-black uppercase tracking-wider transition-all shadow-sm hover:shadow-md cursor-pointer group-hover:bg-amber-600 group-hover:text-white"
              >
                <span>OPEN SECTION</span>
                <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}
