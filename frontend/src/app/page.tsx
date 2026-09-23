'use client';

import React from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { Headphones, BookOpen, Edit3, Mic, CheckCircle2, ShieldCheck, ArrowRight, Sparkles } from 'lucide-react';
import { apiLogin } from '@/lib/api';

export default function HomePage() {
  const router = useRouter();

  const handleQuickLogin = async (email: string, role: string) => {
    try {
      await apiLogin(email, 'password123');
      if (role === 'admin') router.push('/admin');
      else if (role === 'examiner') router.push('/examiner');
      else router.push('/student');
    } catch (e: any) {
      alert('Kirishda xatolik: ' + e.message);
    }
  };

  return (
    <div className="space-y-16 py-6">
      {/* Hero Section */}
      <section className="text-center max-w-4xl mx-auto space-y-6">
        <div className="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-emerald-50 border border-emerald-200 text-emerald-800 text-xs font-semibold">
          <Sparkles className="w-3.5 h-3.5 text-emerald-600" />
          Real CEFR Imtihoni Simulyatsiyasi (Multi-level A1–C1)
        </div>

        <h1 className="text-4xl sm:text-5xl font-extrabold text-slate-900 tracking-tight leading-tight">
          Ingliz tili darajangizni <span className="text-emerald-600">CEFR Standartlari</span> asosida aniqlang
        </h1>

        <p className="text-lg text-slate-600 max-w-2xl mx-auto">
          Reading, Listening, Writing va Speaking bo‘yicha to‘liq mock test topshiring. Real vaqt taymeri, ovoz yozib olish va professional tekshiruv bilan haqiqiy CEFR darajangizni bilib oling.
        </p>

        {/* Quick Demo Access Buttons */}
        <div className="pt-4 p-5 bg-white rounded-2xl border border-slate-200 shadow-sm max-w-2xl mx-auto">
          <p className="text-xs uppercase font-bold text-slate-500 tracking-wider mb-3">
            Tezkor Namoyish (Bir marta bosish bilan kirish):
          </p>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-2.5">
            <button
              onClick={() => handleQuickLogin('student@cefr.uz', 'student')}
              className="py-2.5 px-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-sm font-semibold transition-all shadow-sm flex items-center justify-center gap-1.5"
            >
              🎓 Student Kirish
            </button>
            <button
              onClick={() => handleQuickLogin('examiner@cefr.uz', 'examiner')}
              className="py-2.5 px-3 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-sm font-semibold transition-all shadow-sm flex items-center justify-center gap-1.5"
            >
              ✍️ Examiner Kirish
            </button>
            <button
              onClick={() => handleQuickLogin('admin@cefr.uz', 'admin')}
              className="py-2.5 px-3 bg-slate-800 hover:bg-slate-900 text-white rounded-xl text-sm font-semibold transition-all shadow-sm flex items-center justify-center gap-1.5"
            >
              ⚙️ Admin Kirish
            </button>
          </div>
        </div>
      </section>

      {/* 4 Skills Feature Grid */}
      <section className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="w-12 h-12 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center mb-4">
            <Headphones className="w-6 h-6" />
          </div>
          <h3 className="text-lg font-bold text-slate-900">1. Listening</h3>
          <p className="text-sm text-slate-600 mt-2">
            Haqiqiy imtihondagi kabi maksimal 1 yoki 2 marta eshitish imkoniyati va avtomatik tezkor ballash.
          </p>
          <span className="inline-block mt-4 text-xs font-semibold text-blue-700 bg-blue-50 px-2 py-1 rounded">
            Avtomatik tekshiruv
          </span>
        </div>

        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center mb-4">
            <BookOpen className="w-6 h-6" />
          </div>
          <h3 className="text-lg font-bold text-slate-900">2. Reading</h3>
          <p className="text-sm text-slate-600 mt-2">
            Split-screen (ikkiga bo‘lingan ekran) orqali chapda matnni o‘qib, o‘ngda qulay savollarga javob berish.
          </p>
          <span className="inline-block mt-4 text-xs font-semibold text-emerald-700 bg-emerald-50 px-2 py-1 rounded">
            Split-screen interfeys
          </span>
        </div>

        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="w-12 h-12 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center mb-4">
            <Edit3 className="w-6 h-6" />
          </div>
          <h3 className="text-lg font-bold text-slate-900">3. Writing</h3>
          <p className="text-sm text-slate-600 mt-2">
            Jonli so‘z sanagich va taymer bilan Task 1 hamda Task 2 insholarini yozish. Examiner tekshiruvi.
          </p>
          <span className="inline-block mt-4 text-xs font-semibold text-amber-700 bg-amber-50 px-2 py-1 rounded">
            So‘z hisoblagich & Examiner
          </span>
        </div>

        <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
          <div className="w-12 h-12 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center mb-4">
            <Mic className="w-6 h-6" />
          </div>
          <h3 className="text-lg font-bold text-slate-900">4. Speaking</h3>
          <p className="text-sm text-slate-600 mt-2">
            Brauzer orqali to‘g‘ridan-to‘g‘ri mikrofon yordamida ovozni yozib olish va audio serverga yuborish.
          </p>
          <span className="inline-block mt-4 text-xs font-semibold text-purple-700 bg-purple-50 px-2 py-1 rounded">
            Web Audio API Yozuvchi
          </span>
        </div>
      </section>

      {/* CEFR Scale Table */}
      <section className="bg-white p-8 rounded-2xl border border-slate-200 shadow-sm">
        <h2 className="text-2xl font-bold text-slate-900 text-center mb-6">
          CEFR Darajalarini Hisoblash Matritsasi
        </h2>

        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50 text-slate-700 uppercase font-semibold text-xs border-b border-slate-200">
              <tr>
                <th className="py-3 px-4">Foiz Oralig‘i</th>
                <th className="py-3 px-4">CEFR Darajasi</th>
                <th className="py-3 px-4">Tavsif</th>
                <th className="py-3 px-4">Holat</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              <tr className="hover:bg-slate-50">
                <td className="py-3.5 px-4 font-bold text-emerald-600">80% – 100%</td>
                <td className="py-3.5 px-4 font-black text-slate-900">C1</td>
                <td className="py-3.5 px-4 text-slate-600">Advanced (Oliy daraja)</td>
                <td className="py-3.5 px-4"><span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-100 text-emerald-800">Mustaqil & Erkin</span></td>
              </tr>
              <tr className="hover:bg-slate-50">
                <td className="py-3.5 px-4 font-bold text-blue-600">65% – 79%</td>
                <td className="py-3.5 px-4 font-black text-slate-900">B2</td>
                <td className="py-3.5 px-4 text-slate-600">Upper-Intermediate (Mustaqil)</td>
                <td className="py-3.5 px-4"><span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-blue-100 text-blue-800">Yaxshi</span></td>
              </tr>
              <tr className="hover:bg-slate-50">
                <td className="py-3.5 px-4 font-bold text-amber-600">50% – 64%</td>
                <td className="py-3.5 px-4 font-black text-slate-900">B1</td>
                <td className="py-3.5 px-4 text-slate-600">Intermediate (O‘rta)</td>
                <td className="py-3.5 px-4"><span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-amber-100 text-amber-800">Qoniqarli</span></td>
              </tr>
              <tr className="hover:bg-slate-50">
                <td className="py-3.5 px-4 font-bold text-orange-600">35% – 49%</td>
                <td className="py-3.5 px-4 font-black text-slate-900">A2</td>
                <td className="py-3.5 px-4 text-slate-600">Elementary</td>
                <td className="py-3.5 px-4"><span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-orange-100 text-orange-800">Boshlang‘ich</span></td>
              </tr>
              <tr className="hover:bg-slate-50">
                <td className="py-3.5 px-4 font-bold text-rose-600">0% – 34%</td>
                <td className="py-3.5 px-4 font-black text-slate-900">A1</td>
                <td className="py-3.5 px-4 text-slate-600">Beginner</td>
                <td className="py-3.5 px-4"><span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-rose-100 text-rose-800">O‘rganuvchi</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      {/* Architecture Highlights */}
      <section className="bg-gradient-to-r from-slate-900 to-slate-800 text-white p-8 rounded-2xl shadow-xl flex flex-col md:flex-row items-center justify-between gap-6">
        <div className="space-y-2">
          <h3 className="text-xl font-bold flex items-center gap-2">
            <ShieldCheck className="w-6 h-6 text-emerald-400" />
            Go Core Backend + Python Media Service + Next.js
          </h3>
          <p className="text-slate-300 text-sm max-w-xl">
            Docker konteynerlarida to‘liq izolyatsiyalangan arxitektura. PostgreSQL ma'lumotlar bazasi, Redis taymer kesh va Web Audio API integratsiyasi.
          </p>
        </div>

        <Link
          href="/student"
          className="px-6 py-3.5 rounded-xl bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-sm flex items-center gap-2 whitespace-nowrap shadow-lg transition-all"
        >
          Testni Boshlash
          <ArrowRight className="w-4 h-4" />
        </Link>
      </section>
    </div>
  );
}
