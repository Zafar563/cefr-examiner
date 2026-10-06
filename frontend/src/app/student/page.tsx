'use client';

import React, { useEffect, useState, useMemo } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
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
} from 'lucide-react';

export default function StudentDashboard() {
  const router = useRouter();
  const [mounted, setMounted] = useState(false);
  const [tests, setTests] = useState<Test[]>([]);
  const [history, setHistory] = useState<TestSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [startingTestId, setStartingTestId] = useState<number | null>(null);
  const [startingMock, setStartingMock] = useState(false);

  // Filters
  const [activeTab, setActiveTab] = useState<'all' | 'listening' | 'reading' | 'writing' | 'speaking' | 'mock'>('all');
  const [selectedBook, setSelectedBook] = useState<string>('all');
  const [searchQuery, setSearchQuery] = useState<string>('');

  useEffect(() => {
    setMounted(true);
    const user = getCurrentStoredUser();
    if (!user) {
      router.push('/login');
      return;
    }
    if (typeof window !== 'undefined') {
      const params = new URLSearchParams(window.location.search);
      const tabParam = params.get('tab') || params.get('filter');
      const bookParam = params.get('book');
      if (tabParam && ['all', 'listening', 'reading', 'writing', 'speaking', 'mock'].includes(tabParam)) {
        setActiveTab(tabParam as any);
      }
      if (bookParam) {
        setSelectedBook(bookParam);
      }
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

  const handleStartTest = async (testId: number, forceNew: boolean = false) => {
    const targetTest = (Array.isArray(tests) ? tests : []).find((t) => t.id === testId);
    if (targetTest && targetTest.title.toLowerCase().includes('mock')) {
      await handleStartRandomMock(forceNew);
      return;
    }

    try {
      setStartingTestId(testId);
      const session = await apiStartSession(testId, forceNew);
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
      // Book filter
      if (selectedBook !== 'all') {
        const meta = getTestMeta(t.title);
        if (meta.bookNum !== selectedBook) return false;
      }
      // Search filter
      if (searchQuery.trim()) {
        const q = searchQuery.toLowerCase().trim();
        const matchesTitle = t.title.toLowerCase().includes(q);
        const matchesDesc = (t.description || '').toLowerCase().includes(q);
        if (!matchesTitle && !matchesDesc) return false;
      }
      return true;
    });
  }, [sortedTests, selectedBook, searchQuery]);

  const listeningTests = useMemo(() => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('listening')), [filteredTests]);
  const readingTests = useMemo(() => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('reading')), [filteredTests]);
  const writingTests = useMemo(() => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('writing')), [filteredTests]);
  const speakingTests = useMemo(() => filteredTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('speaking')), [filteredTests]);
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
        <div className="w-12 h-12 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-semibold text-sm">Imtihonlar bazasi yuklanmoqda...</p>
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

    let badgeClass = 'bg-amber-50 text-amber-700 border-amber-200/80';
    let cardHover = 'hover:border-amber-300 hover:shadow-amber-500/10';
    let btnClass = 'bg-gradient-to-r from-amber-600 to-yellow-600 hover:from-amber-700 hover:to-yellow-700 text-white shadow-amber-500/20';
    let typeLabel = '🏆 CEFR Mock';
    let icon = <Sparkles className="w-4 h-4 text-amber-600" />;

    if (isListening) {
      badgeClass = 'bg-blue-50 text-blue-700 border-blue-200/80';
      cardHover = 'hover:border-blue-400 hover:shadow-blue-500/10';
      btnClass = 'bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white shadow-blue-500/20';
      typeLabel = '🎧 Listening';
      icon = <Headphones className="w-4 h-4 text-blue-600" />;
    } else if (isReading) {
      badgeClass = 'bg-emerald-50 text-emerald-700 border-emerald-200/80';
      cardHover = 'hover:border-emerald-400 hover:shadow-emerald-500/10';
      btnClass = 'bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white shadow-emerald-500/20';
      typeLabel = '📖 Reading';
      icon = <BookOpen className="w-4 h-4 text-emerald-600" />;
    } else if (isWriting) {
      badgeClass = 'bg-orange-50 text-orange-700 border-orange-200/80';
      cardHover = 'hover:border-orange-400 hover:shadow-orange-500/10';
      btnClass = 'bg-gradient-to-r from-orange-600 to-amber-600 hover:from-orange-700 hover:to-amber-700 text-white shadow-orange-500/20';
      typeLabel = '✍️ Writing';
      icon = <PenTool className="w-4 h-4 text-orange-600" />;
    } else if (isSpeaking) {
      badgeClass = 'bg-purple-50 text-purple-700 border-purple-200/80';
      cardHover = 'hover:border-purple-400 hover:shadow-purple-500/10';
      btnClass = 'bg-gradient-to-r from-purple-600 to-violet-600 hover:from-purple-700 hover:to-violet-700 text-white shadow-purple-500/20';
      typeLabel = '🎙️ Speaking';
      icon = <Mic className="w-4 h-4 text-purple-600" />;
    }

    const pastSessions = (Array.isArray(history) ? history : []).filter((h) => h.test_id === test.id);
    const lastSession = pastSessions[0];
    const isOngoing = lastSession?.status === 'in_progress' && lastSession.expires_at && new Date(lastSession.expires_at).getTime() > Date.now();
    const hasCompleted = pastSessions.some((h) => h.status === 'submitted' || h.status === 'graded' || (h.expires_at && new Date(h.expires_at).getTime() <= Date.now()));

    return (
      <div
        key={test.id}
        className={`card-modern p-6 flex flex-col justify-between group transition-all duration-200 ${cardHover}`}
      >
        <div>
          {/* Top Chips Row */}
          <div className="flex items-center justify-between gap-2 mb-3">
            <div className="flex items-center gap-1.5 flex-wrap">
              <span className={`px-2.5 py-1 rounded-lg text-xs font-bold border flex items-center gap-1.5 shadow-xs ${badgeClass}`}>
                {icon}
                <span>{typeLabel}</span>
              </span>

              {meta.book && (
                <span className="px-2.5 py-1 rounded-lg text-xs font-black bg-slate-900 dark:bg-slate-800 text-white shadow-xs">
                  {meta.book}
                </span>
              )}

              {meta.testNum && (
                <span className="px-2 py-1 rounded-lg text-xs font-bold bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 border border-slate-200 dark:border-slate-700">
                  {meta.testNum}
                </span>
              )}

              {hasCompleted && lastSession?.result?.cefr_level && (
                <span className="px-2 py-1 rounded-lg text-xs font-black bg-emerald-100 dark:bg-emerald-950/80 text-emerald-800 dark:text-emerald-300 border border-emerald-200 dark:border-emerald-800">
                  {lastSession.result.cefr_level}
                </span>
              )}
            </div>

            <span className="text-xs font-bold text-slate-500 dark:text-slate-400 flex items-center gap-1 bg-slate-50 dark:bg-slate-800/80 px-2.5 py-1 rounded-lg border border-slate-200/60 dark:border-slate-700 whitespace-nowrap">
              <Clock className="w-3.5 h-3.5 text-slate-400" />
              {test.duration_minutes}m
            </span>
          </div>

          {/* Test Title */}
          <h3 className="text-base sm:text-lg font-bold text-slate-900 dark:text-white mt-2 group-hover:text-emerald-700 dark:group-hover:text-emerald-400 transition-colors">
            {test.title}
          </h3>

          {/* Description */}
          <p className="text-xs sm:text-sm text-slate-600 dark:text-slate-400 mt-2 leading-relaxed line-clamp-2">
            {test.description}
          </p>

          {/* Features Pills */}
          <div className="mt-4 pt-4 border-t border-slate-100 dark:border-slate-800 flex flex-wrap gap-2 text-xs font-medium">
            {isListening ? (
              <>
                <span className="bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300 border border-blue-200/60 dark:border-blue-800 px-2.5 py-1 rounded-lg">
                  🎧 4 ta Bo‘lim (40 ta savol)
                </span>
                <span className="bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 px-2.5 py-1 rounded-lg font-semibold">
                  🔊 2 marta eshitish
                </span>
              </>
            ) : isReading ? (
              <>
                <span className="bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 border border-emerald-200/60 dark:border-emerald-800 px-2.5 py-1 rounded-lg">
                  📖 3 ta Matn (40 ta savol)
                </span>
                <span className="bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 px-2.5 py-1 rounded-lg font-semibold">
                  Avtomatik baholash
                </span>
              </>
            ) : isWriting ? (
              <>
                <span className="bg-orange-50 dark:bg-orange-950/60 text-orange-700 dark:text-orange-300 border border-orange-200/60 dark:border-orange-800 px-2.5 py-1 rounded-lg">
                  ✍️ Task 1 + Task 2
                </span>
                <span className="bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 px-2.5 py-1 rounded-lg font-semibold">
                  📝 Examiner baholashi
                </span>
              </>
            ) : isSpeaking ? (
              <>
                <span className="bg-purple-50 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300 border border-purple-200/60 dark:border-purple-800 px-2.5 py-1 rounded-lg">
                  🎙️ 3 ta Qism (Part 1, 2, 3)
                </span>
                <span className="bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 px-2.5 py-1 rounded-lg font-semibold">
                  🔴 Ovoz yozish & Ballash
                </span>
              </>
            ) : (
              <>
                <span className="bg-slate-100 dark:bg-slate-800 px-2.5 py-1 rounded-lg font-bold text-slate-700 dark:text-slate-300">Multi-skill</span>
                <span className="bg-slate-100 dark:bg-slate-800 px-2.5 py-1 rounded-lg font-semibold text-slate-600 dark:text-slate-400">CEFR Standart</span>
              </>
            )}
          </div>
        </div>

        {/* Start / Continue / Retake Button */}
        <div className="mt-6 pt-2">
          {isOngoing ? (
            <div className="flex items-center gap-2">
              <button
                onClick={() => handleStartTest(test.id, false)}
                disabled={startingTestId === test.id}
                className={`flex-1 py-3 px-4 rounded-xl text-sm font-bold transition-all shadow-md flex items-center justify-center gap-2 group/btn disabled:opacity-50 ${btnClass}`}
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
                className="py-3 px-3 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 hover:bg-slate-100 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-300 text-xs font-bold transition-all flex items-center gap-1 shrink-0"
              >
                <RotateCcw className="w-3.5 h-3.5 text-slate-500" />
                <span className="hidden sm:inline">Qayta</span>
              </button>
            </div>
          ) : (
            <button
              onClick={() => handleStartTest(test.id, hasCompleted)}
              disabled={startingTestId === test.id}
              className={`w-full py-3 px-4 rounded-xl text-sm font-bold transition-all shadow-md flex items-center justify-center gap-2 group/btn disabled:opacity-50 ${btnClass}`}
            >
              {startingTestId === test.id ? (
                <>
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                  <span>Tayyorlanmoqda...</span>
                </>
              ) : hasCompleted ? (
                <>
                  <RotateCcw className="w-4 h-4" />
                  <span>Qayta Topshirish</span>
                </>
              ) : (
                <>
                  <span>Testni Boshlash</span>
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
    <div className="space-y-10 py-6">
      {/* Modern Hero Greeting Banner */}
      <div className="relative bg-gradient-to-r from-emerald-800 via-teal-800 to-slate-900 text-white rounded-3xl p-6 sm:p-8 shadow-xl overflow-hidden">
        <div className="absolute right-0 top-0 w-80 h-80 bg-emerald-500/15 rounded-full blur-3xl pointer-events-none" />

        <div className="relative z-10 flex flex-col md:flex-row md:items-center justify-between gap-6">
          <div className="space-y-2 max-w-2xl">
            <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/10 text-emerald-300 border border-white/15 text-xs font-bold backdrop-blur-md">
              <Award className="w-3.5 h-3.5" />
              CEFR & Cambridge IELTS Official Test Center
            </div>
            <h1 className="text-2xl sm:text-4xl font-extrabold tracking-tight">
              O‘quvchi Kabineti
            </h1>
            <p className="text-emerald-100/90 text-sm leading-relaxed">
              Cambridge 13 dan 21 gacha bo‘lgan to‘liq rasmiy testlarni ketma-ket topshiring yoki barcha ko‘nikmalarni birlashtirgan to‘liq mock imtihonini sinab ko‘ring.
            </p>
          </div>

          <div className="flex flex-row md:flex-col items-center md:items-end gap-2 shrink-0">
            <button
              onClick={() => handleStartRandomMock(false)}
              disabled={startingMock}
              className="py-3 px-5 bg-gradient-to-r from-amber-500 to-yellow-500 hover:from-amber-600 hover:to-yellow-600 text-slate-950 font-black rounded-2xl text-xs sm:text-sm shadow-lg shadow-amber-500/25 transition-all flex items-center gap-2 hover:scale-[1.02] disabled:opacity-50"
            >
              <Zap className="w-4 h-4 fill-slate-950" />
              <span>To‘liq Mock Boshlash</span>
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>
        </div>

        {/* Quick Stats Grid */}
        <div className="grid grid-cols-2 sm:grid-cols-5 gap-3 mt-6 pt-6 border-t border-white/10 text-center">
          <div className="bg-white/5 backdrop-blur-md p-3 rounded-2xl border border-white/10">
            <span className="text-[11px] text-emerald-200 block font-semibold">Jami Testlar</span>
            <span className="text-lg sm:text-2xl font-black">{sortedTests.length} ta</span>
          </div>
          <div className="bg-white/5 backdrop-blur-md p-3 rounded-2xl border border-white/10">
            <span className="text-[11px] text-emerald-200 block font-semibold">📖 Reading</span>
            <span className="text-lg sm:text-2xl font-black">
              {sortedTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('reading')).length} ta
            </span>
          </div>
          <div className="bg-white/5 backdrop-blur-md p-3 rounded-2xl border border-white/10">
            <span className="text-[11px] text-purple-200 block font-semibold">🎙️ Speaking</span>
            <span className="text-lg sm:text-2xl font-black">
              {sortedTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('speaking')).length} ta
            </span>
          </div>
          <div className="bg-white/5 backdrop-blur-md p-3 rounded-2xl border border-white/10">
            <span className="text-[11px] text-orange-200 block font-semibold">✍️ Writing</span>
            <span className="text-lg sm:text-2xl font-black">
              {sortedTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('writing')).length} ta
            </span>
          </div>
          <div className="bg-white/5 backdrop-blur-md p-3 rounded-2xl border border-white/10">
            <span className="text-[11px] text-blue-200 block font-semibold">🎧 Listening</span>
            <span className="text-lg sm:text-2xl font-black">
              {sortedTests.filter((t) => !t.title.toLowerCase().includes('mock') && t.title.toLowerCase().includes('listening')).length} ta
            </span>
          </div>
        </div>
      </div>

      {/* Available Tests Section */}
      <section className="space-y-6">
        {/* Section Header with Search */}
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <h2 className="text-xl sm:text-2xl font-extrabold text-slate-900 dark:text-white flex items-center gap-2">
              <PlayCircle className="w-6 h-6 text-emerald-600 dark:text-emerald-400" />
              Mavjud Imtihonlar (Cambridge 13–21)
            </h2>
            <p className="text-xs text-slate-500 dark:text-slate-400 mt-1">
              Imtihonlar tartiblangan holda ketma-ket joylashgan. Qidiruv va filtrlar orqali kerakli testni toping.
            </p>
          </div>

          {/* Search Box */}
          <div className="relative w-full md:w-80">
            <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2 pointer-events-none" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Test yoki mavzu nomi bo‘yicha qidiruv..."
              className="w-full pl-10 pr-9 py-2.5 rounded-2xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 dark:placeholder:text-slate-500 text-xs sm:text-sm font-medium focus:outline-none focus:border-emerald-500 focus:ring-2 focus:ring-emerald-500/20 shadow-xs"
            />
            {searchQuery && (
              <button
                onClick={() => setSearchQuery('')}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
              >
                <X className="w-4 h-4" />
              </button>
            )}
          </div>
        </div>

        {/* Cambridge Book Filter Pills */}
        <div className="flex items-center gap-1.5 overflow-x-auto pb-2 scrollbar-none">
          <span className="text-xs font-bold text-slate-400 dark:text-slate-500 flex items-center gap-1 mr-1 shrink-0">
            <Filter className="w-3.5 h-3.5" /> Kitob:
          </span>
          <button
            onClick={() => setSelectedBook('all')}
            className={`px-3 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all ${
              selectedBook === 'all'
                ? 'bg-slate-900 dark:bg-slate-700 text-white shadow-xs'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-700'
            }`}
          >
            Barchasi
          </button>
          {[13, 14, 15, 16, 17, 18, 19, 20, 21].map((book) => {
            const isSelected = selectedBook === String(book);
            return (
              <button
                key={book}
                onClick={() => setSelectedBook(String(book))}
                className={`px-3 py-1.5 rounded-xl text-xs font-bold whitespace-nowrap transition-all ${
                  isSelected
                    ? 'bg-emerald-600 dark:bg-emerald-600 text-white shadow-xs'
                    : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-emerald-50 dark:hover:bg-emerald-950/40 hover:text-emerald-700 dark:hover:text-emerald-400'
                }`}
              >
                Cambridge {book}
              </button>
            );
          })}
        </div>

        {/* Skill Category Tabs */}
        <div className="flex flex-wrap items-center gap-2 border-b border-slate-200 dark:border-slate-800 pb-3">
          <button
            onClick={() => setActiveTab('all')}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-2 ${
              activeTab === 'all'
                ? 'bg-slate-900 dark:bg-slate-700 text-white shadow-sm'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-700'
            }`}
          >
            <span>Barchasi</span>
            <span
              className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                activeTab === 'all' ? 'bg-slate-800 text-white' : 'bg-slate-100 dark:bg-slate-700 text-slate-600 dark:text-slate-300'
              }`}
            >
              {filteredTests.length}
            </span>
          </button>

          <button
            onClick={() => setActiveTab('reading')}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-2 ${
              activeTab === 'reading'
                ? 'bg-emerald-600 text-white shadow-sm shadow-emerald-500/20'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-emerald-50/50 dark:hover:bg-emerald-950/40 hover:text-emerald-700 dark:hover:text-emerald-400'
            }`}
          >
            <BookOpen className="w-4 h-4" />
            <span>📖 Reading</span>
            <span
              className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                activeTab === 'reading' ? 'bg-emerald-700 text-white' : 'bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300'
              }`}
            >
              {readingTests.length}
            </span>
          </button>

          <button
            onClick={() => setActiveTab('speaking')}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-2 ${
              activeTab === 'speaking'
                ? 'bg-purple-600 text-white shadow-sm shadow-purple-500/20'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-purple-50/50 dark:hover:bg-purple-950/40 hover:text-purple-700 dark:hover:text-purple-400'
            }`}
          >
            <Mic className="w-4 h-4" />
            <span>🎙️ Speaking</span>
            <span
              className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                activeTab === 'speaking' ? 'bg-purple-700 text-white' : 'bg-purple-50 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300'
              }`}
            >
              {speakingTests.length}
            </span>
          </button>

          <button
            onClick={() => setActiveTab('writing')}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-2 ${
              activeTab === 'writing'
                ? 'bg-orange-600 text-white shadow-sm shadow-orange-500/20'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-orange-50/50 dark:hover:bg-orange-950/40 hover:text-orange-700 dark:hover:text-orange-400'
            }`}
          >
            <PenTool className="w-4 h-4" />
            <span>✍️ Writing</span>
            <span
              className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                activeTab === 'writing' ? 'bg-orange-700 text-white' : 'bg-orange-50 dark:bg-orange-950/60 text-orange-700 dark:text-orange-300'
              }`}
            >
              {writingTests.length}
            </span>
          </button>

          <button
            onClick={() => setActiveTab('listening')}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-2 ${
              activeTab === 'listening'
                ? 'bg-blue-600 text-white shadow-sm shadow-blue-500/20'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-blue-50/50 dark:hover:bg-blue-950/40 hover:text-blue-700 dark:hover:text-blue-400'
            }`}
          >
            <Headphones className="w-4 h-4" />
            <span>🎧 Listening</span>
            <span
              className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                activeTab === 'listening' ? 'bg-blue-700 text-white' : 'bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300'
              }`}
            >
              {listeningTests.length}
            </span>
          </button>

          <button
            onClick={() => setActiveTab('mock')}
            className={`px-4 py-2 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-2 ${
              activeTab === 'mock'
                ? 'bg-amber-600 text-white shadow-sm shadow-amber-500/20'
                : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-amber-50/50 dark:hover:bg-amber-950/40 hover:text-amber-700 dark:hover:text-amber-400'
            }`}
          >
            <Sparkles className="w-4 h-4" />
            <span>🏆 To‘liq Mock</span>
            <span
              className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                activeTab === 'mock' ? 'bg-amber-700 text-white' : 'bg-amber-50 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300'
              }`}
            >
              {mockTests.length || '⚡'}
            </span>
          </button>
        </div>

        {/* Tests Display */}
        {filteredTests.length === 0 ? (
          <div className="p-12 text-center bg-white rounded-3xl border border-dashed border-slate-300 text-slate-500">
            <p className="font-bold text-slate-700">Qidiruv bo‘yicha testlar topilmadi</p>
            <p className="text-xs text-slate-400 mt-1">Filtr parametrlarini o‘zgartirib ko‘ring.</p>
          </div>
        ) : activeTab === 'listening' ? (
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-sm font-bold text-blue-950">
              <Headphones className="w-4 h-4 text-blue-600" />
              <span>IELTS & CEFR Listening Testlari ({listeningTests.length} ta)</span>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {listeningTests.map((t) => renderTestCard(t))}
            </div>
          </div>
        ) : activeTab === 'reading' ? (
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-sm font-bold text-emerald-950">
              <BookOpen className="w-4 h-4 text-emerald-600" />
              <span>IELTS & CEFR Reading Testlari (Cambridge 13–21: {readingTests.length} ta)</span>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {readingTests.map((t) => renderTestCard(t))}
            </div>
          </div>
        ) : activeTab === 'writing' ? (
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-sm font-bold text-orange-950">
              <PenTool className="w-4 h-4 text-orange-600" />
              <span>IELTS & CEFR Writing Testlari (Cambridge 13–21: {writingTests.length} ta)</span>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {writingTests.map((t) => renderTestCard(t))}
            </div>
          </div>
        ) : activeTab === 'speaking' ? (
          <div className="space-y-4">
            <div className="flex items-center gap-2 text-sm font-bold text-purple-950">
              <Mic className="w-4 h-4 text-purple-600" />
              <span>IELTS & CEFR Speaking Testlari (Cambridge 13–21: {speakingTests.length} ta)</span>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              {speakingTests.map((t) => renderTestCard(t))}
            </div>
          </div>
        ) : activeTab === 'mock' ? (
          <div className="space-y-6">
            {/* Random Mock Exam Hero Card */}
            <div className="bg-gradient-to-br from-slate-900 via-indigo-950 to-purple-950 text-white rounded-3xl p-6 sm:p-8 shadow-xl relative overflow-hidden border border-indigo-500/30">
              <div className="absolute top-0 right-0 -mr-16 -mt-16 w-64 h-64 bg-indigo-500/10 rounded-full blur-3xl pointer-events-none"></div>
              <div className="max-w-2xl space-y-3 relative z-10">
                <div className="flex flex-wrap items-center gap-2">
                  <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-amber-400 text-slate-950 uppercase tracking-wider shadow-sm">
                    <Sparkles className="w-3.5 h-3.5 fill-slate-950" /> Rasmiy Imtihon Simulyatsiyasi
                  </span>
                  <span className="text-xs text-indigo-300 font-medium">Listening + Reading + Writing + Speaking</span>
                </div>

                <h2 className="text-2xl sm:text-3xl font-black tracking-tight">
                  Tasodifiy To‘liq Mock Imtihon (Random Mock Exam)
                </h2>
                <p className="text-slate-300 text-xs sm:text-sm leading-relaxed">
                  Tizim mavjud Cambridge IELTS bazasidan tasodifiy <strong>Listening</strong> (40 savol), <strong>Reading</strong> (40 savol), <strong>Writing</strong> (Task 1 & 2) va <strong>Speaking</strong> (3 qism) bo‘limlarini bitta to‘liq 180 daqiqalik sinov imtihoniga jamlaydi.
                </p>

                <div className="grid grid-cols-2 sm:grid-cols-5 gap-2.5 pt-2">
                  <div className="bg-white/10 backdrop-blur-md p-3 rounded-xl border border-white/10 text-center">
                    <span className="text-xs text-indigo-200 block font-semibold">🎧 Listening</span>
                    <span className="text-sm font-extrabold">40 ta savol</span>
                  </div>
                  <div className="bg-white/10 backdrop-blur-md p-3 rounded-xl border border-white/10 text-center">
                    <span className="text-xs text-emerald-200 block font-semibold">📖 Reading</span>
                    <span className="text-sm font-extrabold">40 ta savol</span>
                  </div>
                  <div className="bg-white/10 backdrop-blur-md p-3 rounded-xl border border-white/10 text-center">
                    <span className="text-xs text-orange-200 block font-semibold">✍️ Writing</span>
                    <span className="text-sm font-extrabold">2 topshiriq</span>
                  </div>
                  <div className="bg-white/10 backdrop-blur-md p-3 rounded-xl border border-white/10 text-center">
                    <span className="text-xs text-purple-200 block font-semibold">🎙️ Speaking</span>
                    <span className="text-sm font-extrabold">3 ta qism</span>
                  </div>
                  <div className="bg-white/10 backdrop-blur-md p-3 rounded-xl border border-white/10 text-center">
                    <span className="text-xs text-amber-200 block font-semibold">⏱️ Vaqt / Ball</span>
                    <span className="text-sm font-extrabold">180m / 160 ball</span>
                  </div>
                </div>

                <div className="pt-4 flex flex-wrap items-center gap-3">
                  <button
                    onClick={() => handleStartRandomMock(false)}
                    disabled={startingMock}
                    className="px-6 py-3 bg-gradient-to-r from-emerald-500 to-teal-500 hover:from-emerald-600 hover:to-teal-600 text-white font-bold rounded-xl text-xs sm:text-sm shadow-lg shadow-emerald-500/25 transition-all flex items-center gap-2 disabled:opacity-50"
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
                    className="px-4 py-3 bg-white/10 hover:bg-white/20 text-white font-semibold rounded-xl text-xs sm:text-sm transition-all border border-white/20 flex items-center gap-1.5 disabled:opacity-50"
                    title="Yangi tasodifiy variant shakllantirish"
                  >
                    <RefreshCw className="w-4 h-4" />
                    <span>Yangi Variant</span>
                  </button>
                </div>
              </div>
            </div>

            {mockTests.length > 0 && (
              <div className="space-y-4 pt-2">
                <div className="flex items-center gap-2 text-sm font-bold text-slate-900">
                  <Sparkles className="w-4 h-4 text-amber-500" />
                  <span>Avvalgi Mock Variantlari ({mockTests.length} ta)</span>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  {mockTests.map((t) => renderTestCard(t))}
                </div>
              </div>
            )}
          </div>
        ) : (
          /* activeTab === 'all': Grouped by categories! */
          <div className="space-y-8">
            {/* Random Mock Exam Banner Featured */}
            <div className="bg-gradient-to-br from-slate-900 via-indigo-950 to-purple-950 text-white rounded-3xl p-6 sm:p-8 shadow-xl relative overflow-hidden border border-indigo-500/30">
              <div className="absolute top-0 right-0 -mr-16 -mt-16 w-64 h-64 bg-indigo-500/10 rounded-full blur-3xl pointer-events-none"></div>
              <div className="max-w-2xl space-y-3 relative z-10">
                <div className="flex flex-wrap items-center gap-2">
                  <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-amber-400 text-slate-950 uppercase tracking-wider shadow-sm">
                    <Sparkles className="w-3.5 h-3.5 fill-slate-950" /> Rasmiy Imtihon Simulyatsiyasi
                  </span>
                  <span className="text-xs text-indigo-300 font-medium">Listening + Reading + Writing + Speaking</span>
                </div>

                <h2 className="text-2xl sm:text-3xl font-black tracking-tight">
                  Tasodifiy To‘liq Mock Imtihon (Random Mock Exam)
                </h2>
                <p className="text-slate-300 text-xs sm:text-sm leading-relaxed">
                  Tizim mavjud Cambridge IELTS bazasidan tasodifiy <strong>Listening</strong> (40 savol), <strong>Reading</strong> (40 savol), <strong>Writing</strong> (Task 1 & 2) va <strong>Speaking</strong> (3 qism) bo‘limlarini bitta to‘liq 180 daqiqalik sinov imtihoniga jamlaydi.
                </p>

                <div className="pt-3 flex flex-wrap items-center gap-3">
                  <button
                    onClick={() => handleStartRandomMock(false)}
                    disabled={startingMock}
                    className="px-6 py-3 bg-gradient-to-r from-emerald-500 to-teal-500 hover:from-emerald-600 hover:to-teal-600 text-white font-bold rounded-xl text-xs sm:text-sm shadow-lg shadow-emerald-500/25 transition-all flex items-center gap-2 disabled:opacity-50"
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
                    onClick={() => setActiveTab('mock')}
                    className="px-4 py-3 bg-white/10 hover:bg-white/20 text-white font-semibold rounded-xl text-xs sm:text-sm transition-all border border-white/20 flex items-center gap-1.5"
                  >
                    <span>Bo‘lim ma’lumotlari →</span>
                  </button>
                </div>
              </div>
            </div>

            {readingTests.length > 0 && (
              <div className="space-y-4">
                <div className="flex items-center justify-between pb-2 border-b border-emerald-100">
                  <h3 className="text-base font-bold text-slate-900 flex items-center gap-2">
                    <span className="w-3 h-3 rounded-full bg-emerald-600"></span>
                    <BookOpen className="w-4 h-4 text-emerald-600" />
                    Reading Testlari (Cambridge 13–21)
                  </h3>
                  <button
                    onClick={() => setActiveTab('reading')}
                    className="text-xs font-bold text-emerald-600 hover:text-emerald-800 transition-colors"
                  >
                    Barchasini ko‘rish ({readingTests.length}) →
                  </button>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  {readingTests.slice(0, 6).map((t) => renderTestCard(t))}
                </div>
                {readingTests.length > 6 && (
                  <div className="text-center pt-2">
                    <button
                      onClick={() => setActiveTab('reading')}
                      className="px-5 py-2.5 rounded-xl border border-emerald-200 bg-emerald-50/70 hover:bg-emerald-100 text-emerald-800 text-xs font-bold transition-all"
                    >
                      Barcha {readingTests.length} ta Reading testlarini ko‘rish →
                    </button>
                  </div>
                )}
              </div>
            )}

            {speakingTests.length > 0 && (
              <div className="space-y-4">
                <div className="flex items-center justify-between pb-2 border-b border-purple-100">
                  <h3 className="text-base font-bold text-slate-900 flex items-center gap-2">
                    <span className="w-3 h-3 rounded-full bg-purple-600"></span>
                    <Mic className="w-4 h-4 text-purple-600" />
                    Speaking Testlari (Cambridge 13–21)
                  </h3>
                  <button
                    onClick={() => setActiveTab('speaking')}
                    className="text-xs font-bold text-purple-600 hover:text-purple-800 transition-colors"
                  >
                    Barchasini ko‘rish ({speakingTests.length}) →
                  </button>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  {speakingTests.slice(0, 6).map((t) => renderTestCard(t))}
                </div>
                {speakingTests.length > 6 && (
                  <div className="text-center pt-2">
                    <button
                      onClick={() => setActiveTab('speaking')}
                      className="px-5 py-2.5 rounded-xl border border-purple-200 bg-purple-50/70 hover:bg-purple-100 text-purple-800 text-xs font-bold transition-all"
                    >
                      Barcha {speakingTests.length} ta Speaking testlarini ko‘rish →
                    </button>
                  </div>
                )}
              </div>
            )}

            {writingTests.length > 0 && (
              <div className="space-y-4">
                <div className="flex items-center justify-between pb-2 border-b border-orange-100">
                  <h3 className="text-base font-bold text-slate-900 flex items-center gap-2">
                    <span className="w-3 h-3 rounded-full bg-orange-600"></span>
                    <PenTool className="w-4 h-4 text-orange-600" />
                    Writing Testlari (Cambridge 13–21)
                  </h3>
                  <button
                    onClick={() => setActiveTab('writing')}
                    className="text-xs font-bold text-orange-600 hover:text-orange-800 transition-colors"
                  >
                    Barchasini ko‘rish ({writingTests.length}) →
                  </button>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  {writingTests.slice(0, 6).map((t) => renderTestCard(t))}
                </div>
                {writingTests.length > 6 && (
                  <div className="text-center pt-2">
                    <button
                      onClick={() => setActiveTab('writing')}
                      className="px-5 py-2.5 rounded-xl border border-orange-200 bg-orange-50/70 hover:bg-orange-100 text-orange-800 text-xs font-bold transition-all"
                    >
                      Barcha {writingTests.length} ta Writing testlarini ko‘rish →
                    </button>
                  </div>
                )}
              </div>
            )}

            {listeningTests.length > 0 && (
              <div className="space-y-4">
                <div className="flex items-center justify-between pb-2 border-b border-blue-100">
                  <h3 className="text-base font-bold text-slate-900 flex items-center gap-2">
                    <span className="w-3 h-3 rounded-full bg-blue-600"></span>
                    <Headphones className="w-4 h-4 text-blue-600" />
                    Listening Testlari (Cambridge 13–21)
                  </h3>
                  <button
                    onClick={() => setActiveTab('listening')}
                    className="text-xs font-bold text-blue-600 hover:text-blue-800 transition-colors"
                  >
                    Barchasini ko‘rish ({listeningTests.length}) →
                  </button>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  {listeningTests.slice(0, 6).map((t) => renderTestCard(t))}
                </div>
                {listeningTests.length > 6 && (
                  <div className="text-center pt-2">
                    <button
                      onClick={() => setActiveTab('listening')}
                      className="px-5 py-2.5 rounded-xl border border-blue-200 bg-blue-50/70 hover:bg-blue-100 text-blue-800 text-xs font-bold transition-all"
                    >
                      Barcha {listeningTests.length} ta Listening testlarini ko‘rish →
                    </button>
                  </div>
                )}
              </div>
            )}
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
          <div className="p-8 text-center bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 text-slate-500 dark:text-slate-400 text-sm shadow-xs">
            Siz hali birorta ham test topshirmagansiz. Yuqoridagi testlardan birini boshlang!
          </div>
        ) : (
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 overflow-hidden shadow-xs">
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead className="bg-slate-50 dark:bg-slate-800/80 text-slate-600 dark:text-slate-300 text-xs uppercase font-bold border-b border-slate-200 dark:border-slate-800">
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
                            <span className="px-2.5 py-1 rounded-lg text-xs font-black bg-emerald-600 text-white shadow-xs">
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
                              className="text-xs font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-950/60 hover:bg-emerald-100 dark:hover:bg-emerald-900/60 px-2.5 py-1.5 rounded-xl transition-all flex items-center gap-1 shrink-0"
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
