'use client';

import React from 'react';
import Link from 'next/link';
import {
  Headphones,
  BookOpen,
  Mic,
  PenTool,
  Clock,
  Sparkles,
  ArrowRight,
  ShieldCheck,
  Zap,
  BarChart3,
  CheckCircle2,
} from 'lucide-react';

export default function HomePage() {
  const modules = [
    {
      id: 'listening',
      name: 'Listening',
      tag: 'AUDIO • 30 MIN',
      badgeColor: 'bg-teal-50 dark:bg-teal-950/60 text-[#0a4e5e] dark:text-teal-300 border-teal-200/80 dark:border-teal-800/80',
      iconBg: 'bg-teal-50 dark:bg-teal-950/60 text-[#0a4e5e] dark:text-teal-300 border-teal-200/80 dark:border-teal-800',
      btnBg: 'bg-[#0a4e5e] hover:bg-[#073945] text-white shadow-teal-900/15',
      accentBorder: 'group-hover:border-[#0a4e5e]/40 dark:group-hover:border-teal-500/40',
      href: '/student?tab=listening',
      icon: Headphones,
      desc: 'Haqiqiy imtihon audio yozuvlari asosida 4 ta bo‘lim va 40 ta savol.',
      features: [
        '40 ta savol (Section 1–4)',
        'Sectionlar bo‘yicha alohida mashq',
        'Avtomatik tekshiruv va natija',
      ],
    },
    {
      id: 'reading',
      name: 'Reading',
      tag: 'TEXTS • 60 MIN',
      badgeColor: 'bg-emerald-50 dark:bg-emerald-950/60 text-[#047857] dark:text-emerald-300 border-emerald-200/80 dark:border-emerald-800/80',
      iconBg: 'bg-emerald-50 dark:bg-emerald-950/60 text-[#047857] dark:text-emerald-300 border-emerald-200/80 dark:border-emerald-800',
      btnBg: 'bg-[#047857] hover:bg-[#035e44] text-white shadow-emerald-900/15',
      accentBorder: 'group-hover:border-[#047857]/40 dark:group-hover:border-emerald-500/40',
      href: '/student?tab=reading',
      icon: BookOpen,
      desc: 'Rasmiy Cambridge Academic matnlari, 3 ta passage va interaktiv belgilagich.',
      features: [
        '40 ta savol (Passage 1–3)',
        'Ko‘p rangli matn belgilash (Highlighter)',
        'Passage bo‘yicha mustaqil ishlash',
      ],
    },
    {
      id: 'speaking',
      name: 'Speaking',
      tag: 'VOICE • 15 MIN',
      badgeColor: 'bg-purple-50 dark:bg-purple-950/60 text-[#6d28d9] dark:text-purple-300 border-purple-200/80 dark:border-purple-800/80',
      iconBg: 'bg-purple-50 dark:bg-purple-950/60 text-[#6d28d9] dark:text-purple-300 border-purple-200/80 dark:border-purple-800',
      btnBg: 'bg-[#6d28d9] hover:bg-[#561fae] text-white shadow-purple-900/15',
      accentBorder: 'group-hover:border-[#6d28d9]/40 dark:group-hover:border-purple-500/40',
      href: '/student?tab=speaking',
      icon: Mic,
      desc: 'Part 1, Part 2 (Cue Card) va Part 3 tahliliy suhbat topshiriqlari.',
      features: [
        '3 ta qism (Audio yozish)',
        'Tayyorgarlik va gapirish taymeri',
        'Ekspert tekshiruvi va baholash',
      ],
    },
    {
      id: 'writing',
      name: 'Writing',
      tag: 'ESSAY • 60 MIN',
      badgeColor: 'bg-fuchsia-50 dark:bg-fuchsia-950/60 text-[#7a2259] dark:text-fuchsia-300 border-fuchsia-200/80 dark:border-fuchsia-800/80',
      iconBg: 'bg-fuchsia-50 dark:bg-fuchsia-950/60 text-[#7a2259] dark:text-fuchsia-300 border-fuchsia-200/80 dark:border-fuchsia-800',
      btnBg: 'bg-[#7a2259] hover:bg-[#601a46] text-white shadow-fuchsia-900/15',
      accentBorder: 'group-hover:border-[#7a2259]/40 dark:group-hover:border-fuchsia-500/40',
      href: '/student?tab=writing',
      icon: PenTool,
      desc: 'Task 1 (Hisobot va vizual grafik) va Task 2 (Akademik insho) moduli.',
      features: [
        'Task 1 (min 150) + Task 2 (min 250)',
        'Jonli so‘z sanagich va taymer',
        'CEFR mezonlari bo‘yicha baholash',
      ],
    },
  ];

  return (
    <div className="space-y-12 sm:space-y-16 py-4 sm:py-8 w-full mx-auto px-2 sm:px-4 lg:px-6">
      {/* 1. Executive Hero Section with Eye-Friendly Deep Background */}
      <section className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#0c1527] via-[#0f1e38] to-[#122340] text-white p-7 sm:p-10 lg:p-14 shadow-2xl border border-slate-700/60">
        {/* Soft Ambient Glows */}
        <div className="absolute -top-32 -left-32 w-80 h-80 bg-teal-500/15 rounded-full blur-3xl pointer-events-none" />
        <div className="absolute -bottom-32 -right-32 w-80 h-80 bg-purple-500/15 rounded-full blur-3xl pointer-events-none" />

        <div className="relative z-10 max-w-4xl space-y-6">
          <div className="inline-flex items-center gap-2.5 px-4 py-1.5 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-xs sm:text-sm font-bold text-white shadow-xs">
            <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
            <span>RASMIY CEFR & CAMBRIDGE IMTIHON BAZASI</span>
          </div>

          <h1 className="text-3xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight leading-tight">
            Xalqaro Imtihonlarga <br className="hidden sm:inline" />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-teal-300 via-emerald-300 to-cyan-300">
              Mukammal Tayyorgarlik
            </span>
          </h1>

          <p className="text-sm sm:text-base lg:text-lg text-slate-300 font-medium leading-relaxed max-w-2xl">
            Listening, Reading, Writing va Speaking bo‘yicha Cambridge 13 dan 21 gacha bo‘lgan barcha testlar.
            Haqiqiy imtihon formati, rasmiy audio treklar va avtomatlashtirilgan band hisoblash tizimi.
          </p>

          <div className="pt-2 flex flex-wrap items-center gap-3 sm:gap-4">
            <Link
              href="/student?tab=listening"
              className="px-6 py-3.5 rounded-2xl bg-gradient-to-r from-teal-500 to-emerald-500 hover:from-teal-600 hover:to-emerald-600 text-white font-extrabold text-sm sm:text-base shadow-lg shadow-teal-500/20 active:scale-95 transition-all flex items-center gap-2 cursor-pointer"
            >
              <span>Testlarni Boshlash</span>
              <ArrowRight className="w-4 h-4" />
            </Link>

            <Link
              href="/student?tab=mock"
              className="px-6 py-3.5 rounded-2xl bg-white/10 hover:bg-white/15 text-white font-bold text-sm sm:text-base border border-white/20 backdrop-blur-md active:scale-95 transition-all flex items-center gap-2 cursor-pointer"
            >
              <Sparkles className="w-4 h-4 text-amber-300" />
              <span>To‘liq Mock Topshirish</span>
            </Link>
          </div>
        </div>
      </section>

      {/* 2. Four Main Test Modules (Executive Modern Cards) */}
      <section className="space-y-6">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <h2 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white tracking-tight">
              Imtihon Modullari
            </h2>
            <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 font-semibold mt-1">
              O‘zingizga kerakli bo‘limni tanlang va mustaqil mashq qiling.
            </p>
          </div>

          <span className="text-xs font-bold text-slate-500 dark:text-slate-400 bg-slate-100 dark:bg-slate-800 px-3.5 py-1.5 rounded-full border border-slate-200 dark:border-slate-700 w-fit">
            4 ta Asosiy Bo‘lim
          </span>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {modules.map((m) => {
            const Icon = m.icon;
            return (
              <div
                key={m.id}
                className={`bg-white dark:bg-[#131d31] rounded-3xl border border-slate-200/90 dark:border-slate-800 p-6 sm:p-7 flex flex-col justify-between shadow-xs hover:shadow-xl ${m.accentBorder} transition-all duration-300 group`}
              >
                <div>
                  {/* Top Row: Icon + Badge */}
                  <div className="flex items-center justify-between gap-3 mb-5">
                    <div
                      className={`w-13 h-13 rounded-2xl border flex items-center justify-center shadow-xs transition-transform group-hover:scale-105 ${m.iconBg}`}
                    >
                      <Icon className="w-6 h-6" />
                    </div>

                    <span
                      className={`px-3 py-1 rounded-full text-[10px] font-black tracking-wider uppercase border shadow-2xs ${m.badgeColor}`}
                    >
                      {m.tag}
                    </span>
                  </div>

                  {/* Title & Description */}
                  <h3 className="text-xl font-black text-slate-900 dark:text-white tracking-tight group-hover:text-slate-700 dark:group-hover:text-slate-200 transition-colors">
                    {m.name} Moduli
                  </h3>

                  <p className="text-xs sm:text-[13px] text-slate-600 dark:text-slate-400 font-medium leading-relaxed mt-2">
                    {m.desc}
                  </p>

                  {/* Bullet points */}
                  <div className="space-y-2 pt-4 mt-4 border-t border-slate-100 dark:border-slate-800/80">
                    {m.features.map((f, idx) => (
                      <div
                        key={idx}
                        className="flex items-center gap-2 text-xs font-semibold text-slate-700 dark:text-slate-300"
                      >
                        <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600 shrink-0" />
                        <span className="line-clamp-1">{f}</span>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Bottom Action Button */}
                <div className="pt-6 mt-6">
                  <Link
                    href={m.href}
                    className={`w-full py-3.5 px-5 rounded-2xl font-black text-xs sm:text-sm tracking-wide transition-all shadow-md active:scale-95 flex items-center justify-center gap-2 cursor-pointer ${m.btnBg}`}
                  >
                    <span>{m.name} Testlari</span>
                    <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-1" />
                  </Link>
                </div>
              </div>
            );
          })}
        </div>
      </section>

      {/* 3. Dedicated Full Mock Exam Banner */}
      <section className="relative overflow-hidden rounded-3xl bg-gradient-to-r from-[#171e36] via-[#201c3d] to-[#2d122b] text-white p-6 sm:p-8 lg:p-9 shadow-xl border border-purple-900/40">
        <div className="relative z-10 flex flex-col lg:flex-row lg:items-center justify-between gap-6">
          <div className="space-y-2 max-w-2xl">
            <div className="flex items-center gap-2">
              <span className="px-3 py-1 rounded-full text-xs font-black bg-rose-500 text-white uppercase tracking-wider shadow-xs">
                FULL EXAM SIMULATOR
              </span>
              <span className="text-xs font-bold text-slate-300">180 daqiqa • 4 ta modul</span>
            </div>

            <h3 className="text-2xl sm:text-3xl font-black text-white tracking-tight">
              To‘liq CEFR & IELTS Mock Imtihoni
            </h3>

            <p className="text-xs sm:text-sm text-slate-300 font-medium leading-relaxed">
              Listening (40 ta savol), Reading (3 ta matn, 40 ta savol), Writing (Task 1 & 2) va Speaking
              (3 qismli audio intervyu) bitta to‘liq imtihonga jamlanadi. Haqiqiy imtihon kabi vaqt nazorati
              ostida topshiring.
            </p>
          </div>

          <div className="shrink-0">
            <Link
              href="/student?tab=mock"
              className="inline-flex items-center gap-2.5 px-7 py-4 rounded-2xl bg-gradient-to-r from-rose-600 via-purple-600 to-indigo-600 hover:from-rose-500 hover:to-indigo-500 text-white font-extrabold text-sm sm:text-base shadow-xl shadow-rose-900/30 active:scale-95 transition-all cursor-pointer"
            >
              <Sparkles className="w-5 h-5 text-amber-300" />
              <span>To‘liq Mock Boshlash</span>
              <ArrowRight className="w-4 h-4" />
            </Link>
          </div>
        </div>
      </section>

      {/* 4. Why Choose Platform Key Highlights */}
      <section className="grid grid-cols-1 sm:grid-cols-3 gap-6 pt-2">
        <div className="bg-white dark:bg-[#131d31] rounded-3xl border border-slate-200/90 dark:border-slate-800 p-6 flex items-start gap-4 shadow-xs">
          <div className="w-12 h-12 rounded-2xl bg-teal-50 dark:bg-teal-950/60 text-[#0a4e5e] dark:text-teal-300 border border-teal-200/80 dark:border-teal-800 flex items-center justify-center shrink-0">
            <ShieldCheck className="w-6 h-6" />
          </div>
          <div className="space-y-1">
            <h4 className="text-sm sm:text-base font-black text-slate-900 dark:text-white">
              Rasmiy Cambridge Bazasi
            </h4>
            <p className="text-xs text-slate-500 dark:text-slate-400 font-medium leading-relaxed">
              Cambridge IELTS 13–21 to‘liq kitoblaridagi barcha topshiriqlar va original audio yozuvlar.
            </p>
          </div>
        </div>

        <div className="bg-white dark:bg-[#131d31] rounded-3xl border border-slate-200/90 dark:border-slate-800 p-6 flex items-start gap-4 shadow-xs">
          <div className="w-12 h-12 rounded-2xl bg-emerald-50 dark:bg-emerald-950/60 text-[#047857] dark:text-emerald-300 border border-emerald-200/80 dark:border-emerald-800 flex items-center justify-center shrink-0">
            <Zap className="w-6 h-6" />
          </div>
          <div className="space-y-1">
            <h4 className="text-sm sm:text-base font-black text-slate-900 dark:text-white">
              Qulay Imtihon Muhiti
            </h4>
            <p className="text-xs text-slate-500 dark:text-slate-400 font-medium leading-relaxed">
              Matnni rangli ajratish, avtomatik audio nazorati, jonli taymer va ko‘zni toliqtirmaydigan dizayn.
            </p>
          </div>
        </div>

        <div className="bg-white dark:bg-[#131d31] rounded-3xl border border-slate-200/90 dark:border-slate-800 p-6 flex items-start gap-4 shadow-xs">
          <div className="w-12 h-12 rounded-2xl bg-purple-50 dark:bg-purple-950/60 text-[#6d28d9] dark:text-purple-300 border border-purple-200/80 dark:border-purple-800 flex items-center justify-center shrink-0">
            <BarChart3 className="w-6 h-6" />
          </div>
          <div className="space-y-1">
            <h4 className="text-sm sm:text-base font-black text-slate-900 dark:text-white">
              Tezkor Natija & Tahlil
            </h4>
            <p className="text-xs text-slate-500 dark:text-slate-400 font-medium leading-relaxed">
              Imtihon topshirilishi bilanoq Listening va Reading natijalari hamda CEFR darajasi aniqlanadi.
            </p>
          </div>
        </div>
      </section>
    </div>
  );
}
