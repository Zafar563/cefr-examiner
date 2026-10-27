'use client';

import React, { useEffect, useState, useRef, Suspense } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import {
  apiGetExamRoom,
  apiJoinExamRoom,
  getCurrentStoredUser,
  ExamRoom,
  RoomParticipantInfo,
  User,
} from '@/lib/api';
import {
  Users,
  Shield,
  KeyRound,
  ArrowRight,
  Clock,
  CheckCircle2,
  AlertCircle,
  Sparkles,
  Headphones,
  BookOpen,
  Edit3,
  Mic,
  Zap,
} from 'lucide-react';

function LiveExamContent() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const initialPin = searchParams.get('pin') || '';

  const [user, setUser] = useState<User | null>(null);
  const [pinInput, setPinInput] = useState(initialPin);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // Active room state
  const [activeRoom, setActiveRoom] = useState<ExamRoom | null>(null);
  const [participant, setParticipant] = useState<RoomParticipantInfo | null>(null);
  const [startingCountdown, setStartingCountdown] = useState<number | null>(null);

  const pollIntervalRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    const currentUser = getCurrentStoredUser();
    setUser(currentUser);
    if (!currentUser) {
      router.push(`/login?redirect=/student/live${initialPin ? `?pin=${initialPin}` : ''}`);
      return;
    }

    if (initialPin) {
      handleJoin(initialPin);
    }
  }, []);

  const handleJoin = async (pinToUse?: string) => {
    const pin = (pinToUse || pinInput).trim();
    if (!pin || pin.length < 4) {
      setError('Please enter a valid 6-digit room PIN.');
      return;
    }

    setLoading(true);
    setError('');

    try {
      const res = await apiJoinExamRoom(pin);
      setActiveRoom(res.room);
      setParticipant(res.participant);

      // If room is already in progress, launch immediately
      if (res.room.status === 'in_progress' && res.participant?.session_id) {
        router.push(`/student/test/${res.participant.session_id}`);
        return;
      }
    } catch (e: any) {
      setError(e.message || 'Failed to join room. Please check the PIN code.');
    } finally {
      setLoading(false);
    }
  };

  // Poll room status while in lobby
  useEffect(() => {
    if (!activeRoom || activeRoom.status === 'completed') {
      if (pollIntervalRef.current) {
        clearInterval(pollIntervalRef.current);
        pollIntervalRef.current = null;
      }
      return;
    }

    pollIntervalRef.current = setInterval(async () => {
      if (typeof document !== 'undefined' && document.hidden) return;

      try {
        const updated = await apiGetExamRoom(activeRoom.pin_code);
        setActiveRoom(updated);

        // If examiner completed or closed the room, stop polling immediately
        if (updated.status === 'completed') {
          if (pollIntervalRef.current) {
            clearInterval(pollIntervalRef.current);
            pollIntervalRef.current = null;
          }
          return;
        }

        // Find current user's participant record
        if (user && updated.participants) {
          const myPart = updated.participants.find((p) => p.student_id === user.id);
          if (myPart) {
            setParticipant(myPart);
            if (updated.status === 'in_progress' && myPart.session_id) {
              if (pollIntervalRef.current) {
                clearInterval(pollIntervalRef.current);
                pollIntervalRef.current = null;
              }
              setStartingCountdown(3);
              setTimeout(() => {
                router.push(`/student/test/${myPart.session_id}`);
              }, 1500);
            }
          }
        }
      } catch (err) {
        console.error('Polling error:', err);
      }
    }, 2500);

    return () => {
      if (pollIntervalRef.current) {
        clearInterval(pollIntervalRef.current);
        pollIntervalRef.current = null;
      }
    };
  }, [activeRoom?.pin_code, activeRoom?.status, user?.id]);

  const getModuleIcon = (type: string) => {
    switch (type) {
      case 'listening':
        return <Headphones className="w-5 h-5 text-cyan-500" />;
      case 'reading':
        return <BookOpen className="w-5 h-5 text-emerald-500" />;
      case 'writing':
        return <Edit3 className="w-5 h-5 text-rose-500" />;
      case 'speaking':
        return <Mic className="w-5 h-5 text-purple-500" />;
      default:
        return <Zap className="w-5 h-5 text-amber-500" />;
    }
  };

  return (
    <div className="max-w-3xl mx-auto py-8 sm:py-14 px-4">
      {!activeRoom ? (
        // 1. PIN INPUT FORM
        <div className="relative overflow-hidden rounded-3xl border border-slate-200/80 dark:border-white/10 bg-white/80 dark:bg-slate-900/70 p-7 sm:p-12 backdrop-blur-xl shadow-2xl text-center space-y-8">
          <div className="mx-auto w-16 h-16 rounded-3xl bg-blue-500/10 dark:bg-sky-400/10 text-blue-600 dark:text-sky-400 flex items-center justify-center ring-1 ring-blue-500/20 shadow-md">
            <KeyRound className="w-8 h-8" />
          </div>

          <div className="space-y-2">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold bg-blue-50 dark:bg-blue-950/60 text-blue-600 dark:text-sky-400 uppercase tracking-wider">
              <Users className="w-3.5 h-3.5" />
              <span>Live Group Examination</span>
            </span>
            <h1 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
              Join Exam Room
            </h1>
            <p className="text-sm sm:text-base text-slate-600 dark:text-slate-400 max-w-md mx-auto leading-relaxed">
              Enter the 6-digit PIN code provided by your instructor or examiner to participate in the synchronous group test.
            </p>
          </div>

          <form
            onSubmit={(e) => {
              e.preventDefault();
              handleJoin();
            }}
            className="max-w-md mx-auto space-y-4"
          >
            <div>
              <input
                type="text"
                maxLength={6}
                value={pinInput}
                onChange={(e) => setPinInput(e.target.value.replace(/\D/g, ''))}
                placeholder="Enter 6-Digit PIN"
                className="w-full text-center text-3xl sm:text-4xl font-mono font-black tracking-widest py-4 px-6 rounded-2xl border-2 border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-800/80 text-slate-900 dark:text-white focus:outline-none focus:border-blue-500 dark:focus:border-sky-400 shadow-inner uppercase transition-all"
                autoFocus
              />
            </div>

            {error && (
              <div className="p-3.5 rounded-2xl bg-rose-50 dark:bg-rose-950/40 border border-rose-200 dark:border-rose-900/60 text-xs sm:text-sm font-bold text-rose-600 dark:text-rose-400 flex items-center justify-center gap-2">
                <AlertCircle className="w-4 h-4 shrink-0" />
                <span>{error}</span>
              </div>
            )}

            <button
              type="submit"
              disabled={loading || pinInput.length < 4}
              className="w-full py-4 rounded-2xl bg-gradient-to-r from-blue-600 via-indigo-600 to-sky-600 text-white font-black text-sm sm:text-base uppercase tracking-wider shadow-xl shadow-blue-500/25 hover:shadow-2xl hover:shadow-blue-500/35 transition-all flex items-center justify-center gap-2 disabled:opacity-50 cursor-pointer active:scale-95"
            >
              {loading ? (
                <>
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                  <span>Connecting to Room...</span>
                </>
              ) : (
                <>
                  <span>Enter Examination Room</span>
                  <ArrowRight className="w-5 h-5" />
                </>
              )}
            </button>
          </form>

          <div className="pt-4 border-t border-slate-100 dark:border-white/5 flex items-center justify-center gap-6 text-xs text-slate-500 dark:text-slate-400">
            <span className="flex items-center gap-1.5 font-medium">
              <Shield className="w-4 h-4 text-emerald-500" />
              <span>Verified Session Security</span>
            </span>
            <span className="flex items-center gap-1.5 font-medium">
              <Clock className="w-4 h-4 text-blue-500" />
              <span>Official Exam Timing</span>
            </span>
          </div>
        </div>
      ) : (
        // 2. LIVE WAITING ROOM / LOBBY
        <div className="relative overflow-hidden rounded-3xl border border-slate-200/80 dark:border-white/10 bg-white/80 dark:bg-slate-900/70 p-7 sm:p-10 backdrop-blur-xl shadow-2xl space-y-8">
          {/* Header Banner */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-6 border-b border-slate-200 dark:border-white/10">
            <div>
              <div className="flex items-center gap-2">
                <span className="flex h-2.5 w-2.5 rounded-full bg-emerald-500 animate-ping" />
                <span className="text-xs font-black uppercase tracking-wider text-emerald-600 dark:text-emerald-400">
                  CONNECTED TO LIVE ROOM
                </span>
              </div>
              <h2 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white tracking-tight mt-1">
                {activeRoom.title}
              </h2>
              <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-0.5">
                Examiner: <strong className="text-slate-700 dark:text-slate-200">{activeRoom.examiner_name || 'Senior Examiner'}</strong>
              </p>
            </div>

            <div className="flex items-center gap-3">
              <div className="text-right">
                <span className="text-[10px] font-black uppercase tracking-wider text-slate-400 block">
                  ROOM PIN
                </span>
                <span className="text-2xl sm:text-3xl font-mono font-black text-blue-600 dark:text-sky-400 tracking-wider">
                  {activeRoom.pin_code}
                </span>
              </div>
            </div>
          </div>

          {/* Status Display */}
          {startingCountdown !== null ? (
            <div className="p-8 rounded-3xl bg-emerald-50 dark:bg-emerald-950/40 border border-emerald-300 dark:border-emerald-700 text-center space-y-3 animate-in zoom-in-95 duration-300">
              <div className="w-16 h-16 rounded-full bg-emerald-500 text-white font-black text-2xl flex items-center justify-center mx-auto shadow-lg shadow-emerald-500/30 animate-pulse">
                GO!
              </div>
              <h3 className="text-xl sm:text-2xl font-black text-emerald-800 dark:text-emerald-200">
                Examination Started!
              </h3>
              <p className="text-xs sm:text-sm text-emerald-700 dark:text-emerald-300 font-medium">
                Redirecting you to the official test simulator now...
              </p>
            </div>
          ) : activeRoom.status === 'completed' ? (
            <div className="p-8 rounded-3xl bg-slate-100 dark:bg-slate-800/80 border border-slate-200 dark:border-white/10 text-center space-y-4">
              <div className="w-14 h-14 rounded-full bg-slate-200 dark:bg-slate-700 text-slate-500 flex items-center justify-center mx-auto">
                <CheckCircle2 className="w-7 h-7" />
              </div>
              <div>
                <h3 className="text-lg sm:text-xl font-bold text-slate-900 dark:text-white">
                  This Exam Session Has Concluded
                </h3>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1 max-w-md mx-auto">
                  The examiner has completed and locked this exam session.
                </p>
              </div>
              <button
                onClick={() => {
                  setActiveRoom(null);
                  setParticipant(null);
                  if (pollIntervalRef.current) clearInterval(pollIntervalRef.current);
                }}
                className="px-6 py-2.5 rounded-full bg-slate-900 hover:bg-slate-800 dark:bg-white dark:hover:bg-slate-200 text-white dark:text-slate-900 font-bold text-xs uppercase cursor-pointer"
              >
                Return to PIN Entry
              </button>
            </div>
          ) : (
            <div className="p-8 rounded-3xl bg-slate-50/80 dark:bg-slate-800/50 border border-slate-200/80 dark:border-white/10 text-center space-y-4">
              <div className="relative mx-auto w-16 h-16 flex items-center justify-center">
                <div className="absolute inset-0 rounded-full border-4 border-blue-500/20 border-t-blue-500 animate-spin" />
                <div className="w-10 h-10 rounded-full bg-blue-500/10 flex items-center justify-center text-blue-600 dark:text-sky-400">
                  <Users className="w-5 h-5" />
                </div>
              </div>

              <div>
                <h3 className="text-lg sm:text-xl font-bold text-slate-900 dark:text-white">
                  Waiting for Examiner to Begin the Examination...
                </h3>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1 max-w-md mx-auto leading-relaxed">
                  Your screen will automatically transition to the official test page as soon as the examiner launches the session. Please do not close or reload this page.
                </p>
              </div>

              <div className="flex flex-col sm:flex-row items-center justify-center gap-3">
                <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-blue-100/70 dark:bg-blue-950/60 text-blue-700 dark:text-sky-300 text-xs font-bold">
                  <span className="w-2 h-2 rounded-full bg-blue-500 animate-pulse" />
                  <span>{(activeRoom.participants || []).length} Candidates In Waiting Room</span>
                </div>
                <button
                  onClick={() => {
                    setActiveRoom(null);
                    setParticipant(null);
                    if (pollIntervalRef.current) clearInterval(pollIntervalRef.current);
                  }}
                  className="text-xs font-bold text-slate-500 hover:text-rose-600 underline cursor-pointer"
                >
                  Leave Waiting Room
                </button>
              </div>
            </div>
          )}

          {/* Room Details & Exam Protocol */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div className="p-4 rounded-2xl bg-white/50 dark:bg-slate-800/40 border border-slate-200/60 dark:border-white/5 flex items-center gap-3">
              <div className="p-2.5 rounded-xl bg-slate-100 dark:bg-white/10">
                {getModuleIcon(activeRoom.module_type)}
              </div>
              <div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-slate-400 block">
                  MODULE TYPE
                </span>
                <span className="text-sm font-bold text-slate-800 dark:text-slate-200 uppercase">
                  {activeRoom.module_type}
                </span>
              </div>
            </div>

            <div className="p-4 rounded-2xl bg-white/50 dark:bg-slate-800/40 border border-slate-200/60 dark:border-white/5 flex items-center gap-3">
              <div className="p-2.5 rounded-xl bg-slate-100 dark:bg-white/10 text-amber-500">
                <Clock className="w-5 h-5" />
              </div>
              <div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-slate-400 block">
                  DURATION
                </span>
                <span className="text-sm font-bold text-slate-800 dark:text-slate-200">
                  {activeRoom.duration_minutes} Minutes
                </span>
              </div>
            </div>

            <div className="p-4 rounded-2xl bg-white/50 dark:bg-slate-800/40 border border-slate-200/60 dark:border-white/5 flex items-center gap-3">
              <div className="p-2.5 rounded-xl bg-slate-100 dark:bg-white/10 text-emerald-500">
                <CheckCircle2 className="w-5 h-5" />
              </div>
              <div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-slate-400 block">
                  YOUR STATUS
                </span>
                <span className="text-sm font-bold text-emerald-600 dark:text-emerald-400 uppercase">
                  {participant?.status || 'CONNECTED'}
                </span>
              </div>
            </div>
          </div>

          {/* Candidate list in lobby */}
          <div className="space-y-3 pt-2">
            <h4 className="text-xs font-black uppercase tracking-wider text-slate-400">
              Connected Candidates ({activeRoom.participants?.length || 0})
            </h4>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5 max-h-48 overflow-y-auto pr-1">
              {(activeRoom.participants || []).map((p) => {
                const isMe = p.student_id === user?.id;
                return (
                  <div
                    key={p.id}
                    className={`px-3.5 py-2.5 rounded-xl border flex items-center justify-between text-xs transition-colors ${
                      isMe
                        ? 'bg-blue-50/80 dark:bg-blue-950/40 border-blue-200 dark:border-blue-900/60 font-bold text-blue-900 dark:text-blue-200'
                        : 'bg-slate-50/60 dark:bg-slate-800/40 border-slate-200/60 dark:border-white/5 text-slate-700 dark:text-slate-300'
                    }`}
                  >
                    <span className="truncate">
                      {p.student_name} {isMe && '(You)'}
                    </span>
                    <span className="text-[10px] px-2 py-0.5 rounded-full font-bold uppercase bg-white/80 dark:bg-white/10 text-slate-500 dark:text-slate-400">
                      Ready
                    </span>
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default function StudentLiveExamPage() {
  return (
    <Suspense fallback={<div className="py-24 text-center">Loading Live Exam Room...</div>}>
      <LiveExamContent />
    </Suspense>
  );
}
