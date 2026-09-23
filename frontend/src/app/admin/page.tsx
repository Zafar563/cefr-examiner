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
  getCurrentStoredUser,
  Test,
  Section,
  Question,
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
} from 'lucide-react';

export default function AdminPage() {
  const router = useRouter();
  const [mounted, setMounted] = useState(false);
  const [tests, setTests] = useState<Test[]>([]);
  const [loading, setLoading] = useState(true);

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

  // New question form
  const [selectedSectionIdForQuestion, setSelectedSectionIdForQuestion] = useState<number | null>(null);
  const [newQuestionType, setNewQuestionType] = useState('single_choice');
  const [newQuestionText, setNewQuestionText] = useState('');
  const [optA, setOptA] = useState('');
  const [optB, setOptB] = useState('');
  const [optC, setOptC] = useState('');
  const [optD, setOptD] = useState('');
  const [correctAnswer, setCorrectAnswer] = useState('');
  const [questionPoints, setQuestionPoints] = useState(5);

  useEffect(() => {
    setMounted(true);
    const user = getCurrentStoredUser();
    if (!user || user.role !== 'admin') {
      alert('Ushbu sahifaga faqat Admin huquqiga ega foydalanuvchilar kira oladi');
      router.push('/login');
      return;
    }
    loadTests();
  }, [router]);

  const loadTests = async () => {
    setLoading(true);
    try {
      const data = await apiGetTests();
      setTests(Array.isArray(data) ? data : []);
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

  const handleCreateQuestion = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedSectionIdForQuestion) return;

    const options = [optA, optB, optC, optD].filter((o) => o.trim() !== '');

    try {
      await apiCreateQuestion(selectedSectionIdForQuestion, {
        question_type: newQuestionType,
        question_text: newQuestionText,
        options,
        correct_answer: correctAnswer,
        points: questionPoints,
        order_index: 1,
      });
      alert('Savol muvaffaqiyatli qo‘shildi!');
      setSelectedSectionIdForQuestion(null);
      setNewQuestionText('');
      setOptA('');
      setOptB('');
      setOptC('');
      setOptD('');
      setCorrectAnswer('');
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
          <div className="bg-white rounded-2xl max-w-lg w-full p-6 space-y-4 shadow-xl border border-slate-100">
            <h3 className="text-lg font-bold text-slate-900">Yangi CEFR Test Yaratish</h3>
            <form onSubmit={handleCreateTest} className="space-y-4">
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">Test Nomi</label>
                <input
                  type="text"
                  required
                  value={newTitle}
                  onChange={(e) => setNewTitle(e.target.value)}
                  placeholder="Masalan, CEFR Mock Exam #2 (2026 Edition)"
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">Tavsif</label>
                <textarea
                  rows={3}
                  value={newDesc}
                  onChange={(e) => setNewDesc(e.target.value)}
                  placeholder="Test haqida ma'lumot..."
                  className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none"
                />
              </div>

              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-xs font-bold text-slate-700 mb-1">Davomiyligi (daqiqa)</label>
                  <input
                    type="number"
                    value={newDuration}
                    onChange={(e) => setNewDuration(parseInt(e.target.value) || 120)}
                    className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none"
                  />
                </div>
                <div>
                  <label className="block text-xs font-bold text-slate-700 mb-1">Daraja</label>
                  <input
                    type="text"
                    value={newLevel}
                    onChange={(e) => setNewLevel(e.target.value)}
                    className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none"
                  />
                </div>
              </div>

              <div className="flex gap-2 pt-2">
                <button
                  type="button"
                  onClick={() => setShowNewTest(false)}
                  className="flex-1 py-2.5 rounded-xl border border-slate-300 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-all"
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

      {/* Tests Management List */}
      <section className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm space-y-4">
        <h2 className="text-lg font-bold text-slate-900">Mavjud Testlar Ro‘yxati</h2>

        <div className="divide-y divide-slate-100">
          {tests.map((test) => (
            <div
              key={test.id}
              className={`py-4 first:pt-0 p-3 rounded-xl transition-all ${
                selectedTest?.id === test.id ? 'bg-emerald-50/50 border border-emerald-200' : ''
              }`}
            >
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                  <div className="flex items-center gap-2">
                    <span className="font-bold text-slate-900 text-base">{test.title}</span>
                    <span className="px-2 py-0.5 rounded text-xs font-bold bg-emerald-50 text-emerald-700 border border-emerald-200">
                      {test.level}
                    </span>
                  </div>
                  <p className="text-xs text-slate-500 mt-1">{test.description}</p>
                  <span className="text-xs text-slate-400 mt-1 block">Davomiyligi: {test.duration_minutes} daqiqa</span>
                </div>

                <div className="flex items-center gap-2">
                  <button
                    onClick={() => handleSelectTest(test.id)}
                    className="px-3.5 py-2 rounded-xl text-xs font-semibold bg-emerald-600 text-white hover:bg-emerald-700 transition-colors shadow-sm flex items-center gap-1.5"
                  >
                    <BookOpen className="w-3.5 h-3.5" /> Bo‘limlar va Savollar
                  </button>
                  <button
                    onClick={() => handleDeleteTest(test.id)}
                    className="p-2 text-slate-400 hover:text-rose-600 hover:bg-rose-50 rounded-xl transition-colors"
                    title="Testni o‘chirish"
                  >
                    <Trash2 className="w-4 h-4" />
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* Selected Test Sections & Questions Inspector */}
      {selectedTest && (
        <section className="bg-white rounded-2xl border-2 border-emerald-600/40 p-6 shadow-sm space-y-6">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-4 border-b border-slate-100">
            <div>
              <span className="text-xs font-bold uppercase text-emerald-600">Tanlangan Test:</span>
              <h2 className="text-xl font-extrabold text-slate-900">{selectedTest.title}</h2>
            </div>

            <div className="flex gap-2">
              <button
                onClick={() => setShowAddSection(true)}
                className="px-3.5 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
              >
                <Plus className="w-4 h-4" /> Yangi Bo‘lim Qo‘shish
              </button>
              <button
                onClick={() => setSelectedTest(null)}
                className="px-3 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl text-xs font-semibold transition-colors"
              >
                Yopish
              </button>
            </div>
          </div>

          {/* Add Section Form (Modal / Inline) */}
          {showAddSection && (
            <div className="bg-slate-50 border border-slate-200 rounded-2xl p-5 space-y-4">
              <div className="flex items-center justify-between">
                <h3 className="text-sm font-bold text-slate-900">Yangi Bo‘lim (Section) Qo‘shish</h3>
                <button onClick={() => setShowAddSection(false)} className="text-xs text-slate-400 hover:text-slate-600 font-bold">Bekor qilish</button>
              </div>

              <form onSubmit={handleCreateSection} className="space-y-4">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-bold text-slate-700 mb-1">Bo‘lim turi</label>
                    <select
                      value={sectionType}
                      onChange={(e) => setSectionType(e.target.value)}
                      className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white font-medium"
                    >
                      <option value="reading">📖 Reading (Split-screen matn va savollar)</option>
                      <option value="listening">🎧 Listening (Audio eshitish)</option>
                      <option value="writing">✍️ Writing (Insho matn muharriri)</option>
                      <option value="speaking">🎙️ Speaking (Ovoz yozish)</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-xs font-bold text-slate-700 mb-1">Bo‘lim Sarlavhasi</label>
                    <input
                      type="text"
                      required
                      value={sectionTitle}
                      onChange={(e) => setSectionTitle(e.target.value)}
                      placeholder="Masalan, Section 2: Reading Comprehension"
                      className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none"
                    />
                  </div>
                </div>

                <div>
                  <label className="block text-xs font-bold text-slate-700 mb-1">Ko‘rsatma (Instructions)</label>
                  <input
                    type="text"
                    value={sectionInstructions}
                    onChange={(e) => setSectionInstructions(e.target.value)}
                    placeholder="Talaba uchun ko‘rsatma..."
                    className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none"
                  />
                </div>

                {sectionType === 'reading' && (
                  <div className="p-4 bg-emerald-50/60 rounded-xl border border-emerald-200 space-y-2">
                    <label className="block text-xs font-bold text-emerald-950">
                      📖 Reading Passage (Talaba chap tomonda o‘qiydigan matn):
                    </label>
                    <p className="text-xs text-emerald-800">
                      Ushbu maydonga kiritilgan matn test topshirishda chap tomonda mustaqil scroll bilan chiqadi.
                    </p>
                    <textarea
                      rows={8}
                      required
                      value={passageText}
                      onChange={(e) => setPassageText(e.target.value)}
                      placeholder="Reading matnini (maqola, insho yoki hikoyani) shu yerga to‘liq joylashtiring..."
                      className="w-full p-3.5 rounded-xl border border-slate-300 text-xs focus:ring-2 focus:ring-emerald-500 outline-none bg-white leading-relaxed font-sans"
                    />
                  </div>
                )}

                {sectionType === 'listening' && (
                  <div className="p-4 bg-blue-50/60 rounded-xl border border-blue-200 space-y-3">
                    <span className="text-xs font-bold text-blue-900 block">Listening Audio Faylini Yuklash</span>
                    <input
                      type="file"
                      accept="audio/*"
                      onChange={handleAudioFileUpload}
                      className="text-xs text-slate-600"
                    />
                    {isUploadingAudio && <p className="text-xs text-blue-600 font-semibold">Audio yuklanmoqda...</p>}
                    {audioUrl && (
                      <p className="text-xs text-emerald-700 font-semibold">
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
            <h3 className="text-base font-bold text-slate-900">Ushbu Testdagi Bo‘limlar:</h3>

            {(!selectedTest.sections || selectedTest.sections.length === 0) ? (
              <p className="text-xs text-slate-500 py-6 text-center bg-slate-50 rounded-xl">
                Ushbu testda hali bo‘limlar mavjud emas. Yuqoridagi tugma orqali Reading yoki Listening bo‘limini qo‘shing.
              </p>
            ) : (
              selectedTest.sections.map((sec, secIdx) => {
                const isReading = sec.type === 'reading';
                const questions = sec.questions || [];

                return (
                  <div key={sec.id} className="border border-slate-200 rounded-2xl p-5 space-y-4 bg-white shadow-sm">
                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 pb-3 border-b border-slate-100">
                      <div className="flex items-center gap-2">
                        <span className="px-2.5 py-1 rounded-md text-xs font-bold uppercase bg-slate-100 text-slate-700">
                          {sec.type}
                        </span>
                        <h4 className="font-bold text-slate-900 text-sm">{sec.title}</h4>
                      </div>

                      <button
                        onClick={() => setSelectedSectionIdForQuestion(sec.id)}
                        className="px-3 py-1.5 bg-emerald-50 text-emerald-700 hover:bg-emerald-100 rounded-lg text-xs font-bold transition-colors flex items-center gap-1.5 self-start sm:self-auto"
                      >
                        <Plus className="w-3.5 h-3.5" /> Savol Qo‘shish
                      </button>
                    </div>

                    {/* Reading Passage Preview */}
                    {isReading && (
                      <div className="bg-emerald-50/50 p-4 rounded-xl border border-emerald-100 space-y-1">
                        <span className="text-xs font-bold text-emerald-900 block">
                          📖 Chap tomonda chiqadigan matn (Reading Passage):
                        </span>
                        <p className="text-xs text-slate-700 line-clamp-3 leading-relaxed">
                          {sec.passage_text || 'Matn kiritilmagan'}
                        </p>
                      </div>
                    )}

                    {/* Questions in Section */}
                    <div className="space-y-3">
                      <span className="text-xs font-bold text-slate-500 block">
                        O‘ng tomonda chiqadigan savollar ({questions.length} ta):
                      </span>

                      {questions.length === 0 ? (
                        <p className="text-xs text-slate-400 italic">Hali savollar qo‘shilmagan.</p>
                      ) : (
                        <div className="space-y-2">
                          {questions.map((q, qIdx) => (
                            <div key={q.id || qIdx} className="p-3 bg-slate-50 rounded-xl border border-slate-200 text-xs space-y-1">
                              <div className="flex items-center justify-between font-semibold text-slate-900">
                                <span>#{qIdx + 1}. {q.question_text}</span>
                                <span className="text-emerald-700">{q.points} ball</span>
                              </div>
                              {q.options && q.options.length > 0 && (
                                <div className="text-slate-500 pl-3">
                                  Variantlar: {q.options.join(' | ')}
                                </div>
                              )}
                              {q.correct_answer && (
                                <div className="text-emerald-800 font-semibold pl-3">
                                  To‘g‘ri javob: {q.correct_answer}
                                </div>
                              )}
                            </div>
                          ))}
                        </div>
                      )}
                    </div>

                    {/* Add Question to this Section Form */}
                    {selectedSectionIdForQuestion === sec.id && (
                      <div className="mt-4 pt-4 border-t border-slate-200 p-4 bg-slate-50 rounded-xl space-y-4">
                        <div className="flex items-center justify-between">
                          <h5 className="text-xs font-bold text-slate-900 uppercase">
                            Yangi Savol Qo‘shish ({sec.title})
                          </h5>
                          <button
                            onClick={() => setSelectedSectionIdForQuestion(null)}
                            className="text-xs text-slate-400 hover:text-slate-600 font-bold"
                          >
                            Bekor qilish
                          </button>
                        </div>

                        <form onSubmit={handleCreateQuestion} className="space-y-3">
                          <div>
                            <label className="block text-xs font-semibold text-slate-700 mb-1">Savol matni:</label>
                            <input
                              type="text"
                              required
                              value={newQuestionText}
                              onChange={(e) => setNewQuestionText(e.target.value)}
                              placeholder="Masalan: According to paragraph 1, why was..."
                              className="w-full px-3 py-2 rounded-xl border border-slate-300 text-xs focus:ring-2 focus:ring-emerald-500 outline-none bg-white"
                            />
                          </div>

                          <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                            <div>
                              <label className="block text-xs font-semibold text-slate-600 mb-1">Variant A:</label>
                              <input
                                type="text"
                                required
                                value={optA}
                                onChange={(e) => setOptA(e.target.value)}
                                placeholder="1-variant matni"
                                className="w-full px-3 py-1.5 rounded-lg border border-slate-300 text-xs bg-white"
                              />
                            </div>
                            <div>
                              <label className="block text-xs font-semibold text-slate-600 mb-1">Variant B:</label>
                              <input
                                type="text"
                                required
                                value={optB}
                                onChange={(e) => setOptB(e.target.value)}
                                placeholder="2-variant matni"
                                className="w-full px-3 py-1.5 rounded-lg border border-slate-300 text-xs bg-white"
                              />
                            </div>
                            <div>
                              <label className="block text-xs font-semibold text-slate-600 mb-1">Variant C:</label>
                              <input
                                type="text"
                                value={optC}
                                onChange={(e) => setOptC(e.target.value)}
                                placeholder="3-variant matni (ixtiyoriy)"
                                className="w-full px-3 py-1.5 rounded-lg border border-slate-300 text-xs bg-white"
                              />
                            </div>
                            <div>
                              <label className="block text-xs font-semibold text-slate-600 mb-1">Variant D:</label>
                              <input
                                type="text"
                                value={optD}
                                onChange={(e) => setOptD(e.target.value)}
                                placeholder="4-variant matni (ixtiyoriy)"
                                className="w-full px-3 py-1.5 rounded-lg border border-slate-300 text-xs bg-white"
                              />
                            </div>
                          </div>

                          <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-1">
                            <div>
                              <label className="block text-xs font-bold text-emerald-900 mb-1">To‘g‘ri javob (aynan matni):</label>
                              <input
                                type="text"
                                required
                                value={correctAnswer}
                                onChange={(e) => setCorrectAnswer(e.target.value)}
                                placeholder="To‘g‘ri variant matnini shu yerga yozing"
                                className="w-full px-3 py-2 rounded-xl border border-emerald-300 text-xs focus:ring-2 focus:ring-emerald-500 outline-none bg-emerald-50/30 font-semibold"
                              />
                            </div>
                            <div>
                              <label className="block text-xs font-bold text-slate-700 mb-1">Beriladigan ball:</label>
                              <input
                                type="number"
                                min="1"
                                value={questionPoints}
                                onChange={(e) => setQuestionPoints(parseInt(e.target.value) || 5)}
                                className="w-full px-3 py-2 rounded-xl border border-slate-300 text-xs bg-white"
                              />
                            </div>
                          </div>

                          <button
                            type="submit"
                            className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all"
                          >
                            Savolni Saqlash
                          </button>
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
    </div>
  );
}
