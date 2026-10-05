'use client';

import React from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import {
  Headphones,
  BookOpen,
  Edit3,
  Mic,
  CheckCircle2,
  ShieldCheck,
  ArrowRight,
  Sparkles,
  Award,
  Layers,
  Zap,
  Clock,
  Compass,
} from 'lucide-react';

export default function HomePage() {
  const router = useRouter();

  return (
    <div className="space-y-20 py-8">
      {/* Hero Section */}
      <section className="relative text-center max-w-4xl mx-auto space-y-6 pt-4">
        {/* Ambient Top Glow */}
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[300px] bg-gradient-to-tr from-emerald-500/10 via-teal-500/10 to-blue-500/10 blur-3xl -z-10 pointer-events-none rounded-full" />

        <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white/80 dark:bg-slate-900/80 border border-emerald-200/80 dark:border-emerald-800/80 text-emerald-800 dark:text-emerald-300 text-xs font-bold shadow-xs backdrop-blur-md">
          <span className="flex h-2 w-2 relative">
            <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
            <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
          </span>
          Cambridge IELTS 13–21 & Rasmiy CEFR Multi-level Simulyatsiyasi
        </div>

        <h1 className="text-4xl sm:text-6xl font-extrabold text-slate-900 dark:text-white tracking-tight leading-[1.15]">
          Haqiqiy Imtihon Muhitida <br className="hidden sm:inline" />
          <span className="bg-clip-text text-transparent bg-gradient-to-r from-emerald-600 via-teal-600 to-cyan-700 dark:from-emerald-400 dark:via-teal-400 dark:to-cyan-400">
            Ingliz Tili Darajangizni
          </span>{' '}
          Sinang
        </h1>

        <p className="text-base sm:text-lg text-slate-600 dark:text-slate-400 max-w-2xl mx-auto leading-relaxed">
          Cambridge 13 dan 21 gacha bo‘lgan to‘liq akademik Reading, Listening, Writing va Speaking testlari orqali real CEFR darajangizni aniqlang.
        </p>

        {/* Real User Call to Action Buttons */}
        <div className="pt-4 flex flex-col sm:flex-row items-center justify-center gap-3.5 max-w-md mx-auto">
          <Link
            href="/student"
            className="w-full sm:w-auto px-7 py-3.5 bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white rounded-2xl text-sm font-bold transition-all shadow-lg shadow-emerald-600/25 hover:scale-[1.02] flex items-center justify-center gap-2 group"
          >
            🎓 Test Topshirishni Boshlash
            <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-1" />
          </Link>
          <Link
            href="/login"
            className="w-full sm:w-auto px-7 py-3.5 bg-white dark:bg-slate-900 hover:bg-slate-50 dark:hover:bg-slate-800 text-slate-800 dark:text-slate-100 border border-slate-200 dark:border-slate-800 rounded-2xl text-sm font-bold transition-all shadow-sm flex items-center justify-center gap-2"
          >
            Tizimga Kirish
          </Link>
        </div>

        {/* Live Metrics Bar */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 pt-6 max-w-3xl mx-auto">
          <div className="bg-white/80 dark:bg-slate-900/80 backdrop-blur-sm p-4 rounded-2xl border border-slate-200/80 dark:border-slate-800 text-center shadow-xs">
            <div className="text-2xl sm:text-3xl font-black text-emerald-600 dark:text-emerald-400">78+</div>
            <div className="text-xs font-bold text-slate-600 dark:text-slate-400 mt-0.5">Mavjud Testlar</div>
          </div>
          <div className="bg-white/80 dark:bg-slate-900/80 backdrop-blur-sm p-4 rounded-2xl border border-slate-200/80 dark:border-slate-800 text-center shadow-xs">
            <div className="text-2xl sm:text-3xl font-black text-teal-600 dark:text-teal-400">13 – 21</div>
            <div className="text-xs font-bold text-slate-600 dark:text-slate-400 mt-0.5">Cambridge Seriyalari</div>
          </div>
          <div className="bg-white/80 dark:bg-slate-900/80 backdrop-blur-sm p-4 rounded-2xl border border-slate-200/80 dark:border-slate-800 text-center shadow-xs">
            <div className="text-2xl sm:text-3xl font-black text-blue-600 dark:text-blue-400">4 ta</div>
            <div className="text-xs font-bold text-slate-600 dark:text-slate-400 mt-0.5">Asosiy Skill</div>
          </div>
          <div className="bg-white/80 dark:bg-slate-900/80 backdrop-blur-sm p-4 rounded-2xl border border-slate-200/80 dark:border-slate-800 text-center shadow-xs">
            <div className="text-2xl sm:text-3xl font-black text-purple-600 dark:text-purple-400">100%</div>
            <div className="text-xs font-bold text-slate-600 dark:text-slate-400 mt-0.5">Avtomatik Ballash</div>
          </div>
        </div>
      </section>

      {/* 4 Skills Feature Grid */}
      <section className="space-y-6">
        <div className="text-center max-w-2xl mx-auto">
          <span className="text-xs font-extrabold text-emerald-600 dark:text-emerald-400 uppercase tracking-widest bg-emerald-50 dark:bg-emerald-950/60 px-3 py-1 rounded-full border border-emerald-200 dark:border-emerald-800">
            Imtihon Strukturasi
          </span>
          <h2 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-white mt-2">
            To‘rtta Asosiy Til Ko‘nikmasi
          </h2>
          <p className="text-sm text-slate-600 dark:text-slate-400 mt-1">
            Har bir modul rasmiy xalqaro IELTS va CEFR talablariga moslashtirilgan.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {/* Listening */}
          <div className="card-modern p-6 flex flex-col justify-between group hover:border-blue-300 dark:hover:border-blue-700">
            <div>
              <div className="w-12 h-12 rounded-2xl bg-blue-50 dark:bg-blue-950/60 text-blue-600 dark:text-blue-400 flex items-center justify-center mb-4 ring-1 ring-blue-100 dark:ring-blue-900/50 group-hover:scale-110 transition-transform">
                <Headphones className="w-6 h-6" />
              </div>
              <h3 className="text-lg font-bold text-slate-900 dark:text-white">1. Listening</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mt-2 leading-relaxed">
                4 ta bo‘lim, 40 ta savol. Maksimal 2 marta eshitish chegarasi va avtomatik tezkor ballash algoritmi.
              </p>
            </div>
            <div className="mt-6 pt-4 border-t border-slate-100 dark:border-slate-800 flex items-center justify-between">
              <span className="text-xs font-bold text-blue-700 dark:text-blue-300 bg-blue-50 dark:bg-blue-950/60 px-2.5 py-1 rounded-lg">
                Audio Pleyer & Limit
              </span>
              <span className="text-xs text-slate-400 font-semibold">30 daqiqa</span>
            </div>
          </div>

          {/* Reading */}
          <div className="card-modern p-6 flex flex-col justify-between group hover:border-emerald-300 dark:hover:border-emerald-700">
            <div>
              <div className="w-12 h-12 rounded-2xl bg-emerald-50 dark:bg-emerald-950/60 text-emerald-600 dark:text-emerald-400 flex items-center justify-center mb-4 ring-1 ring-emerald-100 dark:ring-emerald-900/50 group-hover:scale-110 transition-transform">
                <BookOpen className="w-6 h-6" />
              </div>
              <h3 className="text-lg font-bold text-slate-900 dark:text-white">2. Reading</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mt-2 leading-relaxed">
                Cambridge 13–21 (36 ta to‘liq test). Matnlarni diqqat bilan o‘qib, barcha savollarga aniq javob berish.
              </p>
            </div>
            <div className="mt-6 pt-4 border-t border-slate-100 dark:border-slate-800 flex items-center justify-between">
              <span className="text-xs font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-950/60 px-2.5 py-1 rounded-lg">
                40 ta Savol
              </span>
              <span className="text-xs text-slate-400 font-semibold">60 daqiqa</span>
            </div>
          </div>

          {/* Writing */}
          <div className="card-modern p-6 flex flex-col justify-between group hover:border-orange-300 dark:hover:border-orange-700">
            <div>
              <div className="w-12 h-12 rounded-2xl bg-orange-50 dark:bg-orange-950/60 text-orange-600 dark:text-orange-400 flex items-center justify-center mb-4 ring-1 ring-orange-100 dark:ring-orange-900/50 group-hover:scale-110 transition-transform">
                <Edit3 className="w-6 h-6" />
              </div>
              <h3 className="text-lg font-bold text-slate-900 dark:text-white">3. Writing</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mt-2 leading-relaxed">
                Task 1 (kamida 150 so‘z) va Task 2 (kamida 250 so‘z). Jonli so‘z hisoblagich va examiner baholash tizimi.
              </p>
            </div>
            <div className="mt-6 pt-4 border-t border-slate-100 dark:border-slate-800 flex items-center justify-between">
              <span className="text-xs font-bold text-orange-700 dark:text-orange-300 bg-orange-50 dark:bg-orange-950/60 px-2.5 py-1 rounded-lg">
                So‘z Sanagich
              </span>
              <span className="text-xs text-slate-400 font-semibold">60 daqiqa</span>
            </div>
          </div>

          {/* Speaking */}
          <div className="card-modern p-6 flex flex-col justify-between group hover:border-purple-300 dark:hover:border-purple-700">
            <div>
              <div className="w-12 h-12 rounded-2xl bg-purple-50 dark:bg-purple-950/60 text-purple-600 dark:text-purple-400 flex items-center justify-center mb-4 ring-1 ring-purple-100 dark:ring-purple-900/50 group-hover:scale-110 transition-transform">
                <Mic className="w-6 h-6" />
              </div>
              <h3 className="text-lg font-bold text-slate-900 dark:text-white">4. Speaking</h3>
              <p className="text-sm text-slate-600 dark:text-slate-400 mt-2 leading-relaxed">
                Cambridge 13–21 (Part 1, Part 2 Cue card, Part 3). Brauzerda ovozni yozib olish va mediaga xavfsiz yuklash.
              </p>
            </div>
            <div className="mt-6 pt-4 border-t border-slate-100 dark:border-slate-800 flex items-center justify-between">
              <span className="text-xs font-bold text-purple-700 dark:text-purple-300 bg-purple-50 dark:bg-purple-950/60 px-2.5 py-1 rounded-lg">
                Web Audio Yozuv
              </span>
              <span className="text-xs text-slate-400 font-semibold">15 daqiqa</span>
            </div>
          </div>
        </div>
      </section>

      {/* Cambridge Books Showcase */}
      <section className="bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white rounded-3xl p-8 sm:p-10 shadow-xl relative overflow-hidden">
        <div className="absolute right-0 top-0 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none" />
        
        <div className="max-w-2xl space-y-4">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 text-xs font-bold">
            <Sparkles className="w-3.5 h-3.5" />
            Cambridge IELTS 13 dan 21 gacha
          </div>
          <h2 className="text-2xl sm:text-3xl font-extrabold tracking-tight">
            Eng so‘nggi va ishonchli akademik materiallar
          </h2>
          <p className="text-slate-300 text-sm leading-relaxed">
            Platformada Cambridge 13, 14, 15, 16, 17, 18, 19, 20 va 21 to‘plamlarining barcha 4 tadan testlari to‘liq integratsiya qilingan. Tartiblangan holda ketma-ket topshirish imkoniyati.
          </p>
          <div className="pt-2 flex flex-wrap gap-2">
            {[13, 14, 15, 16, 17, 18, 19, 20, 21].map((book) => (
              <span
                key={book}
                className="px-3 py-1 rounded-xl bg-white/10 hover:bg-white/20 border border-white/10 text-xs font-bold transition-colors"
              >
                Cambridge {book}
              </span>
            ))}
          </div>
        </div>

        <div className="mt-8 pt-6 border-t border-slate-700/60 flex flex-col sm:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-3 text-xs text-slate-400">
            <ShieldCheck className="w-5 h-5 text-emerald-400" />
            <span>Rasmiy javob kalitlari va avtomatik tekshirish algoritmi</span>
          </div>

          <Link
            href="/student"
            className="w-full sm:w-auto px-6 py-3 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-500 hover:from-emerald-600 hover:to-teal-600 text-white font-bold text-sm flex items-center justify-center gap-2 shadow-lg shadow-emerald-500/20 transition-all hover:scale-[1.02]"
          >
            Testlar Ro‘yxatini Ochish
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>
      </section>

      {/* CEFR Scale Table */}
      <section className="bg-white dark:bg-slate-900 p-8 rounded-3xl border border-slate-200 dark:border-slate-800 shadow-sm space-y-6">
        <div className="text-center max-w-xl mx-auto">
          <h2 className="text-2xl font-extrabold text-slate-900 dark:text-white">
            CEFR Darajalari Matritsasi
          </h2>
          <p className="text-xs text-slate-500 dark:text-slate-400 mt-1">
            Imtihon yakunida to‘plangan foiz va ball asosida beriladigan rasmiy CEFR darajalari
          </p>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50 dark:bg-slate-800/80 text-slate-700 dark:text-slate-300 uppercase font-bold text-xs border-b border-slate-200 dark:border-slate-800">
              <tr>
                <th className="py-3 px-4 rounded-l-xl">Foiz Oralig‘i</th>
                <th className="py-3 px-4">CEFR Darajasi</th>
                <th className="py-3 px-4">Tavsif</th>
                <th className="py-3 px-4 rounded-r-xl">Holat</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 dark:divide-slate-800">
              <tr className="hover:bg-slate-50/80 dark:hover:bg-slate-800/50 transition-colors">
                <td className="py-3.5 px-4 font-bold text-emerald-600 dark:text-emerald-400">80% – 100%</td>
                <td className="py-3.5 px-4 font-black text-slate-900 dark:text-white text-base">C1</td>
                <td className="py-3.5 px-4 text-slate-600 dark:text-slate-300 font-medium">Advanced (Oliy daraja)</td>
                <td className="py-3.5 px-4">
                  <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-emerald-100 dark:bg-emerald-950/80 text-emerald-800 dark:text-emerald-300">
                    Mustaqil & Erkin
                  </span>
                </td>
              </tr>
              <tr className="hover:bg-slate-50/80 dark:hover:bg-slate-800/50 transition-colors">
                <td className="py-3.5 px-4 font-bold text-blue-600 dark:text-blue-400">65% – 79%</td>
                <td className="py-3.5 px-4 font-black text-slate-900 dark:text-white text-base">B2</td>
                <td className="py-3.5 px-4 text-slate-600 dark:text-slate-300 font-medium">Upper-Intermediate (Yetuk)</td>
                <td className="py-3.5 px-4">
                  <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-blue-100 dark:bg-blue-950/80 text-blue-800 dark:text-blue-300">
                    Yaxshi
                  </span>
                </td>
              </tr>
              <tr className="hover:bg-slate-50/80 dark:hover:bg-slate-800/50 transition-colors">
                <td className="py-3.5 px-4 font-bold text-amber-600 dark:text-amber-400">50% – 64%</td>
                <td className="py-3.5 px-4 font-black text-slate-900 dark:text-white text-base">B1</td>
                <td className="py-3.5 px-4 text-slate-600 dark:text-slate-300 font-medium">Intermediate (O‘rta)</td>
                <td className="py-3.5 px-4">
                  <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-amber-100 dark:bg-amber-950/80 text-amber-800 dark:text-amber-300">
                    Qoniqarli
                  </span>
                </td>
              </tr>
              <tr className="hover:bg-slate-50/80 dark:hover:bg-slate-800/50 transition-colors">
                <td className="py-3.5 px-4 font-bold text-orange-600 dark:text-orange-400">35% – 49%</td>
                <td className="py-3.5 px-4 font-black text-slate-900 dark:text-white text-base">A2</td>
                <td className="py-3.5 px-4 text-slate-600 dark:text-slate-300 font-medium">Elementary (Boshlang‘ich)</td>
                <td className="py-3.5 px-4">
                  <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-orange-100 dark:bg-orange-950/80 text-orange-800 dark:text-orange-300">
                    Boshlang‘ich
                  </span>
                </td>
              </tr>
              <tr className="hover:bg-slate-50/80 dark:hover:bg-slate-800/50 transition-colors">
                <td className="py-3.5 px-4 font-bold text-rose-600 dark:text-rose-400">0% – 34%</td>
                <td className="py-3.5 px-4 font-black text-slate-900 dark:text-white text-base">A1</td>
                <td className="py-3.5 px-4 text-slate-600 dark:text-slate-300 font-medium">Beginner (O‘rganuvchi)</td>
                <td className="py-3.5 px-4">
                  <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-rose-100 dark:bg-rose-950/80 text-rose-800 dark:text-rose-300">
                    O‘rganuvchi
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
  );
}

