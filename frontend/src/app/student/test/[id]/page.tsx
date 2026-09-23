'use client';

import React, { useEffect, useState, useRef } from 'react';
import { useParams, useRouter } from 'next/navigation';
import {
  apiGetSession,
  apiGetTestDetails,
  apiSaveAnswer,
  apiSubmitSession,
  apiUploadAudio,
  TestSession,
  Test,
  Section,
  Question,
  Answer,
} from '@/lib/api';
import {
  Clock,
  CheckCircle,
  Play,
  Pause,
  RotateCcw,
  Mic,
  Square,
  Volume2,
  FileText,
  Send,
  AlertTriangle,
  ChevronLeft,
  ChevronRight,
  Headphones,
  BookOpen,
  Edit3,
} from 'lucide-react';

export default function TestTakingPage() {
  const params = useParams();
  const router = useRouter();
  const sessionId = Number(params.id);

  const [session, setSession] = useState<TestSession | null>(null);
  const [test, setTest] = useState<Test | null>(null);
  const [loading, setLoading] = useState(true);
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0);

  // Answers state mapped by questionId -> { text: string, audioUrl: string }
  const [answersMap, setAnswersMap] = useState<Record<number, { text: string; audioUrl: string }>>({});
  const [savingQuestionId, setSavingQuestionId] = useState<number | null>(null);

  // Timer state
  const [secondsRemaining, setSecondsRemaining] = useState<number>(7200);

  // Listening state: audio play limiter (max 2 plays)
  const [audioPlaysLeft, setAudioPlaysLeft] = useState<Record<number, number>>({});
  const [isPlayingAudio, setIsPlayingAudio] = useState(false);
  const audioRef = useRef<HTMLAudioElement | null>(null);

  // Speaking state: Web Audio / MediaRecorder
  const [recordingQuestionId, setRecordingQuestionId] = useState<number | null>(null);
  const [recordingSeconds, setRecordingSeconds] = useState(0);
  const mediaRecorderRef = useRef<MediaRecorder | null>(null);
  const audioChunksRef = useRef<Blob[]>([]);
  const [recordedAudios, setRecordedAudios] = useState<Record<number, { blobUrl: string; isSaved: boolean }>>({});
  const [isUploadingVoice, setIsUploadingVoice] = useState(false);

  // Submitting modal
  const [showSubmitModal, setShowSubmitModal] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    loadTestSession();
  }, [sessionId]);

  // Load session and test data
  const loadTestSession = async () => {
    setLoading(true);
    try {
      const sess = await apiGetSession(sessionId);
      if (sess.status !== 'in_progress') {
        router.push(`/student/results/${sessionId}`);
        return;
      }
      setSession(sess);

      const testData = await apiGetTestDetails(sess.test_id);
      setTest(testData);

      // Prepopulate existing answers
      const map: Record<number, { text: string; audioUrl: string }> = {};
      if (sess.answers) {
        sess.answers.forEach((ans) => {
          map[ans.question_id] = {
            text: ans.user_answer_text || '',
            audioUrl: ans.audio_file_url || '',
          };
        });
      }
      setAnswersMap(map);

      // Calculate remaining seconds
      const expiresAt = new Date(sess.expires_at).getTime();
      const now = new Date().getTime();
      const diffSecs = Math.max(0, Math.floor((expiresAt - now) / 1000));
      setSecondsRemaining(diffSecs);
    } catch (err: any) {
      alert('Sessiyani yuklashda xatolik: ' + err.message);
      router.push('/student');
    } finally {
      setLoading(false);
    }
  };

  // Timer countdown
  useEffect(() => {
    if (secondsRemaining <= 0) return;
    const timer = setInterval(() => {
      setSecondsRemaining((prev) => {
        if (prev <= 1) {
          clearInterval(timer);
          handleAutoSubmit();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => clearInterval(timer);
  }, [secondsRemaining]);

  const handleAutoSubmit = async () => {
    alert('Vaqtingiz tugadi! Test avtomatik tarzda topshirilmoqda.');
    await submitTest();
  };

  const submitTest = async () => {
    setSubmitting(true);
    try {
      await apiSubmitSession(sessionId);
      router.push(`/student/results/${sessionId}`);
    } catch (e: any) {
      alert('Testni topshirishda xatolik: ' + e.message);
      setSubmitting(false);
    }
  };

  // Autosave handler
  const handleSaveAnswer = async (questionId: number, text: string, audioUrl: string = '') => {
    setAnswersMap((prev) => ({
      ...prev,
      [questionId]: { text, audioUrl: audioUrl || prev[questionId]?.audioUrl || '' },
    }));

    setSavingQuestionId(questionId);
    try {
      await apiSaveAnswer(sessionId, questionId, text, audioUrl || answersMap[questionId]?.audioUrl || '');
    } catch (e) {
      console.error('Failed to autosave answer:', e);
    } finally {
      setSavingQuestionId(null);
    }
  };

  // Listening Audio Player functions
  const playAudioWithLimit = (sectionId: number, audioUrl: string) => {
    const remaining = audioPlaysLeft[sectionId] !== undefined ? audioPlaysLeft[sectionId] : 2;
    if (remaining <= 0) {
      alert('Ushbu audio eshitish limiti (2 marta) tugadi!');
      return;
    }

    if (audioRef.current) {
      if (isPlayingAudio) {
        audioRef.current.pause();
        setIsPlayingAudio(false);
      } else {
        audioRef.current.play().then(() => {
          setIsPlayingAudio(true);
          setAudioPlaysLeft((prev) => ({
            ...prev,
            [sectionId]: remaining - 1,
          }));
        }).catch((err) => {
          console.warn('Audio play error:', err);
          // In case of synthetic sample audio demo fallback
          setIsPlayingAudio(true);
          setAudioPlaysLeft((prev) => ({ ...prev, [sectionId]: remaining - 1 }));
        });
      }
    }
  };

  // Speaking Recording Functions
  const startRecording = async (questionId: number) => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      audioChunksRef.current = [];
      const mediaRecorder = new MediaRecorder(stream);
      mediaRecorderRef.current = mediaRecorder;

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          audioChunksRef.current.push(event.data);
        }
      };

      mediaRecorder.onstop = () => {
        const audioBlob = new Blob(audioChunksRef.current, { type: 'audio/webm' });
        const blobUrl = URL.createObjectURL(audioBlob);
        setRecordedAudios((prev) => ({
          ...prev,
          [questionId]: { blobUrl, isSaved: false },
        }));
      };

      mediaRecorder.start();
      setRecordingQuestionId(questionId);
      setRecordingSeconds(0);
    } catch (err: any) {
      alert('Mikrofonga ulanishda xatolik: ' + err.message + '. Brauzerda mikrofonga ruxsat bering.');
    }
  };

  const stopRecording = () => {
    if (mediaRecorderRef.current && recordingQuestionId !== null) {
      mediaRecorderRef.current.stop();
      mediaRecorderRef.current.stream.getTracks().forEach((track) => track.stop());
      setRecordingQuestionId(null);
    }
  };

  const uploadAndSaveSpeakingAnswer = async (questionId: number) => {
    const audioBlob = new Blob(audioChunksRef.current, { type: 'audio/webm' });
    if (!audioBlob || audioBlob.size === 0) {
      alert('Saqlash uchun audio mavjud emas!');
      return;
    }

    setIsUploadingVoice(true);
    try {
      const uploadRes = await apiUploadAudio(audioBlob, `speaking_q${questionId}_${sessionId}.webm`);
      await handleSaveAnswer(questionId, 'Speaking audio javob yozildi', uploadRes.url);
      setRecordedAudios((prev) => ({
        ...prev,
        [questionId]: { ...prev[questionId], isSaved: true },
      }));
      alert('Speaking ovozli javobingiz muvaffaqiyatli saqlandi!');
    } catch (err: any) {
      alert('Audioni yuklashda xatolik: ' + err.message);
    } finally {
      setIsUploadingVoice(false);
    }
  };

  // Recording timer
  useEffect(() => {
    let interval: any = null;
    if (recordingQuestionId !== null) {
      interval = setInterval(() => {
        setRecordingSeconds((prev) => prev + 1);
      }, 1000);
    }
    return () => clearInterval(interval);
  }, [recordingQuestionId]);

  // Format seconds to HH:MM:SS
  const formatTimer = (seconds: number) => {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = seconds % 60;
    return `${h > 0 ? `${h}:` : ''}${m < 10 ? '0' : ''}${m}:${s < 10 ? '0' : ''}${s}`;
  };

  // Word counter helper for writing
  const countWords = (text: string) => {
    return text.trim() ? text.trim().split(/\s+/).length : 0;
  };

  if (loading || !test) {
    return (
      <div className="py-24 text-center">
        <div className="w-12 h-12 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-semibold">Test yuklanmoqda...</p>
      </div>
    );
  }

  const sections = test.sections || [];
  const currentSection = sections[currentSectionIndex];

  return (
    <div className="space-y-6 pb-20">
      {/* Top Test Header Bar */}
      <div className="bg-white rounded-2xl border border-slate-200 p-4 sm:p-5 shadow-sm sticky top-16 z-40">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div>
            <h1 className="text-lg sm:text-xl font-extrabold text-slate-900 line-clamp-1">
              {test.title}
            </h1>
            <p className="text-xs text-slate-500 font-medium">CEFR Multi-level Mock Examination</p>
          </div>

          <div className="flex items-center gap-3">
            {/* Live Timer */}
            <div
              className={`flex items-center gap-2 px-3.5 py-1.5 rounded-xl font-mono text-sm font-bold border ${
                secondsRemaining < 300
                  ? 'bg-rose-50 text-rose-700 border-rose-200 animate-pulse'
                  : 'bg-slate-100 text-slate-800 border-slate-200'
              }`}
            >
              <Clock className="w-4 h-4 text-slate-500" />
              <span>{formatTimer(secondsRemaining)}</span>
            </div>

            {/* Submit Button */}
            <button
              onClick={() => setShowSubmitModal(true)}
              className="py-1.5 px-4 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs sm:text-sm font-semibold transition-all shadow-sm flex items-center gap-1.5"
            >
              <Send className="w-3.5 h-3.5" />
              Topshirish
            </button>
          </div>
        </div>

        {/* Section Navigation Tabs */}
        <div className="flex gap-2 overflow-x-auto pt-4 mt-3 border-t border-slate-100">
          {sections.map((sec, idx) => {
            const isSelected = idx === currentSectionIndex;
            let icon = <BookOpen className="w-4 h-4" />;
            if (sec.type === 'listening') icon = <Headphones className="w-4 h-4" />;
            if (sec.type === 'writing') icon = <Edit3 className="w-4 h-4" />;
            if (sec.type === 'speaking') icon = <Mic className="w-4 h-4" />;

            return (
              <button
                key={sec.id}
                onClick={() => setCurrentSectionIndex(idx)}
                className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs sm:text-sm font-bold whitespace-nowrap transition-all ${
                  isSelected
                    ? 'bg-emerald-600 text-white shadow-sm'
                    : 'bg-slate-50 text-slate-600 hover:bg-slate-100'
                }`}
              >
                {icon}
                <span>{sec.title}</span>
              </button>
            );
          })}
        </div>
      </div>

      {/* Main Section Content Area */}
      {currentSection && (
        <div className="space-y-6">
          {/* Section Instructions Card */}
          <div className="bg-emerald-50/70 border border-emerald-200/80 rounded-2xl p-4 sm:p-5">
            <h2 className="text-base font-bold text-emerald-950 flex items-center gap-2">
              <span className="w-2.5 h-2.5 rounded-full bg-emerald-600"></span>
              {currentSection.title}
            </h2>
            <p className="text-xs sm:text-sm text-emerald-800 mt-1 leading-relaxed">
              {currentSection.instructions}
            </p>
          </div>

          {/* 1. LISTENING SECTION */}
          {currentSection.type === 'listening' && (
            <div className="space-y-6">
              {/* Audio Player Card with Limit (1-2 plays) */}
              <div className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm flex flex-col sm:flex-row items-center justify-between gap-4">
                <div className="flex items-center gap-3">
                  <div className="w-12 h-12 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center">
                    <Headphones className="w-6 h-6" />
                  </div>
                  <div>
                    <h3 className="text-sm font-bold text-slate-900">Listening Audio Treki</h3>
                    <p className="text-xs text-slate-500">
                      Imtihon qoidasi: Audioni maksimal 2 marta tinglash mumkin.
                    </p>
                  </div>
                </div>

                <div className="flex items-center gap-3">
                  <div className="text-right">
                    <span className="text-xs font-semibold text-slate-500 block">Qolgan imkoniyat:</span>
                    <span className="text-sm font-bold text-blue-700">
                      {audioPlaysLeft[currentSection.id] !== undefined
                        ? audioPlaysLeft[currentSection.id]
                        : 2}{' '}
                      / 2 marta
                    </span>
                  </div>

                  <audio
                    ref={audioRef}
                    src={currentSection.audio_url || 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'}
                    onEnded={() => setIsPlayingAudio(false)}
                    className="hidden"
                  />

                  <button
                    onClick={() =>
                      playAudioWithLimit(
                        currentSection.id,
                        currentSection.audio_url || 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
                      )
                    }
                    disabled={
                      audioPlaysLeft[currentSection.id] !== undefined &&
                      audioPlaysLeft[currentSection.id] <= 0 &&
                      !isPlayingAudio
                    }
                    className="px-4 py-2.5 bg-blue-600 hover:bg-blue-700 disabled:opacity-40 text-white rounded-xl text-sm font-bold shadow-sm transition-all flex items-center gap-2"
                  >
                    {isPlayingAudio ? (
                      <>
                        <Pause className="w-4 h-4" /> To‘xtatish
                      </>
                    ) : (
                      <>
                        <Play className="w-4 h-4" /> Eshitish
                      </>
                    )}
                  </button>
                </div>
              </div>

              {/* Questions for Listening */}
              <div className="space-y-4">
                {currentSection.questions?.map((q, qIdx) => (
                  <div key={q.id} className="bg-white rounded-2xl border border-slate-200 p-5 sm:p-6 shadow-sm">
                    <div className="flex items-center justify-between mb-3">
                      <span className="text-xs font-bold uppercase text-slate-400">Savol #{qIdx + 1}</span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                        {q.points} ball
                      </span>
                    </div>

                    <h4 className="text-base font-semibold text-slate-900 mb-4">{q.question_text}</h4>

                    <div className="space-y-2">
                      {q.options?.map((opt, optIdx) => {
                        const isChecked = answersMap[q.id]?.text === opt;
                        return (
                          <label
                            key={optIdx}
                            onClick={() => handleSaveAnswer(q.id, opt)}
                            className={`flex items-center gap-3 p-3.5 rounded-xl border text-sm cursor-pointer transition-all ${
                              isChecked
                                ? 'border-emerald-600 bg-emerald-50/60 font-semibold text-emerald-950'
                                : 'border-slate-200 hover:bg-slate-50 text-slate-700'
                            }`}
                          >
                            <input
                              type="radio"
                              name={`question_${q.id}`}
                              checked={isChecked}
                              onChange={() => {}}
                              className="text-emerald-600 focus:ring-emerald-500 w-4 h-4"
                            />
                            <span>{opt}</span>
                          </label>
                        );
                      })}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* 2. READING SECTION (SPLIT-SCREEN) */}
          {currentSection.type === 'reading' && (
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 items-start">
              {/* Left Column: Passage Text */}
              <div className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm lg:sticky lg:top-40 max-h-[75vh] overflow-y-auto">
                <div className="flex items-center justify-between pb-3 border-b border-slate-100 mb-4">
                  <h3 className="text-sm font-bold text-slate-900 uppercase tracking-wider flex items-center gap-2">
                    <BookOpen className="w-4 h-4 text-emerald-600" />
                    Reading Passage (Matn)
                  </h3>
                  <span className="text-xs text-slate-400">Diqqat bilan o‘qing</span>
                </div>

                <div className="text-slate-800 text-sm leading-relaxed whitespace-pre-line space-y-4 font-normal">
                  {currentSection.passage_text || 'Matn taqdim etilmagan.'}
                </div>
              </div>

              {/* Right Column: Questions */}
              <div className="space-y-4">
                {currentSection.questions?.map((q, qIdx) => (
                  <div key={q.id} className="bg-white rounded-2xl border border-slate-200 p-5 sm:p-6 shadow-sm">
                    <div className="flex items-center justify-between mb-3">
                      <span className="text-xs font-bold uppercase text-slate-400">Savol #{qIdx + 1}</span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                        {q.points} ball
                      </span>
                    </div>

                    <h4 className="text-base font-semibold text-slate-900 mb-4">{q.question_text}</h4>

                    <div className="space-y-2">
                      {q.options?.map((opt, optIdx) => {
                        const isChecked = answersMap[q.id]?.text === opt;
                        return (
                          <label
                            key={optIdx}
                            onClick={() => handleSaveAnswer(q.id, opt)}
                            className={`flex items-center gap-3 p-3.5 rounded-xl border text-sm cursor-pointer transition-all ${
                              isChecked
                                ? 'border-emerald-600 bg-emerald-50/60 font-semibold text-emerald-950'
                                : 'border-slate-200 hover:bg-slate-50 text-slate-700'
                            }`}
                          >
                            <input
                              type="radio"
                              name={`question_${q.id}`}
                              checked={isChecked}
                              onChange={() => {}}
                              className="text-emerald-600 focus:ring-emerald-500 w-4 h-4"
                            />
                            <span>{opt}</span>
                          </label>
                        );
                      })}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* 3. WRITING SECTION */}
          {currentSection.type === 'writing' && (
            <div className="space-y-6">
              {currentSection.questions?.map((q, qIdx) => {
                const currentText = answersMap[q.id]?.text || '';
                const wordCount = countWords(currentText);
                const targetWords = qIdx === 0 ? 150 : 250;
                const isTargetReached = wordCount >= targetWords;

                return (
                  <div key={q.id} className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm space-y-4">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-amber-700 bg-amber-50 px-2.5 py-1 rounded-md border border-amber-200">
                        Writing Topshirig‘i #{qIdx + 1}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                        Maks: {q.points} ball
                      </span>
                    </div>

                    <p className="text-slate-800 text-sm font-semibold leading-relaxed bg-slate-50 p-4 rounded-xl border border-slate-200">
                      {q.question_text}
                    </p>

                    <div>
                      <div className="flex items-center justify-between text-xs mb-2">
                        <span className="text-slate-500 font-medium">Insho matnini bu yerga yozing:</span>
                        <div
                          className={`font-mono font-bold px-2 py-1 rounded-md text-xs ${
                            isTargetReached ? 'bg-emerald-100 text-emerald-800' : 'bg-amber-100 text-amber-800'
                          }`}
                        >
                          So‘zlar: {wordCount} / minimum {targetWords}
                        </div>
                      </div>

                      <textarea
                        rows={10}
                        value={currentText}
                        onChange={(e) => handleSaveAnswer(q.id, e.target.value)}
                        placeholder="Insho yozishni boshlang..."
                        className="w-full p-4 rounded-xl border border-slate-300 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 font-sans leading-relaxed"
                      />
                    </div>
                  </div>
                );
              })}
            </div>
          )}

          {/* 4. SPEAKING SECTION */}
          {currentSection.type === 'speaking' && (
            <div className="space-y-6">
              {currentSection.questions?.map((q, qIdx) => {
                const isRecordingThis = recordingQuestionId === q.id;
                const existingRecording = recordedAudios[q.id];
                const savedAudioUrl = answersMap[q.id]?.audioUrl;

                return (
                  <div key={q.id} className="bg-white rounded-2xl border border-slate-200 p-6 shadow-sm space-y-4">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-purple-700 bg-purple-50 px-2.5 py-1 rounded-md border border-purple-200">
                        Speaking Part #{qIdx + 1}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                        Maks: {q.points} ball
                      </span>
                    </div>

                    <p className="text-slate-900 text-sm font-bold leading-relaxed bg-purple-50/50 p-4 rounded-xl border border-purple-100">
                      {q.question_text}
                    </p>

                    {/* Microphone Controls */}
                    <div className="p-5 bg-slate-50 rounded-xl border border-slate-200 flex flex-col sm:flex-row items-center justify-between gap-4">
                      <div className="flex items-center gap-3">
                        <div
                          className={`w-12 h-12 rounded-2xl flex items-center justify-center transition-all ${
                            isRecordingThis
                              ? 'bg-rose-500 text-white animate-pulse'
                              : 'bg-purple-100 text-purple-700'
                          }`}
                        >
                          <Mic className="w-6 h-6" />
                        </div>
                        <div>
                          <div className="text-sm font-bold text-slate-800">
                            {isRecordingThis
                              ? 'Ovoz yozilmoqda...'
                              : savedAudioUrl
                              ? 'Javob muvaffaqiyatli saqlangan'
                              : 'Ovozingizni yozib oling'}
                          </div>
                          <div className="text-xs text-slate-500 font-mono">
                            {isRecordingThis ? `Vaqt: ${recordingSeconds} soniya` : 'Tugmani bosib gapiring'}
                          </div>
                        </div>
                      </div>

                      <div className="flex items-center gap-2">
                        {isRecordingThis ? (
                          <button
                            onClick={stopRecording}
                            className="px-4 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                          >
                            <Square className="w-4 h-4" /> Yozishni To‘xtatish
                          </button>
                        ) : (
                          <button
                            onClick={() => startRecording(q.id)}
                            className="px-4 py-2.5 bg-purple-600 hover:bg-purple-700 text-white rounded-xl text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
                          >
                            <Mic className="w-4 h-4" /> Yozishni Boshlash
                          </button>
                        )}
                      </div>
                    </div>

                    {/* Recorded Audio Preview */}
                    {(existingRecording || savedAudioUrl) && (
                      <div className="p-4 bg-emerald-50 rounded-xl border border-emerald-200 flex flex-col sm:flex-row items-center justify-between gap-3">
                        <div className="flex items-center gap-2">
                          <CheckCircle className="w-5 h-5 text-emerald-600 flex-shrink-0" />
                          <span className="text-xs font-semibold text-emerald-900">
                            Yozilgan audio tayyor. Tinglab ko‘rishingiz mumkin:
                          </span>
                        </div>

                        <audio
                          controls
                          src={existingRecording?.blobUrl || savedAudioUrl}
                          className="h-9 w-full sm:w-64"
                        />

                        {existingRecording && !existingRecording.isSaved && (
                          <button
                            onClick={() => uploadAndSaveSpeakingAnswer(q.id)}
                            disabled={isUploadingVoice}
                            className="px-3.5 py-2 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-50 text-white rounded-lg text-xs font-bold shadow-sm transition-all whitespace-nowrap"
                          >
                            {isUploadingVoice ? 'Yuklanmoqda...' : 'Audioni Saqlash'}
                          </button>
                        )}
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          )}

          {/* Bottom Section Navigator */}
          <div className="flex items-center justify-between pt-6 border-t border-slate-200">
            <button
              onClick={() => setCurrentSectionIndex((prev) => Math.max(0, prev - 1))}
              disabled={currentSectionIndex === 0}
              className="px-4 py-2.5 rounded-xl border border-slate-300 text-xs font-semibold text-slate-700 hover:bg-slate-100 disabled:opacity-30 transition-all flex items-center gap-1.5"
            >
              <ChevronLeft className="w-4 h-4" /> Oldingi bo‘lim
            </button>

            {currentSectionIndex < sections.length - 1 ? (
              <button
                onClick={() => setCurrentSectionIndex((prev) => Math.min(sections.length - 1, prev + 1))}
                className="px-5 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
              >
                Keyingi bo‘lim <ChevronRight className="w-4 h-4" />
              </button>
            ) : (
              <button
                onClick={() => setShowSubmitModal(true)}
                className="px-5 py-2.5 rounded-xl bg-emerald-700 hover:bg-emerald-800 text-white text-xs font-bold shadow-sm transition-all flex items-center gap-1.5"
              >
                Testni Yakunlash <Send className="w-4 h-4" />
              </button>
            )}
          </div>
        </div>
      )}

      {/* Submit Confirmation Modal */}
      {showSubmitModal && (
        <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-md w-full p-6 space-y-4 shadow-xl border border-slate-100">
            <div className="w-12 h-12 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center mx-auto">
              <AlertTriangle className="w-6 h-6" />
            </div>

            <h3 className="text-lg font-bold text-center text-slate-900">
              Imtihonni topshirishni tasdiqlaysizmi?
            </h3>
            <p className="text-xs text-slate-600 text-center leading-relaxed">
              Reading va Listening natijalari avtomatik hisoblanadi. Writing va Speaking javoblaringiz esa tekshirish uchun o‘qituvchiga yuboriladi.
            </p>

            <div className="flex gap-2 pt-2">
              <button
                onClick={() => setShowSubmitModal(false)}
                disabled={submitting}
                className="flex-1 py-2.5 rounded-xl border border-slate-300 text-slate-700 text-xs font-bold hover:bg-slate-50 transition-all"
              >
                Qaytish
              </button>
              <button
                onClick={submitTest}
                disabled={submitting}
                className="flex-1 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all disabled:opacity-50"
              >
                {submitting ? 'Topshirilmoqda...' : 'Ha, Topshirish'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
