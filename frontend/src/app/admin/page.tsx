'use client';

import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import {
  apiGetTests,
  apiGetTestDetails,
  apiCreateTest,
  apiDeleteTest,
  apiCreateSection,
  apiCreateQuestion,
  apiUploadAudio,
  apiGetUsers,
  apiUpdateUserRole,
  getCurrentStoredUser,
  Test,
  Section,
  Question,
  User,
  sortCambridgeTests,
} from '@/lib/api';
import {
  Settings,
  Plus,
  Trash2,
  BookOpen,
  Headphones,
  Edit3,
  Mic,
  HelpCircle,
  CheckCircle2,
  ChevronDown,
  ChevronUp,
  Sparkles,
  Users,
  Shield,
  UserCheck,
  Search,
  CheckSquare,
  Scale,
  Image as ImageIcon,
  Filter,
  Layers,
  Upload,
} from 'lucide-react';
import {
  IELTS_QUESTION_CATEGORIES,
  IeltsQuestionCategory,
  getQuestionCategory,
} from '@/lib/questionTypes';

export default function AdminPage() {
  const router = useRouter();
  const [mounted, setMounted] = useState(false);
  const [activeTab, setActiveTab] = useState<'tests' | 'users'>('tests');
  const [users, setUsers] = useState<User[]>([]);
  const [loadingUsers, setLoadingUsers] = useState(false);
  const [userSearch, setUserSearch] = useState('');
  const [roleUpdatingId, setRoleUpdatingId] = useState<number | null>(null);
  const [roleMessage, setRoleMessage] = useState<string>('');

  const [tests, setTests] = useState<Test[]>([]);
  const [loading, setLoading] = useState(true);
  const [filterTab, setFilterTab] = useState<'all' | 'listening' | 'reading' | 'writing' | 'speaking' | 'mock'>('all');

  // New test modal/form
  const [showNewTest, setShowNewTest] = useState(false);
  const [newTitle, setNewTitle] = useState('');
  const [newDesc, setNewDesc] = useState('');
  const [newDuration, setNewDuration] = useState(120);
  const [newLevel, setNewLevel] = useState('Multi-level (A1-C1)');

  // Selected test for inspecting sections & questions
  const [selectedTest, setSelectedTest] = useState<Test | null>(null);

  // New section form
  const [showAddSection, setShowAddSection] = useState(false);
  const [sectionType, setSectionType] = useState('reading');
  const [sectionTitle, setSectionTitle] = useState('Reading Comprehension');
  const [sectionInstructions, setSectionInstructions] = useState('Chap tarafdagi matnni diqqat bilan o‘qing va o‘ng tarafdagi savollarga javob bering.');
  const [passageText, setPassageText] = useState('');
  const [audioUrl, setAudioUrl] = useState('');
  const [isUploadingAudio, setIsUploadingAudio] = useState(false);

  // Universal IELTS Question Constructor States
  const [selectedSectionIdForQuestion, setSelectedSectionIdForQuestion] = useState<number | null>(null);
  const [questionCategory, setQuestionCategory] = useState<IeltsQuestionCategory>('multiple_choice');
  const [newQuestionText, setNewQuestionText] = useState('');
  const [questionPoints, setQuestionPoints] = useState(1);
  const [correctAnswer, setCorrectAnswer] = useState('');

  // Multiple Choice (A, B, C, D)
  const [mcOptions, setMcOptions] = useState<string[]>(['', '', '', '']);

  // Multiple Selection (Choose 2/3)
  const [multiOptions, setMultiOptions] = useState<string[]>(['', '', '', '', '']);
  const [multiCorrectAnswers, setMultiCorrectAnswers] = useState<string[]>([]);

  // Matching (Headings / Features)
  const [matchingOptions, setMatchingOptions] = useState<string[]>([
    'i. ',
    'ii. ',
    'iii. ',
    'iv. ',
  ]);

  // Writing Task Image
  const [writingImageUrl, setWritingImageUrl] = useState('');
  const [isUploadingWritingImg, setIsUploadingWritingImg] = useState(false);

  useEffect(() => {
    setMounted(true);
    const user = getCurrentStoredUser();
    if (!user || user.role !== 'admin') {
      alert('Ushbu sahifaga faqat Admin huquqiga ega foydalanuvchilar kira oladi');
      router.push('/login');
      return;
    }
    loadTests();
    loadUsers();
  }, [router]);

  const loadUsers = async () => {
    setLoadingUsers(true);
    try {
      const data = await apiGetUsers();
      setUsers(Array.isArray(data) ? data : []);
    } catch (e: any) {
      console.error('Foydalanuvchilarni yuklashda xatolik:', e);
    } finally {
      setLoadingUsers(false);
    }
  };

  const handleUpdateRole = async (userId: number, newRole: 'student' | 'examiner' | 'admin') => {
    setRoleUpdatingId(userId);
    try {
      await apiUpdateUserRole(userId, newRole);
      setUsers(prev => prev.map(u => u.id === userId ? { ...u, role: newRole } : u));
      setRoleMessage(`Foydalanuvchi roli muvaffaqiyatli ${newRole.toUpperCase()} ga o'zgartirildi!`);
      setTimeout(() => setRoleMessage(''), 3500);
    } catch (e: any) {
      alert("Rolni o'zgartirishda xatolik: " + e.message);
    } finally {
      setRoleUpdatingId(null);
    }
  };

  const loadTests = async () => {
    setLoading(true);
    try {
      const data = await apiGetTests();
      const list = Array.isArray(data) ? [...data] : [];
      list.sort(sortCambridgeTests);
      setTests(list);
    } catch (e: any) {
      alert('Testlarni yuklashda xatolik: ' + e.message);
    } finally {
      setLoading(false);
    }
  };

  const handleSelectTest = async (testId: number) => {
    try {
      const details = await apiGetTestDetails(testId);
      setSelectedTest(details);
    } catch (e: any) {
      alert('Test tafsilotlarini yuklashda xatolik: ' + e.message);
    }
  };

  const handleCreateTest = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await apiCreateTest(newTitle, newDesc, newLevel, newDuration);
      alert('Yangi CEFR test yaratildi!');
      setShowNewTest(false);
      setNewTitle('');
      setNewDesc('');
      loadTests();
    } catch (e: any) {
      alert('Test yaratishda xatolik: ' + e.message);
    }
  };

  const handleDeleteTest = async (testId: number) => {
    if (!confirm('Rostdan ham ushbu testni o‘chirmoqchimisiz?')) return;
    try {
      await apiDeleteTest(testId);
      if (selectedTest?.id === testId) setSelectedTest(null);
      loadTests();
    } catch (e: any) {
      alert('O‘chirishda xatolik: ' + e.message);
    }
  };

  const handleAudioFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    setIsUploadingAudio(true);
    try {
      const res = await apiUploadAudio(file, file.name);
      setAudioUrl(res.url);
      alert('Audio muvaffaqiyatli yuklandi!');
    } catch (e: any) {
      alert('Audio yuklashda xatolik: ' + e.message);
    } finally {
      setIsUploadingAudio(false);
    }
  };

  const handleCreateSection = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedTest) return;

    try {
      await apiCreateSection(selectedTest.id, {
        type: sectionType,
        title: sectionTitle,
        instructions: sectionInstructions,
        audio_url: audioUrl || null,
        passage_text: passageText || null,
        order_index: (selectedTest.sections?.length || 0) + 1,
      });
      alert('Bo‘lim testga muvaffaqiyatli qo‘shildi!');
      setShowAddSection(false);
      setSectionTitle('');
      setSectionInstructions('');
      setPassageText('');
      setAudioUrl('');
      handleSelectTest(selectedTest.id);
      loadTests();
    } catch (e: any) {
      alert('Bo‘lim qo‘shishda xatolik: ' + e.message);
    }
  };

  const handleWritingImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setIsUploadingWritingImg(true);
    try {
      const res = await apiUploadAudio(file, file.name);
      setWritingImageUrl(res.url);
      alert('Rasm muvaffaqiyatli yuklandi!');
    } catch (e: any) {
      alert('Rasm yuklashda xatolik: ' + e.message);
    } finally {
      setIsUploadingWritingImg(false);
    }
  };

  const handleCreateQuestion = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedSectionIdForQuestion) return;

    let questionType: 'single_choice' | 'multiple_choice' | 'text_input' | 'essay' | 'speaking_prompt' = 'single_choice';
    let options: string[] = [];
    let finalCorrectAnswer = correctAnswer.trim();

    switch (questionCategory) {
      case 'multiple_choice':
        questionType = 'single_choice';
        options = mcOptions.map((o) => o.trim()).filter(Boolean);
        if (!finalCorrectAnswer && options.length > 0) {
          finalCorrectAnswer = options[0];
        }
        break;

      case 'multiple_selection':
        questionType = 'multiple_choice';
        options = multiOptions.map((o) => o.trim()).filter(Boolean);
        finalCorrectAnswer = multiCorrectAnswers.join(', ');
        if (!finalCorrectAnswer) {
          alert('Iltimos, kamida bitta to‘g‘ri javob variantini belgilang!');
          return;
        }
        break;

      case 'true_false_not_given':
        questionType = 'single_choice';
        options = ['TRUE', 'FALSE', 'NOT GIVEN'];
        if (!finalCorrectAnswer) finalCorrectAnswer = 'TRUE';
        break;

      case 'yes_no_not_given':
        questionType = 'single_choice';
        options = ['YES', 'NO', 'NOT GIVEN'];
        if (!finalCorrectAnswer) finalCorrectAnswer = 'YES';
        break;

      case 'completion':
        questionType = 'text_input';
        options = [];
        if (!finalCorrectAnswer) {
          alert('Iltimos, to‘g‘ri javob so‘zini kiriting!');
          return;
        }
        break;

      case 'matching':
        questionType = 'single_choice';
        options = matchingOptions.map((o) => o.trim()).filter(Boolean);
        if (!finalCorrectAnswer && options.length > 0) {
          finalCorrectAnswer = options[0].split('.')[0].trim();
        }
        break;

      case 'essay':
        questionType = 'essay';
        options = writingImageUrl.trim() ? [writingImageUrl.trim()] : [];
        finalCorrectAnswer = '';
        break;

      case 'speaking':
        questionType = 'speaking_prompt';
        options = [];
        finalCorrectAnswer = '';
        break;

      default:
        questionType = 'single_choice';
        options = mcOptions.filter(Boolean);
        break;
    }

    try {
      const sec = selectedTest?.sections?.find((s) => s.id === selectedSectionIdForQuestion);
      const nextOrder = (sec?.questions?.length || 0) + 1;

      await apiCreateQuestion(selectedSectionIdForQuestion, {
        question_type: questionType,
        question_text: newQuestionText,
        options,
        correct_answer: finalCorrectAnswer,
        points: questionPoints,
        order_index: nextOrder,
      });

      alert('Yangi IELTS savoli muvaffaqiyatli qo‘shildi!');
      setSelectedSectionIdForQuestion(null);
      setNewQuestionText('');
      setMcOptions(['', '', '', '']);
      setMultiOptions(['', '', '', '', '']);
      setMultiCorrectAnswers([]);
      setMatchingOptions(['i. ', 'ii. ', 'iii. ', 'iv. ']);
      setWritingImageUrl('');
      setCorrectAnswer('');
      setQuestionPoints(1);
      if (selectedTest) {
        handleSelectTest(selectedTest.id);
      }
    } catch (e: any) {
      alert('Savol qo‘shishda xatolik: ' + e.message);
    }
  };

  if (!mounted || loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-10 h-10 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-medium">Yuklanmoqda...</p>
      </div>
    );
  }

  return (
    <div className="space-y-8 py-4">
      {/* Admin Header */}
      <div className="bg-gradient-to-r from-slate-900 to-slate-800 text-white rounded-2xl p-6 sm:p-8 shadow-sm flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold tracking-tight flex items-center gap-2.5">
            <Settings className="w-7 h-7 text-emerald-400" />
            Tizim Admin Paneli
          </h1>
          <p className="text-slate-300 text-sm mt-1">
            CEFR testlarini yaratish, Reading matnlarini kiritish va savollarni boshqarish.
          </p>
        </div>

        <button
          onClick={() => setShowNewTest(true)}
          className="px-4 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs sm:text-sm font-bold shadow-md transition-all flex items-center gap-2"
        >
          <Plus className="w-4 h-4" /> Yangi Test Yaratish
        </button>
      </div>

      {/* New Test Modal */}
      {showNewTest && (
        <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-white dark:bg-slate-900 rounded-2xl max-w-lg w-full p-6 space-y-4 shadow-xl border border-slate-100 dark:border-slate-800">
            <h3 className="text-lg font-bold text-slate-900 dark:text-white">Yangi CEFR Test Yaratish</h3>
            <form onSubmit={handleCreateTest} className="space-y-4">
              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Test Nomi</label>
                <input
                  type="text"
                  required
                  value={newTitle}
                  onChange={(e) => setNewTitle(e.target.value)}
                  placeholder="Masalan, CEFR Mock Exam #2 (2026 Edition)"
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Tavsif</label>
                <textarea
                  rows={3}
                  value={newDesc}
                  onChange={(e) => setNewDesc(e.target.value)}
                  placeholder="Test haqida ma'lumot..."
                  className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                />
              </div>

              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Davomiyligi (daqiqa)</label>
                  <input
                    type="number"
                    value={newDuration}
                    onChange={(e) => setNewDuration(parseInt(e.target.value) || 120)}
                    className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100"
                  />
                </div>
                <div>
                  <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Daraja</label>
                  <input
                    type="text"
                    value={newLevel}
                    onChange={(e) => setNewLevel(e.target.value)}
                    className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100"
                  />
                </div>
              </div>

              <div className="flex gap-2 pt-2">
                <button
                  type="button"
                  onClick={() => setShowNewTest(false)}
                  className="flex-1 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-slate-700 dark:text-slate-300 text-xs font-bold hover:bg-slate-50 dark:hover:bg-slate-800 transition-all"
                >
                  Bekor qilish
                </button>
                <button
                  type="submit"
                  className="flex-1 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all"
                >
                  Saqlash
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Role message alert */}
      {roleMessage && (
        <div className="p-4 rounded-xl bg-emerald-50 dark:bg-emerald-950/60 border border-emerald-200 dark:border-emerald-800 text-emerald-800 dark:text-emerald-200 text-sm font-bold flex items-center gap-2 shadow-xs">
          <CheckCircle2 className="w-5 h-5 text-emerald-600 dark:text-emerald-400" />
          {roleMessage}
        </div>
      )}

      {/* Main Tab Navigation */}
      <div className="flex items-center gap-3 border-b border-slate-200 dark:border-slate-800 pb-3">
        <button
          onClick={() => setActiveTab('tests')}
          className={`px-4 py-2.5 rounded-xl font-bold text-sm transition-all flex items-center gap-2 ${
            activeTab === 'tests'
              ? 'bg-slate-900 dark:bg-emerald-600 text-white shadow-sm'
              : 'text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800'
          }`}
        >
          <BookOpen className="w-4 h-4" />
          Testlar Boshqaruvi ({tests.length})
        </button>

        <button
          onClick={() => { setActiveTab('users'); loadUsers(); }}
          className={`px-4 py-2.5 rounded-xl font-bold text-sm transition-all flex items-center gap-2 ${
            activeTab === 'users'
              ? 'bg-slate-900 dark:bg-emerald-600 text-white shadow-sm'
              : 'text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800'
          }`}
        >
          <Users className="w-4 h-4" />
          Foydalanuvchilar va Rollar ({users.length})
        </button>
      </div>

      {activeTab === 'users' ? (
        <section className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
            <div>
              <h2 className="text-lg font-bold text-slate-900 dark:text-white flex items-center gap-2">
                <Users className="w-5 h-5 text-emerald-600 dark:text-emerald-400" />
                Ro‘yxatdan O‘tgan Foydalanuvchilar
              </h2>
              <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">
                Barcha yangi foydalanuvchilar 'student' bo‘lib ro‘yxatdan o‘tadi. Administrator bu yerdan ularning rolini 'examiner' yoki 'admin' ga o‘zgartirishi mumkin.
              </p>
            </div>

            {/* Search Input */}
            <div className="relative w-full sm:w-64">
              <Search className="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
              <input
                type="text"
                placeholder="Qidirish (ism yoki email)..."
                value={userSearch}
                onChange={(e) => setUserSearch(e.target.value)}
                className="w-full pl-9 pr-3.5 py-2 text-xs rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 outline-none focus:ring-2 focus:ring-emerald-500"
              />
            </div>
          </div>

          {loadingUsers ? (
            <div className="py-12 text-center text-slate-500 text-xs">Foydalanuvchilar ro‘yxati yuklanmoqda...</div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-left text-xs">
                <thead>
                  <tr className="border-b border-slate-100 dark:border-slate-800 text-slate-400 dark:text-slate-500 font-semibold uppercase tracking-wider">
                    <th className="py-3 px-3">ID</th>
                    <th className="py-3 px-3">To‘liq Ism</th>
                    <th className="py-3 px-3">Email</th>
                    <th className="py-3 px-3">Ro‘yxatdan O‘tgan</th>
                    <th className="py-3 px-3">Joriy Rol</th>
                    <th className="py-3 px-3 text-right">Rolni O‘zgartirish</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 dark:divide-slate-800">
                  {users
                    .filter((u) => {
                      const q = userSearch.toLowerCase();
                      return (u.full_name || '').toLowerCase().includes(q) || (u.email || '').toLowerCase().includes(q);
                    })
                    .map((u) => (
                      <tr key={u.id} className="hover:bg-slate-50/60 dark:hover:bg-slate-800/40 transition-colors">
                        <td className="py-3 px-3 font-mono text-slate-400">#{u.id}</td>
                        <td className="py-3 px-3 font-bold text-slate-900 dark:text-slate-100">{u.full_name || 'Noma‘lum'}</td>
                        <td className="py-3 px-3 text-slate-600 dark:text-slate-300">{u.email}</td>
                        <td className="py-3 px-3 text-slate-400">
                          {u.created_at ? new Date(u.created_at).toLocaleDateString('uz-UZ') : '—'}
                        </td>
                        <td className="py-3 px-3">
                          <span
                            className={`px-2.5 py-1 rounded-md text-[11px] font-extrabold uppercase ${
                              u.role === 'admin'
                                ? 'bg-purple-100 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300'
                                : u.role === 'examiner'
                                ? 'bg-indigo-100 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300'
                                : 'bg-emerald-100 dark:bg-emerald-950/60 text-emerald-800 dark:text-emerald-300'
                            }`}
                          >
                            {u.role === 'admin' ? '⚙️ Admin' : u.role === 'examiner' ? '✍️ Examiner' : '🎓 Student'}
                          </span>
                        </td>
                        <td className="py-3 px-3 text-right">
                          <select
                            value={u.role}
                            disabled={roleUpdatingId === u.id}
                            onChange={(e) => handleUpdateRole(u.id, e.target.value as any)}
                            className="px-2.5 py-1 text-xs font-semibold rounded-lg border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-800 dark:text-slate-200 outline-none focus:ring-2 focus:ring-emerald-500 cursor-pointer disabled:opacity-50"
                          >
                            <option value="student">Student (O‘quvchi)</option>
                            <option value="examiner">Examiner (O‘qituvchi)</option>
                            <option value="admin">Admin (Boshqaruvchi)</option>
                          </select>
                        </td>
                      </tr>
                    ))}
                </tbody>
              </table>
            </div>
          )}
        </section>
      ) : (
        <>
          {/* Tests Management List */}
      <section className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <h2 className="text-lg font-bold text-slate-900 dark:text-white">Mavjud Testlar Ro‘yxati</h2>
          <span className="text-xs text-slate-500 dark:text-slate-400 font-semibold bg-slate-100 dark:bg-slate-800 px-3 py-1 rounded-full">
            Jami: {tests.length} ta test
          </span>
        </div>

        {/* Filter Tabs */}
        {(() => {
          const listeningTests = tests.filter((t) => t.title.toLowerCase().includes('listening'));
          const readingTests = tests.filter((t) => t.title.toLowerCase().includes('reading'));
          const writingTests = tests.filter((t) => t.title.toLowerCase().includes('writing'));
          const speakingTests = tests.filter((t) => t.title.toLowerCase().includes('speaking'));
          const mockTests = tests.filter(
            (t) =>
              t.title.toLowerCase().includes('mock') ||
              (!t.title.toLowerCase().includes('listening') &&
                !t.title.toLowerCase().includes('reading') &&
                !t.title.toLowerCase().includes('writing') &&
                !t.title.toLowerCase().includes('speaking'))
          );
          const filteredTests =
            filterTab === 'listening'
              ? listeningTests
              : filterTab === 'reading'
              ? readingTests
              : filterTab === 'writing'
              ? writingTests
              : filterTab === 'speaking'
              ? speakingTests
              : filterTab === 'mock'
              ? mockTests
              : tests;

          return (
            <>
              <div className="flex flex-wrap items-center gap-2 border-b border-slate-100 dark:border-slate-800 pb-3">
                <button
                  onClick={() => setFilterTab('all')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 ${
                    filterTab === 'all'
                      ? 'bg-slate-900 dark:bg-slate-100 text-white dark:text-slate-900 shadow-sm'
                      : 'bg-slate-50 dark:bg-slate-800 text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-700'
                  }`}
                >
                  <span>Barchasi</span>
                  <span
                    className={`px-1.5 py-0.2 rounded-full text-[10px] ${
                      filterTab === 'all'
                        ? 'bg-slate-700 dark:bg-slate-300 text-white dark:text-slate-900'
                        : 'bg-slate-200 dark:bg-slate-700 text-slate-700 dark:text-slate-300'
                    }`}
                  >
                    {tests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('listening')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 ${
                    filterTab === 'listening'
                      ? 'bg-blue-600 text-white shadow-sm'
                      : 'bg-blue-50 dark:bg-blue-950/40 text-blue-700 dark:text-blue-300 hover:bg-blue-100/60 dark:hover:bg-blue-900/60'
                  }`}
                >
                  <Headphones className="w-3.5 h-3.5" />
                  <span>🎧 Listening</span>
                  <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-blue-700 text-white">
                    {listeningTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('reading')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 ${
                    filterTab === 'reading'
                      ? 'bg-emerald-600 text-white shadow-sm'
                      : 'bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 hover:bg-emerald-100/60 dark:hover:bg-emerald-900/60'
                  }`}
                >
                  <BookOpen className="w-3.5 h-3.5" />
                  <span>📖 Reading</span>
                  <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-emerald-700 text-white">
                    {readingTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('writing')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 ${
                    filterTab === 'writing'
                      ? 'bg-orange-600 text-white shadow-sm'
                      : 'bg-orange-50 dark:bg-orange-950/40 text-orange-700 dark:text-orange-300 hover:bg-orange-100/60 dark:hover:bg-orange-900/60'
                  }`}
                >
                  <Edit3 className="w-3.5 h-3.5" />
                  <span>✍️ Writing</span>
                  <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-orange-700 text-white">
                    {writingTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('speaking')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 ${
                    filterTab === 'speaking'
                      ? 'bg-purple-600 text-white shadow-sm'
                      : 'bg-purple-50 dark:bg-purple-950/40 text-purple-700 dark:text-purple-300 hover:bg-purple-100/60 dark:hover:bg-purple-900/60'
                  }`}
                >
                  <Mic className="w-3.5 h-3.5" />
                  <span>🎙️ Speaking</span>
                  <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-purple-700 text-white">
                    {speakingTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('mock')}
                  className={`px-3 py-1.5 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5 ${
                    filterTab === 'mock'
                      ? 'bg-amber-600 text-white shadow-sm'
                      : 'bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 hover:bg-amber-100/60 dark:hover:bg-amber-900/60'
                  }`}
                >
                  <Sparkles className="w-3.5 h-3.5" />
                  <span>🏆 To‘liq Mock</span>
                  <span className="px-1.5 py-0.2 rounded-full text-[10px] bg-amber-700 text-white">
                    {mockTests.length}
                  </span>
                </button>
              </div>

              <div className="space-y-3">
                {filteredTests.length === 0 ? (
                  <div className="py-8 text-center text-slate-400 dark:text-slate-500 text-sm">
                    Ushbu toifada testlar mavjud emas.
                  </div>
                ) : (
                  filteredTests.map((test) => {
                    const isListening = test.title.toLowerCase().includes('listening');
                    const isReading = test.title.toLowerCase().includes('reading');
                    const isWriting = test.title.toLowerCase().includes('writing');
                    const isSpeaking = test.title.toLowerCase().includes('speaking');
                    return (
                      <div
                        key={test.id}
                        className={`p-4 rounded-2xl border transition-all ${
                          selectedTest?.id === test.id
                            ? 'bg-emerald-50/60 dark:bg-emerald-950/30 border-emerald-300 dark:border-emerald-700/60 ring-2 ring-emerald-500/20 shadow-xs'
                            : 'bg-white dark:bg-slate-800/80 hover:bg-slate-50/80 dark:hover:bg-slate-800 border-slate-200/80 dark:border-slate-700/80 shadow-xs'
                        }`}
                      >
                        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                          <div className="min-w-0 flex-1 space-y-1">
                            <div className="flex items-center gap-2 flex-wrap">
                              {isListening ? (
                                <span className="px-2.5 py-0.5 rounded-lg text-[11px] font-bold bg-blue-100 dark:bg-blue-950/60 text-blue-800 dark:text-blue-300 flex items-center gap-1">
                                  <Headphones className="w-3 h-3" /> Listening
                                </span>
                              ) : isReading ? (
                                <span className="px-2.5 py-0.5 rounded-lg text-[11px] font-bold bg-emerald-100 dark:bg-emerald-950/60 text-emerald-800 dark:text-emerald-300 flex items-center gap-1">
                                  <BookOpen className="w-3 h-3" /> Reading
                                </span>
                              ) : isWriting ? (
                                <span className="px-2.5 py-0.5 rounded-lg text-[11px] font-bold bg-orange-100 dark:bg-orange-950/60 text-orange-800 dark:text-orange-300 flex items-center gap-1">
                                  <Edit3 className="w-3 h-3" /> Writing
                                </span>
                              ) : isSpeaking ? (
                                <span className="px-2.5 py-0.5 rounded-lg text-[11px] font-bold bg-purple-100 dark:bg-purple-950/60 text-purple-800 dark:text-purple-300 flex items-center gap-1">
                                  <Mic className="w-3 h-3" /> Speaking
                                </span>
                              ) : (
                                <span className="px-2.5 py-0.5 rounded-lg text-[11px] font-bold bg-amber-100 dark:bg-amber-950/60 text-amber-800 dark:text-amber-300 flex items-center gap-1">
                                  <Sparkles className="w-3 h-3" /> Mock
                                </span>
                              )}
                              <span className="font-bold text-slate-900 dark:text-white text-sm sm:text-base">{test.title}</span>
                              <span className="px-2 py-0.5 rounded-md text-xs font-bold bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300">
                                {test.level}
                              </span>
                            </div>
                            <p className="text-xs text-slate-500 dark:text-slate-400 mt-1 line-clamp-2 leading-relaxed">{test.description}</p>
                            <span className="text-[11px] text-slate-400 dark:text-slate-500 font-medium block">Davomiyligi: {test.duration_minutes} daqiqa</span>
                          </div>

                          <div className="flex items-center gap-2 shrink-0 self-start sm:self-center">
                            <button
                              onClick={() => handleSelectTest(test.id)}
                              className="px-4 py-2.5 rounded-xl text-xs font-bold whitespace-nowrap bg-emerald-600 hover:bg-emerald-700 text-white transition-colors shadow-sm flex items-center gap-1.5 shrink-0"
                            >
                              <BookOpen className="w-4 h-4" />
                              <span>Bo‘limlar va Savollar</span>
                            </button>
                            <button
                              onClick={() => handleDeleteTest(test.id)}
                              className="p-2.5 text-slate-400 hover:text-rose-600 hover:bg-rose-50 dark:hover:bg-rose-950/50 rounded-xl transition-colors shrink-0"
                              title="Testni o‘chirish"
                            >
                              <Trash2 className="w-4 h-4" />
                            </button>
                          </div>
                        </div>
                      </div>
                    );
                  })
                )}
              </div>
            </>
          );
        })()}
      </section>

      {/* Selected Test Sections & Questions Inspector */}
      {selectedTest && (
        <section className="bg-white dark:bg-slate-900 rounded-2xl border-2 border-emerald-600/40 p-6 shadow-sm space-y-6">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-4 border-b border-slate-100 dark:border-slate-800">
            <div>
              <span className="text-xs font-bold uppercase text-emerald-600 dark:text-emerald-400">Tanlangan Test:</span>
              <h2 className="text-xl font-extrabold text-slate-900 dark:text-white">{selectedTest.title}</h2>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              <button
                onClick={() => setShowAddSection(true)}
                className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all flex items-center gap-1.5 whitespace-nowrap shrink-0"
              >
                <Plus className="w-4 h-4" />
                <span>Yangi Bo‘lim Qo‘shish</span>
              </button>
              <button
                onClick={() => setSelectedTest(null)}
                className="px-3.5 py-2 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-300 rounded-xl text-xs font-semibold transition-colors whitespace-nowrap shrink-0"
              >
                Yopish
              </button>
            </div>
          </div>

          {/* Add Section Form (Modal / Inline) */}
          {showAddSection && (
            <div className="bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 rounded-2xl p-5 space-y-4">
              <div className="flex items-center justify-between">
                <h3 className="text-sm font-bold text-slate-900 dark:text-white">Yangi Bo‘lim (Section) Qo‘shish</h3>
                <button onClick={() => setShowAddSection(false)} className="text-xs text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 font-bold">Bekor qilish</button>
              </div>

              <form onSubmit={handleCreateSection} className="space-y-4">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Bo‘lim turi</label>
                    <select
                      value={sectionType}
                      onChange={(e) => setSectionType(e.target.value)}
                      className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100 font-medium"
                    >
                      <option value="reading">📖 Reading (Matn va savollar)</option>
                      <option value="listening">🎧 Listening (Audio eshitish)</option>
                      <option value="writing">✍️ Writing (Insho matn muharriri)</option>
                      <option value="speaking">🎙️ Speaking (Ovoz yozish)</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Bo‘lim Sarlavhasi</label>
                    <input
                      type="text"
                      required
                      value={sectionTitle}
                      onChange={(e) => setSectionTitle(e.target.value)}
                      placeholder="Masalan, Section 2: Reading Comprehension"
                      className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Ko‘rsatma (Instructions)</label>
                  <input
                    type="text"
                    value={sectionInstructions}
                    onChange={(e) => setSectionInstructions(e.target.value)}
                    placeholder="Talaba uchun ko‘rsatma..."
                    className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                  />
                </div>

                {sectionType === 'reading' && (
                  <div className="p-4 bg-emerald-50/60 dark:bg-emerald-950/40 rounded-xl border border-emerald-200 dark:border-emerald-800 space-y-2">
                    <label className="block text-xs font-bold text-emerald-950 dark:text-emerald-200">
                      📖 Reading Passage (Talaba chap tomonda o‘qiydigan matn):
                    </label>
                    <p className="text-xs text-emerald-800 dark:text-emerald-300">
                      Ushbu maydonga kiritilgan matn test topshirishda chap tomonda mustaqil scroll bilan chiqadi.
                    </p>
                    <textarea
                      rows={8}
                      required
                      value={passageText}
                      onChange={(e) => setPassageText(e.target.value)}
                      placeholder="Reading matnini (maqola, insho yoki hikoyani) shu yerga to‘liq joylashtiring..."
                      className="w-full p-3.5 rounded-xl border border-slate-300 dark:border-slate-700 text-xs focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100 leading-relaxed font-sans placeholder:text-slate-400"
                    />
                  </div>
                )}

                {sectionType === 'listening' && (
                  <div className="p-4 bg-blue-50/60 dark:bg-blue-950/40 rounded-xl border border-blue-200 dark:border-blue-800 space-y-3">
                    <span className="text-xs font-bold text-blue-900 dark:text-blue-200 block">Listening Audio Faylini Yuklash</span>
                    <input
                      type="file"
                      accept="audio/*"
                      onChange={handleAudioFileUpload}
                      className="text-xs text-slate-600 dark:text-slate-300"
                    />
                    {isUploadingAudio && <p className="text-xs text-blue-600 dark:text-blue-400 font-semibold">Audio yuklanmoqda...</p>}
                    {audioUrl && (
                      <p className="text-xs text-emerald-700 dark:text-emerald-400 font-semibold">
                        ✓ Audio saqlandi: <span className="font-mono">{audioUrl}</span>
                      </p>
                    )}
                  </div>
                )}

                <button
                  type="submit"
                  className="py-2 px-4 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all"
                >
                  Bo‘limni Saqlash
                </button>
              </form>
            </div>
          )}

          {/* Sections List in the Test */}
          <div className="space-y-6">
            <h3 className="text-base font-bold text-slate-900 dark:text-white">Ushbu Testdagi Bo‘limlar:</h3>

            {(!selectedTest.sections || selectedTest.sections.length === 0) ? (
              <p className="text-xs text-slate-500 dark:text-slate-400 py-6 text-center bg-slate-50 dark:bg-slate-800/50 rounded-xl border border-slate-200 dark:border-slate-800">
                Ushbu testda hali bo‘limlar mavjud emas. Yuqoridagi tugma orqali Reading yoki Listening bo‘limini qo‘shing.
              </p>
            ) : (
              selectedTest.sections.map((sec, secIdx) => {
                const isReading = sec.type === 'reading';
                const questions = sec.questions || [];

                return (
                  <div key={sec.id} className="border border-slate-200 dark:border-slate-800 rounded-2xl p-5 space-y-4 bg-white dark:bg-slate-800/60 shadow-sm">
                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 pb-3 border-b border-slate-100 dark:border-slate-700/60">
                      <div className="flex items-center gap-2">
                        <span className="px-2.5 py-1 rounded-md text-xs font-bold uppercase bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300">
                          {sec.type}
                        </span>
                        <h4 className="font-bold text-slate-900 dark:text-white text-sm">{sec.title}</h4>
                      </div>

                      <button
                        onClick={() => setSelectedSectionIdForQuestion(sec.id)}
                        className="px-3.5 py-1.5 bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 hover:bg-emerald-100 dark:hover:bg-emerald-900/60 rounded-lg text-xs font-bold transition-colors flex items-center gap-1.5 whitespace-nowrap shrink-0 self-start sm:self-auto"
                      >
                        <Plus className="w-3.5 h-3.5" />
                        <span>Savol Qo‘shish</span>
                      </button>
                    </div>

                    {/* Reading Passage Preview */}
                    {isReading && (
                      <div className="bg-emerald-50/50 dark:bg-emerald-950/30 p-4 rounded-xl border border-emerald-100 dark:border-emerald-900/50 space-y-1">
                        <span className="text-xs font-bold text-emerald-900 dark:text-emerald-200 block">
                          📖 Chap tomonda chiqadigan matn (Reading Passage):
                        </span>
                        <p className="text-xs text-slate-700 dark:text-slate-300 line-clamp-3 leading-relaxed">
                          {sec.passage_text || 'Matn kiritilmagan'}
                        </p>
                      </div>
                    )}

                    {/* Questions in Section */}
                    <div className="space-y-3">
                      <span className="text-xs font-bold text-slate-500 dark:text-slate-400 block">
                        O‘ng tomonda chiqadigan savollar ({questions.length} ta):
                      </span>

                      {questions.length === 0 ? (
                        <p className="text-xs text-slate-400 dark:text-slate-500 italic">Hali savollar qo‘shilmagan.</p>
                      ) : (
                        <div className="space-y-2">
                          {questions.map((q, qIdx) => (
                            <div key={q.id || qIdx} className="p-3 bg-slate-50 dark:bg-slate-900/80 rounded-xl border border-slate-200 dark:border-slate-700/80 text-xs space-y-1">
                              <div className="flex items-center justify-between font-semibold text-slate-900 dark:text-slate-100">
                                <span>#{qIdx + 1}. {q.question_text}</span>
                                <span className="text-emerald-700 dark:text-emerald-400">{q.points} ball</span>
                              </div>
                              {q.options && q.options.length > 0 && (
                                <div className="text-slate-500 dark:text-slate-400 pl-3">
                                  Variantlar: {q.options.join(' | ')}
                                </div>
                              )}
                              {q.correct_answer && (
                                <div className="text-emerald-800 dark:text-emerald-300 font-semibold pl-3">
                                  To‘g‘ri javob: {q.correct_answer}
                                </div>
                              )}
                            </div>
                          ))}
                        </div>
                      )}
                    </div>

                    {/* Universal IELTS Question Constructor */}
                    {selectedSectionIdForQuestion === sec.id && (
                      <div className="mt-4 pt-4 border-t border-slate-200 dark:border-slate-700/80 p-5 bg-slate-50 dark:bg-slate-900/80 rounded-2xl space-y-5 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
                        <div className="flex items-center justify-between pb-2 border-b border-slate-200 dark:border-slate-700">
                          <div>
                            <h5 className="text-sm font-extrabold text-slate-900 dark:text-white uppercase flex items-center gap-2">
                              <Sparkles className="w-4 h-4 text-emerald-600" />
                              <span>Universal IELTS Savol Konstruktori</span>
                            </h5>
                            <p className="text-[11px] text-slate-500 dark:text-slate-400 mt-0.5">
                              Bo‘lim: <span className="font-bold">{sec.title}</span>
                            </p>
                          </div>
                          <button
                            type="button"
                            onClick={() => setSelectedSectionIdForQuestion(null)}
                            className="text-xs text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 font-bold px-2 py-1 rounded-lg hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors cursor-pointer"
                          >
                            Bekor qilish
                          </button>
                        </div>

                        <form onSubmit={handleCreateQuestion} className="space-y-4">
                          {/* Step 1: Choose Question Category */}
                          <div className="space-y-1.5">
                            <label className="block text-xs font-bold text-slate-700 dark:text-slate-300">
                              1. IELTS Savol Turini Tanlang:
                            </label>
                            <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                              {[
                                { id: 'multiple_choice', label: '🔘 Multiple Choice', sub: 'Yakka tanlov (A, B, C, D)' },
                                { id: 'multiple_selection', label: '☑️ Choose 2 / 3', sub: 'Ko‘p tanlov (A–E)' },
                                { id: 'true_false_not_given', label: '⚖️ True/False/NG', sub: 'Faktik ma’lumot' },
                                { id: 'yes_no_not_given', label: '⚖️ Yes/No/NG', sub: 'Muallif qarashi' },
                                { id: 'completion', label: '✍️ Completion', sub: 'Bo‘sh o‘rin to‘ldirish' },
                                { id: 'matching', label: '📋 Matching', sub: 'Sarlavha/xususiyat' },
                                { id: 'essay', label: '📝 Writing Task', sub: 'Task 1 yoki Task 2' },
                                { id: 'speaking', label: '🎙️ Speaking Prompt', sub: 'Part 1, 2 yoki 3' },
                              ].map((cat) => {
                                const isSel = questionCategory === cat.id;
                                return (
                                  <button
                                    key={cat.id}
                                    type="button"
                                    onClick={() => {
                                      setQuestionCategory(cat.id as any);
                                      if (cat.id === 'true_false_not_given') setCorrectAnswer('TRUE');
                                      if (cat.id === 'yes_no_not_given') setCorrectAnswer('YES');
                                    }}
                                    className={`p-2.5 rounded-xl border text-left transition-all cursor-pointer ${
                                      isSel
                                        ? 'border-emerald-500 bg-emerald-50 dark:bg-emerald-950/60 ring-2 ring-emerald-500/20'
                                        : 'border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 hover:bg-slate-50 dark:hover:bg-slate-750'
                                    }`}
                                  >
                                    <div className={`text-xs font-bold ${isSel ? 'text-emerald-800 dark:text-emerald-300' : 'text-slate-800 dark:text-slate-200'}`}>
                                      {cat.label}
                                    </div>
                                    <div className="text-[10px] text-slate-400 dark:text-slate-500 mt-0.5 font-medium">
                                      {cat.sub}
                                    </div>
                                  </button>
                                );
                              })}
                            </div>
                          </div>

                          {/* Step 2: Question Text / Instructions */}
                          <div>
                            <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                              2. Savol Matni yoki Ko‘rsatma:
                            </label>
                            <textarea
                              required
                              rows={questionCategory === 'essay' || questionCategory === 'speaking' ? 4 : 2}
                              value={newQuestionText}
                              onChange={(e) => setNewQuestionText(e.target.value)}
                              placeholder={
                                questionCategory === 'multiple_choice'
                                  ? 'Masalan: What is the main reason why researchers visited the valley?'
                                  : questionCategory === 'true_false_not_given'
                                  ? 'Masalan: The trees were originally planted to prevent soil erosion.'
                                  : questionCategory === 'completion'
                                  ? 'Masalan: In 1985, the government established a new ___ to oversee nature reserves.'
                                  : questionCategory === 'matching'
                                  ? 'Masalan: Paragraph A'
                                  : questionCategory === 'essay'
                                  ? 'Masalan: WRITING TASK 2: Some people believe that universities should focus on practical skills. Discuss both views...'
                                  : 'Masalan: Part 2: Describe a website you find useful. You should say: what it is, how often you use it...'
                              }
                              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-xs sm:text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                            />
                          </div>

                          {/* Step 3: Dynamic Category-Specific Inputs */}

                          {/* A. Multiple Choice (A, B, C, D) */}
                          {questionCategory === 'multiple_choice' && (
                            <div className="space-y-2.5 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <span className="text-xs font-bold text-slate-700 dark:text-slate-300 block">
                                Variantlar va To‘g‘ri Javob (Radio orqali belgilang):
                              </span>
                              {['A', 'B', 'C', 'D'].map((letter, idx) => {
                                const optVal = mcOptions[idx];
                                const isCorrect = correctAnswer === optVal && optVal.trim() !== '';
                                return (
                                  <div key={letter} className="flex items-center gap-2">
                                    <input
                                      type="radio"
                                      name="mc_correct_radio"
                                      checked={isCorrect}
                                      onChange={() => setCorrectAnswer(optVal)}
                                      title="Ushbu variantni to‘g‘ri javob deb belgilash"
                                      className="w-4 h-4 text-emerald-600 focus:ring-emerald-500 cursor-pointer shrink-0"
                                    />
                                    <span className="w-6 text-xs font-bold text-slate-500 dark:text-slate-400">{letter}.</span>
                                    <input
                                      type="text"
                                      required={idx < 2}
                                      value={optVal}
                                      onChange={(e) => {
                                        const next = [...mcOptions];
                                        next[idx] = e.target.value;
                                        setMcOptions(next);
                                        if (isCorrect) setCorrectAnswer(e.target.value);
                                      }}
                                      placeholder={`${letter} varianti matni`}
                                      className="flex-1 px-3 py-1.5 rounded-lg border border-slate-300 dark:border-slate-700 text-xs bg-slate-50/50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                    />
                                  </div>
                                );
                              })}
                            </div>
                          )}

                          {/* B. Multiple Selection (Choose 2/3) */}
                          {questionCategory === 'multiple_selection' && (
                            <div className="space-y-2.5 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <span className="text-xs font-bold text-slate-700 dark:text-slate-300 block">
                                Variantlar (A–E) va To‘g‘ri Javoblar (Checkbox orqali 2 ta yoki 3 tasini belgilang):
                              </span>
                              {['A', 'B', 'C', 'D', 'E'].map((letter, idx) => {
                                const optVal = multiOptions[idx];
                                const isChecked = multiCorrectAnswers.includes(letter);
                                return (
                                  <div key={letter} className="flex items-center gap-2">
                                    <input
                                      type="checkbox"
                                      checked={isChecked}
                                      onChange={(e) => {
                                        if (e.target.checked) {
                                          setMultiCorrectAnswers([...multiCorrectAnswers, letter]);
                                        } else {
                                          setMultiCorrectAnswers(multiCorrectAnswers.filter((a) => a !== letter));
                                        }
                                      }}
                                      className="w-4 h-4 text-indigo-600 rounded focus:ring-indigo-500 cursor-pointer shrink-0"
                                    />
                                    <span className="w-6 text-xs font-bold text-slate-500 dark:text-slate-400">{letter}.</span>
                                    <input
                                      type="text"
                                      required={idx < 3}
                                      value={optVal}
                                      onChange={(e) => {
                                        const next = [...multiOptions];
                                        next[idx] = e.target.value;
                                        setMultiOptions(next);
                                      }}
                                      placeholder={`${letter} varianti`}
                                      className="flex-1 px-3 py-1.5 rounded-lg border border-slate-300 dark:border-slate-700 text-xs bg-slate-50/50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                    />
                                  </div>
                                );
                              })}
                              <div className="text-[11px] text-slate-500 dark:text-slate-400 pt-1 font-semibold">
                                Belgilangan to‘g‘ri javoblar: <span className="font-bold text-indigo-600 dark:text-indigo-400">{multiCorrectAnswers.join(', ') || 'Hali belgilanmadi'}</span>
                              </div>
                            </div>
                          )}

                          {/* C. True / False / Not Given */}
                          {questionCategory === 'true_false_not_given' && (
                            <div className="space-y-2 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <span className="text-xs font-bold text-slate-700 dark:text-slate-300 block">
                                To‘g‘ri Javobni Tanlang:
                              </span>
                              <div className="grid grid-cols-3 gap-3">
                                {['TRUE', 'FALSE', 'NOT GIVEN'].map((ans) => {
                                  const isSel = correctAnswer === ans;
                                  return (
                                    <button
                                      key={ans}
                                      type="button"
                                      onClick={() => setCorrectAnswer(ans)}
                                      className={`py-2.5 px-4 rounded-xl text-xs font-bold transition-all border cursor-pointer text-center ${
                                        isSel
                                          ? 'bg-emerald-600 text-white border-emerald-600 shadow-sm ring-2 ring-emerald-500/30'
                                          : 'bg-slate-50 dark:bg-slate-900 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 hover:bg-slate-100'
                                      }`}
                                    >
                                      {ans}
                                    </button>
                                  );
                                })}
                              </div>
                            </div>
                          )}

                          {/* D. Yes / No / Not Given */}
                          {questionCategory === 'yes_no_not_given' && (
                            <div className="space-y-2 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <span className="text-xs font-bold text-slate-700 dark:text-slate-300 block">
                                To‘g‘ri Javobni Tanlang:
                              </span>
                              <div className="grid grid-cols-3 gap-3">
                                {['YES', 'NO', 'NOT GIVEN'].map((ans) => {
                                  const isSel = correctAnswer === ans;
                                  return (
                                    <button
                                      key={ans}
                                      type="button"
                                      onClick={() => setCorrectAnswer(ans)}
                                      className={`py-2.5 px-4 rounded-xl text-xs font-bold transition-all border cursor-pointer text-center ${
                                        isSel
                                          ? 'bg-teal-600 text-white border-teal-600 shadow-sm ring-2 ring-teal-500/30'
                                          : 'bg-slate-50 dark:bg-slate-900 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 hover:bg-slate-100'
                                      }`}
                                    >
                                      {ans}
                                    </button>
                                  );
                                })}
                              </div>
                            </div>
                          )}

                          {/* E. Completion / Fill in Blanks */}
                          {questionCategory === 'completion' && (
                            <div className="space-y-2 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <label className="block text-xs font-bold text-slate-700 dark:text-slate-300">
                                To‘g‘ri javob so‘z(lar)i:
                              </label>
                              <input
                                type="text"
                                required
                                value={correctAnswer}
                                onChange={(e) => setCorrectAnswer(e.target.value)}
                                placeholder="Masalan: 1985 yoki university / college"
                                className="w-full px-3.5 py-2 rounded-xl border border-amber-300 dark:border-amber-700 text-xs focus:ring-2 focus:ring-amber-500 outline-none bg-amber-50/20 dark:bg-amber-950/20 text-slate-900 dark:text-slate-100 font-semibold"
                              />
                              <p className="text-[11px] text-slate-400 dark:text-slate-500">
                                * Eslatma: Talaba javob yozganda registr (katta-kichik harf) e’tiborga olinmaydi. Agar bir nechta to‘g‘ri variant bo‘lsa, ularni <code className="text-amber-600 font-bold">/</code> belgisi bilan ajrating (masalan: <code className="text-amber-600">centre / center</code>).
                              </p>
                            </div>
                          )}

                          {/* F. Matching (Headings / Features) */}
                          {questionCategory === 'matching' && (
                            <div className="space-y-3 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <div className="flex items-center justify-between">
                                <span className="text-xs font-bold text-slate-700 dark:text-slate-300">
                                  Moslashtiriladigan variantlar ro‘yxati (i, ii, iii...):
                                </span>
                                <button
                                  type="button"
                                  onClick={() => setMatchingOptions([...matchingOptions, ''])}
                                  className="text-[11px] font-bold text-purple-600 hover:text-purple-700 flex items-center gap-1 cursor-pointer"
                                >
                                  <Plus className="w-3 h-3" /> Variant qo‘shish
                                </button>
                              </div>

                              <div className="space-y-2">
                                {matchingOptions.map((opt, idx) => (
                                  <div key={idx} className="flex items-center gap-2">
                                    <input
                                      type="text"
                                      value={opt}
                                      onChange={(e) => {
                                        const next = [...matchingOptions];
                                        next[idx] = e.target.value;
                                        setMatchingOptions(next);
                                      }}
                                      placeholder={`Masalan: ${idx + 1}. The impact on climate`}
                                      className="flex-1 px-3 py-1.5 rounded-lg border border-slate-300 dark:border-slate-700 text-xs bg-slate-50/50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                    />
                                    {matchingOptions.length > 2 && (
                                      <button
                                        type="button"
                                        onClick={() => setMatchingOptions(matchingOptions.filter((_, i) => i !== idx))}
                                        className="p-1.5 text-slate-400 hover:text-rose-600"
                                        title="O‘chirish"
                                      >
                                        <Trash2 className="w-3.5 h-3.5" />
                                      </button>
                                    )}
                                  </div>
                                ))}
                              </div>

                              <div>
                                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                                  Ushbu savol uchun to‘g‘ri javob (masalan, iii yoki B):
                                </label>
                                <input
                                  type="text"
                                  required
                                  value={correctAnswer}
                                  onChange={(e) => setCorrectAnswer(e.target.value)}
                                  placeholder="Masalan: iii"
                                  className="w-full px-3 py-1.5 rounded-lg border border-purple-300 dark:border-purple-700 text-xs bg-purple-50/20 dark:bg-purple-950/20 text-slate-900 dark:text-slate-100 font-bold"
                                />
                              </div>
                            </div>
                          )}

                          {/* G. Writing Task (Task 1 & Task 2) */}
                          {questionCategory === 'essay' && (
                            <div className="space-y-3 p-4 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
                              <span className="text-xs font-bold text-slate-700 dark:text-slate-300 block">
                                Task 1 Diagramma/Grafik Rasmi (Ixtiyoriy):
                              </span>
                              <div className="flex flex-col sm:flex-row items-center gap-3">
                                <label className="px-4 py-2 bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 dark:hover:bg-slate-650 text-slate-700 dark:text-slate-300 rounded-xl text-xs font-bold transition-colors cursor-pointer flex items-center gap-2 shrink-0">
                                  <Upload className="w-3.5 h-3.5" />
                                  <span>{isUploadingWritingImg ? 'Yuklanmoqda...' : 'Rasm Yuklash (.png/.jpg)'}</span>
                                  <input
                                    type="file"
                                    accept="image/*"
                                    onChange={handleWritingImageUpload}
                                    className="hidden"
                                    disabled={isUploadingWritingImg}
                                  />
                                </label>
                                <input
                                  type="text"
                                  value={writingImageUrl}
                                  onChange={(e) => setWritingImageUrl(e.target.value)}
                                  placeholder="Yoki to‘g‘ridan-to‘g‘ri rasm URL manzilini kiriting..."
                                  className="flex-1 w-full px-3 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-xs bg-slate-50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                />
                              </div>
                              {writingImageUrl && (
                                <div className="mt-2 p-2 bg-slate-100 dark:bg-slate-900 rounded-xl max-w-xs">
                                  <img src={writingImageUrl} alt="Task preview" className="w-full h-auto rounded-lg object-contain max-h-40" />
                                </div>
                              )}
                            </div>
                          )}

                          {/* Points and Submit */}
                          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pt-2">
                            <div className="flex items-center gap-2">
                              <label className="text-xs font-bold text-slate-700 dark:text-slate-300 whitespace-nowrap">
                                Ball:
                              </label>
                              <input
                                type="number"
                                min="1"
                                max="50"
                                value={questionPoints}
                                onChange={(e) => setQuestionPoints(parseInt(e.target.value) || 1)}
                                className="w-20 px-3 py-1.5 rounded-lg border border-slate-300 dark:border-slate-700 text-xs bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 font-bold"
                              />
                            </div>

                            <button
                              type="submit"
                              className="px-6 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-md transition-all flex items-center justify-center gap-2 cursor-pointer"
                            >
                              <Plus className="w-4 h-4" />
                              <span>Savolni Saqlash</span>
                            </button>
                          </div>
                        </form>
                      </div>
                    )}
                  </div>
                );
              })
            )}
          </div>
        </section>
      )}
        </>
      )}
    </div>
  );
}
