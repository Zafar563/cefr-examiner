'use client';

import React, { useEffect, useState, useMemo, Suspense } from 'react';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import {
  apiGetTests,
  apiGetStudentHistory,
  apiStartSession,
  apiStartRandomMock,
  getCurrentStoredUser,
  Test,
  TestSession,
  sortCambridgeTests,
} from '@/lib/api';
import {
  Clock,
  Award,
  ChevronRight,
  PlayCircle,
  FileText,
  Headphones,
  BookOpen,
  Sparkles,
  Mic,
  RefreshCw,
  Zap,
  PenTool,
  Search,
  X,
  Filter,
  Layers,
  CheckCircle2,
  RotateCcw,
  Shuffle,
  Play,
} from 'lucide-react';

function StudentDashboardContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [mounted, setMounted] = useState(false);
  const [tests, setTests] = useState<Test[]>([]);
  const [history, setHistory] = useState<TestSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [startingTestId, setStartingTestId] = useState<number | null>(null);
  const [startingMock, setStartingMock] = useState(false);

  // Filters - default to 'listening' strictly (no mixed 144 tests dump)
  const [activeTab, setActiveTab] = useState<'listening' | 'reading' | 'writing' | 'speaking' | 'mock'>('listening');
  const [searchQuery, setSearchQuery] = useState<string>('');

  // Listening Section Filter: 'all' | '1' | '2' | '3' | '4' | 'full' (matches mockup with 'full' default)
  const [listeningSectionFilter, setListeningSectionFilter] = useState<'all' | '1' | '2' | '3' | '4' | 'full'>('full');
  const [selectedBook, setSelectedBook] = useState<string>('all');

  useEffect(() => {
    setMounted(true);
    const user = getCurrentStoredUser();
    if (!user) {
      router.push('/login');
      return;
    }
    loadData();
  }, [router]);

  useEffect(() => {
    if (!searchParams) return;
    const tabParam = searchParams.get('tab') || searchParams.get('filter');
    const sectionParam = searchParams.get('section');
    if (tabParam && ['listening', 'reading', 'writing', 'speaking', 'mock'].includes(tabParam)) {
      setActiveTab(tabParam as any);
    } else if (!tabParam) {
      setActiveTab('listening');
    }
    if (sectionParam) {
      if (['all', '1', '2', '3', '4', 'full'].includes(sectionParam)) {
        setListeningSectionFilter(sectionParam as any);
      } else {
        setSearchQuery(sectionParam);
      }
    } else {
      setSearchQuery('');
    }
  }, [searchParams]);

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

  const handleStartRandomMock = async (forceNew: boolean = false) => {
    try {
      setStartingMock(true);
      const session = await apiStartRandomMock(forceNew);
      router.push(`/student/test/${session.id}`);
    } catch (e: any) {
      alert('Mock imtihonni boshlashda xatolik: ' + e.message);
      setStartingMock(false);
    }
  };

  const handleStartTest = async (testId: number, forceNew: boolean = false, targetSectionIndex?: number) => {
    const targetTest = (Array.isArray(tests) ? tests : []).find((t) => t.id === testId);
    if (targetTest && targetTest.title.toLowerCase().includes('mock')) {
      await handleStartRandomMock(forceNew);
      return;
    }

    try {
      setStartingTestId(testId);
      const session = await apiStartSession(testId, forceNew);
      const secQuery = targetSectionIndex !== undefined ? `?section=${targetSectionIndex}` : '';
      router.push(`/student/test/${session.id}${secQuery}`);
    } catch (e: any) {
      alert('Testni boshlashda xatolik: ' + e.message);
      setStartingTestId(null);
    }
  };

  const formatDate = (dateStr?: string) => {
    if (!dateStr) return 'Yaqinda';
    try {
      const d = new Date(dateStr);
      return isNaN(d.getTime())
        ? 'Yaqinda'
        : d.toLocaleDateString('uz-UZ') + ' ' + d.toLocaleTimeString('uz-UZ', { hour: '2-digit', minute: '2-digit' });
    } catch {
      return 'Yaqinda';
    }
  };

  // Helper to extract Cambridge book number and test number
  const getTestMeta = (title: string) => {
    const bookMatch = title.match(/Cambridge IELTS (\d+)/i);
    const testMatch = title.match(/Test (\d+)/i);
    return {
      book: bookMatch ? `Cambridge ${bookMatch[1]}` : null,
      bookNum: bookMatch ? bookMatch[1] : null,
      testNum: testMatch ? `Test ${testMatch[1]}` : null,
    };
  };

  // Sorted and filtered tests
  const sortedTests = useMemo(() => {
    const list = Array.isArray(tests) ? [...tests] : [];
    return list.sort(sortCambridgeTests);
  }, [tests]);

  const filteredTests = useMemo(() => {
    return sortedTests.filter((t) => {
      // Search filter
      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase().trim();
        const matchesTitle = t.title.toLowerCase().includes(q);
        const matchesDesc = (t.description || '').toLowerCase().includes(q);
        const matchesSection = (t.sections || []).some((s) => (s.title || '').toLowerCase().includes(q));
        if (!matchesTitle && !matchesDesc && !matchesSection) return false;
      }
      return true;
    });
  }, [sortedTests, searchQuery]);

  const listeningTests = useMemo(
    () => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('listening')),
    [filteredTests]
  );

  const completedListeningCount = useMemo(() => {
    const listeningIds = new Set(
      sortedTests
        .filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('listening'))
        .map((t) => t.id)
    );
    const completedIds = new Set(
      (Array.isArray(history) ? history : [])
        .filter((h) => listeningIds.has(h.test_id) && (h.status === 'submitted' || h.status === 'graded'))
        .map((h) => h.test_id)
    );
    return completedIds.size;
  }, [sortedTests, history]);

  const totalListeningCount = useMemo(() => {
    return sortedTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('listening')).length;
  }, [sortedTests]);

  const availableBooks = useMemo(() => {
    const books = new Set<string>();
    sortedTests.forEach((t) => {
      if (t.title.toLowerCase().includes('listening') && !t.title.toLowerCase().includes('mock')) {
        const meta = getTestMeta(t.title);
        if (meta.bookNum) books.add(meta.bookNum);
      }
    });
    return Array.from(books).sort((a, b) => parseInt(a, 10) - parseInt(b, 10));
  }, [sortedTests]);

  const displayedListeningTests = useMemo(() => {
    return listeningTests.filter((t) => {
      if (selectedBook !== 'all') {
        const meta = getTestMeta(t.title);
        if (meta.bookNum !== selectedBook) return false;
      }
      return true;
    });
  }, [listeningTests, selectedBook]);

  const handlePickRandomListeningTest = () => {
    const pool = displayedListeningTests.length > 0 ? displayedListeningTests : listeningTests;
    if (pool.length === 0) return;

    const completedIds = new Set(
      (Array.isArray(history) ? history : [])
        .filter((h) => h.status === 'submitted' || h.status === 'graded')
        .map((h) => h.test_id)
    );
    const uncompleted = pool.filter((t) => !completedIds.has(t.id));
    const candidatePool = uncompleted.length > 0 ? uncompleted : pool;
    const randomTest = candidatePool[Math.floor(Math.random() * candidatePool.length)];

    if (listeningSectionFilter === '1') {
      handleStartTest(randomTest.id, false, 0);
    } else if (listeningSectionFilter === '2') {
      handleStartTest(randomTest.id, false, 1);
    } else if (listeningSectionFilter === '3') {
      handleStartTest(randomTest.id, false, 2);
    } else if (listeningSectionFilter === '4') {
      handleStartTest(randomTest.id, false, 3);
    } else {
      handleStartTest(randomTest.id, false);
    }
  };
  const readingTests = useMemo(
    () => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('reading')),
    [filteredTests]
  );
  const writingTests = useMemo(
    () => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('writing')),
    [filteredTests]
  );
  const speakingTests = useMemo(
    () => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('speaking')),
    [filteredTests]
  );
  const mockTests = useMemo(
    () =>
      filteredTests.filter(
        (t) =>
          t.title.toLowerCase().includes('mock') ||
          (!t.title.toLowerCase().includes('listening') &&
            !t.title.toLowerCase().includes('reading') &&
            !t.title.toLowerCase().includes('writing') &&
            !t.title.toLowerCase().includes('speaking'))
      ),
    [filteredTests]
  );

  const safeHistory = Array.isArray(history) ? history : [];

  if (!mounted || loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-12 h-12 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 dark:text-slate-400 font-semibold text-sm">Imtihonlar bazasi yuklanmoqda...</p>
      </div>
    );
  }

  const renderTestCard = (test: Test) => {
    const isMock = test.title.toLowerCase().includes('mock');
    const isListening = !isMock && test.title.toLowerCase().includes('listening');
    const isReading = !isMock && test.title.toLowerCase().includes('reading');
    const isWriting = !isMock && test.title.toLowerCase().includes('writing');
    const isSpeaking = !isMock && test.title.toLowerCase().includes('speaking');

    const meta = getTestMeta(test.title);

    let badgeClass = 'bg-rose-50 dark:bg-rose-950/60 text-rose-700 dark:text-rose-300 border-rose-200/80 dark:border-rose-800';
    let cardHover = 'hover:border-rose-400 hover:shadow-rose-500/10';
    let btnClass = 'bg-gradient-to-r from-rose-600 to-red-600 hover:from-rose-700 hover:to-red-700 text-white shadow-rose-500/20';
    let typeLabel = '🏆 CEFR Mock';
    let icon = <Sparkles className="w-4 h-4 text-rose-600" />;
    let titleHoverClass = 'group-hover:text-rose-600';

    if (isListening) {
      badgeClass = 'bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300 border-blue-200/80 dark:border-blue-800';
      cardHover = 'hover:border-blue-400 hover:shadow-blue-500/10';
      btnClass = 'bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white shadow-blue-500/20';
      typeLabel = '🎧 Listening';
      icon = <Headphones className="w-4 h-4 text-blue-600" />;
      titleHoverClass = 'group-hover:text-blue-600';
    } else if (isReading) {
      badgeClass = 'bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 border-emerald-200/80 dark:border-emerald-800';
      cardHover = 'hover:border-emerald-400 hover:shadow-emerald-500/10';
      btnClass = 'bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white shadow-emerald-500/20';
      typeLabel = '📖 Reading';
      icon = <BookOpen className="w-4 h-4 text-emerald-600" />;
      titleHoverClass = 'group-hover:text-emerald-600';
    } else if (isWriting) {
      badgeClass = 'bg-amber-50 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300 border-amber-200/80 dark:border-amber-800';
      cardHover = 'hover:border-amber-400 hover:shadow-amber-500/10';
      btnClass = 'bg-gradient-to-r from-amber-600 to-orange-600 hover:from-amber-700 hover:to-orange-700 text-white shadow-amber-500/20';
      typeLabel = '✍️ Writing';
      icon = <PenTool className="w-4 h-4 text-amber-600" />;
      titleHoverClass = 'group-hover:text-amber-600';
    } else if (isSpeaking) {
      badgeClass = 'bg-purple-50 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300 border-purple-200/80 dark:border-purple-800';
      cardHover = 'hover:border-purple-400 hover:shadow-purple-500/10';
      btnClass = 'bg-gradient-to-r from-purple-600 to-violet-600 hover:from-purple-700 hover:to-violet-700 text-white shadow-purple-500/20';
      typeLabel = '🎙️ Speaking';
      icon = <Mic className="w-4 h-4 text-purple-600" />;
      titleHoverClass = 'group-hover:text-purple-600';
    }

    const pastSessions = (Array.isArray(history) ? history : []).filter((h) => h.test_id === test.id);
    const lastSession = pastSessions[0];
    const isOngoing = lastSession?.status === 'in_progress' && lastSession.expires_at && new Date(lastSession.expires_at).getTime() > Date.now();
    const hasCompleted = pastSessions.some((h) => h.status === 'submitted' || h.status === 'graded' || (h.expires_at && new Date(h.expires_at).getTime() <= Date.now()));

    return (
      <div
        key={test.id}
        className={`bg-white dark:bg-slate-900 rounded-3xl border border-slate-200/90 dark:border-slate-800 p-6 sm:p-7 flex flex-col justify-between group transition-all duration-200 shadow-md shadow-slate-200/40 dark:shadow-none hover:shadow-xl ${cardHover}`}
      >
        <div>
          {/* Top Chips Row */}
          <div className="flex items-center justify-between gap-2 mb-3">
            <div className="flex items-center gap-1.5 flex-wrap">
              <span className={`px-3 py-1 rounded-xl text-xs font-bold border flex items-center gap-1.5 shadow-xs ${badgeClass}`}>
                {icon}
                <span>{typeLabel}</span>
              </span>

              {meta.bookNum && (
                <span className="px-3 py-1 rounded-xl text-xs font-black bg-slate-900 dark:bg-slate-800 text-white shadow-xs">
                  Book {meta.bookNum}
                </span>
              )}

              {meta.testNum && (
                <span className="px-2.5 py-1 rounded-xl text-xs font-bold bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 border border-slate-200 dark:border-slate-700">
                  {meta.testNum}
                </span>
              )}

              {hasCompleted && lastSession?.result?.cefr_level && (
                <span className="px-2.5 py-1 rounded-xl text-xs font-black bg-emerald-100 dark:bg-emerald-950/80 text-emerald-800 dark:text-emerald-300 border border-emerald-200 dark:border-emerald-800">
                  {lastSession.result.cefr_level}
                </span>
              )}
            </div>

            <span className="text-xs font-bold text-slate-500 dark:text-slate-400 flex items-center gap-1 bg-slate-50 dark:bg-slate-800/80 px-3 py-1 rounded-xl border border-slate-200/60 dark:border-slate-700 whitespace-nowrap">
              <Clock className="w-4 h-4 text-slate-400" />
              {test.duration_minutes}m
            </span>
          </div>

          {/* Test Title */}
          <h3 className={`text-lg sm:text-xl font-black text-slate-900 dark:text-white mt-2 ${titleHoverClass} transition-colors leading-snug`}>
            {test.title}
          </h3>

          {/* Individual Section / Passage Practice Options */}
          {(!isListening || !['1', '2', '3', '4'].includes(listeningSectionFilter)) && (
            <div className="mt-5 pt-4 border-t border-slate-100 dark:border-slate-800">
              <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                {isReading ? (
                  <>
                    <button
                      onClick={() => handleStartTest(test.id, false, 0)}
                      disabled={startingTestId === test.id}
                      className="py-2 px-2.5 rounded-xl bg-emerald-50 dark:bg-emerald-950/40 hover:bg-emerald-600 hover:text-white dark:hover:bg-emerald-600 dark:hover:text-white text-emerald-800 dark:text-emerald-300 text-xs sm:text-sm font-bold transition-all border border-emerald-200/60 dark:border-emerald-800 text-center cursor-pointer"
                    >
                      Passage 1
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false, 1)}
                      disabled={startingTestId === test.id}
                      className="py-2 px-2.5 rounded-xl bg-emerald-50 dark:bg-emerald-950/40 hover:bg-emerald-600 hover:text-white dark:hover:bg-emerald-600 dark:hover:text-white text-emerald-800 dark:text-emerald-300 text-xs sm:text-sm font-bold transition-all border border-emerald-200/60 dark:border-emerald-800 text-center cursor-pointer"
                    >
                      Passage 2
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false, 2)}
                      disabled={startingTestId === test.id}
                      className="py-2 px-2.5 rounded-xl bg-emerald-50 dark:bg-emerald-950/40 hover:bg-emerald-600 hover:text-white dark:hover:bg-emerald-600 dark:hover:text-white text-emerald-800 dark:text-emerald-300 text-xs sm:text-sm font-bold transition-all border border-emerald-200/60 dark:border-emerald-800 text-center cursor-pointer"
                    >
                      Passage 3
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false)}
                      disabled={startingTestId === test.id}
                      className="py-2 px-2.5 rounded-xl bg-slate-100 dark:bg-slate-800 hover:bg-slate-900 hover:text-white text-slate-700 dark:text-slate-200 text-xs sm:text-sm font-bold transition-all border border-slate-200 dark:border-slate-700 text-center cursor-pointer"
                    >
                      To‘liq (1–3)
                    </button>
                  </>
                ) : isListening ? (
                  <>
                    {[
                      { sec: 0, label: 'Section 1', qRange: '1–10', num: '1' },
                      { sec: 1, label: 'Section 2', qRange: '11–20', num: '2' },
                      { sec: 2, label: 'Section 3', qRange: '21–30', num: '3' },
                      { sec: 3, label: 'Section 4', qRange: '31–40', num: '4' },
                    ].map((s) => (
                      <button
                        key={s.sec}
                        onClick={() => handleStartTest(test.id, hasCompleted, s.sec)}
                        disabled={startingTestId === test.id}
                        className="py-2 px-2 rounded-xl text-xs font-bold transition-all border text-center cursor-pointer flex flex-col items-center justify-center gap-0.5 bg-blue-50 dark:bg-blue-950/40 hover:bg-blue-600 hover:text-white text-blue-800 dark:text-blue-300 border-blue-200/60 dark:border-blue-800"
                      >
                        <span>{s.label}</span>
                        <span className="text-[10px] text-blue-600 dark:text-blue-400 opacity-75">
                          Q {s.qRange}
                        </span>
                      </button>
                    ))}
                  </>
                ) : isSpeaking ? (
                  <>
                    <button
                      onClick={() => handleStartTest(test.id, false, 0)}
                      disabled={startingTestId === test.id}
                      className="py-1.5 px-2 rounded-xl bg-purple-50 dark:bg-purple-950/40 hover:bg-purple-600 hover:text-white text-purple-800 dark:text-purple-300 text-xs font-bold transition-all border border-purple-200/60 dark:border-purple-800 text-center cursor-pointer"
                    >
                      Part 1
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false, 1)}
                      disabled={startingTestId === test.id}
                      className="py-1.5 px-2 rounded-xl bg-purple-50 dark:bg-purple-950/40 hover:bg-purple-600 hover:text-white text-purple-800 dark:text-purple-300 text-xs font-bold transition-all border border-purple-200/60 dark:border-purple-800 text-center cursor-pointer"
                    >
                      Part 2
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false, 2)}
                      disabled={startingTestId === test.id}
                      className="py-1.5 px-2 rounded-xl bg-purple-50 dark:bg-purple-950/40 hover:bg-purple-600 hover:text-white text-purple-800 dark:text-purple-300 text-xs font-bold transition-all border border-purple-200/60 dark:border-purple-800 text-center cursor-pointer"
                    >
                      Part 3
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false)}
                      disabled={startingTestId === test.id}
                      className="py-1.5 px-2 rounded-xl bg-slate-100 dark:bg-slate-800 hover:bg-slate-900 hover:text-white text-slate-700 dark:text-slate-200 text-xs font-bold transition-all border border-slate-200 dark:border-slate-700 text-center cursor-pointer"
                    >
                      To‘liq
                    </button>
                  </>
                ) : isWriting ? (
                  <>
                    <button
                      onClick={() => handleStartTest(test.id, false, 0)}
                      disabled={startingTestId === test.id}
                      className="py-1.5 px-2 rounded-xl bg-orange-50 dark:bg-orange-950/40 hover:bg-orange-600 hover:text-white text-orange-800 dark:text-orange-300 text-xs font-bold transition-all border border-orange-200/60 dark:border-orange-800 text-center cursor-pointer"
                    >
                      Task 1
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false, 1)}
                      disabled={startingTestId === test.id}
                      className="py-1.5 px-2 rounded-xl bg-orange-50 dark:bg-orange-950/40 hover:bg-orange-600 hover:text-white text-orange-800 dark:text-orange-300 text-xs font-bold transition-all border border-orange-200/60 dark:border-orange-800 text-center cursor-pointer"
                    >
                      Task 2
                    </button>
                    <button
                      onClick={() => handleStartTest(test.id, false)}
                      disabled={startingTestId === test.id}
                      className="col-span-2 py-1.5 px-2 rounded-xl bg-slate-100 dark:bg-slate-800 hover:bg-slate-900 hover:text-white text-slate-700 dark:text-slate-200 text-xs font-bold transition-all border border-slate-200 dark:border-slate-700 text-center cursor-pointer"
                    >
                      To‘liq (Task 1 + 2)
                    </button>
                  </>
                ) : null}
              </div>
            </div>
          )}
        </div>
        </div>

        {/* Start / Continue / Retake Full Test Button */}
        <div className="mt-5 pt-3 border-t border-slate-100 dark:border-slate-800">
          {isOngoing ? (
            <div className="flex items-center gap-2">
              <button
                onClick={() => handleStartTest(test.id, false)}
                disabled={startingTestId === test.id}
                className={`flex-1 py-3 px-4 rounded-xl text-sm font-bold transition-all shadow-md flex items-center justify-center gap-2 group/btn disabled:opacity-50 cursor-pointer ${btnClass}`}
              >
                {startingTestId === test.id ? (
                  <>
                    <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                    <span>Ochilmoqda...</span>
                  </>
                ) : (
                  <>
                    <span>Davom ettirish</span>
                    <ChevronRight className="w-4 h-4 transition-transform group-hover/btn:translate-x-1" />
                  </>
                )}
              </button>
              <button
                onClick={() => handleStartTest(test.id, true)}
                disabled={startingTestId === test.id}
                title="Yangi urinish boshlash"
                className="py-3 px-3 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 hover:bg-slate-100 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-300 text-xs font-bold transition-all flex items-center gap-1 shrink-0 cursor-pointer"
              >
                <RotateCcw className="w-3.5 h-3.5 text-slate-500" />
                <span className="hidden sm:inline">Qayta</span>
              </button>
            </div>
          ) : isListening && ['1', '2', '3', '4'].includes(listeningSectionFilter) ? (
            <button
              onClick={() =>
                handleStartTest(test.id, hasCompleted, parseInt(listeningSectionFilter, 10) - 1)
              }
              disabled={startingTestId === test.id}
              className="w-full py-3 px-4 rounded-xl text-sm font-extrabold transition-all shadow-md flex items-center justify-center gap-2 group/btn disabled:opacity-50 cursor-pointer bg-gradient-to-r from-cyan-600 via-blue-600 to-indigo-600 hover:from-cyan-700 hover:to-indigo-700 text-white shadow-blue-500/25"
            >
              {startingTestId === test.id ? (
                <>
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                  <span>Tayyorlanmoqda...</span>
                </>
              ) : (
                <>
                  <Play className="w-4 h-4 fill-current" />
                  <span>Section {listeningSectionFilter}</span>
                  <ChevronRight className="w-4 h-4 transition-transform group-hover/btn:translate-x-1" />
                </>
              )}
            </button>
          ) : (
            <button
              onClick={() => handleStartTest(test.id, hasCompleted)}
              disabled={startingTestId === test.id}
              className={`w-full py-3 px-4 rounded-xl text-sm font-bold transition-all shadow-md flex items-center justify-center gap-2 group/btn disabled:opacity-50 cursor-pointer ${btnClass}`}
            >
              {startingTestId === test.id ? (
                <>
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                  <span>Tayyorlanmoqda...</span>
                </>
              ) : hasCompleted ? (
                <>
                  <RotateCcw className="w-4 h-4" />
                  <span>To‘liq Qayta Topshirish</span>
                </>
              ) : (
                <>
                  <span>To‘liq Testni Boshlash</span>
                  <ChevronRight className="w-4 h-4 transition-transform group-hover/btn:translate-x-1" />
                </>
              )}
            </button>
          )}
        </div>
      </div>
    );
  };

  return (
    <div className="space-y-8 py-6 max-w-7xl mx-auto px-2 sm:px-4">
      {/* 1. Header Section: If Listening, render the Real Exam Materials Hero Banner matching mockup */}
      {activeTab === 'listening' ? (
        <section className="space-y-5">
          {/* Main Hero Banner Container */}
          <div className="relative overflow-hidden rounded-3xl bg-gradient-to-r from-[#0a4e5e] via-[#0d5f73] to-[#185880] p-6 sm:p-8 lg:p-9 text-white shadow-xl border border-cyan-800/40">
            {/* Faint Background Headphones Silhouette Watermark on the Right */}
            <div className="hidden lg:block absolute right-4 xl:right-10 top-1/2 -translate-y-1/2 pointer-events-none text-cyan-200/15">
              <Headphones className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />
            </div>

            <div className="relative z-10 space-y-5 max-w-4xl">
              {/* Row 1: Badge + Title */}
              <div className="flex flex-wrap items-center gap-3">
                <span className="inline-flex items-center px-3 py-0.5 rounded-full border border-white/40 text-[11px] font-black uppercase tracking-wider bg-white/10 text-white shadow-xs">
                  AUDIO
                </span>
                <h1 className="text-2xl sm:text-3xl lg:text-4xl font-black text-white tracking-tight flex items-center gap-2 flex-wrap">
                  <span>Listening</span>
                  <span className="underline decoration-2 decoration-white/90 underline-offset-6">
                    Real Exam Materials
                  </span>
                </h1>
              </div>

              {/* Row 2: Subtitle */}
              <p className="text-xs sm:text-sm md:text-[15px] text-white/90 font-medium leading-relaxed">
                Practise with real-exam listening audio. Each full test is 40 questions across 4 sections.
              </p>

              {/* Row 3: 3 Numbered Steps / Guide Pills */}
              <div className="flex flex-wrap items-center gap-2 sm:gap-2.5 pt-0.5">
                <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                  <span className="w-4.5 h-4.5 rounded-full bg-white text-[#0a4e5e] font-black text-[11px] flex items-center justify-center shrink-0">
                    1
                  </span>
                  <span>Pick a section or a Full Listening</span>
                </div>

                <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                  <span className="w-4.5 h-4.5 rounded-full bg-white text-[#0a4e5e] font-black text-[11px] flex items-center justify-center shrink-0">
                    2
                  </span>
                  <span>Take the test – 30 min audio + 2 min to review answers</span>
                </div>

                <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                  <span className="w-4.5 h-4.5 rounded-full bg-white text-[#0a4e5e] font-black text-[11px] flex items-center justify-center shrink-0">
                    3
                  </span>
                  <span>See your band and review your answers</span>
                </div>
              </div>

              {/* Row 4: Progress Bar & Pick One Button */}
              <div className="space-y-2 pt-1">
                {/* Thin Progress Bar */}
                <div className="w-56 sm:w-64 h-1.5 bg-white/25 rounded-full overflow-hidden">
                  <div
                    className="h-full bg-white rounded-full transition-all duration-500"
                    style={{
                      width: `${Math.min(
                        100,
                        Math.round((completedListeningCount / Math.max(1, totalListeningCount)) * 100)
                      )}%`,
                    }}
                  />
                </div>

                <div className="flex items-center gap-4 flex-wrap pt-0.5">
                  <span className="text-xs sm:text-sm font-bold text-white/90">
                    {completedListeningCount} / {totalListeningCount} tests completed
                  </span>

                  <button
                    onClick={handlePickRandomListeningTest}
                    className="bg-white hover:bg-slate-100 text-[#0a4e5e] font-extrabold text-xs px-4 py-2 rounded-full shadow-md flex items-center gap-1.5 transition-transform active:scale-95 cursor-pointer"
                  >
                    <Shuffle className="w-3.5 h-3.5 text-[#0a4e5e]" />
                    <span>Pick one for me</span>
                  </button>
                </div>
              </div>

              {/* Row 5: FILTER BY SECTION */}
              <div className="space-y-2 pt-2">
                <div className="text-[11px] font-black uppercase tracking-wider text-cyan-100/80">
                  FILTER BY SECTION
                </div>
                <div className="flex flex-wrap items-center gap-2">
                  {[
                    { id: 'all', label: 'All' },
                    { id: '1', label: 'Section 1' },
                    { id: '2', label: 'Section 2' },
                    { id: '3', label: 'Section 3' },
                    { id: '4', label: 'Section 4' },
                    { id: 'full', label: 'Full Listening' },
                  ].map((tab) => {
                    const isActive = listeningSectionFilter === tab.id;
                    return (
                      <button
                        key={tab.id}
                        onClick={() => setListeningSectionFilter(tab.id as any)}
                        className={`px-4 py-1.5 rounded-full text-xs font-black transition-all cursor-pointer ${
                          isActive
                            ? 'bg-white text-[#0a4e5e] shadow-md ring-2 ring-white/60'
                            : 'bg-white/10 hover:bg-white/20 text-white border border-white/25'
                        }`}
                      >
                        {tab.label}
                      </button>
                    );
                  })}
                </div>
              </div>
            </div>
          </div>


          {/* Quick Cambridge Book & Search Bar */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pt-1">
            <div className="flex items-center gap-1.5 overflow-x-auto pb-1 sm:pb-0 scrollbar-none">
              <span className="text-xs font-bold text-slate-500 dark:text-slate-400 shrink-0 mr-1 hidden sm:inline">
                Kitob:
              </span>
              <button
                onClick={() => setSelectedBook('all')}
                className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all shrink-0 cursor-pointer ${
                  selectedBook === 'all'
                    ? 'bg-slate-900 dark:bg-slate-700 text-white shadow-xs'
                    : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-750'
                }`}
              >
                Barchasi ({listeningTests.length})
              </button>
              {availableBooks.map((b) => (
                <button
                  key={b}
                  onClick={() => setSelectedBook(b)}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all shrink-0 cursor-pointer ${
                    selectedBook === b
                      ? 'bg-blue-600 text-white shadow-xs ring-1 ring-blue-500'
                      : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-750'
                  }`}
                >
                  Book {b}
                </button>
              ))}
            </div>

            {/* Search Input */}
            <div className="relative w-full sm:w-72">
              <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Test yoki mavzu qidirish..."
                className="w-full pl-9 pr-8 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 text-xs sm:text-sm font-semibold focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-500/20 shadow-xs"
              />
              {searchQuery && (
                <button
                  onClick={() => setSearchQuery('')}
                  className="absolute right-2.5 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
                >
                  <X className="w-3.5 h-3.5" />
                </button>
              )}
            </div>
          </div>
        </section>
      ) : (
        /* Regular Subheader for Reading, Speaking, Writing, Mock */
        <section className="space-y-4">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div>
              <h1 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white flex items-center gap-2.5">
                {activeTab === 'reading' ? (
                  <>
                    <BookOpen className="w-7 h-7 text-emerald-600" />
                    <span>Reading Testlari</span>
                  </>
                ) : activeTab === 'speaking' ? (
                  <>
                    <Mic className="w-7 h-7 text-purple-600" />
                    <span>Speaking Testlari</span>
                  </>
                ) : activeTab === 'writing' ? (
                  <>
                    <PenTool className="w-7 h-7 text-amber-600" />
                    <span>Writing Testlari</span>
                  </>
                ) : (
                  <>
                    <Sparkles className="w-7 h-7 text-rose-600" />
                    <span>To‘liq Mock Imtihonlar</span>
                  </>
                )}
              </h1>
            </div>

            {/* Search Box */}
            <div className="relative w-full md:w-80">
              <Search className="w-4.5 h-4.5 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2 pointer-events-none" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Qidiruv (Test 1)..."
                className="w-full pl-11 pr-9 py-2.5 rounded-2xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 text-sm font-semibold focus:outline-none focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/20 shadow-xs"
              />
              {searchQuery && (
                <button
                  onClick={() => setSearchQuery('')}
                  className="absolute right-3.5 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
                >
                  <X className="w-4 h-4" />
                </button>
              )}
            </div>
          </div>
        </section>
      )}

      {/* 3. Filtered Tests Grid (Renders ONLY the active tab category) */}
      <section className="space-y-6">
        {activeTab === 'listening' ? (
          displayedListeningTests.length === 0 ? (
            <div className="p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
              <p className="font-bold text-slate-700 dark:text-slate-300">Listening testlari topilmadi</p>
              <p className="text-xs text-slate-400 mt-1">Filtr parametrlarini o‘zgartirib ko‘ring.</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {displayedListeningTests.map((t) => renderTestCard(t))}
            </div>
          )
        ) : activeTab === 'reading' ? (
          readingTests.length === 0 ? (
            <div className="p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 text-slate-500">
              <p className="font-bold text-slate-700 dark:text-slate-300">Reading testlari topilmadi</p>
              <p className="text-xs text-slate-400 mt-1">Filtr parametrlarini o‘zgartirib ko‘ring.</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {readingTests.map((t) => renderTestCard(t))}
            </div>
          )
        ) : activeTab === 'speaking' ? (
          speakingTests.length === 0 ? (
            <div className="p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 text-slate-500">
              <p className="font-bold text-slate-700 dark:text-slate-300">Speaking testlari topilmadi</p>
              <p className="text-xs text-slate-400 mt-1">Filtr parametrlarini o‘zgartirib ko‘ring.</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {speakingTests.map((t) => renderTestCard(t))}
            </div>
          )
        ) : activeTab === 'writing' ? (
          writingTests.length === 0 ? (
            <div className="p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 text-slate-500">
              <p className="font-bold text-slate-700 dark:text-slate-300">Writing testlari topilmadi</p>
              <p className="text-xs text-slate-400 mt-1">Filtr parametrlarini o‘zgartirib ko‘ring.</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {writingTests.map((t) => renderTestCard(t))}
            </div>
          )
        ) : (
          /* activeTab === 'mock' */
          <div className="space-y-6">
            <div className="bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white rounded-3xl p-6 sm:p-8 shadow-xl relative overflow-hidden border border-slate-700">
              <div className="max-w-2xl space-y-3 relative z-10">
                <div className="flex items-center gap-2">
                  <span className="px-3 py-1 rounded-full text-xs font-black bg-amber-400 text-slate-950 uppercase tracking-wider">
                    Full Mock
                  </span>
                  <span className="text-xs text-slate-300">180 daqiqa • 4 ta modul</span>
                </div>

                <h2 className="text-2xl sm:text-3xl font-black tracking-tight">
                  Tasodifiy To‘liq Mock Imtihon
                </h2>
                <p className="text-slate-300 text-xs sm:text-sm leading-relaxed">
                  Barcha modullar bo‘yicha tasodifiy Listening (40 savol), Reading (40 savol), Writing (Task 1 & 2) va Speaking (3 qism) bitta to‘liq imtihonga jamlanadi.
                </p>

                <div className="pt-3 flex flex-wrap items-center gap-3">
                  <button
                    onClick={() => handleStartRandomMock(false)}
                    disabled={startingMock}
                    className="px-6 py-3 bg-gradient-to-r from-rose-500 to-amber-500 hover:from-rose-600 hover:to-amber-600 text-white font-bold rounded-xl text-xs sm:text-sm shadow-lg transition-all flex items-center gap-2 disabled:opacity-50 cursor-pointer"
                  >
                    {startingMock ? (
                      <>
                        <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                        <span>Mock Tayyorlanmoqda...</span>
                      </>
                    ) : (
                      <>
                        <Zap className="w-4 h-4 fill-white" />
                        <span>Tasodifiy Mock Boshlash</span>
                        <ChevronRight className="w-4 h-4" />
                      </>
                    )}
                  </button>

                  <button
                    onClick={() => handleStartRandomMock(true)}
                    disabled={startingMock}
                    className="px-4 py-3 bg-white/10 hover:bg-white/20 text-white font-semibold rounded-xl text-xs sm:text-sm transition-all border border-white/20 flex items-center gap-1.5 disabled:opacity-50 cursor-pointer"
                  >
                    <RefreshCw className="w-4 h-4" />
                    <span>Yangi Variant</span>
                  </button>
                </div>
              </div>
            </div>

            {mockTests.length > 0 && (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-5 pt-2">
                {mockTests.map((t) => renderTestCard(t))}
              </div>
            )}
          </div>
        )}
      </section>

      {/* 4. History & Results Section */}
      <section className="space-y-4 pt-6 border-t border-slate-200/80 dark:border-slate-800">
        <h2 className="text-lg sm:text-xl font-bold text-slate-900 dark:text-white flex items-center gap-2">
          <FileText className="w-5 h-5 text-indigo-600" />
          Testlar Tarixi va Natijalarim
        </h2>

        {safeHistory.length === 0 ? (
          <div className="p-8 text-center bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 text-slate-500 dark:text-slate-400 text-sm shadow-xs">
            Siz hali birorta ham test topshirmagansiz. Yuqoridagi testlardan birini boshlang!
          </div>
        ) : (
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 overflow-hidden shadow-xs">
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead className="bg-slate-100/80 dark:bg-slate-800/80 text-slate-700 dark:text-slate-300 text-xs uppercase font-bold border-b border-slate-200 dark:border-slate-800">
                  <tr>
                    <th className="py-3.5 px-4">Test Nomi</th>
                    <th className="py-3.5 px-4">Boshlangan Sana</th>
                    <th className="py-3.5 px-4">Holati</th>
                    <th className="py-3.5 px-4">To‘plangan Ball / Foiz</th>
                    <th className="py-3.5 px-4">CEFR Daraja</th>
                    <th className="py-3.5 px-4 text-right">Amal</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 dark:divide-slate-800">
                  {safeHistory.map((s) => {
                    const isExpired =
                      s.status === 'in_progress' && s.expires_at
                        ? new Date(s.expires_at).getTime() < Date.now()
                        : false;

                    return (
                      <tr key={s.id} className="hover:bg-slate-50/80 dark:hover:bg-slate-800/50 transition-colors">
                        <td className="py-4 px-4 font-bold text-slate-800 dark:text-slate-200">
                          {s.test_title || `CEFR Mock #${s.test_id}`}
                        </td>
                        <td className="py-4 px-4 text-slate-500 dark:text-slate-400 text-xs">
                          {formatDate(s.started_at)}
                        </td>
                        <td className="py-4 px-4">
                          {s.status === 'in_progress' ? (
                            isExpired ? (
                              <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-rose-100 dark:bg-rose-950/60 text-rose-800 dark:text-rose-300">
                                Vaqti tugagan
                              </span>
                            ) : (
                              <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-amber-100 dark:bg-amber-950/60 text-amber-800 dark:text-amber-300">
                                Jarayonda
                              </span>
                            )
                          ) : s.status === 'submitted' ? (
                            <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-blue-100 dark:bg-blue-950/60 text-blue-800 dark:text-blue-300">
                              Tekshirilmoqda
                            </span>
                          ) : (
                            <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-emerald-100 dark:bg-emerald-950/60 text-emerald-800 dark:text-emerald-300">
                              Baholandi
                            </span>
                          )}
                        </td>
                        <td className="py-4 px-4 text-slate-700 dark:text-slate-300 font-semibold">
                          {s.result ? (
                            <span>
                              {s.result.total_score} / {s.result.max_score} ({s.result.percentage}%)
                            </span>
                          ) : (
                            <span className="text-slate-400 dark:text-slate-600">—</span>
                          )}
                        </td>
                        <td className="py-4 px-4">
                          {s.result ? (
                            <span
                              className={`px-2.5 py-1 rounded-lg text-xs font-black text-white shadow-xs ${
                                s.result.cefr_level.includes('C1') || s.result.cefr_level.includes('C2')
                                  ? 'bg-purple-600'
                                  : s.result.cefr_level.includes('B2')
                                  ? 'bg-emerald-600'
                                  : s.result.cefr_level.includes('B1')
                                  ? 'bg-blue-600'
                                  : 'bg-amber-600'
                              }`}
                            >
                              {s.result.cefr_level}
                            </span>
                          ) : (
                            <span className="text-slate-400 dark:text-slate-600">—</span>
                          )}
                        </td>
                        <td className="py-4 px-4 text-right">
                          <div className="flex items-center justify-end gap-2">
                            {s.status === 'in_progress' && !isExpired ? (
                              <Link
                                href={`/student/test/${s.id}`}
                                className="text-xs font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-950/60 hover:bg-emerald-100 dark:hover:bg-emerald-900/60 px-3 py-1.5 rounded-xl transition-all"
                              >
                                Davom ettirish
                              </Link>
                            ) : (
                              <Link
                                href={`/student/results/${s.id}`}
                                className="text-xs font-bold text-indigo-700 dark:text-indigo-300 bg-indigo-50 dark:bg-indigo-950/60 hover:bg-indigo-100 dark:hover:bg-indigo-900/60 px-3 py-1.5 rounded-xl transition-all"
                              >
                                Natijani ko‘rish
                              </Link>
                            )}
                            <button
                              onClick={() => handleStartTest(s.test_id, true)}
                              disabled={startingTestId === s.test_id}
                              className="text-xs font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-950/60 hover:bg-emerald-100 dark:hover:bg-emerald-900/60 px-2.5 py-1.5 rounded-xl transition-all flex items-center gap-1 shrink-0 cursor-pointer"
                              title="Ushbu testni qaytadan boshlash"
                            >
                              <RotateCcw className="w-3.5 h-3.5" />
                              <span className="hidden sm:inline">Qayta</span>
                            </button>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </section>
    </div>
  );
}

export default function StudentDashboard() {
  return (
    <Suspense
      fallback={
        <div className="py-24 text-center">
          <div className="w-12 h-12 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-slate-600 dark:text-slate-400 font-semibold text-sm">Yuklanmoqda...</p>
        </div>
      }
    >
      <StudentDashboardContent />
    </Suspense>
  );
}
