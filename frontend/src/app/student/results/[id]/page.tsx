'use client';

import React, { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import Link from 'next/link';
import { apiGetSession, apiStartSession, apiStartRandomMock, TestSession } from '@/lib/api';
import { ArrowLeft, CheckCircle2, XCircle, AlertCircle, Sparkles, Headphones, BookOpen, Mic, RotateCcw } from 'lucide-react';

export default function TestResultPage() {
  const params = useParams();
  const router = useRouter();
  const rawId = params?.id;
  const sessionId = rawId ? Number(rawId) : NaN;

  const [mounted, setMounted] = useState(false);
  const [session, setSession] = useState<TestSession | null>(null);
  const [loading, setLoading] = useState(true);
  const [errorMessage, setErrorMessage] = useState('');

  useEffect(() => {
    setMounted(true);
    if (!isNaN(sessionId) && sessionId > 0) {
      loadSessionResult(sessionId);
    } else {
      setErrorMessage('Yaroqsiz natija identifikatori.');
      setLoading(false);
    }
  }, [sessionId]);

  const loadSessionResult = async (sId: number) => {
    setLoading(true);
    setErrorMessage('');
    try {
      const data = await apiGetSession(sId);
      if (!data || !data.id) {
        throw new Error('Natija topilmadi');
      }
      setSession(data);
    } catch (e: any) {
      setErrorMessage(e.message || 'Natijalarni yuklab bo‘lmadi.');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateStr?: string) => {
    if (!dateStr) return 'Yaqinda';
    try {
      const d = new Date(dateStr);
      return isNaN(d.getTime()) ? 'Yaqinda' : d.toLocaleDateString('uz-UZ') + ' ' + d.toLocaleTimeString('uz-UZ', { hour: '2-digit', minute: '2-digit' });
    } catch {
      return 'Yaqinda';
    }
  };

  const [retaking, setRetaking] = useState(false);

  const handleRetake = async () => {
    if (!session || !session.test_id) return;
    setRetaking(true);
    try {
      const isMock = (session.test_title || '').toLowerCase().includes('mock');
      let newSession;
      if (isMock) {
        newSession = await apiStartRandomMock(true);
      } else {
        newSession = await apiStartSession(session.test_id, true);
      }
      router.push(`/student/test/${newSession.id}`);
    } catch (e: any) {
      alert('Testni qayta boshlashda xatolik: ' + e.message);
      setRetaking(false);
    }
  };

  if (!mounted || loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-10 h-10 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-medium">Natijalar tahlil qilinmoqda...</p>
      </div>
    );
  }

  if (errorMessage || !session) {
    return (
      <div className="max-w-md mx-auto my-16 p-6 bg-white rounded-2xl border border-slate-200 text-center space-y-4 shadow-sm">
        <h3 className="text-base font-bold text-slate-900">Xatolik</h3>
        <p className="text-xs text-slate-600">{errorMessage || 'Natijalar topilmadi.'}</p>
        <Link
          href="/student"
          className="inline-block px-4 py-2 bg-emerald-600 text-white rounded-xl text-xs font-bold hover:bg-emerald-700 transition-colors"
        >
          Kabinetga qaytish
        </Link>
      </div>
    );
  }

  const result = session.result;
  const isFinal = result?.is_final || session.status === 'graded';

  const getLevelColor = (level?: string) => {
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

  const answers = Array.isArray(session.answers) ? session.answers : [];

  return (
    <div className="space-y-8 py-4 max-w-5xl mx-auto">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <Link
          href="/student"
          className="inline-flex items-center gap-1.5 text-xs font-semibold text-slate-500 hover:text-slate-800 transition-colors"
        >
          <ArrowLeft className="w-4 h-4" /> Barcha testlarga qaytish
        </Link>

        {session && session.test_id && (
          <button
            onClick={handleRetake}
            disabled={retaking}
            className="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-xs sm:text-sm shadow-md shadow-emerald-600/20 transition-all disabled:opacity-50"
          >
            {retaking ? (
              <>
                <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                <span>Yangi test ochilmoqda...</span>
              </>
            ) : (
              <>
                <RotateCcw className="w-4 h-4" />
                <span>Testni Qayta Topshirish (Retake)</span>
              </>
            )}
          </button>
        )}
      </div>

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
            <h1 className="text-3xl sm:text-4xl font-black tracking-tight">{session.test_title || 'CEFR Test'}</h1>
            <p className="text-xs sm:text-sm text-white/80">
              Talaba: <span className="font-semibold text-white">{session.student_name || 'Talaba'}</span> | Sana:{' '}
              {formatDate(session.submitted_at || session.started_at)}
            </p>
          </div>

          {result && (
            <div className="flex flex-col items-center justify-center p-6 bg-white/10 backdrop-blur-md rounded-2xl border border-white/20 min-w-[160px]">
              <span className="text-xs font-bold uppercase tracking-wider text-white/80">CEFR DARAJASI</span>
              <span className="text-5xl sm:text-6xl font-black tracking-tighter my-1">{result.cefr_level || 'A1'}</span>
              <span className="text-sm font-bold text-white/90">
                {result.percentage}% ({result.total_score} / {result.max_score} ball)
              </span>
            </div>
          )}
        </div>
      </div>

      {(() => {
        const titleLower = (session.test_title || '').toLowerCase();
        const isMock = titleLower.includes('mock');
        const isListeningTest = titleLower.includes('listening') && !isMock;
        const isReadingTest = titleLower.includes('reading') && !isMock;
        const isSpeakingTest = titleLower.includes('speaking') && !isMock;
        const hasWriting = (session.answers || []).some((a) => a.section_type === 'writing') || (result?.writing_score || 0) > 0;

        return (
          <>
            {!isFinal && !isListeningTest && !isReadingTest && (
              <div className="p-4 rounded-2xl bg-amber-50 border border-amber-200 text-amber-800 text-xs sm:text-sm flex items-center gap-3">
                <AlertCircle className="w-5 h-5 flex-shrink-0 text-amber-600" />
                <div>
                  <strong>Eslatma:</strong> Reading va Listening bo‘limlari avtomatik hisoblandi. Writing va Speaking javoblaringiz Examiner (tekshiruvchi o‘qituvchi) tomonidan tekshirilmoqda. O‘qituvchi baholagach, yakuniy ballingiz yangilanadi.
                </div>
              </div>
            )}

            {result && isListeningTest ? (
              <div className="bg-white dark:bg-slate-900 p-6 rounded-2xl border-2 border-blue-200 dark:border-blue-900/60 shadow-sm flex flex-col sm:flex-row items-center justify-between gap-6">
                <div className="space-y-2 text-center sm:text-left">
                  <span className="text-xs font-bold uppercase text-blue-600 dark:text-blue-400 tracking-wider flex items-center gap-1.5 justify-center sm:justify-start">
                    <Headphones className="w-4 h-4" /> 🎧 Listening Comprehension Natijasi
                  </span>
                  <div className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white">
                    {result.listening_score} <span className="text-xl font-semibold text-slate-400">/ {result.max_score || 40} ball</span>
                  </div>
                  <p className="text-xs text-slate-500 dark:text-slate-400">
                    To‘g‘ri javoblar foizi: <strong>{result.percentage}%</strong>
                  </p>
                </div>
                <div className="flex items-center gap-3">
                  <div className="px-6 py-3 rounded-2xl bg-blue-50 dark:bg-blue-950/60 border border-blue-100 dark:border-blue-900/50 text-center">
                    <span className="text-xs font-bold uppercase text-blue-700 dark:text-blue-300 block">CEFR DARAJASI</span>
                    <span className="text-3xl font-black text-blue-900 dark:text-blue-100">{result.cefr_level || 'A1'}</span>
                  </div>
                </div>
              </div>
            ) : result && isReadingTest ? (
              <div className="bg-white dark:bg-slate-900 p-6 rounded-2xl border-2 border-emerald-200 dark:border-emerald-900/60 shadow-sm flex flex-col sm:flex-row items-center justify-between gap-6">
                <div className="space-y-2 text-center sm:text-left">
                  <span className="text-xs font-bold uppercase text-emerald-600 dark:text-emerald-400 tracking-wider flex items-center gap-1.5 justify-center sm:justify-start">
                    <BookOpen className="w-4 h-4" /> 📖 Reading Comprehension Natijasi
                  </span>
                  <div className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white">
                    {result.reading_score} <span className="text-xl font-semibold text-slate-400">/ {result.max_score || 40} ball</span>
                  </div>
                  <p className="text-xs text-slate-500 dark:text-slate-400">
                    To‘g‘ri javoblar foizi: <strong>{result.percentage}%</strong>
                  </p>
                </div>
                <div className="flex items-center gap-3">
                  <div className="px-6 py-3 rounded-2xl bg-emerald-50 dark:bg-emerald-950/60 border border-emerald-100 dark:border-emerald-900/50 text-center">
                    <span className="text-xs font-bold uppercase text-emerald-700 dark:text-emerald-300 block">CEFR DARAJASI</span>
                    <span className="text-3xl font-black text-emerald-900 dark:text-emerald-100">{result.cefr_level || 'A1'}</span>
                  </div>
                </div>
              </div>
            ) : result && isSpeakingTest ? (
              <div className="bg-white dark:bg-slate-900 p-6 rounded-2xl border-2 border-purple-200 dark:border-purple-900/60 shadow-sm flex flex-col sm:flex-row items-center justify-between gap-6">
                <div className="space-y-2 text-center sm:text-left">
                  <span className="text-xs font-bold uppercase text-purple-600 dark:text-purple-400 tracking-wider flex items-center gap-1.5 justify-center sm:justify-start">
                    <Mic className="w-4 h-4" /> 🎙️ Speaking Assessment Natijasi
                  </span>
                  <div className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white">
                    {result.speaking_score} <span className="text-xl font-semibold text-slate-400">/ {result.max_score || 40} ball</span>
                  </div>
                  <p className="text-xs text-slate-500 dark:text-slate-400">
                    To‘plangan ball foizi: <strong>{result.percentage}%</strong>
                  </p>
                </div>
                <div className="flex items-center gap-3">
                  <div className="px-6 py-3 rounded-2xl bg-purple-50 dark:bg-purple-950/60 border border-purple-100 dark:border-purple-900/50 text-center">
                    <span className="text-xs font-bold uppercase text-purple-700 dark:text-purple-300 block">CEFR DARAJASI</span>
                    <span className="text-3xl font-black text-purple-900 dark:text-purple-100">{result.cefr_level || 'A1'}</span>
                  </div>
                </div>
              </div>
            ) : result ? (
              /* Skills Breakdown for Multi-skill Mock */
              <div className={`grid grid-cols-1 ${hasWriting ? 'sm:grid-cols-2 lg:grid-cols-4' : 'sm:grid-cols-3'} gap-4`}>
                <div className="bg-white dark:bg-slate-900 p-5 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-sm space-y-2">
                  <div className="flex items-center justify-between">
                    <span className="text-xs font-bold uppercase text-blue-600 dark:text-blue-400 block">🎧 Listening</span>
                    <span className="text-xs font-semibold text-slate-400">maks 40 ball</span>
                  </div>
                  <div className="text-2xl font-black text-slate-900 dark:text-white">{result.listening_score} ball</div>
                  <div className="w-full bg-slate-100 dark:bg-slate-800 rounded-full h-2">
                    <div
                      className="bg-blue-600 h-2 rounded-full"
                      style={{ width: `${Math.min(100, (result.listening_score / 40) * 100)}%` }}
                    ></div>
                  </div>
                </div>

                <div className="bg-white dark:bg-slate-900 p-5 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-sm space-y-2">
                  <div className="flex items-center justify-between">
                    <span className="text-xs font-bold uppercase text-emerald-600 dark:text-emerald-400 block">📖 Reading</span>
                    <span className="text-xs font-semibold text-slate-400">maks 40 ball</span>
                  </div>
                  <div className="text-2xl font-black text-slate-900 dark:text-white">{result.reading_score} ball</div>
                  <div className="w-full bg-slate-100 dark:bg-slate-800 rounded-full h-2">
                    <div
                      className="bg-emerald-600 h-2 rounded-full"
                      style={{ width: `${Math.min(100, (result.reading_score / 40) * 100)}%` }}
                    ></div>
                  </div>
                </div>

                {hasWriting && (
                  <div className="bg-white dark:bg-slate-900 p-5 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-sm space-y-2">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-amber-600 dark:text-amber-400 block">✍️ Writing</span>
                      <span className="text-xs font-semibold text-slate-400">maks 40 ball</span>
                    </div>
                    <div className="text-2xl font-black text-slate-900 dark:text-white">{result.writing_score} ball</div>
                    <div className="w-full bg-slate-100 dark:bg-slate-800 rounded-full h-2">
                      <div
                        className="bg-amber-600 h-2 rounded-full"
                        style={{ width: `${Math.min(100, (result.writing_score / 40) * 100)}%` }}
                      ></div>
                    </div>
                  </div>
                )}

                <div className="bg-white dark:bg-slate-900 p-5 rounded-2xl border border-slate-200 dark:border-slate-800 shadow-sm space-y-2">
                  <div className="flex items-center justify-between">
                    <span className="text-xs font-bold uppercase text-purple-600 dark:text-purple-400 block">🎙️ Speaking</span>
                    <span className="text-xs font-semibold text-slate-400">maks 40 ball</span>
                  </div>
                  <div className="text-2xl font-black text-slate-900 dark:text-white">{result.speaking_score} ball</div>
                  <div className="w-full bg-slate-100 dark:bg-slate-800 rounded-full h-2">
                    <div
                      className="bg-purple-600 h-2 rounded-full"
                      style={{ width: `${Math.min(100, (result.speaking_score / 40) * 100)}%` }}
                    ></div>
                  </div>
                </div>
              </div>
            ) : null}
          </>
        );
      })()}

      {/* Answers & Error Analysis (Xatolar ustida ishlash) */}
      <section className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-5">
        <h2 className="text-lg font-bold text-slate-900 dark:text-white flex items-center gap-2">
          <CheckCircle2 className="w-5 h-5 text-emerald-600 dark:text-emerald-400" />
          Savollar va Xatolar Tahlili (Review)
        </h2>

        {answers.length === 0 ? (
          <p className="text-xs text-slate-500 dark:text-slate-400 py-4">Javoblar ro‘yxati mavjud emas.</p>
        ) : (
          <div className="divide-y divide-slate-100 dark:divide-slate-800 space-y-4">
            {answers.map((ans, idx) => {
              const isAutoGraded = ans.section_type === 'listening' || ans.section_type === 'reading';
              const isCorrect = isAutoGraded && ans.score > 0;

              return (
                <div key={ans.id || idx} className="pt-4 first:pt-0 space-y-2">
                  <div className="flex items-start justify-between gap-4">
                    <div className="space-y-1">
                      <span className="text-xs font-bold uppercase text-slate-400 dark:text-slate-500">
                        {ans.section_type} • Savol #{idx + 1}
                      </span>
                      <h4 className="text-sm font-semibold text-slate-900 dark:text-white">{ans.question_text}</h4>
                    </div>
                    <div className="flex-shrink-0">
                      {isAutoGraded ? (
                        isCorrect ? (
                          <span className="px-2.5 py-1 rounded-md text-xs font-bold bg-emerald-100 dark:bg-emerald-950/60 text-emerald-800 dark:text-emerald-300 flex items-center gap-1">
                            <CheckCircle2 className="w-3.5 h-3.5" /> To‘g‘ri (+{ans.score})
                          </span>
                        ) : (
                          <span className="px-2.5 py-1 rounded-md text-xs font-bold bg-rose-100 dark:bg-rose-950/60 text-rose-800 dark:text-rose-300 flex items-center gap-1">
                            <XCircle className="w-3.5 h-3.5" /> Noto‘g‘ri (0)
                          </span>
                        )
                      ) : ans.is_graded ? (
                        <span className="px-2.5 py-1 rounded-md text-xs font-bold bg-indigo-100 dark:bg-indigo-950/60 text-indigo-800 dark:text-indigo-300">
                          Baholandi: {ans.score} ball
                        </span>
                      ) : (
                        <span className="px-2.5 py-1 rounded-md text-xs font-medium bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                          Kutilmoqda
                        </span>
                      )}
                    </div>
                  </div>

                  {/* Details */}
                  <div className="p-3 bg-slate-50 dark:bg-slate-800/80 rounded-xl text-xs space-y-1.5 border border-slate-100 dark:border-slate-700">
                    <div>
                      <span className="font-semibold text-slate-500 dark:text-slate-400">Sizning javobingiz: </span>
                      <span className="font-bold text-slate-800 dark:text-slate-200">{ans.user_answer_text || 'Javob berilmagan'}</span>
                    </div>

                    {ans.correct_answer && (
                      <div>
                        <span className="font-semibold text-emerald-700 dark:text-emerald-400">To‘g‘ri javob: </span>
                        <span className="font-bold text-emerald-900 dark:text-emerald-200">{ans.correct_answer}</span>
                      </div>
                    )}

                    {ans.examiner_feedback && (
                      <div className="mt-2 pt-2 border-t border-slate-200 dark:border-slate-700">
                        <span className="font-semibold text-indigo-700 dark:text-indigo-400">Examiner izohi: </span>
                        <span className="text-slate-700 dark:text-slate-300">{ans.examiner_feedback}</span>
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </section>

      {/* Retake Call to Action Banner */}
      {session && session.test_id && (
        <div className="p-6 bg-slate-900 text-white rounded-3xl flex flex-col sm:flex-row items-center justify-between gap-4 shadow-lg border border-slate-800">
          <div>
            <h3 className="text-base font-bold flex items-center gap-2">
              <RotateCcw className="w-5 h-5 text-emerald-400" />
              Natijani yaxshilashni xohlaysizmi?
            </h3>
            <p className="text-xs text-slate-400 mt-1 max-w-xl">
              Xatolaringizni ko‘rib chiqqan bo‘lsangiz, testni yangidan boshlab o‘z bilimingizni yana bir bor sinab ko‘rishingiz mumkin. Har bir urinishingiz natijasi alohida saqlanadi.
            </p>
          </div>
          <button
            onClick={handleRetake}
            disabled={retaking}
            className="px-6 py-3 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-500 hover:from-emerald-600 hover:to-teal-600 text-white font-bold text-xs sm:text-sm shadow-lg shadow-emerald-500/25 transition-all flex items-center gap-2 shrink-0 disabled:opacity-50"
          >
            {retaking ? (
              <>
                <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                <span>Yuklanmoqda...</span>
              </>
            ) : (
              <>
                <RotateCcw className="w-4 h-4" />
                <span>Testni Qayta Ishlash</span>
              </>
            )}
          </button>
        </div>
      )}
    </div>
  );
}
