'use client';

import React, { useEffect, useState, useRef, useMemo } from 'react';
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
  Mic,
  Square,
  Send,
  AlertTriangle,
  ChevronLeft,
  ChevronRight,
  Headphones,
  BookOpen,
  Edit3,
} from 'lucide-react';
import ReadingPassageHighlighter, { clearSessionHighlights } from '@/components/ReadingPassageHighlighter';

interface IeltsReadingSectionProps {
  instructionsHtml: string;
  qnumToQuestionId: Record<number, number>;
  initialAnswers: Record<number, { text: string; audioUrl: string }>;
  onSaveAnswer: (questionId: number, text: string) => void;
  onAnswerUpdated?: (questionId: number, text: string) => void;
  className?: string;
}

const IeltsReadingSection = React.memo(
  React.forwardRef<HTMLDivElement, IeltsReadingSectionProps>(function IeltsReadingSection(
    { instructionsHtml, qnumToQuestionId, initialAnswers, onSaveAnswer, onAnswerUpdated, className },
    ref
  ) {
    const localRef = useRef<HTMLDivElement | null>(null);
    const answersRef = useRef(initialAnswers);
    answersRef.current = initialAnswers;

    const qmapRef = useRef(qnumToQuestionId);
    qmapRef.current = qnumToQuestionId;

    const saveRef = useRef(onSaveAnswer);
    saveRef.current = onSaveAnswer;

    const updateRef = useRef(onAnswerUpdated);
    updateRef.current = onAnswerUpdated;

    const debounceTimersRef = useRef<Record<number, NodeJS.Timeout>>({});

    const setRefs = (node: HTMLDivElement | null) => {
      localRef.current = node;
      if (typeof ref === 'function') {
        ref(node);
      } else if (ref) {
        (ref as React.MutableRefObject<HTMLDivElement | null>).current = node;
      }
    };

    // Pre-fill answers whenever instructionsHtml changes
    useEffect(() => {
      const container = localRef.current;
      if (!container) return;

      const qmap = qmapRef.current;
      const answers = answersRef.current;

      // 1. Text inputs
      const textInputs = container.querySelectorAll<HTMLInputElement>('input[type="text"][data-qnum]');
      textInputs.forEach((input) => {
        const qnum = Number(input.getAttribute('data-qnum'));
        const qId = qmap[qnum];
        if (qId && answers[qId]) {
          const val = answers[qId].text || '';
          input.value = val;
          if (val) input.classList.add('answered');
          else input.classList.remove('answered');
        }
      });

      // 2. Select dropdowns
      const selects = container.querySelectorAll<HTMLSelectElement>('select[data-qnum]');
      selects.forEach((select) => {
        const qnum = Number(select.getAttribute('data-qnum'));
        const qId = qmap[qnum];
        if (qId && answers[qId]) {
          const val = answers[qId].text || '';
          select.value = val;
          if (val) select.classList.add('answered');
          else select.classList.remove('answered');
        }
      });

      // 3. Radio inputs
      const radios = container.querySelectorAll<HTMLInputElement>('input[type="radio"][data-qnum]');
      radios.forEach((radio) => {
        const qnum = Number(radio.getAttribute('data-qnum'));
        const qId = qmap[qnum];
        if (qId && answers[qId]) {
          radio.checked = answers[qId].text === radio.value;
        }
      });

      // 4. Checkboxes
      const checkboxes = container.querySelectorAll<HTMLInputElement>('input[type="checkbox"][data-multi-qnums]');
      checkboxes.forEach((cb) => {
        const multiAttr = cb.getAttribute('data-multi-qnums') || '';
        const qnums = multiAttr.split(',').map(Number);
        const answersForGroup = qnums.map((qn) => {
          const qId = qmap[qn];
          return qId && answers[qId] ? answers[qId].text : '';
        });
        cb.checked = answersForGroup.includes(cb.value);
      });
    }, [instructionsHtml]);

    // Attach native DOM event listeners
    useEffect(() => {
      const container = localRef.current;
      if (!container) return;

      const handleChange = (e: Event) => {
        const target = e.target as HTMLElement;
        if (!target) return;
        const qmap = qmapRef.current;

        // Radio button change
        if (target instanceof HTMLInputElement && target.type === 'radio') {
          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmap[qnum];
          if (qId) {
            saveRef.current(qId, target.value);
            updateRef.current?.(qId, target.value);
          }
        }

        // Select dropdown change
        if (target instanceof HTMLSelectElement) {
          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmap[qnum];
          if (qId) {
            if (target.value) target.classList.add('answered');
            else target.classList.remove('answered');
            saveRef.current(qId, target.value);
            updateRef.current?.(qId, target.value);
          }
        }

        // Checkbox change
        if (target instanceof HTMLInputElement && target.type === 'checkbox') {
          const multiAttr = target.getAttribute('data-multi-qnums');
          if (multiAttr) {
            const qnums = multiAttr.split(',').map(Number);
            const limit = Number(target.getAttribute('data-limit')) || qnums.length;
            const allCheckboxes = Array.from(
              container.querySelectorAll<HTMLInputElement>(`input[type="checkbox"][data-multi-qnums="${multiAttr}"]`)
            );
            const checkedBoxes = allCheckboxes.filter((cb) => cb.checked);

            if (checkedBoxes.length > limit) {
              target.checked = false;
              alert(`Siz maksimal ${limit} ta variant tanlashingiz mumkin.`);
              return;
            }

            const selectedValues = checkedBoxes.map((cb) => cb.value);
            qnums.forEach((qn, idx) => {
              const qId = qmap[qn];
              if (qId) {
                const val = selectedValues[idx] || '';
                saveRef.current(qId, val);
                updateRef.current?.(qId, val);
              }
            });
          }
        }
      };

      // Click on radio button label or text
      const handleClick = (e: MouseEvent) => {
        const target = e.target as HTMLElement;
        if (!target) return;
        if (target.tagName === 'INPUT') return; // Handled by change listener

        const radioLabel = target.closest<HTMLLabelElement>('.ielts-radio-btn');
        if (radioLabel) {
          const radio = radioLabel.querySelector<HTMLInputElement>('input[type="radio"]');
          if (radio && !radio.checked) {
            radio.checked = true;
            const qnum = Number(radio.getAttribute('data-qnum'));
            const qId = qmapRef.current[qnum];
            if (qId) {
              saveRef.current(qId, radio.value);
              updateRef.current?.(qId, radio.value);
            }
          }
        }
      };

      // Text input typing (updates answered style immediately and debounces saving)
      const handleInput = (e: Event) => {
        const target = e.target as HTMLElement;
        if (target instanceof HTMLInputElement && target.type === 'text') {
          const val = target.value;
          if (val.trim()) target.classList.add('answered');
          else target.classList.remove('answered');

          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmapRef.current[qnum];
          if (qId) {
            updateRef.current?.(qId, val);
            if (debounceTimersRef.current[qId]) {
              clearTimeout(debounceTimersRef.current[qId]);
            }
            debounceTimersRef.current[qId] = setTimeout(() => {
              saveRef.current(qId, val.trim());
              delete debounceTimersRef.current[qId];
            }, 600);
          }
        }
      };

      // Focus out (blur) saves immediately and cancels debounce
      const handleFocusOut = (e: FocusEvent) => {
        const target = e.target as HTMLElement;
        if (target instanceof HTMLInputElement && target.type === 'text') {
          const qnum = Number(target.getAttribute('data-qnum'));
          const qId = qmapRef.current[qnum];
          if (qId) {
            if (debounceTimersRef.current[qId]) {
              clearTimeout(debounceTimersRef.current[qId]);
              delete debounceTimersRef.current[qId];
            }
            const val = target.value.trim();
            saveRef.current(qId, val);
            updateRef.current?.(qId, val);
          }
        }
      };

      // Enter key blurs and triggers focusout
      const handleKeyDown = (e: KeyboardEvent) => {
        const target = e.target as HTMLElement;
        if (target instanceof HTMLInputElement && target.type === 'text') {
          if (e.key === 'Enter') {
            e.preventDefault();
            target.blur();
          }
        }
      };

      container.addEventListener('change', handleChange);
      container.addEventListener('click', handleClick);
      container.addEventListener('input', handleInput);
      container.addEventListener('focusout', handleFocusOut);
      container.addEventListener('keydown', handleKeyDown);

      return () => {
        Object.values(debounceTimersRef.current).forEach(clearTimeout);
        debounceTimersRef.current = {};
        container.removeEventListener('change', handleChange);
        container.removeEventListener('click', handleClick);
        container.removeEventListener('input', handleInput);
        container.removeEventListener('focusout', handleFocusOut);
        container.removeEventListener('keydown', handleKeyDown);
      };
    }, []);

    return (
      <div
        ref={setRefs}
        className={className || "bg-white rounded-2xl border border-slate-200 p-6 shadow-sm lg:sticky lg:top-40 max-h-[70vh] overflow-y-auto"}
        dangerouslySetInnerHTML={{ __html: instructionsHtml }}
      />
    );
  }),
  (prevProps, nextProps) => {
    // Only re-render if the instructions HTML changed (e.g. section switched)
    return prevProps.instructionsHtml === nextProps.instructionsHtml;
  }
);

export default function TestTakingPage() {
  const params = useParams();
  const router = useRouter();
  const rawId = params?.id;
  const sessionId = rawId ? Number(rawId) : NaN;

  const [mounted, setMounted] = useState(false);
  const [session, setSession] = useState<TestSession | null>(null);
  const [test, setTest] = useState<Test | null>(null);
  const [loading, setLoading] = useState(true);
  const [errorMessage, setErrorMessage] = useState('');
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

  // IELTS authentic reading container ref
  const ieltsContainerRef = useRef<HTMLDivElement | null>(null);

  const sections = Array.isArray(test?.sections) ? test.sections : [];
  const currentSection = sections[currentSectionIndex] || null;

  // Map question number (1..40) to question ID for the current active section
  const qnumToQuestionId = useMemo(() => {
    const map: Record<number, number> = {};
    if (currentSection && Array.isArray(currentSection.questions)) {
      currentSection.questions.forEach((q) => {
        map[q.order_index] = q.id;
      });
    }
    return map;
  }, [currentSection]);

  // Handler for live answer changes to update UI state immediately
  const handleLiveAnswerUpdate = (questionId: number, text: string) => {
    setAnswersMap((prev) => ({
      ...prev,
      [questionId]: { text, audioUrl: prev[questionId]?.audioUrl || '' },
    }));
  };

  const flushAnswers = () => {
    if (!ieltsContainerRef.current) return;
    const inputs = ieltsContainerRef.current.querySelectorAll<HTMLInputElement>('input[type="text"][data-qnum]');
    inputs.forEach((input) => {
      const qnum = Number(input.getAttribute('data-qnum'));
      const qId = qnumToQuestionId[qnum];
      if (qId && input.value.trim()) {
        handleSaveAnswer(qId, input.value.trim());
      }
    });
  };

  const handleSectionChange = (idx: number) => {
    flushAnswers();
    setCurrentSectionIndex(idx);
  };

  const scrollToQuestion = (qnum: number) => {
    if (!ieltsContainerRef.current) return;
    const el = ieltsContainerRef.current.querySelector(
      `[data-qnum="${qnum}"], [data-multi-qnums*="${qnum}"]`
    );
    if (el) {
      el.scrollIntoView({ behavior: 'smooth', block: 'center' });
      if (el instanceof HTMLElement) {
        el.focus();
      }
    }
  };

  useEffect(() => {
    setMounted(true);
    if (!isNaN(sessionId) && sessionId > 0) {
      loadTestSession(sessionId);
    } else {
      setErrorMessage('Yaroqsiz test sessiya identifikatori.');
      setLoading(false);
    }
  }, [sessionId]);

  // Load session and test data
  const loadTestSession = async (sId: number) => {
    setLoading(true);
    setErrorMessage('');
    try {
      const sess = await apiGetSession(sId);
      if (!sess || !sess.id) {
        throw new Error('Sessiya topilmadi');
      }

      if (sess.status !== 'in_progress') {
        router.push(`/student/results/${sId}`);
        return;
      }
      setSession(sess);

      const testData = await apiGetTestDetails(sess.test_id);
      setTest(testData);

      // Check if target section was requested in URL query
      if (typeof window !== 'undefined') {
        const urlParams = new URLSearchParams(window.location.search);
        const secParam = urlParams.get('section');
        if (secParam !== null) {
          const secIdx = parseInt(secParam, 10);
          if (!isNaN(secIdx) && secIdx >= 0 && secIdx < (testData.sections?.length || 0)) {
            setCurrentSectionIndex(secIdx);
          }
        }
      }

      // Prepopulate existing answers
      const map: Record<number, { text: string; audioUrl: string }> = {};
      if (Array.isArray(sess.answers)) {
        sess.answers.forEach((ans) => {
          if (ans && ans.question_id) {
            map[ans.question_id] = {
              text: ans.user_answer_text || '',
              audioUrl: ans.audio_file_url || '',
            };
          }
        });
      }
      setAnswersMap(map);

      // Calculate remaining seconds safely
      let diffSecs = 7200;
      if (sess.expires_at) {
        const expiresAt = new Date(sess.expires_at).getTime();
        if (!isNaN(expiresAt)) {
          diffSecs = Math.max(0, Math.floor((expiresAt - Date.now()) / 1000));
        }
      }
      if (diffSecs <= 0) {
        clearSessionHighlights(sId);
        alert('Ushbu test sessiyasining vaqti tugagan. Natijalar sahifasiga yo‘naltirilmoqdasiz.');
        router.push(`/student/results/${sId}`);
        return;
      }
      setSecondsRemaining(diffSecs);
    } catch (err: any) {
      setErrorMessage(err.message || 'Sessiyani yuklashda xatolik yuz berdi');
    } finally {
      setLoading(false);
    }
  };

  // Timer countdown
  useEffect(() => {
    if (!mounted || secondsRemaining <= 0) return;
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
  }, [mounted, secondsRemaining]);

  const handleAutoSubmit = async () => {
    alert('Vaqt tugadi! Testingiz avtomatik topshirilmoqda...');
    flushAnswers();
    await submitTest();
  };

  const submitTest = async () => {
    if (isNaN(sessionId)) return;
    flushAnswers();
    setSubmitting(true);
    try {
      await apiSubmitSession(sessionId);
      clearSessionHighlights(sessionId);
      router.push(`/student/results/${sessionId}`);
    } catch (e: any) {
      alert('Testni topshirishda xatolik: ' + (e.message || 'Server xatosi'));
      setSubmitting(false);
    }
  };

  // Autosave handler
  const handleSaveAnswer = async (questionId: number, text: string, audioUrl: string = '') => {
    if (isNaN(sessionId)) return;
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
        audioRef.current
          .play()
          .then(() => {
            setIsPlayingAudio(true);
            setAudioPlaysLeft((prev) => ({
              ...prev,
              [sectionId]: remaining - 1,
            }));
          })
          .catch((err) => {
            console.warn('Audio play error:', err);
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
      alert('Mikrofonga ulanishda xatolik: ' + (err.message || 'Ruxsat berilmadi'));
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
    if (isNaN(seconds) || seconds < 0) return '00:00';
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = seconds % 60;
    return `${h > 0 ? `${h}:` : ''}${m < 10 ? '0' : ''}${m}:${s < 10 ? '0' : ''}${s}`;
  };

  // Word counter helper for writing
  const countWords = (text?: string) => {
    if (!text) return 0;
    const trimmed = text.trim();
    return trimmed ? trimmed.split(/\s+/).length : 0;
  };

  // Safe Options getter
  const getOptions = (options: any): string[] => {
    if (Array.isArray(options)) return options;
    if (typeof options === 'string') {
      try {
        const parsed = JSON.parse(options);
        if (Array.isArray(parsed)) return parsed;
      } catch {}
    }
    return [];
  };

  if (!mounted || loading) {
    return (
      <div className="py-24 text-center">
        <div className="w-12 h-12 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-600 font-semibold">Test yuklanmoqda...</p>
      </div>
    );
  }

  if (errorMessage || !test) {
    return (
      <div className="max-w-md mx-auto my-16 p-6 bg-white rounded-2xl border border-slate-200 text-center space-y-4 shadow-sm">
        <div className="w-12 h-12 rounded-full bg-rose-50 text-rose-600 flex items-center justify-center mx-auto">
          <AlertTriangle className="w-6 h-6" />
        </div>
        <h3 className="text-base font-bold text-slate-900">Xatolik yuz berdi</h3>
        <p className="text-xs text-slate-600">{errorMessage || 'Test ma’lumotlarini yuklab bo‘lmadi.'}</p>
        <button
          onClick={() => router.push('/student')}
          className="px-4 py-2 bg-emerald-600 text-white rounded-xl text-xs font-bold hover:bg-emerald-700 transition-colors"
        >
          Testlar ro‘yxatiga qaytish
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-6 pb-20">
      {/* Top Test Header Bar */}
      <div className="glass-panel rounded-2xl border border-slate-200/90 dark:border-slate-800 p-4 sm:p-5 shadow-md shadow-slate-200/40 dark:shadow-none sticky top-16 z-40 transition-all">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div>
            <h1 className="text-lg sm:text-xl font-extrabold text-slate-900 dark:text-white line-clamp-1">
              {test.title}
            </h1>
            <p className="text-xs text-slate-500 dark:text-slate-400 font-semibold flex items-center gap-1.5 mt-0.5">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse"></span>
              CEFR & IELTS Academic Standard Examination
            </p>
          </div>

          <div className="flex items-center gap-3">
            {/* Live Timer */}
            <div
              className={`flex items-center gap-2 px-4 py-2 rounded-xl font-mono text-sm font-black border shadow-xs ${
                secondsRemaining < 300
                  ? 'bg-rose-50 dark:bg-rose-950/60 text-rose-700 dark:text-rose-300 border-rose-300 dark:border-rose-800 animate-pulse ring-2 ring-rose-400/20'
                  : 'bg-slate-900 dark:bg-slate-800 text-white border-slate-800 dark:border-slate-700'
              }`}
            >
              <Clock className={`w-4 h-4 ${secondsRemaining < 300 ? 'text-rose-600 dark:text-rose-400' : 'text-emerald-400'}`} />
              <span>{formatTimer(secondsRemaining)}</span>
            </div>

            {/* Submit Button */}
            <button
              onClick={() => setShowSubmitModal(true)}
              className="py-2 px-5 bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white rounded-xl text-xs sm:text-sm font-bold transition-all shadow-md shadow-emerald-600/20 hover:scale-[1.02] flex items-center gap-1.5"
            >
              <Send className="w-3.5 h-3.5" />
              Topshirish
            </button>
          </div>
        </div>

        {/* Section Navigation Tabs */}
        <div className="flex gap-2 overflow-x-auto pt-3 mt-3 border-t border-slate-200/70 dark:border-slate-800">
          {sections.map((sec, idx) => {
            const isSelected = idx === currentSectionIndex;
            let icon = <BookOpen className="w-4 h-4" />;
            if (sec.type === 'listening') icon = <Headphones className="w-4 h-4" />;
            if (sec.type === 'writing') icon = <Edit3 className="w-4 h-4" />;
            if (sec.type === 'speaking') icon = <Mic className="w-4 h-4" />;

            return (
              <button
                key={sec.id || idx}
                onClick={() => handleSectionChange(idx)}
                className={`flex items-center gap-2 px-4 py-2 rounded-xl text-xs sm:text-sm font-bold whitespace-nowrap transition-all ${
                  isSelected
                    ? 'bg-slate-900 dark:bg-emerald-600 text-white shadow-sm ring-1 ring-slate-800 dark:ring-emerald-500'
                    : 'bg-white dark:bg-slate-800/90 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-700'
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
      {currentSection ? (
        <div className="space-y-6">
          {/* Section Instructions Card */}
          <div className="bg-emerald-50/70 dark:bg-emerald-950/40 border border-emerald-200/80 dark:border-emerald-800/80 rounded-2xl p-4 sm:p-5 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
            <div>
              <h2 className="text-base font-bold text-emerald-950 dark:text-emerald-200 flex items-center gap-2">
                <span className="w-2.5 h-2.5 rounded-full bg-emerald-600 dark:bg-emerald-400"></span>
                {currentSection.title}
              </h2>
              <p className="text-xs sm:text-sm text-emerald-800 dark:text-emerald-300 mt-1 leading-relaxed">
                {currentSection.instructions?.includes('ielts-')
                  ? currentSection.type === 'listening'
                    ? 'Audio trekni tinglang va barcha topshiriqlarni bajaring. Barcha javoblaringiz avtomatik saqlanadi.'
                    : 'Matnni diqqat bilan o‘qing va o‘ng tarafdagi barcha topshiriqlarni bajaring. Barcha javoblaringiz avtomatik saqlanadi.'
                  : currentSection.instructions}
              </p>
            </div>
            {currentSection.instructions?.includes('ielts-') && (
              <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-emerald-100 dark:bg-emerald-900/60 text-emerald-800 dark:text-emerald-200 text-xs font-bold whitespace-nowrap self-start sm:self-auto">
                {currentSection.type === 'listening' ? <Headphones className="w-3.5 h-3.5" /> : <BookOpen className="w-3.5 h-3.5" />}
                {currentSection.type === 'listening' ? 'IELTS Academic Listening' : 'IELTS Academic Reading'}
              </span>
            )}
          </div>

          {/* 1. LISTENING SECTION */}
          {currentSection.type === 'listening' && (
            <div className="space-y-6">
              {/* Audio Player Card with Limit (1-2 plays) */}
              <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm flex flex-col sm:flex-row items-center justify-between gap-4">
                <div className="flex items-center gap-3">
                  <div className="w-12 h-12 rounded-2xl bg-blue-50 dark:bg-blue-950/60 text-blue-600 dark:text-blue-400 flex items-center justify-center">
                    <Headphones className="w-6 h-6" />
                  </div>
                  <div>
                    <h3 className="text-sm font-bold text-slate-900 dark:text-white">Listening Audio Treki</h3>
                    <p className="text-xs text-slate-500 dark:text-slate-400">
                      Imtihon qoidasi: Audioni maksimal 2 marta tinglash mumkin.
                    </p>
                  </div>
                </div>

                <div className="flex items-center gap-3">
                  <div className="text-right">
                    <span className="text-xs font-semibold text-slate-500 dark:text-slate-400 block">Qolgan imkoniyat:</span>
                    <span className="text-sm font-bold text-blue-700 dark:text-blue-400">
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
              {currentSection.instructions?.includes('ielts-reading-container') || currentSection.instructions?.includes('ielts-listening-container') ? (
                <div className="space-y-4">
                  <IeltsReadingSection
                    ref={ieltsContainerRef}
                    instructionsHtml={currentSection.instructions}
                    qnumToQuestionId={qnumToQuestionId}
                    initialAnswers={answersMap}
                    onSaveAnswer={handleSaveAnswer}
                    onAnswerUpdated={handleLiveAnswerUpdate}
                    className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm"
                  />

                  {/* Question Navigator Palette */}
                  <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm">
                    <div className="flex items-center justify-between mb-2">
                      <span className="text-xs font-bold text-slate-700 dark:text-slate-300 uppercase tracking-wider">
                        Ushbu bo‘lim savollari ({currentSection.questions?.length || 0} ta)
                      </span>
                      <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300">
                        Bajarildi:{' '}
                        {(currentSection.questions || []).filter((q) => Boolean(answersMap[q.id]?.text)).length} /{' '}
                        {currentSection.questions?.length || 0}
                      </span>
                    </div>

                    <div className="flex flex-wrap gap-1.5 pt-2 border-t border-slate-100 dark:border-slate-800">
                      {(currentSection.questions || []).map((q) => {
                        const isAnswered = Boolean(answersMap[q.id]?.text);
                        return (
                          <button
                            key={q.id}
                            type="button"
                            onClick={() => scrollToQuestion(q.order_index)}
                            title={`Savol #${q.order_index}`}
                            className={`w-8 h-8 rounded-lg text-xs font-bold transition-all flex items-center justify-center border ${
                              isAnswered
                                ? 'bg-blue-600 text-white border-blue-600 shadow-xs'
                                : 'bg-white dark:bg-slate-800 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 hover:border-blue-400 hover:bg-blue-50/50 dark:hover:bg-slate-700'
                            }`}
                          >
                            {q.order_index}
                          </button>
                        );
                      })}
                    </div>
                  </div>
                </div>
              ) : (
                <div className="space-y-4">
                  {(Array.isArray(currentSection.questions) ? currentSection.questions : []).map((q, qIdx) => {
                    const options = getOptions(q.options);
                    return (
                      <div key={q.id || qIdx} className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 sm:p-6 shadow-sm">
                        <div className="flex items-center justify-between mb-3">
                          <span className="text-xs font-bold uppercase text-slate-400 dark:text-slate-500">Savol #{qIdx + 1}</span>
                          <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                            {q.points} ball
                          </span>
                        </div>

                        <h4 className="text-base font-semibold text-slate-900 dark:text-white mb-4">{q.question_text}</h4>

                        {options.length > 0 ? (
                          <div className="space-y-2">
                            {options.map((opt, optIdx) => {
                              const isChecked = answersMap[q.id]?.text === opt;
                              return (
                                <label
                                  key={optIdx}
                                  className={`flex items-center gap-3 p-3.5 rounded-xl border text-sm cursor-pointer transition-all ${
                                    isChecked
                                      ? 'border-emerald-600 bg-emerald-50/60 dark:bg-emerald-950/40 font-semibold text-emerald-950 dark:text-emerald-300'
                                      : 'border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-800/60 text-slate-700 dark:text-slate-300'
                                  }`}
                                >
                                  <input
                                    type="radio"
                                    name={`question_${q.id}`}
                                    checked={isChecked}
                                    onChange={() => handleSaveAnswer(q.id, opt)}
                                    className="text-emerald-600 focus:ring-emerald-500 w-4 h-4"
                                  />
                                  <span>{opt}</span>
                                </label>
                              );
                            })}
                          </div>
                        ) : (
                          <div>
                            <input
                              type="text"
                              placeholder="Javobingizni yozing..."
                              value={answersMap[q.id]?.text || ''}
                              onChange={(e) => {
                                const val = e.target.value;
                                setAnswersMap((prev) => ({
                                  ...prev,
                                  [q.id]: { text: val, audioUrl: '' },
                                }));
                              }}
                              onBlur={(e) => handleSaveAnswer(q.id, e.target.value)}
                              className="w-full px-4 py-3 border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 text-slate-800 dark:text-slate-100 placeholder:text-slate-400 dark:placeholder:text-slate-500"
                            />
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              )}
            </div>
          )}

          {/* 2. READING SECTION (SPLIT-SCREEN) */}
          {currentSection.type === 'reading' && (
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 items-start">
              {/* Left Column: Passage Text with Interactive Highlighter */}
              <ReadingPassageHighlighter
                passageText={currentSection.passage_text || ''}
                sessionId={sessionId}
                sectionId={currentSection.id}
                className="lg:sticky lg:top-40 max-h-[75vh]"
              />

              {/* Right Column: Questions */}
              {currentSection.instructions?.includes('ielts-reading-container') ? (
                <div className="space-y-4">
                  <IeltsReadingSection
                    ref={ieltsContainerRef}
                    instructionsHtml={currentSection.instructions}
                    qnumToQuestionId={qnumToQuestionId}
                    initialAnswers={answersMap}
                    onSaveAnswer={handleSaveAnswer}
                    onAnswerUpdated={handleLiveAnswerUpdate}
                    className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm"
                  />

                  {/* Question Navigator Palette */}
                  <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 shadow-sm">
                    <div className="flex items-center justify-between mb-2">
                      <span className="text-xs font-bold text-slate-700 dark:text-slate-300 uppercase tracking-wider">
                        Ushbu bo‘lim savollari ({currentSection.questions?.length || 0} ta)
                      </span>
                      <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300">
                        Bajarildi:{' '}
                        {(currentSection.questions || []).filter((q) => Boolean(answersMap[q.id]?.text)).length} /{' '}
                        {currentSection.questions?.length || 0}
                      </span>
                    </div>
                    <div className="flex flex-wrap items-center gap-1.5 pt-1">
                      {(currentSection.questions || []).map((q) => {
                        const isAns = Boolean(answersMap[q.id]?.text);
                        return (
                          <button
                            key={q.id}
                            type="button"
                            onClick={() => scrollToQuestion(q.order_index)}
                            className={`w-7 h-7 rounded-lg text-xs font-bold transition-all flex items-center justify-center ${
                              isAns
                                ? 'bg-emerald-600 text-white shadow-xs'
                                : 'bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-300 hover:border-emerald-500 hover:bg-white dark:hover:bg-slate-700'
                            }`}
                            title={`Savol #${q.order_index}: ${isAns ? 'Javob berilgan' : 'Javob berilmagan'}`}
                          >
                            {q.order_index}
                          </button>
                        );
                      })}
                    </div>
                  </div>
                </div>
              ) : (
                <div className="space-y-4">
                  {(Array.isArray(currentSection.questions) ? currentSection.questions : []).map((q, qIdx) => {
                    const options = getOptions(q.options);
                    return (
                      <div key={q.id || qIdx} className="bg-white rounded-2xl border border-slate-200 p-5 sm:p-6 shadow-sm">
                        <div className="flex items-center justify-between mb-3">
                          <span className="text-xs font-bold uppercase text-slate-400">Savol #{qIdx + 1}</span>
                          <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 text-slate-600">
                            {q.points} ball
                          </span>
                        </div>

                        <h4 className="text-base font-semibold text-slate-900 mb-4">{q.question_text}</h4>

                        {options.length > 0 ? (
                          <div className="space-y-2">
                            {options.map((opt, optIdx) => {
                              const isChecked = answersMap[q.id]?.text === opt;
                              return (
                                <label
                                  key={optIdx}
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
                                    onChange={() => handleSaveAnswer(q.id, opt)}
                                    className="text-emerald-600 focus:ring-emerald-500 w-4 h-4"
                                  />
                                  <span>{opt}</span>
                                </label>
                              );
                            })}
                          </div>
                        ) : (
                          <div>
                            <input
                              type="text"
                              placeholder="Javobingizni yozing..."
                              value={answersMap[q.id]?.text || ''}
                              onChange={(e) => {
                                const val = e.target.value;
                                setAnswersMap((prev) => ({
                                  ...prev,
                                  [q.id]: { text: val, audioUrl: '' },
                                }));
                              }}
                              onBlur={(e) => handleSaveAnswer(q.id, e.target.value)}
                              className="w-full px-4 py-3 border border-slate-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 text-slate-800"
                            />
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              )}
            </div>
          )}

          {/* 3. WRITING SECTION */}
          {currentSection.type === 'writing' && (
            <div className="space-y-6">
              {(Array.isArray(currentSection.questions) ? currentSection.questions : []).map((q, qIdx) => {
                const currentText = answersMap[q.id]?.text || '';
                const wordCount = countWords(currentText);
                const targetWords = qIdx === 0 ? 150 : 250;
                const isTargetReached = wordCount >= targetWords;

                return (
                  <div key={q.id || qIdx} className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-amber-700 dark:text-amber-400 bg-amber-50 dark:bg-amber-950/60 px-2.5 py-1 rounded-md border border-amber-200 dark:border-amber-800">
                        Writing Topshirig‘i #{qIdx + 1}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                        Maks: {q.points} ball
                      </span>
                    </div>

                    <div className="bg-slate-50 dark:bg-slate-800/80 p-4 rounded-xl border border-slate-200 dark:border-slate-700 space-y-3">
                      <div className="text-slate-800 dark:text-slate-200 text-sm font-semibold leading-relaxed whitespace-pre-wrap">
                        {q.question_text}
                      </div>
                      {Array.isArray(q.options) && q.options.length > 0 && typeof q.options[0] === 'string' && (q.options[0].startsWith('/') || q.options[0].startsWith('http')) && (
                        <div className="bg-white dark:bg-slate-900 p-3 rounded-xl border border-slate-200 dark:border-slate-700 shadow-xs inline-block max-w-full">
                          <img
                            src={q.options[0]}
                            alt={`Writing Task ${qIdx + 1} Diagram`}
                            className="max-h-[500px] w-auto max-w-full object-contain rounded-lg mx-auto"
                            onError={(e) => {
                              if (Array.isArray(q.options) && q.options[1] && e.currentTarget.src !== q.options[1]) {
                                e.currentTarget.src = q.options[1];
                              }
                            }}
                          />
                        </div>
                      )}
                    </div>

                    <div>
                      <div className="flex items-center justify-between text-xs mb-2">
                        <span className="text-slate-500 dark:text-slate-400 font-medium">Insho matnini bu yerga yozing:</span>
                        <div
                          className={`font-mono font-bold px-2 py-1 rounded-md text-xs ${
                            isTargetReached
                              ? 'bg-emerald-100 dark:bg-emerald-950/80 text-emerald-800 dark:text-emerald-300'
                              : 'bg-amber-100 dark:bg-amber-950/80 text-amber-800 dark:text-amber-300'
                          }`}
                        >
                          So‘zlar: {wordCount} / minimum {targetWords}
                        </div>
                      </div>

                      <textarea
                        rows={12}
                        value={currentText}
                        onChange={(e) => handleSaveAnswer(q.id, e.target.value)}
                        placeholder={`Insho yozishni boshlang (kamida ${targetWords} so‘z)...`}
                        className="w-full p-4 rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 font-sans leading-relaxed placeholder:text-slate-400 dark:placeholder:text-slate-500"
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
              {(Array.isArray(currentSection.questions) ? currentSection.questions : []).map((q, qIdx) => {
                const isRecordingThis = recordingQuestionId === q.id;
                const existingRecording = recordedAudios[q.id];
                const savedAudioUrl = answersMap[q.id]?.audioUrl;

                return (
                  <div key={q.id || qIdx} className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
                    <div className="flex items-center justify-between">
                      <span className="text-xs font-bold uppercase text-purple-700 dark:text-purple-400 bg-purple-50 dark:bg-purple-950/60 px-2.5 py-1 rounded-md border border-purple-200 dark:border-purple-800">
                        Speaking Part #{qIdx + 1}
                      </span>
                      <span className="text-xs font-semibold px-2 py-0.5 rounded bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400">
                        Maks: {q.points} ball
                      </span>
                    </div>

                    <p className="text-slate-900 dark:text-purple-100 text-sm font-bold leading-relaxed bg-purple-50/50 dark:bg-purple-950/30 p-4 rounded-xl border border-purple-100 dark:border-purple-900/50">
                      {q.question_text}
                    </p>

                    {/* Microphone Controls */}
                    <div className="p-5 bg-slate-50 dark:bg-slate-800/80 rounded-xl border border-slate-200 dark:border-slate-700 flex flex-col sm:flex-row items-center justify-between gap-4">
                      <div className="flex items-center gap-3">
                        <div
                          className={`w-12 h-12 rounded-2xl flex items-center justify-center transition-all ${
                            isRecordingThis
                              ? 'bg-rose-500 text-white animate-pulse'
                              : 'bg-purple-100 dark:bg-purple-900/60 text-purple-700 dark:text-purple-300'
                          }`}
                        >
                          <Mic className="w-6 h-6" />
                        </div>
                        <div>
                          <div className="text-sm font-bold text-slate-800 dark:text-slate-200">
                            {isRecordingThis
                              ? 'Ovoz yozilmoqda...'
                              : savedAudioUrl
                              ? 'Javob muvaffaqiyatli saqlangan'
                              : 'Ovozingizni yozib oling'}
                          </div>
                          <div className="text-xs text-slate-500 dark:text-slate-400 font-mono">
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
                      <div className="p-4 bg-emerald-50 dark:bg-emerald-950/40 rounded-xl border border-emerald-200 dark:border-emerald-800/80 flex flex-col sm:flex-row items-center justify-between gap-3">
                        <div className="flex items-center gap-2">
                          <CheckCircle className="w-5 h-5 text-emerald-600 dark:text-emerald-400 flex-shrink-0" />
                          <span className="text-xs font-semibold text-emerald-900 dark:text-emerald-200">
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
          <div className="flex items-center justify-between pt-6 border-t border-slate-200 dark:border-slate-800">
            <button
              onClick={() => handleSectionChange(Math.max(0, currentSectionIndex - 1))}
              disabled={currentSectionIndex === 0}
              className="px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-xs font-semibold text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800 disabled:opacity-30 transition-all flex items-center gap-1.5"
            >
              <ChevronLeft className="w-4 h-4" /> Oldingi bo‘lim
            </button>

            {currentSectionIndex < sections.length - 1 ? (
              <button
                onClick={() => handleSectionChange(Math.min(sections.length - 1, currentSectionIndex + 1))}
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
      ) : (
        <div className="p-8 text-center bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 text-slate-500 dark:text-slate-400">
          Ushbu testda bo‘limlar mavjud emas.
        </div>
      )}

      {/* Submit Confirmation Modal */}
      {showSubmitModal && (
        <div className="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-white dark:bg-slate-900 rounded-2xl max-w-md w-full p-6 space-y-4 shadow-xl border border-slate-100 dark:border-slate-800">
            <div className="w-12 h-12 rounded-2xl bg-amber-50 dark:bg-amber-950/60 text-amber-600 dark:text-amber-400 flex items-center justify-center mx-auto">
              <AlertTriangle className="w-6 h-6" />
            </div>

            <h3 className="text-lg font-bold text-center text-slate-900 dark:text-white">
              Imtihonni topshirishni tasdiqlaysizmi?
            </h3>
            <p className="text-xs text-slate-600 dark:text-slate-400 text-center leading-relaxed">
              Reading va Listening natijalari avtomatik hisoblanadi. Writing va Speaking javoblaringiz esa tekshirish uchun o‘qituvchiga yuboriladi.
            </p>

            <div className="flex gap-2 pt-2">
              <button
                onClick={() => setShowSubmitModal(false)}
                disabled={submitting}
                className="flex-1 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-slate-700 dark:text-slate-300 text-xs font-bold hover:bg-slate-50 dark:hover:bg-slate-800 transition-all"
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
