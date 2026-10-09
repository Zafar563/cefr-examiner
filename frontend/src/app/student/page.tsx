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
  ChevronRight,
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
  CheckCircle2,
  RotateCcw,
  Shuffle,
  Play,
} from 'lucide-react';

// Format card title to match ieltsmaterials: e.g. "Writing Full 15", "Listening Full 19"
const getCardDisplayTitle = (test: Test): string => {
  const isMock = test.title.toLowerCase().includes('mock');
  if (isMock) {
    return test.title.replace(/^Cambridge\s+/i, '');
  }
  const bookMatch = test.title.match(/Cambridge\s+(?:IELTS\s+)?(\d+)/i);
  const testMatch = test.title.match(/Test\s+(\d+)/i);
  const bookNum = bookMatch ? bookMatch[1] : '';
  const testNum = testMatch ? parseInt(testMatch[1], 10) : 1;

  let moduleName = 'Test';
  if (test.title.toLowerCase().includes('writing')) moduleName = 'Writing';
  else if (test.title.toLowerCase().includes('listening')) moduleName = 'Listening';
  else if (test.title.toLowerCase().includes('reading')) moduleName = 'Reading';
  else if (test.title.toLowerCase().includes('speaking')) moduleName = 'Speaking';

  if (bookNum) {
    if (testNum > 1) {
      return `${moduleName} Full ${bookNum} (Test ${testNum})`;
    }
    return `${moduleName} Full ${bookNum}`;
  }
  return test.title;
};

// Clean topic strings
const cleanTopicText = (text: string, maxLen: number = 75): string => {
  if (!text) return '';
  let cleaned = text
    .replace(/&ndash;/g, '–')
    .replace(/&mdash;/g, '—')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/<[^>]+>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
  cleaned = cleaned.replace(/^(?:Reading Passage \d+:?|Listening Part \d+:?|Section \d+:?|Task \d+:?)\s*/i, '');
  cleaned = cleaned.replace(/^(?:Write about the following topic:?|You should spend about \d+ minutes on this task\.?)\s*/i, '');
  cleaned = cleaned.trim();
  if (cleaned.length > maxLen) {
    cleaned = cleaned.substring(0, maxLen).trim() + '...';
  }
  return cleaned;
};

// Extract items for "INSIDE THIS TEST" box matching the screenshot
const getInsideItems = (
  test: Test,
  listeningFilter?: string
): { label: string; topic: string; sectionIndex?: number }[] => {
  const isMock = test.title.toLowerCase().includes('mock');
  const isListening = !isMock && test.title.toLowerCase().includes('listening');
  const isReading = !isMock && test.title.toLowerCase().includes('reading');
  const isWriting = !isMock && test.title.toLowerCase().includes('writing');
  const isSpeaking = !isMock && test.title.toLowerCase().includes('speaking');

  // 1. WRITING
  if (isWriting) {
    let t1Topic = '';
    let t2Topic = '';

    const q1 = test.sections?.[0]?.questions?.[0]?.question_text;
    const q2 = test.sections?.[0]?.questions?.[1]?.question_text;
    if (q1) {
      const lines = q1.split('\n').map((l) => l.trim()).filter((l) => l.length > 5);
      const cand = lines.find(
        (l) =>
          !l.toLowerCase().includes('writing task') &&
          !l.toLowerCase().includes('should spend') &&
          !l.toLowerCase().includes('summarise') &&
          !l.toLowerCase().includes('at least')
      );
      if (cand) t1Topic = cand;
    }
    if (q2) {
      const lines = q2.split('\n').map((l) => l.trim()).filter((l) => l.length > 5);
      const cand = lines.find(
        (l) =>
          !l.toLowerCase().includes('writing task') &&
          !l.toLowerCase().includes('should spend') &&
          !l.toLowerCase().includes('following topic') &&
          !l.toLowerCase().includes('give reasons') &&
          !l.toLowerCase().includes('at least')
      );
      if (cand) t2Topic = cand;
    }

    if (!t1Topic && test.description) {
      const m1 = test.description.match(/Task 1\s*\((.*?)(?:\s*-\s*min|\))/i);
      if (m1) t1Topic = m1[1];
    }
    if (!t2Topic && test.description) {
      const m2 = test.description.match(/Task 2\s*\((.*?)(?:\s*-\s*min|\))/i);
      if (m2) t2Topic = m2[1];
    }

    return [
      {
        label: 'TASK 1',
        topic: cleanTopicText(t1Topic) || 'Data visual report and summary',
        sectionIndex: 0,
      },
      {
        label: 'TASK 2',
        topic: cleanTopicText(t2Topic) || 'Discursive opinion essay',
        sectionIndex: 0,
      },
    ];
  }

  // 2. READING
  if (isReading) {
    const items: { label: string; topic: string; sectionIndex?: number }[] = [];
    let descPassages: string[] = [];
    if (test.description) {
      const m = test.description.match(/\((.*?)\)/);
      if (m) {
        descPassages = m[1].split(',').map((p) => p.trim());
      }
    }

    for (let i = 0; i < 3; i++) {
      let topic = '';
      if (test.sections?.[i]?.title) {
        topic = test.sections[i].title;
      } else if (descPassages[i]) {
        topic = descPassages[i];
      }
      items.push({
        label: `PASSAGE ${i + 1}`,
        topic: cleanTopicText(topic) || `Academic Reading Passage ${i + 1}`,
        sectionIndex: i,
      });
    }
    return items;
  }

  // 3. LISTENING
  if (isListening) {
    const secTitles = [
      test.sections?.[0]?.title,
      test.sections?.[1]?.title,
      test.sections?.[2]?.title,
      test.sections?.[3]?.title,
    ];

    const fallbackTopics = [
      'Social conversation & form completion',
      'Local facilities & public guide',
      'Academic discussion & study project',
      'University lecture & research talk',
    ];

    if (listeningFilter && ['1', '2', '3', '4'].includes(listeningFilter)) {
      const sIdx = parseInt(listeningFilter, 10) - 1;
      return [
        {
          label: `SECTION ${listeningFilter}`,
          topic: cleanTopicText(secTitles[sIdx] || '') || fallbackTopics[sIdx],
          sectionIndex: sIdx,
        },
      ];
    }

    return [1, 2, 3, 4].map((num) => ({
      label: `SECTION ${num}`,
      topic: cleanTopicText(secTitles[num - 1] || '') || fallbackTopics[num - 1],
      sectionIndex: num - 1,
    }));
  }

  // 4. SPEAKING
  if (isSpeaking) {
    let part2Topic = '';
    const q2 = test.sections?.[0]?.questions?.[1]?.question_text;
    if (q2) {
      const lines = q2.split('\n').map((l) => l.trim()).filter(Boolean);
      const cand = lines.find((l) => l.toLowerCase().startsWith('describe'));
      if (cand) part2Topic = cand;
    }

    return [
      {
        label: 'PART 1',
        topic: 'Introduction & Everyday Topics (4–5 min)',
        sectionIndex: 0,
      },
      {
        label: 'PART 2',
        topic: cleanTopicText(part2Topic) || 'Individual Long Turn / Cue Card (3–4 min)',
        sectionIndex: 0,
      },
      {
        label: 'PART 3',
        topic: 'Two-way Discussion & In-depth Ideas (4–5 min)',
        sectionIndex: 0,
      },
    ];
  }

  // 5. MOCK
  return [
    { label: 'LISTENING', topic: '40 questions across 4 audio sections (30 min)' },
    { label: 'READING', topic: '40 questions across 3 academic texts (60 min)' },
    { label: 'WRITING', topic: 'Task 1 visual report & Task 2 essay (60 min)' },
    { label: 'SPEAKING', topic: 'Interactive voice interview Parts 1–3 (15 min)' },
  ];
};

// Category theme colors matching ieltsmaterials.uz
const getCategoryTheme = (tab: 'listening' | 'reading' | 'writing' | 'speaking' | 'mock') => {
  switch (tab) {
    case 'writing':
      return {
        badge: 'WRITING',
        title: 'Writing Real Exam Materials',
        subtitle: 'Practise with real-exam Academic Writing tasks. Each test includes Task 1 and Task 2.',
        gradient: 'from-[#5b1740] via-[#7a2259] to-[#9d2b72]',
        borderColor: 'border-[#9d2b72]/40',
        buttonBg: 'bg-[#7a2259] hover:bg-[#641a47] text-white shadow-[#7a2259]/20',
        ringColor: 'ring-[#7a2259]',
        icon: <PenTool className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#7a2259]',
      };
    case 'listening':
      return {
        badge: 'AUDIO',
        title: 'Listening Real Exam Materials',
        subtitle: 'Practise with real-exam listening audio. Each full test is 40 questions across 4 sections.',
        gradient: 'from-[#0a4e5e] via-[#0d5f73] to-[#185880]',
        borderColor: 'border-cyan-800/40',
        buttonBg: 'bg-[#0a4e5e] hover:bg-[#083e4b] text-white shadow-cyan-900/20',
        ringColor: 'ring-[#0a4e5e]',
        icon: <Headphones className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#0a4e5e]',
      };
    case 'reading':
      return {
        badge: 'READING',
        title: 'Reading Real Exam Materials',
        subtitle: 'Practise with authentic Cambridge Academic Reading passages. 40 questions across 3 passages.',
        gradient: 'from-[#064e3b] via-[#047857] to-[#0f766e]',
        borderColor: 'border-emerald-800/40',
        buttonBg: 'bg-[#047857] hover:bg-[#065f46] text-white shadow-emerald-900/20',
        ringColor: 'ring-[#047857]',
        icon: <BookOpen className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#047857]',
      };
    case 'speaking':
      return {
        badge: 'SPEAKING',
        title: 'Speaking Real Exam Materials',
        subtitle: 'Practise with real-exam speaking cue cards and interview questions (Parts 1–3).',
        gradient: 'from-[#4c1d95] via-[#6d28d9] to-[#7c3aed]',
        borderColor: 'border-purple-800/40',
        buttonBg: 'bg-[#6d28d9] hover:bg-[#5b21b6] text-white shadow-purple-900/20',
        ringColor: 'ring-[#6d28d9]',
        icon: <Mic className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#6d28d9]',
      };
    case 'mock':
    default:
      return {
        badge: 'CEFR MOCK',
        title: 'Full Mock Exam Simulator',
        subtitle: 'Complete 4-skill exam covering Listening, Reading, Writing and Speaking under exam conditions.',
        gradient: 'from-[#881337] via-[#9f1239] to-[#475569]',
        borderColor: 'border-rose-800/40',
        buttonBg: 'bg-[#9f1239] hover:bg-[#881337] text-white shadow-rose-900/20',
        ringColor: 'ring-[#9f1239]',
        icon: <Sparkles className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#9f1239]',
      };
  }
};

function StudentDashboardContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [mounted, setMounted] = useState(false);
  const [tests, setTests] = useState<Test[]>([]);
  const [history, setHistory] = useState<TestSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [startingTestId, setStartingTestId] = useState<number | null>(null);
  const [startingMock, setStartingMock] = useState(false);

  // Active module tab
  const [activeTab, setActiveTab] = useState<'listening' | 'reading' | 'writing' | 'speaking' | 'mock'>('listening');
  const [searchQuery, setSearchQuery] = useState<string>('');

  // Listening Section Filter: 'all' | '1' | '2' | '3' | '4' | 'full'
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

  // Reset selectedBook when activeTab changes
  useEffect(() => {
    setSelectedBook('all');
  }, [activeTab]);

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

  const getTestMeta = (title: string) => {
    const bookMatch = title.match(/Cambridge\s+(?:IELTS\s+)?(\d+)/i);
    const testMatch = title.match(/Test\s+(\d+)/i);
    return {
      book: bookMatch ? `Cambridge ${bookMatch[1]}` : null,
      bookNum: bookMatch ? bookMatch[1] : null,
      testNum: testMatch ? `Test ${testMatch[1]}` : null,
    };
  };

  const sortedTests = useMemo(() => {
    const list = Array.isArray(tests) ? [...tests] : [];
    return list.sort(sortCambridgeTests);
  }, [tests]);

  const filteredTests = useMemo(() => {
    return sortedTests.filter((t) => {
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

  const currentCategoryTests = useMemo(() => {
    if (activeTab === 'listening') return listeningTests;
    if (activeTab === 'reading') return readingTests;
    if (activeTab === 'writing') return writingTests;
    if (activeTab === 'speaking') return speakingTests;
    return mockTests;
  }, [activeTab, listeningTests, readingTests, writingTests, speakingTests, mockTests]);

  const safeHistory = Array.isArray(history) ? history : [];

  const completedCount = useMemo(() => {
    const categoryIds = new Set(currentCategoryTests.map((t) => t.id));
    const completedIds = new Set(
      safeHistory
        .filter((h) => categoryIds.has(h.test_id) && (h.status === 'submitted' || h.status === 'graded'))
        .map((h) => h.test_id)
    );
    return completedIds.size;
  }, [currentCategoryTests, safeHistory]);

  const totalCount = currentCategoryTests.length;

  const availableBooks = useMemo(() => {
    const books = new Set<string>();
    currentCategoryTests.forEach((t) => {
      const meta = getTestMeta(t.title);
      if (meta.bookNum) books.add(meta.bookNum);
    });
    return Array.from(books).sort((a, b) => parseInt(a, 10) - parseInt(b, 10));
  }, [currentCategoryTests]);

  const displayedTests = useMemo(() => {
    return currentCategoryTests.filter((t) => {
      if (selectedBook !== 'all') {
        const meta = getTestMeta(t.title);
        if (meta.bookNum !== selectedBook) return false;
      }
      return true;
    });
  }, [currentCategoryTests, selectedBook]);

  const handlePickRandomTest = () => {
    const pool = displayedTests.length > 0 ? displayedTests : currentCategoryTests;
    if (pool.length === 0) return;

    const completedIds = new Set(
      safeHistory
        .filter((h) => h.status === 'submitted' || h.status === 'graded')
        .map((h) => h.test_id)
    );
    const uncompleted = pool.filter((t) => !completedIds.has(t.id));
    const candidatePool = uncompleted.length > 0 ? uncompleted : pool;
    const randomTest = candidatePool[Math.floor(Math.random() * candidatePool.length)];

    if (activeTab === 'listening' && ['1', '2', '3', '4'].includes(listeningSectionFilter)) {
      handleStartTest(randomTest.id, false, parseInt(listeningSectionFilter, 10) - 1);
    } else {
      handleStartTest(randomTest.id, false);
    }
  };

  const theme = getCategoryTheme(activeTab);

  if (!mounted || loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-12 h-12 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 dark:text-slate-400 font-semibold text-sm">Imtihonlar bazasi yuklanmoqda...</p>
      </div>
    );
  }

  const renderTestCard = (test: Test) => {
    const displayTitle = getCardDisplayTitle(test);
    const insideItems = getInsideItems(test, activeTab === 'listening' ? listeningSectionFilter : undefined);

    const pastSessions = safeHistory.filter((h) => h.test_id === test.id);
    const lastSession = pastSessions[0];
    const isOngoing =
      lastSession?.status === 'in_progress' &&
      lastSession.expires_at &&
      new Date(lastSession.expires_at).getTime() > Date.now();
    const hasCompleted = pastSessions.some(
      (h) =>
        h.status === 'submitted' ||
        h.status === 'graded' ||
        (h.expires_at && new Date(h.expires_at).getTime() <= Date.now())
    );

    const handleStartPrimary = () => {
      if (activeTab === 'listening' && ['1', '2', '3', '4'].includes(listeningSectionFilter)) {
        handleStartTest(test.id, hasCompleted, parseInt(listeningSectionFilter, 10) - 1);
      } else {
        handleStartTest(test.id, hasCompleted);
      }
    };

    const primaryBtnText = isOngoing
      ? 'Continue'
      : hasCompleted
      ? 'Retake'
      : activeTab === 'listening' && ['1', '2', '3', '4'].includes(listeningSectionFilter)
      ? `Start S${listeningSectionFilter}`
      : 'Start';

    return (
      <div
        key={test.id}
        className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200/90 dark:border-slate-800 p-5 sm:p-6 flex flex-col justify-between shadow-xs hover:shadow-lg transition-all duration-200 group"
      >
        <div>
          {/* Top Header Row: Title on Left, Status + Start Button on Right */}
          <div className="flex items-center justify-between gap-3 mb-4">
            <h3 className="text-lg sm:text-[19px] font-black text-slate-800 dark:text-slate-100 tracking-tight leading-snug">
              {displayTitle}
            </h3>

            <div className="flex items-center gap-2 shrink-0">
              {/* Status Badge */}
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-[11px] font-black border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full text-[11px] font-extrabold border border-slate-300 dark:border-slate-700 text-slate-500 dark:text-slate-400 bg-white dark:bg-slate-800/80 whitespace-nowrap">
                  <span className="w-2.5 h-2.5 rounded-full border-2 border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              {/* Start Button */}
              <button
                onClick={handleStartPrimary}
                disabled={startingTestId === test.id}
                className={`px-5 py-2 rounded-xl text-xs sm:text-sm font-black transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer flex items-center gap-1.5 ${theme.buttonBg}`}
              >
                {startingTestId === test.id ? (
                  <>
                    <div className="w-3.5 h-3.5 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                    <span>...</span>
                  </>
                ) : (
                  <span>{primaryBtnText}</span>
                )}
              </button>
            </div>
          </div>

          {/* INSIDE THIS TEST Section */}
          <div className="space-y-2 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS TEST
            </div>

            <div className="space-y-2">
              {insideItems.map((item, idx) => (
                <div
                  key={idx}
                  onClick={() =>
                    item.sectionIndex !== undefined &&
                    handleStartTest(test.id, hasCompleted, item.sectionIndex)
                  }
                  className={`rounded-2xl p-3 border transition-all ${
                    item.sectionIndex !== undefined
                      ? 'bg-slate-50/90 dark:bg-slate-800/60 hover:bg-slate-100 dark:hover:bg-slate-800 border-slate-200/80 dark:border-slate-700/80 cursor-pointer group/item hover:border-slate-300 dark:hover:border-slate-600'
                      : 'bg-slate-50/70 dark:bg-slate-800/40 border-slate-200/60 dark:border-slate-800'
                  }`}
                >
                  <div className="flex items-center justify-between">
                    <span className="text-[11px] font-black text-slate-400 dark:text-slate-400 uppercase tracking-wider">
                      {item.label}
                    </span>
                    {item.sectionIndex !== undefined && (
                      <span className="text-[10px] font-bold text-slate-400 group-hover/item:text-slate-700 dark:group-hover/item:text-slate-200 flex items-center gap-0.5 transition-colors">
                        <span>Practice</span>
                        <ChevronRight className="w-3 h-3 transition-transform group-hover/item:translate-x-0.5" />
                      </span>
                    )}
                  </div>
                  <p className="text-xs sm:text-[13px] font-bold text-slate-700 dark:text-slate-200 mt-0.5 line-clamp-1">
                    {item.topic}
                  </p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="space-y-8 py-4 sm:py-6 w-full mx-auto px-2 sm:px-4 lg:px-6">
      {/* 1. Main Hero Banner Container (Unified matching ieltsmaterials layout) */}
      <section className="space-y-5">
        <div className={`relative overflow-hidden rounded-3xl bg-gradient-to-r ${theme.gradient} p-6 sm:p-8 lg:p-9 text-white shadow-xl border ${theme.borderColor}`}>
          {/* Watermark Icon on the Right */}
          <div className="hidden lg:block absolute right-4 xl:right-10 top-1/2 -translate-y-1/2 pointer-events-none opacity-15">
            {theme.icon}
          </div>

          <div className="relative z-10 space-y-5 max-w-4xl">
            {/* Row 1: Badge + Title */}
            <div className="flex flex-wrap items-center gap-3">
              <span className="inline-flex items-center px-3 py-0.5 rounded-full border border-white/40 text-[11px] font-black uppercase tracking-wider bg-white/10 text-white shadow-xs">
                {theme.badge}
              </span>
              <h1 className="text-2xl sm:text-3xl lg:text-4xl font-black text-white tracking-tight flex items-center gap-2 flex-wrap">
                <span>{theme.title.split(' ')[0]}</span>
                <span className="underline decoration-2 decoration-white/90 underline-offset-6">
                  {theme.title.split(' ').slice(1).join(' ')}
                </span>
              </h1>
            </div>

            {/* Row 2: Subtitle */}
            <p className="text-xs sm:text-sm md:text-[15px] text-white/90 font-medium leading-relaxed">
              {theme.subtitle}
            </p>

            {/* Row 3: 3 Numbered Steps / Guide Pills */}
            <div className="flex flex-wrap items-center gap-2 sm:gap-2.5 pt-0.5">
              <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                <span className={`w-4.5 h-4.5 rounded-full bg-white ${theme.stepBg} font-black text-[11px] flex items-center justify-center shrink-0`}>
                  1
                </span>
                <span>Select a Cambridge test or individual part</span>
              </div>

              <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                <span className={`w-4.5 h-4.5 rounded-full bg-white ${theme.stepBg} font-black text-[11px] flex items-center justify-center shrink-0`}>
                  2
                </span>
                <span>Complete the tasks under official exam timer</span>
              </div>

              <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                <span className={`w-4.5 h-4.5 rounded-full bg-white ${theme.stepBg} font-black text-[11px] flex items-center justify-center shrink-0`}>
                  3
                </span>
                <span>Instant automated scoring and band calculation</span>
              </div>
            </div>

            {/* Row 4: Progress Bar & Pick One Button */}
            <div className="space-y-2 pt-1">
              <div className="w-56 sm:w-64 h-1.5 bg-white/25 rounded-full overflow-hidden">
                <div
                  className="h-full bg-white rounded-full transition-all duration-500"
                  style={{
                    width: `${Math.min(
                      100,
                      Math.round((completedCount / Math.max(1, totalCount)) * 100)
                    )}%`,
                  }}
                />
              </div>

              <div className="flex items-center gap-4 flex-wrap pt-0.5">
                <span className="text-xs sm:text-sm font-bold text-white/90">
                  {completedCount} / {totalCount} tests completed
                </span>

                <button
                  onClick={handlePickRandomTest}
                  className={`bg-white hover:bg-slate-100 ${theme.stepBg} font-extrabold text-xs px-4 py-2 rounded-full shadow-md flex items-center gap-1.5 transition-transform active:scale-95 cursor-pointer`}
                >
                  <Shuffle className={`w-3.5 h-3.5 ${theme.stepBg}`} />
                  <span>Pick one for me</span>
                </button>
              </div>
            </div>

            {/* Row 5: FILTER BY SECTION (For Listening) */}
            {activeTab === 'listening' && (
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
            )}
          </div>
        </div>

        {/* Subheader: CHOOSE TEST + Cambridge Book Pills + Search Input */}
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 pt-2">
          <div className="flex items-center gap-2 overflow-x-auto pb-1 md:pb-0 scrollbar-none flex-wrap sm:flex-nowrap">
            <span className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 shrink-0 mr-1">
              CHOOSE TEST
            </span>
            <button
              onClick={() => setSelectedBook('all')}
              className={`px-3.5 py-1.5 rounded-full text-xs font-bold transition-all shrink-0 cursor-pointer ${
                selectedBook === 'all'
                  ? 'bg-slate-900 dark:bg-slate-700 text-white shadow-xs'
                  : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-750'
              }`}
            >
              All ({currentCategoryTests.length})
            </button>
            {availableBooks.map((b) => (
              <button
                key={b}
                onClick={() => setSelectedBook(b)}
                className={`px-3.5 py-1.5 rounded-full text-xs font-bold transition-all shrink-0 cursor-pointer ${
                  selectedBook === b
                    ? `${theme.buttonBg} ring-1 ${theme.ringColor}`
                    : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-750'
                }`}
              >
                Book {b}
              </button>
            ))}
          </div>

          {/* Search by test name or topic... */}
          <div className="relative w-full md:w-80">
            <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2 pointer-events-none" />
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              placeholder="Search by test name or topic..."
              className="w-full pl-9 pr-9 py-2 rounded-full border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 text-xs sm:text-sm font-semibold focus:outline-none focus:ring-2 focus:ring-slate-400/20 shadow-xs"
            />
            {searchQuery && (
              <button
                onClick={() => setSearchQuery('')}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
              >
                <X className="w-3.5 h-3.5" />
              </button>
            )}
          </div>
        </div>
      </section>

      {/* 2. Test Grid (3 columns on desktop matching screenshot) */}
      <section className="space-y-6">
        {activeTab === 'mock' && (
          <div className="bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 text-white rounded-3xl p-6 sm:p-8 shadow-xl relative overflow-hidden border border-slate-700 mb-6">
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
        )}

        {displayedTests.length === 0 ? (
          <div className="p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
            <p className="font-bold text-slate-700 dark:text-slate-300">Testlar topilmadi</p>
            <p className="text-xs text-slate-400 mt-1">Filtr yoki qidiruv parametrlarini o‘zgartirib ko‘ring.</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {displayedTests.map((t) => renderTestCard(t))}
          </div>
        )}
      </section>

      {/* 3. History & Results Section */}
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
