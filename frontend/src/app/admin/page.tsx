'use client';

import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import {
  apiGetTests,
  apiCreateTest,
  apiDeleteTest,
  apiCreateSection,
  apiCreateQuestion,
  apiUploadAudio,
  getCurrentStoredUser,
  Test,
} from '@/lib/api';
import { Settings, Plus, Trash2, Upload, FileAudio, BookOpen, CheckCircle2, ChevronDown } from 'lucide-react';

export default function AdminPage() {
  const router = useRouter();
  const [tests, setTests] = useState<Test[]>([]);
  const [loading, setLoading] = useState(true);

  // New test modal/form
  const [showNewTest, setShowNewTest] = useState(false);
  const [newTitle, setNewTitle] = useState('');
  const [newDesc, setNewDesc] = useState('');
  const [newDuration, setNewDuration] = useState(120);
  const [newLevel, setNewLevel] = useState('Multi-level (A1-C1)');

  // Quick section/question addition
  const [selectedTestId, setSelectedTestId] = useState<number | null>(null);
  const [sectionType, setSectionType] = useState('listening');
  const [sectionTitle, setSectionTitle] = useState('');
  const [sectionInstructions, setSectionInstructions] = useState('');
  const [passageText, setPassageText] = useState('');
  const [audioUrl, setAudioUrl] = useState('');
  const [isUploadingAudio, setIsUploadingAudio] = useState(false);

  useEffect(() => {
    const user = getCurrentStoredUser();
    if (!user || user.role !== 'admin') {
      alert('Ushbu sahifaga faqat Admin huquqiga ega foydalanuvchilar kira oladi');
      router.push('/login');
      return;
    }
    loadTests();
  }, []);

  const loadTests = async () => {
    setLoading(true);
    try {
      const data = await apiGetTests();
      setTests(data);
    } catch (e: any) {
      alert('Testlarni yuklashda xatolik: ' + e.message);
    } finally {
      setLoading(false);
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
    if (!selectedTestId) return;

    try {
      await apiCreateSection(selectedTestId, {
        type: sectionType,
        title: sectionTitle,
        instructions: sectionInstructions,
        audio_url: audioUrl || null,
        passage_text: passageText || null,
        order_index: 1,
      });
      alert('Bo‘lim testga qo‘shildi!');
      setSectionTitle('');
      setSectionInstructions('');
      setPassageText('');
      setAudioUrl('');
      loadTests();
    } catch (e: any) {
      alert('Bo‘lim qo‘shishda xatolik: ' + e.message);
    }
  };

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
            CEFR testlarini yaratish, bo‘limlar va savollarni tahrirlash hamda audiolarni boshqarish.
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
            <div key={test.id} className="py-4 first:pt-0 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
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
                  onClick={() => setSelectedTestId(test.id)}
                  className="px-3.5 py-2 rounded-xl text-xs font-semibold bg-emerald-50 text-emerald-700 hover:bg-emerald-100 transition-colors"
                >
                  Bo‘lim qo‘shish
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
          ))}
        </div>
      </section>

      {/* Add Section Form (When a test is selected) */}
      {selectedTestId && (
        <section className="bg-white rounded-2xl border-2 border-emerald-500/40 p-6 shadow-sm space-y-5">
          <div className="flex items-center justify-between pb-3 border-b border-slate-100">
            <h3 className="text-base font-bold text-slate-900">
              Test #{selectedTestId} uchun yangi bo‘lim (Section) qo‘shish
            </h3>
            <button
              onClick={() => setSelectedTestId(null)}
              className="text-xs text-slate-400 hover:text-slate-600 font-semibold"
            >
              Yopish
            </button>
          </div>

          <form onSubmit={handleCreateSection} className="space-y-4">
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">Bo‘lim turi</label>
                <select
                  value={sectionType}
                  onChange={(e) => setSectionType(e.target.value)}
                  className="w-full px-3.5 py-2 rounded-xl border border-slate-300 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white"
                >
                  <option value="listening">Listening</option>
                  <option value="reading">Reading</option>
                  <option value="writing">Writing</option>
                  <option value="speaking">Speaking</option>
                </select>
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">Bo‘lim Sarlavhasi</label>
                <input
                  type="text"
                  required
                  value={sectionTitle}
                  onChange={(e) => setSectionTitle(e.target.value)}
                  placeholder="Masalan, Section 1: Listening Comprehension"
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

            {sectionType === 'reading' && (
              <div>
                <label className="block text-xs font-bold text-slate-700 mb-1">Reading Passage (Matn)</label>
                <textarea
                  rows={6}
                  value={passageText}
                  onChange={(e) => setPassageText(e.target.value)}
                  placeholder="Reading matnini bu yerga joylang..."
                  className="w-full p-3.5 rounded-xl border border-slate-300 text-xs focus:ring-2 focus:ring-emerald-500 outline-none"
                />
              </div>
            )}

            <button
              type="submit"
              className="py-2.5 px-5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all"
            >
              Bo‘limni Saqlash
            </button>
          </form>
        </section>
      )}
    </div>
  );
}
