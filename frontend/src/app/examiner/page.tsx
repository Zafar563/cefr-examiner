'use client';

import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import {
  apiGetExaminerSubmissions,
  apiGetSession,
  apiGradeAnswer,
  getCurrentStoredUser,
  TestSession,
  Answer,
} from '@/lib/api';
import { CheckSquare, Headphones, FileText, Send, CheckCircle2, User, Clock, AlertCircle } from 'lucide-react';

export default function ExaminerPage() {
  const router = useRouter();
  const [submissions, setSubmissions] = useState<TestSession[]>([]);
  const [loading, setLoading] = useState(true);

  // Active grading session
  const [selectedSession, setSelectedSession] = useState<TestSession | null>(null);
  const [gradingScores, setGradingScores] = useState<Record<number, number>>({});
  const [gradingFeedback, setGradingFeedback] = useState<Record<number, string>>({});
  const [savingGradeId, setSavingGradeId] = useState<number | null>(null);

  useEffect(() => {
    const user = getCurrentStoredUser();
    if (!user || (user.role !== 'examiner' && user.role !== 'admin')) {
      alert('Ushbu sahifaga faqat Examiner yoki Admin kira oladi');
      router.push('/login');
      return;
    }
    loadSubmissions();
  }, []);

  const loadSubmissions = async () => {
    setLoading(true);
    try {
      const data = await apiGetExaminerSubmissions();
      setSubmissions(data);
    } catch (e: any) {
      alert('Ma\'lumotlarni yuklashda xatolik: ' + e.message);
    } finally {
      setLoading(false);
    }
  };

  const handleSelectSession = async (session: TestSession) => {
    try {
      const fullDetails = await apiGetSession(session.id);
      setSelectedSession(fullDetails);

      // Pre-fill existing grades
      const scores: Record<number, number> = {};
      const feedback: Record<number, string> = {};
      fullDetails.answers?.forEach((ans) => {
        if (ans.is_graded) {
          scores[ans.id] = ans.score;
          feedback[ans.id] = ans.examiner_feedback || '';
        }
      });
      setGradingScores(scores);
      setGradingFeedback(feedback);
    } catch (e: any) {
      alert('Sessiya ma\'lumotlarini ochishda xatolik: ' + e.message);
    }
  };

  const handleSaveGrade = async (answerId: number) => {
    const score = gradingScores[answerId] !== undefined ? gradingScores[answerId] : 0;
    const feedback = gradingFeedback[answerId] || '';

    setSavingGradeId(answerId);
    try {
      await apiGradeAnswer(answerId, score, feedback);
      alert('Baho va izoh muvaffaqiyatli saqlandi!');
      if (selectedSession) {
        handleSelectSession(selectedSession);
      }
      loadSubmissions();
    } catch (e: any) {
      alert('Baholashda xatolik: ' + e.message);
    } finally {
      setSavingGradeId(null);
    }
  };

  if (loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-10 h-10 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-medium">Tekshirish uchun ishlar yuklanmoqda...</p>
      </div>
    );
  }

  return (
    <div className="space-y-8 py-4">
      {/* Header */}
      <div className="bg-gradient-to-r from-indigo-700 to-slate-900 text-white rounded-2xl p-6 sm:p-8 shadow-sm flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight flex items-center gap-2.5">
            <CheckSquare className="w-7 h-7 text-indigo-300" />
            Examiner Baholash Paneli
          </h1>
          <p className="text-indigo-100 text-sm mt-1">
            Talabalar yuborgan Writing insholari va Speaking audio yozuvlarini baholash.
          </p>
        </div>
        <div className="bg-white/10 px-4 py-2 rounded-xl text-xs sm:text-sm font-semibold">
          Kutilayotgan ishlar: <span className="font-bold text-amber-300">{submissions.length}</span> ta
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Left column: Submissions list */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5 shadow-sm space-y-4">
          <h2 className="text-base font-bold text-slate-900">Tekshirilishi kerak bo‘lgan ishlar</h2>

          {submissions.length === 0 ? (
            <p className="text-xs text-slate-500 py-6 text-center">
              Hozircha tekshirilishi kerak bo‘lgan topshiriqlar mavjud emas.
            </p>
          ) : (
            <div className="space-y-2">
              {submissions.map((sub) => (
                <div
                  key={sub.id}
                  onClick={() => handleSelectSession(sub)}
                  className={`p-4 rounded-xl border text-xs cursor-pointer transition-all ${
                    selectedSession?.id === sub.id
                      ? 'border-indigo-600 bg-indigo-50/50 shadow-sm'
                      : 'border-slate-200 hover:bg-slate-50'
                  }`}
                >
                  <div className="font-bold text-sm text-slate-900 mb-1">{sub.student_name}</div>
                  <div className="text-slate-600 font-medium">{sub.test_title}</div>
                  <div className="text-slate-400 mt-2 flex items-center gap-1">
                    <Clock className="w-3.5 h-3.5" />
                    {sub.submitted_at ? new Date(sub.submitted_at).toLocaleString('uz-UZ') : ''}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Right column: Grading workspace */}
        <div className="lg:col-span-2 space-y-6">
          {selectedSession ? (
            <div className="space-y-6">
              <div className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm">
                <h3 className="text-lg font-bold text-slate-900">
                  {selectedSession.student_name} — {selectedSession.test_title}
                </h3>
                <p className="text-xs text-slate-500 mt-1">
                  Writing insholarini o‘qing va Speaking audiolarni tinglab, CEFR mezonlari bo‘yicha baholang.
                </p>
              </div>

              {/* Answers requiring examiner grading */}
              <div className="space-y-6">
                {selectedSession.answers
                  ?.filter((a) => a.section_type === 'writing' || a.section_type === 'speaking')
                  .map((ans) => {
                    const isWriting = ans.section_type === 'writing';
                    return (
                      <div key={ans.id} className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm space-y-4">
                        <div className="flex items-center justify-between">
                          <span
                            className={`px-2.5 py-1 rounded-md text-xs font-bold uppercase ${
                              isWriting ? 'bg-amber-100 text-amber-800' : 'bg-purple-100 text-purple-800'
                            }`}
                          >
                            {isWriting ? '✍️ Writing Insho' : '🎙️ Speaking Audio'}
                          </span>

                          <span className="text-xs font-semibold text-slate-500">
                            {ans.is_graded ? (
                              <span className="text-emerald-600 font-bold">✓ Baholangan ({ans.score} ball)</span>
                            ) : (
                              <span className="text-amber-600 font-bold">Kutilmoqda</span>
                            )}
                          </span>
                        </div>

                        {/* Prompt */}
                        <div className="p-3 bg-slate-50 rounded-xl text-xs font-semibold text-slate-700">
                          {ans.question_text}
                        </div>

                        {/* Student Response */}
                        {isWriting ? (
                          <div className="p-4 bg-slate-50/80 rounded-xl border border-slate-200 text-xs text-slate-800 font-normal whitespace-pre-line leading-relaxed">
                            {ans.user_answer_text || 'Javob berilmagan'}
                          </div>
                        ) : (
                          <div className="p-4 bg-purple-50/60 rounded-xl border border-purple-200 space-y-2">
                            <span className="text-xs font-semibold text-purple-900 block">
                              Talabaning yozib yuborgan audio yozuvi:
                            </span>
                            {ans.audio_file_url ? (
                              <audio controls src={ans.audio_file_url} className="w-full h-10" />
                            ) : (
                              <span className="text-xs text-slate-500">Audio fayl yuklanmagan</span>
                            )}
                          </div>
                        )}

                        {/* Grading Inputs */}
                        <div className="pt-4 border-t border-slate-100 grid grid-cols-1 sm:grid-cols-3 gap-3">
                          <div>
                            <label className="block text-xs font-bold text-slate-700 mb-1">
                              Qo‘yiladigan Ball (maks 15):
                            </label>
                            <input
                              type="number"
                              min="0"
                              max="15"
                              step="0.5"
                              value={gradingScores[ans.id] ?? ''}
                              onChange={(e) =>
                                setGradingScores({ ...gradingScores, [ans.id]: parseFloat(e.target.value) || 0 })
                              }
                              placeholder="0-15"
                              className="w-full px-3 py-2 rounded-xl border border-slate-300 text-sm font-semibold focus:ring-2 focus:ring-indigo-500 outline-none"
                            />
                          </div>

                          <div className="sm:col-span-2">
                            <label className="block text-xs font-bold text-slate-700 mb-1">
                              Examiner Izohi (Feedback):
                            </label>
                            <input
                              type="text"
                              value={gradingFeedback[ans.id] || ''}
                              onChange={(e) =>
                                setGradingFeedback({ ...gradingFeedback, [ans.id]: e.target.value })
                              }
                              placeholder="Masalan: Good cohesion and vocabulary, but minor grammar flaws..."
                              className="w-full px-3 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-indigo-500 outline-none"
                            />
                          </div>
                        </div>

                        <div className="text-right">
                          <button
                            onClick={() => handleSaveGrade(ans.id)}
                            disabled={savingGradeId === ans.id}
                            className="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-xs font-bold transition-all shadow-sm disabled:opacity-50"
                          >
                            {savingGradeId === ans.id ? 'Saqlanmoqda...' : 'Bahoni Saqlash'}
                          </button>
                        </div>
                      </div>
                    );
                  })}
              </div>
            </div>
          ) : (
            <div className="bg-white rounded-2xl border border-dashed border-slate-300 p-12 text-center text-slate-500 text-sm">
              Chap tomondan tekshirish uchun topshiriqni tanlang.
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
