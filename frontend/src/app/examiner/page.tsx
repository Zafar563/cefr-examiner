'use client';

import React, { useEffect, useState, useRef } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import {
  apiGetExaminerSubmissions,
  apiGetSession,
  apiGradeAnswer,
  apiGetTests,
  apiCreateExamRoom,
  apiGetExamRoom,
  apiListExaminerRooms,
  apiStartExamRoom,
  apiCompleteExamRoom,
  getCurrentStoredUser,
  TestSession,
  Answer,
  Test,
  ExamRoom,
  RoomParticipantInfo,
  User,
} from '@/lib/api';
import {
  CheckSquare,
  Headphones,
  FileText,
  Send,
  CheckCircle2,
  User as UserIcon,
  Clock,
  AlertCircle,
  Users,
  Plus,
  Play,
  Check,
  Copy,
  ExternalLink,
  RefreshCw,
  Sparkles,
  BookOpen,
  Edit3,
  Mic,
  Zap,
  Lock,
  X,
  Layers,
  Award,
} from 'lucide-react';

export default function ExaminerPage() {
  const router = useRouter();
  const [user, setUser] = useState<User | null>(null);
  const [activeTab, setActiveTab] = useState<'rooms' | 'grading'>('rooms');
  const [loading, setLoading] = useState(true);

  // Tests list for room creation selector
  const [tests, setTests] = useState<Test[]>([]);

  // Rooms state
  const [rooms, setRooms] = useState<ExamRoom[]>([]);
  const [selectedRoom, setSelectedRoom] = useState<ExamRoom | null>(null);
  const [creatingRoom, setCreatingRoom] = useState(false);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [copiedPin, setCopiedPin] = useState(false);

  // New room form state
  const [newTitle, setNewTitle] = useState('');
  const [newModuleType, setNewModuleType] = useState('reading');
  const [newTestId, setNewTestId] = useState<number | undefined>(undefined);
  const [newDuration, setNewDuration] = useState(60);

  // Manual grading state
  const [submissions, setSubmissions] = useState<TestSession[]>([]);
  const [selectedSession, setSelectedSession] = useState<TestSession | null>(null);
  const [gradingScores, setGradingScores] = useState<Record<number, number>>({});
  const [gradingFeedback, setGradingFeedback] = useState<Record<number, string>>({});
  const [savingGradeId, setSavingGradeId] = useState<number | null>(null);
  const [gradingFilter, setGradingFilter] = useState<'all' | 'pending' | 'graded'>('all');
  const [gradeSuccessToast, setGradeSuccessToast] = useState<string | null>(null);
  const [gradeValidationError, setGradeValidationError] = useState<string | null>(null);

  const roomPollRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    const currentUser = getCurrentStoredUser();
    setUser(currentUser);
    if (!currentUser || (currentUser.role !== 'examiner' && currentUser.role !== 'admin')) {
      alert('This page is accessible only to Examiners or Admins.');
      router.push('/login');
      return;
    }
    loadInitialData();
  }, []);

  const loadInitialData = async () => {
    setLoading(true);
    try {
      const [subs, allTests, allRooms] = await Promise.all([
        apiGetExaminerSubmissions().catch(() => []),
        apiGetTests().catch(() => []),
        apiListExaminerRooms().catch(() => []),
      ]);
      setSubmissions(subs);
      setTests(allTests);
      setRooms(allRooms);
      if (allRooms.length > 0 && !selectedRoom && activeTab === 'rooms') {
        const active = allRooms.find((r) => r.status === 'in_progress' || r.status === 'waiting');
        if (active) {
          fetchRoomDetails(active.pin_code);
        }
      }
    } catch (e: any) {
      console.error('Failed to load examiner data:', e);
    } finally {
      setLoading(false);
    }
  };

  const fetchRoomDetails = async (pin: string) => {
    try {
      const detailed = await apiGetExamRoom(pin);
      setSelectedRoom(detailed);
    } catch (e) {
      console.error('Failed to load room details:', e);
    }
  };

  // Auto poll active room only when on rooms tab and status is active
  useEffect(() => {
    if (!selectedRoom || selectedRoom.status === 'completed' || activeTab !== 'rooms') {
      if (roomPollRef.current) {
        clearInterval(roomPollRef.current);
        roomPollRef.current = null;
      }
      return;
    }

    roomPollRef.current = setInterval(async () => {
      if (typeof document !== 'undefined' && document.hidden) return;

      try {
        const updated = await apiGetExamRoom(selectedRoom.pin_code);
        setSelectedRoom(updated);
        if (updated.status === 'completed' && roomPollRef.current) {
          clearInterval(roomPollRef.current);
          roomPollRef.current = null;
        }
      } catch (err) {}
    }, 3000);

    return () => {
      if (roomPollRef.current) {
        clearInterval(roomPollRef.current);
        roomPollRef.current = null;
      }
    };
  }, [selectedRoom?.pin_code, selectedRoom?.status, activeTab]);

  const handleCreateRoom = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newTitle.trim()) {
      alert('Please enter a room title');
      return;
    }

    setCreatingRoom(true);
    try {
      const room = await apiCreateExamRoom({
        title: newTitle.trim(),
        module_type: newModuleType,
        test_id: newTestId,
        duration_minutes: newDuration,
      });
      setShowCreateModal(false);
      setNewTitle('');
      await loadInitialData();
      await fetchRoomDetails(room.pin_code);
      alert(`Exam Room created successfully with PIN: ${room.pin_code}`);
    } catch (e: any) {
      alert('Failed to create room: ' + e.message);
    } finally {
      setCreatingRoom(false);
    }
  };

  const handleStartExam = async (roomId: number) => {
    if (!confirm('Are you sure you want to start the exam for all connected candidates?')) {
      return;
    }
    try {
      const updated = await apiStartExamRoom(roomId);
      setSelectedRoom(updated);
      alert('Exam started! All connected candidate screens are launching the test.');
      loadInitialData();
    } catch (e: any) {
      alert('Failed to start exam: ' + e.message);
    }
  };

  const handleCompleteExam = async (roomId: number) => {
    if (!confirm('Are you sure you want to finish and lock this exam session?')) {
      return;
    }
    try {
      const updated = await apiCompleteExamRoom(roomId);
      setSelectedRoom(updated);
      if (roomPollRef.current) {
        clearInterval(roomPollRef.current);
        roomPollRef.current = null;
      }
      alert('Exam completed and locked.');
      loadInitialData();
    } catch (e: any) {
      alert('Failed to complete exam: ' + e.message);
    }
  };

  const handleCopyPin = (pin: string) => {
    navigator.clipboard.writeText(pin);
    setCopiedPin(true);
    setTimeout(() => setCopiedPin(false), 2000);
  };

  // Manual grading methods
  const handleSelectSession = async (session: TestSession) => {
    try {
      const fullDetails = await apiGetSession(session.id);
      setSelectedSession(fullDetails);
      const scores: Record<number, number> = {};
      const feedback: Record<number, string> = {};
      fullDetails.answers?.forEach((ans) => {
        const k = ans.id > 0 ? ans.id : ans.question_id;
        if (ans.is_graded) {
          scores[k] = ans.score;
          feedback[k] = ans.examiner_feedback || '';
        }
      });
      setGradingScores(scores);
      setGradingFeedback(feedback);
    } catch (e: any) {
      alert('Error opening session details: ' + e.message);
    }
  };

  const handleSaveGrade = async (answerId: number, questionId?: number) => {
    const key = answerId > 0 ? answerId : (questionId || 0);
    const rawScore = gradingScores[key];
    if (rawScore === undefined || isNaN(rawScore)) {
      setGradeValidationError('Please enter a valid band score between 0.0 and 9.0.');
      setTimeout(() => setGradeValidationError(null), 4000);
      return;
    }
    const score = Number(rawScore);
    if (score < 0 || score > 9) {
      setGradeValidationError('Band score must be between 0.0 and 9.0 (IELTS/CEFR standard scale).');
      setTimeout(() => setGradeValidationError(null), 4000);
      return;
    }
    const feedback = (gradingFeedback[key] || '').trim();
    setSavingGradeId(key);
    setGradeValidationError(null);
    try {
      await apiGradeAnswer(answerId, score, feedback, selectedSession?.id, questionId);
      setGradeSuccessToast(`Band Score (${score}) and examiner feedback saved successfully!`);
      setTimeout(() => setGradeSuccessToast(null), 4000);
      if (selectedSession) {
        handleSelectSession(selectedSession);
      }
      loadInitialData();
    } catch (e: any) {
      setGradeValidationError('Error submitting grade: ' + e.message);
      setTimeout(() => setGradeValidationError(null), 4000);
    } finally {
      setSavingGradeId(null);
    }
  };

  if (loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-10 h-10 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
        <p className="text-slate-600 dark:text-slate-400 font-medium">Loading Examiner Hub...</p>
      </div>
    );
  }

  const filteredTests = tests.filter((t) => {
    if (newModuleType === 'mock') return t.title.toLowerCase().includes('mock');
    return t.title.toLowerCase().includes(newModuleType);
  });

  return (
    <div className="space-y-8 py-4 max-w-7xl mx-auto">
      {/* 1. Header Banner */}
      <div className="relative overflow-hidden rounded-3xl bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 text-white p-6 sm:p-9 shadow-xl border border-white/10 flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
        <div className="space-y-2">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-indigo-500/20 text-indigo-300 border border-indigo-500/30 text-xs font-black uppercase tracking-wider">
            <Users className="w-3.5 h-3.5" />
            <span>Examiner Control Center</span>
          </div>
          <h1 className="text-2xl sm:text-3xl lg:text-4xl font-black tracking-tight flex items-center gap-3">
            Live Group Exam Hub & Evaluation
          </h1>
          <p className="text-slate-300 text-xs sm:text-sm max-w-2xl leading-relaxed">
            Manage live synchronous exam rooms with 6-digit PIN codes, monitor student progress in real time, and grade essay/speaking submissions.
          </p>
        </div>

        {/* Tab switch buttons */}
        <div className="flex items-center gap-2 p-1.5 rounded-2xl bg-white/10 backdrop-blur-md border border-white/10 shrink-0">
          <button
            onClick={() => setActiveTab('rooms')}
            className={`px-4 py-2.5 rounded-xl text-xs sm:text-sm font-black transition-all flex items-center gap-2 cursor-pointer ${
              activeTab === 'rooms'
                ? 'bg-blue-600 text-white shadow-md'
                : 'text-slate-300 hover:text-white hover:bg-white/5'
            }`}
          >
            <Users className="w-4 h-4" />
            <span>Live Group Rooms</span>
            <span className="px-2 py-0.5 rounded-full bg-white/20 text-[10px] font-bold">
              {rooms.length}
            </span>
          </button>

          <button
            onClick={() => setActiveTab('grading')}
            className={`px-4 py-2.5 rounded-xl text-xs sm:text-sm font-black transition-all flex items-center gap-2 cursor-pointer ${
              activeTab === 'grading'
                ? 'bg-indigo-600 text-white shadow-md'
                : 'text-slate-300 hover:text-white hover:bg-white/5'
            }`}
          >
            <CheckSquare className="w-4 h-4" />
            <span>Manual Grading</span>
            <span className="px-2 py-0.5 rounded-full bg-amber-400 text-slate-900 text-[10px] font-bold">
              {submissions.length}
            </span>
          </button>
        </div>
      </div>

      {/* 2. TAB 1: LIVE GROUP EXAM ROOMS */}
      {activeTab === 'rooms' && (
        <div className="space-y-6">
          {/* Top action row */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
            <div>
              <h2 className="text-xl sm:text-2xl font-black text-slate-900 dark:text-white tracking-tight">
                Live Examination Sessions
              </h2>
              <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400">
                Launch test rooms, share PIN codes with students, and proctor exams synchronously.
              </p>
            </div>

            <button
              onClick={() => setShowCreateModal(true)}
              className="px-6 py-3 rounded-2xl bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-black text-xs sm:text-sm uppercase tracking-wider shadow-lg shadow-blue-500/20 transition-all flex items-center gap-2 cursor-pointer active:scale-95 shrink-0"
            >
              <Plus className="w-4 h-4" />
              <span>Create New Exam Room</span>
            </button>
          </div>

          {/* Active Room Proctoring Panel */}
          {selectedRoom ? (
            <div className="rounded-3xl border border-slate-200/80 dark:border-white/10 bg-white/80 dark:bg-slate-900/70 p-6 sm:p-8 backdrop-blur-xl shadow-xl space-y-6">
              {/* Room Header Row */}
              <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-6 pb-6 border-b border-slate-200 dark:border-white/10">
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <span
                      className={`px-3 py-1 rounded-full text-[11px] font-black uppercase tracking-wider ${
                        selectedRoom.status === 'waiting'
                          ? 'bg-amber-100 text-amber-800 dark:bg-amber-950/60 dark:text-amber-300'
                          : selectedRoom.status === 'in_progress'
                          ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950/60 dark:text-emerald-300 animate-pulse'
                          : 'bg-slate-100 text-slate-700 dark:bg-slate-800 dark:text-slate-300'
                      }`}
                    >
                      ● {selectedRoom.status.replace('_', ' ')}
                    </span>
                    <span className="text-xs text-slate-400 font-bold uppercase tracking-wider">
                      {selectedRoom.module_type} Module · {selectedRoom.duration_minutes} Mins
                    </span>
                  </div>
                  <h3 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white tracking-tight">
                    {selectedRoom.title}
                  </h3>
                  <p className="text-xs sm:text-sm text-slate-500">
                    Test Variant: <strong>{selectedRoom.test_title || 'Dynamic Mock Test'}</strong>
                  </p>
                </div>

                {/* PIN Code Box */}
                <div className="flex items-center gap-4 p-4 rounded-2xl bg-blue-50/70 dark:bg-blue-950/40 border border-blue-200 dark:border-blue-900/60 shrink-0">
                  <div>
                    <span className="text-[10px] font-black uppercase tracking-wider text-slate-400 block">
                      STUDENT ACCESS PIN
                    </span>
                    <span className="text-3xl sm:text-4xl font-mono font-black text-blue-600 dark:text-sky-400 tracking-widest">
                      {selectedRoom.pin_code}
                    </span>
                  </div>
                  <button
                    onClick={() => handleCopyPin(selectedRoom.pin_code)}
                    className="p-3 rounded-xl bg-white dark:bg-slate-800 text-blue-600 dark:text-sky-400 shadow-sm hover:scale-105 transition-all cursor-pointer"
                    title="Copy PIN Code"
                  >
                    {copiedPin ? <Check className="w-5 h-5 text-emerald-500" /> : <Copy className="w-5 h-5" />}
                  </button>
                </div>
              </div>

              {/* Action Buttons Row */}
              <div className="flex flex-wrap items-center justify-between gap-4">
                <div className="flex items-center gap-2">
                  {selectedRoom.status === 'waiting' && (
                    <button
                      onClick={() => handleStartExam(selectedRoom.id)}
                      className="px-6 py-3 rounded-2xl bg-emerald-600 hover:bg-emerald-700 text-white font-black text-xs sm:text-sm uppercase tracking-wider shadow-lg shadow-emerald-600/25 transition-all flex items-center gap-2 cursor-pointer active:scale-95"
                    >
                      <Play className="w-4 h-4 fill-white" />
                      <span>Start Exam for All Candidates ({(selectedRoom.participants || []).length})</span>
                    </button>
                  )}

                  {selectedRoom.status === 'in_progress' && (
                    <button
                      onClick={() => handleCompleteExam(selectedRoom.id)}
                      className="px-6 py-3 rounded-2xl bg-rose-600 hover:bg-rose-700 text-white font-black text-xs sm:text-sm uppercase tracking-wider shadow-lg shadow-rose-600/25 transition-all flex items-center gap-2 cursor-pointer active:scale-95"
                    >
                      <Lock className="w-4 h-4" />
                      <span>Finish & Lock Examination</span>
                    </button>
                  )}

                  <button
                    onClick={() => fetchRoomDetails(selectedRoom.pin_code)}
                    className="px-4 py-3 rounded-2xl bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 font-bold text-xs sm:text-sm hover:bg-slate-200 dark:hover:bg-slate-700 transition-all flex items-center gap-2 cursor-pointer"
                  >
                    <RefreshCw className="w-4 h-4" />
                    <span>Refresh</span>
                  </button>

                  <button
                    onClick={() => {
                      setSelectedRoom(null);
                      if (roomPollRef.current) {
                        clearInterval(roomPollRef.current);
                        roomPollRef.current = null;
                      }
                    }}
                    className="px-4 py-3 rounded-2xl border border-slate-200 dark:border-slate-700 text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-800 font-bold text-xs sm:text-sm transition-all flex items-center gap-1.5 cursor-pointer"
                  >
                    <X className="w-4 h-4" />
                    <span>Close</span>
                  </button>
                </div>

                <div className="text-xs text-slate-500 dark:text-slate-400 font-medium">
                  Direct Student Link:{' '}
                  <code className="px-2 py-1 rounded bg-slate-100 dark:bg-slate-800 font-mono text-[11px] text-blue-600 dark:text-sky-400">
                    /student/live?pin={selectedRoom.pin_code}
                  </code>
                </div>
              </div>

              {/* Participants Live Table */}
              <div className="space-y-3 pt-2">
                <div className="flex items-center justify-between">
                  <h4 className="text-sm font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 flex items-center gap-2">
                    <Users className="w-4 h-4 text-blue-500" />
                    <span>Connected Candidates ({(selectedRoom.participants || []).length})</span>
                  </h4>
                  <span className="text-xs text-slate-400">
                    Auto-updating every 2.5s
                  </span>
                </div>

                {(!selectedRoom.participants || selectedRoom.participants.length === 0) ? (
                  <div className="py-12 text-center rounded-2xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
                    <Users className="w-10 h-10 text-slate-400 mx-auto mb-2 opacity-50" />
                    <p className="font-bold text-sm">No candidates have joined yet.</p>
                    <p className="text-xs text-slate-400 mt-1">
                      Ask your students to enter PIN <strong>{selectedRoom.pin_code}</strong> at <strong>/student/live</strong>.
                    </p>
                  </div>
                ) : (
                  <div className="overflow-x-auto rounded-2xl border border-slate-200 dark:border-white/10">
                    <table className="w-full text-left text-xs sm:text-sm">
                      <thead className="bg-slate-50 dark:bg-slate-800/80 text-[11px] font-black uppercase tracking-wider text-slate-500 border-b border-slate-200 dark:border-white/10">
                        <tr>
                          <th className="py-3 px-4">#</th>
                          <th className="py-3 px-4">Candidate Name</th>
                          <th className="py-3 px-4">Email Address</th>
                          <th className="py-3 px-4">Status</th>
                          <th className="py-3 px-4">Answers</th>
                          <th className="py-3 px-4">Score & CEFR</th>
                          <th className="py-3 px-4 text-right">Action</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-100 dark:divide-white/5">
                        {selectedRoom.participants.map((p, idx) => (
                          <tr key={p.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-800/40 transition-colors">
                            <td className="py-3.5 px-4 font-mono font-bold text-slate-400">{idx + 1}</td>
                            <td className="py-3.5 px-4 font-bold text-slate-900 dark:text-white">{p.student_name}</td>
                            <td className="py-3.5 px-4 text-slate-500 font-mono text-xs">{p.student_email}</td>
                            <td className="py-3.5 px-4">
                              <span
                                className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-[10px] font-black uppercase ${
                                  p.status === 'submitted' || p.status === 'graded'
                                    ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950/60 dark:text-emerald-300'
                                    : p.status === 'in_progress'
                                    ? 'bg-blue-100 text-blue-800 dark:bg-blue-950/60 dark:text-blue-300'
                                    : 'bg-amber-100 text-amber-800 dark:bg-amber-950/60 dark:text-amber-300'
                                }`}
                              >
                                {p.status}
                              </span>
                            </td>
                            <td className="py-3.5 px-4 font-bold text-slate-700 dark:text-slate-300">
                              {p.answers_count} answered
                            </td>
                            <td className="py-3.5 px-4 font-black">
                              {p.cefr_level ? (
                                <span className="px-2 py-0.5 rounded-md bg-amber-500 text-white text-xs">
                                  {p.cefr_level} ({p.score} pts)
                                </span>
                              ) : (
                                <span className="text-slate-400 font-normal text-xs">—</span>
                              )}
                            </td>
                            <td className="py-3.5 px-4 text-right">
                              {p.session_id && (
                                <Link
                                  href={`/student/results/${p.session_id}`}
                                  target="_blank"
                                  className="text-xs font-bold text-blue-600 dark:text-sky-400 hover:underline inline-flex items-center gap-1"
                                >
                                  <span>View Result</span>
                                  <ExternalLink className="w-3.5 h-3.5" />
                                </Link>
                              )}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                )}
              </div>
            </div>
          ) : (
            <div className="p-12 text-center rounded-3xl border border-dashed border-slate-300 dark:border-slate-700 bg-white/50 dark:bg-slate-900/40">
              <p className="font-bold text-slate-700 dark:text-slate-300">No active room selected.</p>
              <p className="text-xs text-slate-400 mt-1">Create a new exam room above to generate a student PIN code.</p>
            </div>
          )}

          {/* Rooms History Grid */}
          <div className="space-y-4 pt-4">
            <h3 className="text-lg font-black text-slate-900 dark:text-white">
              All Rooms Created by You ({rooms.length})
            </h3>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {rooms.map((r) => (
                <div
                  key={r.id}
                  onClick={() => fetchRoomDetails(r.pin_code)}
                  className={`p-5 rounded-2xl border transition-all cursor-pointer ${
                    selectedRoom?.id === r.id
                      ? 'bg-blue-50/70 dark:bg-blue-950/40 border-blue-400 dark:border-blue-700 shadow-md ring-2 ring-blue-500/20'
                      : 'bg-white dark:bg-slate-900 border-slate-200 dark:border-white/10 hover:border-slate-300'
                  }`}
                >
                  <div className="flex items-center justify-between gap-2">
                    <span className="text-xs font-mono font-black text-blue-600 dark:text-sky-400 bg-blue-100/60 dark:bg-blue-900/40 px-2.5 py-1 rounded-lg">
                      PIN: {r.pin_code}
                    </span>
                    <span className="text-[10px] font-black uppercase px-2 py-0.5 rounded-full bg-slate-100 dark:bg-slate-800 text-slate-500">
                      {r.status}
                    </span>
                  </div>
                  <h4 className="font-black text-slate-900 dark:text-white text-base mt-2.5 line-clamp-1">
                    {r.title}
                  </h4>
                  <p className="text-xs text-slate-500 mt-0.5">
                    {r.module_type.toUpperCase()} · {r.duration_minutes}m · {r.participants?.length || 0} candidates
                  </p>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}

      {/* 3. TAB 2: MANUAL GRADING */}
      {activeTab === 'grading' && (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Left Column: Submissions List with Filters */}
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-white/10 p-5 shadow-xs space-y-4">
            <div className="flex items-center justify-between border-b border-slate-100 dark:border-white/10 pb-3">
              <h2 className="text-base font-black text-slate-900 dark:text-white">
                Submissions
              </h2>
              <span className="text-xs font-bold text-slate-400">
                {submissions.length} Total
              </span>
            </div>

            {/* Submissions Filter Pills */}
            <div className="flex items-center gap-1.5 p-1 bg-slate-100 dark:bg-slate-800 rounded-xl text-xs font-bold">
              {[
                { id: 'all', label: 'All' },
                { id: 'pending', label: 'Submitted' },
                { id: 'graded', label: 'Graded' },
              ].map((f) => (
                <button
                  key={f.id}
                  onClick={() => setGradingFilter(f.id as any)}
                  className={`flex-1 py-1.5 rounded-lg transition-all cursor-pointer text-center font-bold ${
                    gradingFilter === f.id
                      ? 'bg-white dark:bg-slate-900 text-indigo-600 dark:text-indigo-400 shadow-xs'
                      : 'text-slate-500 hover:text-slate-700 dark:hover:text-slate-300'
                  }`}
                >
                  {f.label}
                </button>
              ))}
            </div>

            {submissions.filter((s) => {
              if (gradingFilter === 'pending') return s.status === 'submitted';
              if (gradingFilter === 'graded') return s.status === 'graded';
              return true;
            }).length === 0 ? (
              <p className="text-xs text-slate-500 py-8 text-center">
                No submissions found for the selected filter.
              </p>
            ) : (
              <div className="space-y-2 max-h-[700px] overflow-y-auto pr-1">
                {submissions
                  .filter((s) => {
                    if (gradingFilter === 'pending') return s.status === 'submitted';
                    if (gradingFilter === 'graded') return s.status === 'graded';
                    return true;
                  })
                  .map((sub) => {
                    const isWriting = sub.test_title?.toLowerCase().includes('writing');
                    const isSpeaking = sub.test_title?.toLowerCase().includes('speaking');
                    const isMock = sub.test_title?.toLowerCase().includes('mock');

                    return (
                      <div
                        key={sub.id}
                        onClick={() => handleSelectSession(sub)}
                        className={`p-4 rounded-2xl border text-xs cursor-pointer transition-all ${
                          selectedSession?.id === sub.id
                            ? 'border-indigo-600 bg-indigo-50/50 dark:bg-indigo-950/40 ring-2 ring-indigo-500/20'
                            : 'border-slate-200 dark:border-white/10 hover:border-slate-300 dark:hover:border-slate-700 bg-white/50 dark:bg-slate-800/40'
                        }`}
                      >
                        <div className="flex justify-between items-center mb-1">
                          <span className="font-black text-slate-900 dark:text-white truncate max-w-[160px]">
                            {sub.student_name || 'Candidate'}
                          </span>
                          <span className="text-slate-400 font-mono text-[10px]">#{sub.id}</span>
                        </div>
                        <div className="text-slate-500 dark:text-slate-400 font-medium truncate mb-2">
                          {sub.test_title}
                        </div>
                        <div className="flex items-center justify-between text-[10px]">
                          <span
                            className={`px-2 py-0.5 rounded-full font-black uppercase ${
                              sub.status === 'graded'
                                ? 'bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-400'
                                : 'bg-amber-100 dark:bg-amber-950/60 text-amber-700 dark:text-amber-400'
                            }`}
                          >
                            ● {sub.status}
                          </span>
                          <span className="text-slate-400 font-bold uppercase">
                            {isWriting ? 'Writing' : isSpeaking ? 'Speaking' : isMock ? 'Mock' : 'Auto-Graded'}
                          </span>
                        </div>
                      </div>
                    );
                  })}
              </div>
            )}
          </div>

          {/* Right Column: Evaluation & Review Panel */}
          <div className="lg:col-span-2 space-y-4">
            {gradeSuccessToast && (
              <div className="p-4 rounded-2xl bg-emerald-50 dark:bg-emerald-950/60 border border-emerald-200 dark:border-emerald-800 text-emerald-800 dark:text-emerald-200 text-xs sm:text-sm font-bold flex items-center gap-2.5 animate-in fade-in duration-150">
                <CheckCircle2 className="w-5 h-5 text-emerald-600 dark:text-emerald-400 shrink-0" />
                <span>{gradeSuccessToast}</span>
              </div>
            )}

            {gradeValidationError && (
              <div className="p-4 rounded-2xl bg-rose-50 dark:bg-rose-950/60 border border-rose-200 dark:border-rose-800 text-rose-800 dark:text-rose-200 text-xs sm:text-sm font-bold flex items-center gap-2.5 animate-in fade-in duration-150">
                <AlertCircle className="w-5 h-5 text-rose-600 dark:text-rose-400 shrink-0" />
                <span>{gradeValidationError}</span>
              </div>
            )}

            {selectedSession ? (
              <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-white/10 p-6 sm:p-7 shadow-xs space-y-6">
                {/* Session Header */}
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border-b border-slate-100 dark:border-white/10 pb-4">
                  <div>
                    <div className="flex items-center gap-2">
                      <h2 className="text-lg font-black text-slate-900 dark:text-white">
                        Candidate: {selectedSession.student_name || 'Candidate'}
                      </h2>
                      <span className="text-xs text-slate-400 font-mono">({selectedSession.student_email})</span>
                    </div>
                    <p className="text-xs text-slate-500 mt-0.5">
                      Exam: <strong>{selectedSession.test_title}</strong> · Session #{selectedSession.id}
                    </p>
                  </div>

                  <div className="flex items-center gap-2 shrink-0">
                    <span
                      className={`px-3 py-1 rounded-full text-xs font-black uppercase tracking-wider ${
                        selectedSession.status === 'graded'
                          ? 'bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-800'
                          : 'bg-amber-50 dark:bg-amber-950/60 text-amber-700 dark:text-amber-400 border border-amber-200 dark:border-amber-800'
                      }`}
                    >
                      Status: {selectedSession.status}
                    </span>
                    <Link
                      href={`/student/results/${selectedSession.id}`}
                      target="_blank"
                      className="px-3.5 py-1.5 rounded-xl border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800 text-xs font-bold inline-flex items-center gap-1.5 transition-all"
                    >
                      <ExternalLink className="w-3.5 h-3.5" />
                      <span>Results Page</span>
                    </Link>
                  </div>
                </div>

                {/* Check if there are Writing/Speaking tasks for manual grading */}
                {(() => {
                  const manualAnswers = (selectedSession.answers || []).filter(
                    (a) =>
                      a.section_type === 'writing' ||
                      a.section_type === 'speaking' ||
                      !!a.audio_file_url ||
                      (!!a.user_answer_text && a.user_answer_text.length > 50)
                  );

                  if (manualAnswers.length > 0) {
                    return (
                      <div className="space-y-6">
                        <div className="text-xs font-extrabold uppercase tracking-wider text-indigo-600 dark:text-indigo-400">
                          Tasks Requiring Examiner Evaluation ({manualAnswers.length})
                        </div>

                        {manualAnswers.map((ans) => {
                          const wordCount = ans.user_answer_text ? ans.user_answer_text.trim().split(/\s+/).filter(Boolean).length : 0;

                          return (
                            <div
                              key={ans.id}
                              className="p-5 rounded-2xl border border-slate-200 dark:border-white/10 bg-slate-50/50 dark:bg-slate-800/40 space-y-4"
                            >
                              <div className="flex items-center justify-between">
                                <span className="px-2.5 py-1 rounded-lg text-[10px] font-black uppercase tracking-wider bg-indigo-100 dark:bg-indigo-950/80 text-indigo-700 dark:text-indigo-300">
                                  {ans.section_type} Task
                                </span>
                                {ans.is_graded && (
                                  <span className="text-xs font-bold text-emerald-600 dark:text-emerald-400 flex items-center gap-1">
                                    <CheckCircle2 className="w-3.5 h-3.5" /> Graded: {ans.score} / 9.0
                                  </span>
                                )}
                              </div>

                              <h4 className="text-sm font-bold text-slate-900 dark:text-white leading-relaxed">
                                {ans.question_text}
                              </h4>

                              {ans.user_answer_text && (
                                <div className="space-y-1.5">
                                  <div className="flex justify-between items-center text-[10px] font-bold text-slate-400 uppercase">
                                    <span>Candidate Submitted Text:</span>
                                    <span>{wordCount} Words</span>
                                  </div>
                                  <div className="p-4 rounded-xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-white/10 text-xs sm:text-sm whitespace-pre-wrap leading-relaxed shadow-inner">
                                    {ans.user_answer_text}
                                  </div>
                                </div>
                              )}

                              {ans.audio_file_url && (
                                <div className="space-y-1.5">
                                  <span className="text-[10px] font-bold text-slate-400 uppercase">
                                    Candidate Audio Recording:
                                  </span>
                                  <audio controls className="w-full h-11 rounded-xl">
                                    <source src={ans.audio_file_url} />
                                  </audio>
                                </div>
                              )}

                              {(() => {
                                const itemKey = ans.id > 0 ? ans.id : ans.question_id;
                                return (
                                  <div className="pt-2 flex flex-col sm:flex-row items-end sm:items-center gap-3">
                                    <div className="w-full sm:w-36">
                                      <label className="text-[10px] font-black text-slate-500 block uppercase mb-1">
                                        Band Score (0–9)
                                      </label>
                                      <input
                                        type="number"
                                        step="0.5"
                                        min="0"
                                        max="9"
                                        placeholder="e.g. 6.5"
                                        value={gradingScores[itemKey] ?? ''}
                                        onChange={(e) =>
                                          setGradingScores({ ...gradingScores, [itemKey]: parseFloat(e.target.value) })
                                        }
                                        className="w-full px-3 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-bold"
                                      />
                                    </div>

                                    <div className="flex-1 w-full">
                                      <label className="text-[10px] font-black text-slate-500 block uppercase mb-1">
                                        Examiner Feedback
                                      </label>
                                      <input
                                        type="text"
                                        placeholder="Add evaluation feedback..."
                                        value={gradingFeedback[itemKey] || ''}
                                        onChange={(e) =>
                                          setGradingFeedback({ ...gradingFeedback, [itemKey]: e.target.value })
                                        }
                                        className="w-full px-3 py-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-medium"
                                      />
                                    </div>

                                    <button
                                      onClick={() => handleSaveGrade(ans.id, ans.question_id)}
                                      disabled={savingGradeId === itemKey}
                                      className="px-5 py-2.5 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white font-black text-xs uppercase tracking-wider transition-all cursor-pointer shrink-0 disabled:opacity-50"
                                    >
                                      {savingGradeId === itemKey ? 'Saving...' : 'Save Grade'}
                                    </button>
                                  </div>
                                );
                              })()}
                            </div>
                          );
                        })}
                      </div>
                    );
                  }

                  // Auto-graded submission (Reading / Listening)
                  const totalAnswers = selectedSession.answers?.length || 0;
                  const answeredCount = selectedSession.answers?.filter((a) => a.user_answer_text?.trim()).length || 0;
                  const totalEarnedPoints = selectedSession.answers?.reduce((acc, a) => acc + (a.score || 0), 0) || 0;

                  return (
                    <div className="space-y-6">
                      <div className="p-6 rounded-2xl bg-emerald-50/60 dark:bg-emerald-950/30 border border-emerald-200/80 dark:border-emerald-800/60 flex flex-col sm:flex-row items-start sm:items-center gap-4">
                        <div className="p-3 rounded-2xl bg-emerald-600 text-white shadow-md">
                          <CheckCircle2 className="w-8 h-8" />
                        </div>
                        <div className="space-y-1">
                          <h3 className="text-base font-black text-slate-900 dark:text-white">
                            Automated Evaluation Complete
                          </h3>
                          <p className="text-xs text-slate-600 dark:text-slate-300 leading-relaxed">
                            This submission consists exclusively of objective questions (Reading / Listening) that are verified and scored automatically against official answer keys. No manual grading is required.
                          </p>
                        </div>
                      </div>

                      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                        <div className="p-4 rounded-2xl border border-slate-200 dark:border-white/10 bg-slate-50 dark:bg-slate-800/40 text-center">
                          <div className="text-[10px] font-black uppercase text-slate-400">Total Items</div>
                          <div className="text-xl font-black text-slate-900 dark:text-white mt-1">{totalAnswers}</div>
                        </div>
                        <div className="p-4 rounded-2xl border border-slate-200 dark:border-white/10 bg-slate-50 dark:bg-slate-800/40 text-center">
                          <div className="text-[10px] font-black uppercase text-slate-400">Answered</div>
                          <div className="text-xl font-black text-indigo-600 dark:text-indigo-400 mt-1">{answeredCount}</div>
                        </div>
                        <div className="p-4 rounded-2xl border border-slate-200 dark:border-white/10 bg-slate-50 dark:bg-slate-800/40 text-center">
                          <div className="text-[10px] font-black uppercase text-slate-400">Score Earned</div>
                          <div className="text-xl font-black text-emerald-600 dark:text-emerald-400 mt-1">{totalEarnedPoints} pts</div>
                        </div>
                        <div className="p-4 rounded-2xl border border-slate-200 dark:border-white/10 bg-slate-50 dark:bg-slate-800/40 text-center">
                          <div className="text-[10px] font-black uppercase text-slate-400">Awarded Level</div>
                          <div className="text-xl font-black text-purple-600 dark:text-purple-400 mt-1">
                            {selectedSession.result?.cefr_level || 'Evaluated'}
                          </div>
                        </div>
                      </div>

                      {/* Answer overview table */}
                      <div className="space-y-3 pt-2">
                        <div className="flex items-center justify-between">
                          <h4 className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300">
                            Objective Answers Breakdown
                          </h4>
                          <Link
                            href={`/student/results/${selectedSession.id}`}
                            target="_blank"
                            className="text-xs font-bold text-indigo-600 dark:text-indigo-400 hover:underline inline-flex items-center gap-1"
                          >
                            <span>Open Detailed Breakdown</span>
                            <ExternalLink className="w-3 h-3" />
                          </Link>
                        </div>

                        <div className="max-h-96 overflow-y-auto rounded-2xl border border-slate-200 dark:border-white/10 divide-y divide-slate-100 dark:divide-white/5">
                          {(selectedSession.answers || []).map((ans, idx) => (
                            <div key={ans.id} className="p-3.5 text-xs flex items-center justify-between gap-4 hover:bg-slate-50/50 dark:hover:bg-slate-800/30">
                              <div className="space-y-0.5 flex-1 min-w-0">
                                <div className="font-bold text-slate-900 dark:text-white truncate">
                                  #{idx + 1}. {ans.question_text || `Question ${idx + 1}`}
                                </div>
                                <div className="text-slate-500 text-[11px]">
                                  Submitted: <span className="font-mono font-bold text-slate-700 dark:text-slate-300">{ans.user_answer_text || '— (No answer)'}</span>
                                  {ans.correct_answer && (
                                    <> · Correct: <span className="font-mono text-emerald-600 dark:text-emerald-400 font-bold">{ans.correct_answer}</span></>
                                  )}
                                </div>
                              </div>
                              <span
                                className={`px-2 py-0.5 rounded-md font-bold text-[10px] uppercase shrink-0 ${
                                  ans.score > 0
                                    ? 'bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-400'
                                    : 'bg-rose-100 dark:bg-rose-950/60 text-rose-700 dark:text-rose-400'
                                }`}
                              >
                                {ans.score > 0 ? `+${ans.score} Correct` : '0 Pts'}
                              </span>
                            </div>
                          ))}
                        </div>
                      </div>
                    </div>
                  );
                })()}
              </div>
            ) : (
              <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-white/10 p-12 text-center text-slate-500">
                <p className="font-bold">Select a submission from the left list to begin evaluation or review.</p>
              </div>
            )}
          </div>
        </div>
      )}

      {/* CREATE ROOM MODAL */}
      {showCreateModal && (
        <div className="fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 animate-in fade-in duration-200">
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-white/10 p-6 sm:p-8 max-w-lg w-full shadow-2xl space-y-6">
            <div className="flex items-center justify-between pb-4 border-b border-slate-100 dark:border-white/10">
              <div className="flex items-center gap-2">
                <div className="p-2 rounded-xl bg-blue-50 dark:bg-blue-950/60 text-blue-600 dark:text-sky-400">
                  <Plus className="w-5 h-5" />
                </div>
                <div>
                  <h3 className="text-lg font-black text-slate-900 dark:text-white">
                    Create Live Exam Room
                  </h3>
                  <p className="text-xs text-slate-500">Generate a PIN for group test participation</p>
                </div>
              </div>
              <button
                onClick={() => setShowCreateModal(false)}
                className="text-slate-400 hover:text-slate-600 text-sm font-bold cursor-pointer"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleCreateRoom} className="space-y-4">
              <div>
                <label className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 block mb-1.5">
                  Room Title
                </label>
                <input
                  type="text"
                  required
                  placeholder="e.g. Group A — Cambridge 18 Reading Mock"
                  value={newTitle}
                  onChange={(e) => setNewTitle(e.target.value)}
                  className="w-full px-4 py-3 rounded-2xl border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-800/80 text-sm font-bold focus:outline-none focus:border-blue-500"
                />
              </div>

              <div>
                <label className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 block mb-1.5">
                  Module Direction
                </label>
                <div className="grid grid-cols-3 gap-2">
                  {[
                    { id: 'mock', label: 'Full Mock' },
                    { id: 'listening', label: 'Listening' },
                    { id: 'reading', label: 'Reading' },
                    { id: 'writing', label: 'Writing' },
                    { id: 'speaking', label: 'Speaking' },
                  ].map((m) => (
                    <button
                      key={m.id}
                      type="button"
                      onClick={() => {
                        setNewModuleType(m.id);
                        setNewTestId(undefined);
                      }}
                      className={`py-2 px-3 rounded-xl text-xs font-black transition-all cursor-pointer border ${
                        newModuleType === m.id
                          ? 'bg-blue-600 text-white border-blue-600 shadow-sm'
                          : 'bg-slate-50 dark:bg-slate-800/60 border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-300'
                      }`}
                    >
                      {m.label}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 block mb-1.5">
                  Select Specific Test Variant (Optional)
                </label>
                <select
                  value={newTestId ?? ''}
                  onChange={(e) => setNewTestId(e.target.value ? parseInt(e.target.value, 10) : undefined)}
                  className="w-full px-4 py-3 rounded-2xl border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-800/80 text-xs sm:text-sm font-bold focus:outline-none focus:border-blue-500"
                >
                  <option value="">Dynamic Random Variant (Recommended)</option>
                  {filteredTests.map((t) => (
                    <option key={t.id} value={t.id}>
                      {t.title}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 block mb-1.5">
                  Duration (Minutes)
                </label>
                <input
                  type="number"
                  min="5"
                  max="240"
                  value={newDuration}
                  onChange={(e) => setNewDuration(parseInt(e.target.value, 10) || 60)}
                  className="w-full px-4 py-3 rounded-2xl border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-800/80 text-sm font-bold focus:outline-none focus:border-blue-500"
                />
              </div>

              <div className="pt-4 flex items-center justify-end gap-3">
                <button
                  type="button"
                  onClick={() => setShowCreateModal(false)}
                  className="px-5 py-2.5 rounded-xl text-xs font-bold text-slate-500 hover:text-slate-800 cursor-pointer"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  disabled={creatingRoom}
                  className="px-6 py-3 rounded-2xl bg-blue-600 hover:bg-blue-700 text-white font-black text-xs uppercase tracking-wider shadow-lg shadow-blue-600/25 transition-all cursor-pointer"
                >
                  {creatingRoom ? 'Generating PIN...' : 'Launch Room & Generate PIN'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
