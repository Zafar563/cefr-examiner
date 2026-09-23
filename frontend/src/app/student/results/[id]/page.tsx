'use client';

import React, { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import Link from 'next/link';
import { apiGetSession, TestSession, TestResult } from '@/lib/api';
import { Award, ArrowLeft, CheckCircle2, XCircle, Clock, AlertCircle, Sparkles } from 'lucide-react';

export default function TestResultPage() {
  const params = useParams();
  const router = useRouter();
  const sessionId = Number(params.id);

  const [session, setSession] = useState<TestSession | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadSessionResult();
  }, [sessionId]);

  const loadSessionResult = async () => {
    setLoading(true);
    try {
      const data = await apiGetSession(sessionId);
      setSession(data);
    } catch (e: any) {
      alert('Natijalarni yuklashda xatolik: ' + e.message);
      router.push('/student');
    } finally {
      setLoading(false);
    }
  };

  if (loading || !session) {
    return (
      <div className="py-24 text-center">
        <div className="w-10 h-10 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-medium">Natijalar tahlil qilinmoqda...</p>
      </div>
    );
  }

  const result = session.result;
  const isFinal = result?.is_final || session.status === 'graded';

  const getLevelColor = (level: string) => {
    switch (level) {
      case 'C1':
        return 'from-emerald-600 to-teal-600 text-white';
      case 'B2':
        return 'from-blue-600 to-indigo-600 text-white';
      case 'B1':
        return 'from-amber-500 to-orange-600 text-white';
      case 'A2':
        return 'from-orange-500 to-amber-700 text-white';
      default:
        return 'from-slate-700 to-slate-800 text-white';
    }
  };

  return (
    <div className="space-y-8 py-4 max-w-5xl mx-auto">
      <Link
        href="/student"
        className="inline-flex items-center gap-1.5 text-xs font-semibold text-slate-500 hover:text-slate-800 transition-colors"
      >
        <ArrowLeft className="w-4 h-4" /> Barcha testlarga qaytish
      </Link>

      {/* Main Score Hero */}
      <div
        className={`rounded-3xl p-8 shadow-lg bg-gradient-to-br ${
          result ? getLevelColor(result.cefr_level) : 'from-slate-800 to-slate-900 text-white'
        } relative overflow-hidden`}
      >
        <div className="flex flex-col sm:flex-row items-center justify-between gap-6 relative z-10">
          <div className="text-center sm:text-left space-y-2">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-white/20 backdrop-blur-sm">
              <Sparkles className="w-3.5 h-3.5" />
              {isFinal ? 'Rasmiy Baholangan CEFR Natijasi' : 'Dastlabki Hisoblangan Natija'}
            </span>
            <h1 className="text-3xl sm:text-4xl font-black tracking-tight">{session.test_title}</h1>
            <p className="text-xs sm:text-sm text-white/80">
              Talaba: <span className="font-semibold text-white">{session.student_name}</span> | Sana:{' '}
              {session.submitted_at ? new Date(session.submitted_at).toLocaleDateString('uz-UZ') : 'Yaqinda'}
            </p>
          </div>

          {result && (
            <div className="flex flex-col items-center justify-center p-6 bg-white/10 backdrop-blur-md rounded-2xl border border-white/20 min-w-[160px]">
              <span className="text-xs font-bold uppercase tracking-wider text-white/80">CEFR DARAJASI</span>
              <span className="text-5xl sm:text-6xl font-black tracking-tighter my-1">{result.cefr_level}</span>
              <span className="text-sm font-bold text-white/90">
                {result.percentage}% ({result.total_score} / {result.max_score} ball)
              </span>
            </div>
          )}
        </div>
      </div>

      {!isFinal && (
        <div className="p-4 rounded-2xl bg-amber-50 border border-amber-200 text-amber-800 text-xs sm:text-sm flex items-center gap-3">
          <AlertCircle className="w-5 h-5 flex-shrink-0 text-amber-600" />
          <div>
            <strong>Eslatma:</strong> Reading va Listening bo‘limlari avtomatik hisoblandi. Writing va Speaking javoblaringiz Examiner (tekshiruvchi o‘qituvchi) tomonidan tekshirilmoqda. O‘qituvchi baholagach, yakuniy ballingiz yangilanadi.
          </div>
        </div>
      )}

      {/* 4 Skills Breakdown */}
      {result && (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-2">
            <span className="text-xs font-bold uppercase text-blue-600 block">🎧 Listening</span>
            <div className="text-2xl font-black text-slate-900">{result.listening_score} ball</div>
            <div className="w-full bg-slate-100 rounded-full h-2">
              <div
                className="bg-blue-600 h-2 rounded-full"
                style={{ width: `${Math.min(100, (result.listening_score / 30) * 100)}%` }}
              ></div>
            </div>
          </div>

          <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-2">
            <span className="text-xs font-bold uppercase text-emerald-600 block">📖 Reading</span>
            <div className="text-2xl font-black text-slate-900">{result.reading_score} ball</div>
            <div className="w-full bg-slate-100 rounded-full h-2">
              <div
                className="bg-emerald-600 h-2 rounded-full"
                style={{ width: `${Math.min(100, (result.reading_score / 30) * 100)}%` }}
              ></div>
            </div>
          </div>

          <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-2">
            <span className="text-xs font-bold uppercase text-amber-600 block">✍️ Writing</span>
            <div className="text-2xl font-black text-slate-900">{result.writing_score} ball</div>
            <div className="w-full bg-slate-100 rounded-full h-2">
              <div
                className="bg-amber-600 h-2 rounded-full"
                style={{ width: `${Math.min(100, (result.writing_score / 30) * 100)}%` }}
              ></div>
            </div>
          </div>

          <div className="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-2">
            <span className="text-xs font-bold uppercase text-purple-600 block">🎙️ Speaking</span>
            <div className="text-2xl font-black text-slate-900">{result.speaking_score} ball</div>
            <div className="w-full bg-slate-100 rounded-full h-2">
              <div
                className="bg-purple-600 h-2 rounded-full"
                style={{ width: `${Math.min(100, (result.speaking_score / 30) * 100)}%` }}
              ></div>
            </div>
          </div>
        </div>
      )}

      {/* Answers & Error Analysis (Xatolar ustida ishlash) */}
      <section className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm space-y-5">
        <h2 className="text-lg font-bold text-slate-900 flex items-center gap-2">
          <CheckCircle2 className="w-5 h-5 text-emerald-600" />
          Savollar va Xatolar Tahlili (Review)
        </h2>

        <div className="divide-y divide-slate-100 space-y-4">
          {session.answers?.map((ans, idx) => {
            const isAutoGraded = ans.section_type === 'listening' || ans.section_type === 'reading';
            const isCorrect = isAutoGraded && ans.score > 0;

            return (
              <div key={ans.id} className="pt-4 first:pt-0 space-y-2">
                <div className="flex items-start justify-between gap-4">
                  <div className="space-y-1">
                    <span className="text-xs font-bold uppercase text-slate-400">
                      {ans.section_type} • Savol #{idx + 1}
                    </span>
                    <h4 className="text-sm font-semibold text-slate-900">{ans.question_text}</h4>
                  </div>
                  <div className="flex-shrink-0">
                    {isAutoGraded ? (
                      isCorrect ? (
                        <span className="px-2.5 py-1 rounded-md text-xs font-bold bg-emerald-100 text-emerald-800 flex items-center gap-1">
                          <CheckCircle2 className="w-3.5 h-3.5" /> To‘g‘ri (+{ans.score})
                        </span>
                      ) : (
                        <span className="px-2.5 py-1 rounded-md text-xs font-bold bg-rose-100 text-rose-800 flex items-center gap-1">
                          <XCircle className="w-3.5 h-3.5" /> Noto‘g‘ri (0)
                        </span>
                      )
                    ) : ans.is_graded ? (
                      <span className="px-2.5 py-1 rounded-md text-xs font-bold bg-indigo-100 text-indigo-800">
                        Baholandi: {ans.score} ball
                      </span>
                    ) : (
                      <span className="px-2.5 py-1 rounded-md text-xs font-medium bg-slate-100 text-slate-600">
                        Kutilmoqda
                      </span>
                    )}
                  </div>
                </div>

                {/* Details */}
                <div className="p-3 bg-slate-50 rounded-xl text-xs space-y-1.5 border border-slate-100">
                  <div>
                    <span className="font-semibold text-slate-500">Sizning javobingiz: </span>
                    <span className="font-bold text-slate-800">{ans.user_answer_text || 'Javob berilmagan'}</span>
                  </div>

                  {ans.correct_answer && (
                    <div>
                      <span className="font-semibold text-emerald-700">To‘g‘ri javob: </span>
                      <span className="font-bold text-emerald-900">{ans.correct_answer}</span>
                    </div>
                  )}

                  {ans.examiner_feedback && (
                    <div className="mt-2 pt-2 border-t border-slate-200">
                      <span className="font-semibold text-indigo-700">Examiner izohi: </span>
                      <span className="text-slate-700">{ans.examiner_feedback}</span>
                    </div>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      </section>
    </div>
  );
}
