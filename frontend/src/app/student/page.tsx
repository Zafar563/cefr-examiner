'use client';

import React, { useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { apiGetTests, apiGetStudentHistory, apiStartSession, getCurrentStoredUser, Test, TestSession } from '@/lib/api';
import { Clock, Award, ChevronRight, PlayCircle, FileText } from 'lucide-react';

export default function StudentDashboard() {
  const router = useRouter();
  const [mounted, setMounted] = useState(false);
  const [tests, setTests] = useState<Test[]>([]);
  const [history, setHistory] = useState<TestSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [startingTestId, setStartingTestId] = useState<number | null>(null);

  useEffect(() => {
    setMounted(true);
    const user = getCurrentStoredUser();
    if (!user) {
      router.push('/login');
      return;
    }
    loadData();
  }, [router]);

  const loadData = async () => {
    setLoading(true);
    try {
      const [availableTests, sessionHistory] = await Promise.all([
        apiGetTests().catch(() => []),
        apiGetStudentHistory().catch(() => []),
      ]);
      setTests(Array.isArray(availableTests) ? availableTests : []);
      setHistory(Array.isArray(sessionHistory) ? sessionHistory : []);
    } catch (e) {
      console.error('Data load error:', e);
      setTests([]);
      setHistory([]);
    } finally {
      setLoading(false);
    }
  };

  const handleStartTest = async (testId: number) => {
    try {
      setStartingTestId(testId);
      const session = await apiStartSession(testId);
      router.push(`/student/test/${session.id}`);
    } catch (e: any) {
      alert('Testni boshlashda xatolik: ' + e.message);
      setStartingTestId(null);
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

  if (!mounted || loading) {
    return (
      <div className="py-20 text-center">
        <div className="w-10 h-10 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-medium">Ma'lumotlar yuklanmoqda...</p>
      </div>
    );
  }

  const safeTests = Array.isArray(tests) ? tests : [];
  const safeHistory = Array.isArray(history) ? history : [];

  return (
    <div className="space-y-10 py-4">
      {/* Header Banner */}
      <div className="bg-gradient-to-r from-emerald-700 to-teal-800 text-white rounded-2xl p-6 sm:p-8 shadow-sm flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight">O‘quvchi Kabineti</h1>
          <p className="text-emerald-100 text-sm mt-1">
            Real CEFR simulyatsiyasida ishtirok eting va ko‘nikmalaringizni sinab ko‘ring.
          </p>
        </div>
        <div className="bg-white/10 backdrop-blur-md px-4 py-2.5 rounded-xl border border-white/20 text-xs sm:text-sm font-semibold flex items-center gap-2">
          <Award className="w-5 h-5 text-emerald-300" />
          Multi-level CEFR Mock Tizimi
        </div>
      </div>

      {/* Available Tests Section */}
      <section className="space-y-4">
        <div className="flex items-center justify-between">
          <h2 className="text-xl font-bold text-slate-900 flex items-center gap-2">
            <PlayCircle className="w-5 h-5 text-emerald-600" />
            Mavjud Imtihonlar
          </h2>
          <span className="text-xs text-slate-500 font-medium">{safeTests.length} ta test faol</span>
        </div>

        {safeTests.length === 0 ? (
          <div className="p-8 text-center bg-white rounded-2xl border border-dashed border-slate-300 text-slate-500">
            Hozircha faol testlar mavjud emas. Admin panel orqali test qo‘shishingiz mumkin.
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
            {safeTests.map((test) => (
              <div
                key={test.id}
                className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm hover:shadow-md transition-all flex flex-col justify-between"
              >
                <div>
                  <div className="flex items-start justify-between gap-3 mb-2">
                    <span className="px-2.5 py-1 rounded-md text-xs font-bold uppercase tracking-wider bg-emerald-50 text-emerald-700 border border-emerald-200">
                      {test.level}
                    </span>
                    <span className="text-xs font-semibold text-slate-500 flex items-center gap-1">
                      <Clock className="w-3.5 h-3.5 text-slate-400" />
                      {test.duration_minutes} daqiqa
                    </span>
                  </div>

                  <h3 className="text-lg font-bold text-slate-900 mt-2">{test.title}</h3>
                  <p className="text-sm text-slate-600 mt-1.5 leading-relaxed line-clamp-2">
                    {test.description}
                  </p>

                  <div className="mt-4 pt-4 border-t border-slate-100 flex flex-wrap gap-2 text-xs text-slate-600">
                    <span className="bg-slate-100 px-2 py-1 rounded">🎧 Listening</span>
                    <span className="bg-slate-100 px-2 py-1 rounded">📖 Reading</span>
                    <span className="bg-slate-100 px-2 py-1 rounded">✍️ Writing</span>
                    <span className="bg-slate-100 px-2 py-1 rounded">🎙️ Speaking</span>
                  </div>
                </div>

                <div className="mt-6 pt-2">
                  <button
                    onClick={() => handleStartTest(test.id)}
                    disabled={startingTestId === test.id}
                    className="w-full py-2.5 px-4 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-sm font-semibold transition-all shadow-sm flex items-center justify-center gap-2 disabled:opacity-50"
                  >
                    {startingTestId === test.id ? 'Test tayyorlanmoqda...' : 'Testni Boshlash'}
                    <ChevronRight className="w-4 h-4" />
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </section>

      {/* History & Results Section */}
      <section className="space-y-4">
        <h2 className="text-xl font-bold text-slate-900 flex items-center gap-2">
          <FileText className="w-5 h-5 text-indigo-600" />
          Testlar Tarixi va Natijalarim
        </h2>

        {safeHistory.length === 0 ? (
          <div className="p-8 text-center bg-white rounded-2xl border border-slate-200 text-slate-500 text-sm">
            Siz hali birorta ham test topshirmagansiz. Yuqoridagi testlardan birini boshlang!
          </div>
        ) : (
          <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden shadow-sm">
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead className="bg-slate-50 text-slate-600 text-xs uppercase font-semibold border-b border-slate-200">
                  <tr>
                    <th className="py-3 px-4">Test Nomi</th>
                    <th className="py-3 px-4">Boshlangan Sana</th>
                    <th className="py-3 px-4">Holati</th>
                    <th className="py-3 px-4">To‘plangan Ball / Foiz</th>
                    <th className="py-3 px-4">CEFR Daraja</th>
                    <th className="py-3 px-4 text-right">Amal</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {safeHistory.map((s) => (
                    <tr key={s.id} className="hover:bg-slate-50/80 transition-colors">
                      <td className="py-4 px-4 font-semibold text-slate-800">
                        {s.test_title || `CEFR Mock #${s.test_id}`}
                      </td>
                      <td className="py-4 px-4 text-slate-500 text-xs">
                        {formatDate(s.started_at)}
                      </td>
                      <td className="py-4 px-4">
                        {s.status === 'in_progress' ? (
                          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-amber-100 text-amber-800">
                            Jarayonda
                          </span>
                        ) : s.status === 'submitted' ? (
                          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                            Tekshirilmoqda
                          </span>
                        ) : (
                          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-emerald-100 text-emerald-800">
                            Baholandi
                          </span>
                        )}
                      </td>
                      <td className="py-4 px-4 text-slate-700 font-medium">
                        {s.result ? (
                          <span>
                            {s.result.total_score} / {s.result.max_score} ({s.result.percentage}%)
                          </span>
                        ) : (
                          <span className="text-slate-400">—</span>
                        )}
                      </td>
                      <td className="py-4 px-4">
                        {s.result ? (
                          <span className="px-2.5 py-1 rounded-lg text-xs font-black bg-emerald-600 text-white">
                            {s.result.cefr_level}
                          </span>
                        ) : (
                          <span className="text-slate-400">—</span>
                        )}
                      </td>
                      <td className="py-4 px-4 text-right">
                        {s.status === 'in_progress' ? (
                          <Link
                            href={`/student/test/${s.id}`}
                            className="text-xs font-semibold text-emerald-700 bg-emerald-50 hover:bg-emerald-100 px-3 py-1.5 rounded-lg transition-colors"
                          >
                            Davom ettirish
                          </Link>
                        ) : (
                          <Link
                            href={`/student/results/${s.id}`}
                            className="text-xs font-semibold text-indigo-700 bg-indigo-50 hover:bg-indigo-100 px-3 py-1.5 rounded-lg transition-colors"
                          >
                            Natijani ko‘rish
                          </Link>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </section>
    </div>
  );
}
