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
  apiUploadImage,
  apiUploadVideo,
  apiUpdateQuestionExplanation,
  apiUpdateTest,
  apiUpdateSection,
  apiDeleteSection,
  apiUpdateQuestion,
  apiDeleteQuestion,
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
  FileText,
  Table,
  Video,
  Volume2,
  X,
  ArrowLeft,
  ExternalLink,
  ArrowDownUp,
  ChevronRight,
} from 'lucide-react';
import {
  IELTS_QUESTION_CATEGORIES,
  IeltsQuestionCategory,
  getQuestionCategory,
} from '@/lib/questionTypes';
import QuestionExplanationViewer, { parseEmbedVideoUrl } from '@/components/QuestionExplanationViewer';

interface ConstructorQuestionTypeMeta {
  id: string;
  title: string;
  badge: string;
  sub: string;
  baseCategory: IeltsQuestionCategory;
  placeholder: string;
  sectionTypes: ('reading' | 'listening' | 'writing' | 'speaking')[];
  defaultOptions?: string[];
}

const IELTS_CONSTRUCTOR_TYPES: ConstructorQuestionTypeMeta[] = [
  {
    id: 'mc_single',
    title: 'Multiple Choice (one answer)',
    badge: '🔘 Single Choice',
    sub: 'Yakka to‘g‘ri javob (A, B, C, D)',
    baseCategory: 'multiple_choice',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Savol matnini kiriting (masalan: According to the passage, why did the author...?)',
  },
  {
    id: 'mc_multi',
    title: 'Multiple Choice (more than one answer)',
    badge: '☑️ Multi Selection',
    sub: 'Bir nechta to‘g‘ri javob (Choose TWO / THREE)',
    baseCategory: 'multiple_selection',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Savol matnini kiriting (masalan: Which TWO of the following reasons are mentioned...?)',
  },
  {
    id: 'tf_ng',
    title: 'Identifying Information (True/False/Not Given)',
    badge: '⚖️ True / False / Not Given',
    sub: 'Matndagi faktik ma’lumot bilan solishtirish',
    baseCategory: 'true_false_not_given',
    sectionTypes: ['reading'],
    placeholder: 'Mulohaza matnini kiriting (masalan: The trees were originally planted to prevent soil erosion.)',
  },
  {
    id: 'yn_ng',
    title: 'Identifying Writer’s Views (Yes/No/Not Given)',
    badge: '⚖️ Yes / No / Not Given',
    sub: 'Muallif qarashi va da’volari bilan solishtirish',
    baseCategory: 'yes_no_not_given',
    sectionTypes: ['reading'],
    placeholder: 'Muallif qarashi haqidagi mulohaza (masalan: The writer suggests that future energy needs will...)',
  },
  {
    id: 'note_completion',
    title: 'Note Completion',
    badge: '📝 Note Completion',
    sub: 'Qaydlar bo‘sh joylarini to‘ldirish (1–3 so‘z)',
    baseCategory: 'completion',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Qaydlar matni (masalan: Primary cause of soil degradation: ________)',
  },
  {
    id: 'table_completion',
    title: 'Table Completion',
    badge: '📊 Table Completion',
    sub: 'Jadval kataklarini to‘ldirish',
    baseCategory: 'completion',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Jadval qatori / katagi (masalan: Year: 1985 | Event: ________ | Location: Tokyo)',
  },
  {
    id: 'matching_features',
    title: 'Matching Features',
    badge: '🔍 Matching Features',
    sub: 'Olimlar, davrlar yoki xususiyatlarni moslashtirish',
    baseCategory: 'matching',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Savol yoki bayonot (masalan: Who was the first to propose continental drift?)',
    defaultOptions: ['A. Isaac Newton', 'B. Charles Darwin', 'C. Alfred Wegener', 'D. James Hutton'],
  },
  {
    id: 'summary_completion_text',
    title: 'Summary Completion (selecting words from the text)',
    badge: '📄 Summary (From Text)',
    sub: 'Matndan so‘z tanlab xulosani to‘ldirish',
    baseCategory: 'completion',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Xulosa matni (masalan: Overall, the new approach proved to be exceptionally ________.)',
  },
  {
    id: 'summary_completion_list',
    title: 'Summary Completion (selecting from a list of words or phrases)',
    badge: '📦 Summary (From List)',
    sub: 'So‘zlar / variantlar qutisidan tanlash (A–G)',
    baseCategory: 'matching',
    sectionTypes: ['reading'],
    placeholder: 'Xulosa matni (masalan: The resulting alloy was unusually [A/B/C/D] under extreme heat.)',
    defaultOptions: ['A. flexible', 'B. resistant', 'C. fragile', 'D. lightweight', 'E. conductive'],
  },
  {
    id: 'sentence_completion',
    title: 'Sentence Completion',
    badge: '✍️ Sentence Completion',
    sub: 'Gaplarni tugallash (No more than X words)',
    baseCategory: 'completion',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Tugallanmagan gap (masalan: The majority of local inhabitants were employed in ________.)',
  },
  {
    id: 'matching_sentence_endings',
    title: 'Matching Sentence Endings',
    badge: '🔗 Sentence Endings',
    sub: 'Gap boshlanishiga mos yakunni tanlash (A–F)',
    baseCategory: 'matching',
    sectionTypes: ['reading'],
    placeholder: 'Gap boshi (masalan: The initial research into solar cells...)',
    defaultOptions: [
      'A. relied entirely on seasonal agriculture.',
      'B. built stone fortifications to prevent flooding.',
      'C. abandoned their settlements after severe drought.',
    ],
  },
  {
    id: 'matching_headings',
    title: 'Matching Headings',
    badge: '📑 Matching Headings',
    sub: 'Paragraflarga mos sarlavha tanlash (i, ii, iii...)',
    baseCategory: 'matching',
    sectionTypes: ['reading', 'listening'],
    placeholder: 'Paragraf ko‘rsatkichi (masalan: Paragraph A, Paragraph B...)',
    defaultOptions: [
      'i. An unexpected discovery in remote regions',
      'ii. Economic hurdles and political debates',
      'iii. Global impact and future forecast',
      'iv. Methods of preservation',
      'v. Traditional misconceptions',
    ],
  },
  {
    id: 'essay',
    title: 'Writing Task (Task 1 / Task 2)',
    badge: '📝 Writing Task',
    sub: 'Grafik tahlili (Task 1) yoki Insho (Task 2)',
    baseCategory: 'essay',
    sectionTypes: ['writing'],
    placeholder: 'Writing topshirig‘i sharti (masalan: WRITING TASK 2: Some people believe that...)',
  },
  {
    id: 'speaking',
    title: 'Speaking Prompt',
    badge: '🎙️ Speaking Prompt',
    sub: 'Nutq topshirig‘i (Part 1, Part 2 cue card yoki Part 3)',
    baseCategory: 'speaking',
    sectionTypes: ['speaking'],
    placeholder: 'Speaking savoli yoki cue card mavzusi (masalan: Describe a memorable journey...)',
  },
];

export default function AdminPage() {
  const router = useRouter();
  const [mounted, setMounted] = useState(false);
  const [activeTab, setActiveTab] = useState<'tests' | 'editor' | 'users'>('tests');
  const [users, setUsers] = useState<User[]>([]);
  const [loadingUsers, setLoadingUsers] = useState(false);
  const [userSearch, setUserSearch] = useState('');
  const [roleUpdatingId, setRoleUpdatingId] = useState<number | null>(null);
  const [roleMessage, setRoleMessage] = useState<string>('');

  const [tests, setTests] = useState<Test[]>([]);
  const [loading, setLoading] = useState(true);
  const [filterTab, setFilterTab] = useState<'all' | 'reading' | 'listening' | 'writing' | 'speaking'>('all');
  const [adminSortOrder, setAdminSortOrder] = useState<'newest' | 'cambridge'>('newest');
  const [newlyCreatedTestId, setNewlyCreatedTestId] = useState<number | null>(null);
  const [newTestSuccessBanner, setNewTestSuccessBanner] = useState<string | null>(null);

  // New test modal/form
  const [showNewTest, setShowNewTest] = useState(false);
  const [newTestModule, setNewTestModule] = useState<'reading' | 'listening' | 'writing' | 'speaking'>('reading');
  const [newTitle, setNewTitle] = useState('');
  const [newDesc, setNewDesc] = useState('');
  const [newDuration, setNewDuration] = useState(60);
  const [newLevel, setNewLevel] = useState('Multi-level (A1-C1)');

  // Selected test for inspecting sections & questions
  const [selectedTest, setSelectedTest] = useState<Test | null>(null);

  // New Question Explanation States
  const [newExpText, setNewExpText] = useState('');
  const [newExpAudioUrl, setNewExpAudioUrl] = useState('');
  const [newExpVideoUrl, setNewExpVideoUrl] = useState('');
  const [newExpImageUrl, setNewExpImageUrl] = useState('');
  const [newExpFileName, setNewExpFileName] = useState('');
  const [isUploadingExpMedia, setIsUploadingExpMedia] = useState(false);
  const [showNewExpSection, setShowNewExpSection] = useState(false);

  // Section Editing Modal
  const [editingSection, setEditingSection] = useState<Section | null>(null);
  const [editSecTitle, setEditSecTitle] = useState('');
  const [editSecInstructions, setEditSecInstructions] = useState('');
  const [editSecPassageText, setEditSecPassageText] = useState('');
  const [editSecAudioUrl, setEditSecAudioUrl] = useState('');

  // Question Editing Modal
  const [editingQuestion, setEditingQuestion] = useState<Question | null>(null);
  const [editQText, setEditQText] = useState('');
  const [editQCorrectAnswer, setEditQCorrectAnswer] = useState('');
  const [editQPoints, setEditQPoints] = useState(1);
  const [editQOptions, setEditQOptions] = useState('');

  // Existing Question Explanation Editing
  const [editingExpQuestion, setEditingExpQuestion] = useState<Question | null>(null);
  const [editExpText, setEditExpText] = useState('');
  const [editExpAudioUrl, setEditExpAudioUrl] = useState('');
  const [editExpVideoUrl, setEditExpVideoUrl] = useState('');
  const [editExpImageUrl, setEditExpImageUrl] = useState('');
  const [editExpFileName, setEditExpFileName] = useState('');
  const [isSavingEditExp, setIsSavingEditExp] = useState(false);
  const [isUploadingEditExpMedia, setIsUploadingEditExpMedia] = useState(false);

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
  const [selectedConstructorType, setSelectedConstructorType] = useState<string>('mc_single');
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

  // Table Completion Image
  const [tableImageUrl, setTableImageUrl] = useState('');
  const [isUploadingTableImg, setIsUploadingTableImg] = useState(false);

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

    if (typeof window !== 'undefined') {
      const params = new URLSearchParams(window.location.search);
      const testIdParam = params.get('testId');
      if (testIdParam) {
        const id = parseInt(testIdParam, 10);
        if (!isNaN(id)) {
          handleSelectTest(id);
          setActiveTab('editor');
        }
      }
    }
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

  const sortAdminTests = (a: Test, b: Test): number => {
    // 1. Yangi yaratilgan test har doim eng yuqorida (1-o'rinda) tursin
    if (newlyCreatedTestId) {
      if (a.id === newlyCreatedTestId) return -1;
      if (b.id === newlyCreatedTestId) return 1;
    }
    // 2. Eng yangilari birinchi (default)
    if (adminSortOrder === 'newest') {
      if (b.id !== a.id) return b.id - a.id;
      const bTime = b.created_at ? new Date(b.created_at).getTime() : 0;
      const aTime = a.created_at ? new Date(a.created_at).getTime() : 0;
      return bTime - aTime;
    }
    // 3. Kitob tartibida (Cambridge 13-21)
    return sortCambridgeTests(a, b);
  };

  const loadTests = async () => {
    setLoading(true);
    try {
      const data = await apiGetTests();
      const list = Array.isArray(data) ? [...data] : [];
      list.sort(sortAdminTests);
      setTests(list);
    } catch (e: any) {
      alert('Testlarni yuklashda xatolik: ' + e.message);
    } finally {
      setLoading(false);
    }
  };

  const handleSelectTest = async (testId: number, autoScroll = false) => {
    try {
      const details = await apiGetTestDetails(testId);
      setSelectedTest(details);
      if (autoScroll) {
        setTimeout(() => {
          document.getElementById('selected-test-section')?.scrollIntoView({ behavior: 'smooth' });
        }, 100);
      }
    } catch (e: any) {
      alert('Test tafsilotlarini yuklashda xatolik: ' + e.message);
    }
  };

  const handleOpenTestEditor = async (testId: number) => {
    await handleSelectTest(testId);
    setActiveTab('editor');
    if (typeof window !== 'undefined') {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  };

  const handleOpenNewTestModal = () => {
    const defaultModule: 'reading' | 'listening' | 'writing' | 'speaking' =
      filterTab === 'all' ? 'reading' : filterTab;
    setNewTestModule(defaultModule);
    if (defaultModule === 'reading') setNewDuration(60);
    else if (defaultModule === 'listening') setNewDuration(40);
    else if (defaultModule === 'writing') setNewDuration(60);
    else if (defaultModule === 'speaking') setNewDuration(15);
    setShowNewTest(true);
  };

  const handleModuleChange = (mod: 'reading' | 'listening' | 'writing' | 'speaking') => {
    setNewTestModule(mod);
    if (mod === 'reading') setNewDuration(60);
    else if (mod === 'listening') setNewDuration(40);
    else if (mod === 'writing') setNewDuration(60);
    else if (mod === 'speaking') setNewDuration(15);
  };

  const handleCreateTest = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const moduleKeywords: Record<'reading' | 'listening' | 'writing' | 'speaking', string> = {
        reading: 'Reading',
        listening: 'Listening',
        writing: 'Writing',
        speaking: 'Speaking',
      };
      const modWord = moduleKeywords[newTestModule];
      let finalTitle = newTitle.trim();

      // Agar kiritilgan nomda modul so'zi bo'lmasa, uni tartibli va to'g'ri qo'shamiz
      if (!finalTitle.toLowerCase().includes(modWord.toLowerCase())) {
        const testMatch = finalTitle.match(/(Test\s*\d+)/i);
        if (testMatch) {
          finalTitle = finalTitle.replace(testMatch[0], `${modWord} ${testMatch[0]}`);
        } else {
          finalTitle = `${finalTitle} (${modWord})`;
        }
      }

      const created = await apiCreateTest(finalTitle, newDesc, newLevel, newDuration);
      setShowNewTest(false);
      setNewTitle('');
      setNewDesc('');
      setFilterTab(newTestModule);
      setNewlyCreatedTestId(created.id);

      // Yangi yaratilgan testni darhol ro'yxat boshiga (1-o'ringa) joylashtiramiz va belgilaymiz
      setTests(prev => [created, ...prev.filter(t => t.id !== created.id)]);
      setSelectedTest(created);
      setActiveTab('tests');
      setNewTestSuccessBanner(`"${created.title}" testi muvaffaqiyatli yaratildi va ro‘yxatning 1-o‘rniga joylashtirildi!`);
      setTimeout(() => setNewTestSuccessBanner(null), 8000);

      // Sahifani eng yuqoriga ravon ko'taramiz
      if (typeof window !== 'undefined') {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      }

      // Testning to'liq ma'lumotlarini yuklaymiz
      if (created?.id) {
        await handleSelectTest(created.id);
      }

      loadTests();
    } catch (e: any) {
      alert('Test yaratishda xatolik: ' + e.message);
    }
  };

  const getTestModule = (test: Test | null): 'reading' | 'listening' | 'writing' | 'speaking' => {
    if (!test) return 'reading';
    const title = (test.title || '').toLowerCase();
    if (title.includes('reading')) return 'reading';
    if (title.includes('listening')) return 'listening';
    if (title.includes('writing')) return 'writing';
    if (title.includes('speaking')) return 'speaking';
    if (test.sections && test.sections.length > 0) {
      const secType = test.sections[0].type;
      if (['reading', 'listening', 'writing', 'speaking'].includes(secType)) {
        return secType as any;
      }
    }
    return 'reading';
  };

  const handleOpenAddSection = () => {
    if (selectedTest) {
      const mod = getTestModule(selectedTest);
      setSectionType(mod);
      const count = (selectedTest.sections?.length || 0) + 1;

      if (mod === 'reading') {
        setSectionTitle(`Reading Passage ${count}`);
        setSectionInstructions('Chap tarafdagi matnni diqqat bilan o‘qing va o‘ng tarafdagi savollarga javob bering.');
      } else if (mod === 'listening') {
        setSectionTitle(`Listening Section ${count}`);
        setSectionInstructions('Audio faylni tinglang va berilgan savollarga javob bering.');
      } else if (mod === 'writing') {
        setSectionTitle(`Writing Task ${count}`);
        setSectionInstructions('Berilgan mavzu bo‘yicha topshiriqni bajaring.');
      } else if (mod === 'speaking') {
        setSectionTitle(`Speaking Part ${count}`);
        setSectionInstructions('Savollarga og‘zaki javob bering va audio yozuvni saqlang.');
      }
    }
    setShowAddSection(true);
  };

  const handleDeleteTest = async (testId: number) => {
    if (!confirm('Rostdan ham ushbu testni o‘chirmoqchimisiz?')) return;
    try {
      await apiDeleteTest(testId);
      if (selectedTest?.id === testId) setSelectedTest(null);
      if (newlyCreatedTestId === testId) setNewlyCreatedTestId(null);
      setTests(prev => prev.filter(t => t.id !== testId));
      loadTests();
    } catch (e: any) {
      alert('O‘chirishda xatolik: ' + e.message);
    }
  };

  const handleOpenEditSection = (sec: Section) => {
    setEditingSection(sec);
    setEditSecTitle(sec.title || '');
    setEditSecInstructions(sec.instructions || '');
    setEditSecPassageText(sec.passage_text || '');
    setEditSecAudioUrl(sec.audio_url || '');
  };

  const handleSaveSectionEdit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!editingSection || !selectedTest) return;
    try {
      await apiUpdateSection(editingSection.id, {
        title: editSecTitle,
        instructions: editSecInstructions,
        passage_text: editSecPassageText,
        audio_url: editSecAudioUrl,
      });
      setEditingSection(null);
      await handleSelectTest(selectedTest.id);
      loadTests();
    } catch (e: any) {
      alert('Bo‘limni saqlashda xatolik: ' + e.message);
    }
  };

  const handleDeleteSection = async (secId: number) => {
    if (!selectedTest) return;
    if (!confirm('Haqiqatan ham ushbu bo‘lim va unga tegishli barcha savollarni o‘chirmoqchimisiz?')) return;
    try {
      await apiDeleteSection(secId);
      await handleSelectTest(selectedTest.id);
      loadTests();
    } catch (e: any) {
      alert('Bo‘limni o‘chirishda xatolik: ' + e.message);
    }
  };

  const handleOpenEditQuestion = (q: Question) => {
    setEditingQuestion(q);
    setEditQText(q.question_text || '');
    setEditQCorrectAnswer(q.correct_answer || '');
    setEditQPoints(q.points || 1);
    setEditQOptions(Array.isArray(q.options) ? q.options.join(' | ') : '');
  };

  const handleSaveQuestionEdit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!editingQuestion || !selectedTest) return;
    try {
      const opts = editQOptions
        .split('|')
        .map((s) => s.trim())
        .filter(Boolean);
      await apiUpdateQuestion(editingQuestion.id, {
        question_text: editQText,
        correct_answer: editQCorrectAnswer,
        points: editQPoints,
        options: opts,
      });
      setEditingQuestion(null);
      await handleSelectTest(selectedTest.id);
    } catch (e: any) {
      alert('Savolni saqlashda xatolik: ' + e.message);
    }
  };

  const handleDeleteQuestion = async (qId: number) => {
    if (!selectedTest) return;
    if (!confirm('Haqiqatan ham ushbu savolni o‘chirmoqchimisiz?')) return;
    try {
      await apiDeleteQuestion(qId);
      await handleSelectTest(selectedTest.id);
    } catch (e: any) {
      alert('Savolni o‘chirishda xatolik: ' + e.message);
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

  const handleUploadMediaFile = async (file: File, isEditing = false) => {
    if (!file) return;
    if (isEditing) setIsUploadingEditExpMedia(true);
    else setIsUploadingExpMedia(true);

    try {
      const isImage = file.type.startsWith('image/') || /\.(png|jpe?g|gif|webp|svg)$/i.test(file.name);
      const isAudio = file.type.startsWith('audio/') || /\.(mp3|wav|ogg|m4a|aac)$/i.test(file.name);
      const isVideo = file.type.startsWith('video/') || /\.(mp4|webm|mov|mkv)$/i.test(file.name);

      if (isImage) {
        const res = await apiUploadImage(file, file.name);
        if (isEditing) {
          setEditExpImageUrl(res.url);
          setEditExpAudioUrl('');
          setEditExpVideoUrl('');
          setEditExpFileName(file.name);
        } else {
          setNewExpImageUrl(res.url);
          setNewExpAudioUrl('');
          setNewExpVideoUrl('');
          setNewExpFileName(file.name);
        }
      } else if (isAudio) {
        const res = await apiUploadAudio(file, file.name);
        if (isEditing) {
          setEditExpAudioUrl(res.url);
          setEditExpImageUrl('');
          setEditExpVideoUrl('');
          setEditExpFileName(file.name);
        } else {
          setNewExpAudioUrl(res.url);
          setNewExpImageUrl('');
          setNewExpVideoUrl('');
          setNewExpFileName(file.name);
        }
      } else if (isVideo) {
        const res = await apiUploadVideo(file, file.name);
        if (isEditing) {
          setEditExpVideoUrl(res.url);
          setEditExpImageUrl('');
          setEditExpAudioUrl('');
          setEditExpFileName(file.name);
        } else {
          setNewExpVideoUrl(res.url);
          setNewExpImageUrl('');
          setNewExpAudioUrl('');
          setNewExpFileName(file.name);
        }
      } else {
        alert('Iltimos, rasm (PNG, JPG), audio (MP3) yoki video (MP4) formatidagi fayl tanlang.');
      }
    } catch (err: any) {
      alert('Fayl yuklashda xatolik yuz berdi: ' + err.message);
    } finally {
      if (isEditing) setIsUploadingEditExpMedia(false);
      else setIsUploadingExpMedia(false);
    }
  };

  const handleRemoveExpMedia = (isEditing = false) => {
    if (isEditing) {
      setEditExpImageUrl('');
      setEditExpAudioUrl('');
      setEditExpVideoUrl('');
      setEditExpFileName('');
    } else {
      setNewExpImageUrl('');
      setNewExpAudioUrl('');
      setNewExpVideoUrl('');
      setNewExpFileName('');
    }
  };

  const handleSetExternalLink = (url: string, isEditing = false) => {
    const trimmed = url.trim();
    if (isEditing) {
      if (!trimmed) {
        setEditExpVideoUrl('');
        setEditExpFileName('');
        return;
      }
      setEditExpVideoUrl(trimmed);
      setEditExpImageUrl('');
      setEditExpAudioUrl('');
      setEditExpFileName(trimmed);
    } else {
      if (!trimmed) {
        setNewExpVideoUrl('');
        setNewExpFileName('');
        return;
      }
      setNewExpVideoUrl(trimmed);
      setNewExpImageUrl('');
      setNewExpAudioUrl('');
      setNewExpFileName(trimmed);
    }
  };

  const handleOpenEditExp = (q: Question) => {
    setEditingExpQuestion(q);
    setEditExpText(q.explanation_text || '');
    setEditExpAudioUrl(q.explanation_audio_url || '');
    setEditExpVideoUrl(q.explanation_video_url || '');
    setEditExpImageUrl(q.explanation_image_url || '');

    if (q.explanation_image_url) {
      setEditExpFileName(q.explanation_image_url.split('/').pop() || 'Rasm fayli');
    } else if (q.explanation_audio_url) {
      setEditExpFileName(q.explanation_audio_url.split('/').pop() || 'Audio fayl');
    } else if (q.explanation_video_url) {
      setEditExpFileName(q.explanation_video_url.split('/').pop() || 'Video fayl / havola');
    } else {
      setEditExpFileName('');
    }
  };

  const handleSaveExistingExp = async () => {
    if (!editingExpQuestion) return;
    setIsSavingEditExp(true);
    try {
      await apiUpdateQuestionExplanation(editingExpQuestion.id, {
        explanation_text: editExpText.trim(),
        explanation_audio_url: editExpAudioUrl.trim(),
        explanation_video_url: editExpVideoUrl.trim(),
        explanation_image_url: editExpImageUrl.trim(),
      });
      alert('Tushuntirish muvaffaqiyatli saqlandi!');
      setEditingExpQuestion(null);
      if (selectedTest) {
        handleSelectTest(selectedTest.id);
      }
    } catch (err: any) {
      alert('Tushuntirishni saqlashda xatolik: ' + err.message);
    } finally {
      setIsSavingEditExp(false);
    }
  };

  const handleGenerateAiExplanation = (isEditing = false) => {
    const qText = isEditing ? editingExpQuestion?.question_text : newQuestionText;
    const ans = isEditing ? editingExpQuestion?.correct_answer : correctAnswer;

    if (!qText && !ans) {
      alert('Iltimos, avval savol matni va to‘g‘ri javobni kiriting!');
      return;
    }

    const template = `💡 To‘g‘ri javob: "${ans || 'Berilgan variant'}"\n\n📋 Tushuntirish:\nUshbu savolda to‘g‘ri javob "${ans || ''}" bo‘lishining asosiy sababi - matn/audiodagi kalit so‘zlar va kontekst bilan to‘liq mos kelishidir.\n\n🔍 Kalit dalil:\nMatndagi mazmun savol talabiga to‘liq javob beradi va boshqa variantlar chalkashtiruvchi (distractor) hisoblanadi.`;

    if (isEditing) {
      setEditExpText(template);
    } else {
      setNewExpText(template);
      setShowNewExpSection(true);
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

  const handleTableImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setIsUploadingTableImg(true);
    try {
      const res = await apiUploadAudio(file, file.name);
      setTableImageUrl(res.url);
      alert('Jadval rasmi muvaffaqiyatli yuklandi!');
    } catch (e: any) {
      alert('Jadval rasmini yuklashda xatolik: ' + e.message);
    } finally {
      setIsUploadingTableImg(false);
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
        options = tableImageUrl.trim() ? [tableImageUrl.trim()] : [];
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
        explanation_text: newExpText.trim(),
        explanation_audio_url: newExpAudioUrl.trim(),
        explanation_video_url: newExpVideoUrl.trim(),
        explanation_image_url: newExpImageUrl.trim(),
      });

      alert('Yangi IELTS savoli muvaffaqiyatli qo‘shildi!');
      setSelectedSectionIdForQuestion(null);
      setNewQuestionText('');
      setMcOptions(['', '', '', '']);
      setMultiOptions(['', '', '', '', '']);
      setMultiCorrectAnswers([]);
      setMatchingOptions(['i. ', 'ii. ', 'iii. ', 'iv. ']);
      setWritingImageUrl('');
      setTableImageUrl('');
      setCorrectAnswer('');
      setQuestionPoints(1);
      setNewExpText('');
      setNewExpAudioUrl('');
      setNewExpVideoUrl('');
      setNewExpImageUrl('');
      setNewExpFileName('');
      setShowNewExpSection(false);
      setSelectedConstructorType('mc_single');
      setQuestionCategory('multiple_choice');
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
          onClick={handleOpenNewTestModal}
          className="px-4 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs sm:text-sm font-bold shadow-md transition-all flex items-center gap-2 cursor-pointer"
        >
          <Plus className="w-4 h-4" /> Yangi Test Yaratish
        </button>
      </div>

      {/* New Test Modal */}
      {showNewTest && (
        <div className="fixed inset-0 z-[100] bg-slate-950/80 backdrop-blur-md flex items-center justify-center p-4 overflow-y-auto">
          <div className="bg-white dark:bg-slate-900 rounded-2xl max-w-lg w-full p-6 space-y-4 shadow-2xl border border-slate-100 dark:border-slate-800 my-auto">
            <div>
              <h3 className="text-lg font-bold text-slate-900 dark:text-white">Yangi Test Yaratish</h3>
              <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">
                Avval test modulini tanlang, so‘ng nom va parametrlarini kiriting.
              </p>
            </div>

            <form onSubmit={handleCreateTest} className="space-y-4">
              {/* Module Selector */}
              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1.5">
                  Test Moduli (Qaysi bo‘lim uchun?)
                </label>
                <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
                  <button
                    type="button"
                    onClick={() => handleModuleChange('reading')}
                    className={`p-2.5 rounded-xl border text-center transition-all cursor-pointer flex flex-col items-center gap-1 ${
                      newTestModule === 'reading'
                        ? 'bg-emerald-50 dark:bg-emerald-950/50 border-emerald-500 text-emerald-700 dark:text-emerald-300 ring-2 ring-emerald-500/20 font-bold'
                        : 'bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-400 hover:border-slate-300'
                    }`}
                  >
                    <BookOpen className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
                    <span className="text-xs font-extrabold">Reading</span>
                    <span className="text-[10px] text-slate-400">60 daqiqa</span>
                  </button>

                  <button
                    type="button"
                    onClick={() => handleModuleChange('listening')}
                    className={`p-2.5 rounded-xl border text-center transition-all cursor-pointer flex flex-col items-center gap-1 ${
                      newTestModule === 'listening'
                        ? 'bg-blue-50 dark:bg-blue-950/50 border-blue-500 text-blue-700 dark:text-blue-300 ring-2 ring-blue-500/20 font-bold'
                        : 'bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-400 hover:border-slate-300'
                    }`}
                  >
                    <Headphones className="w-4 h-4 text-blue-600 dark:text-blue-400" />
                    <span className="text-xs font-extrabold">Listening</span>
                    <span className="text-[10px] text-slate-400">40 daqiqa</span>
                  </button>

                  <button
                    type="button"
                    onClick={() => handleModuleChange('writing')}
                    className={`p-2.5 rounded-xl border text-center transition-all cursor-pointer flex flex-col items-center gap-1 ${
                      newTestModule === 'writing'
                        ? 'bg-orange-50 dark:bg-orange-950/50 border-orange-500 text-orange-700 dark:text-orange-300 ring-2 ring-orange-500/20 font-bold'
                        : 'bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-400 hover:border-slate-300'
                    }`}
                  >
                    <Edit3 className="w-4 h-4 text-orange-600 dark:text-orange-400" />
                    <span className="text-xs font-extrabold">Writing</span>
                    <span className="text-[10px] text-slate-400">60 daqiqa</span>
                  </button>

                  <button
                    type="button"
                    onClick={() => handleModuleChange('speaking')}
                    className={`p-2.5 rounded-xl border text-center transition-all cursor-pointer flex flex-col items-center gap-1 ${
                      newTestModule === 'speaking'
                        ? 'bg-purple-50 dark:bg-purple-950/50 border-purple-500 text-purple-700 dark:text-purple-300 ring-2 ring-purple-500/20 font-bold'
                        : 'bg-white dark:bg-slate-800 border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-400 hover:border-slate-300'
                    }`}
                  >
                    <Mic className="w-4 h-4 text-purple-600 dark:text-purple-400" />
                    <span className="text-xs font-extrabold">Speaking</span>
                    <span className="text-[10px] text-slate-400">15 daqiqa</span>
                  </button>
                </div>
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Test Nomi</label>
                <input
                  type="text"
                  required
                  value={newTitle}
                  onChange={(e) => setNewTitle(e.target.value)}
                  placeholder={
                    newTestModule === 'reading'
                      ? 'Masalan: Cambridge IELTS 20 Academic Reading Test 1'
                      : newTestModule === 'listening'
                      ? 'Masalan: Cambridge IELTS 20 Academic Listening Test 1'
                      : newTestModule === 'writing'
                      ? 'Masalan: Cambridge IELTS 20 Academic Writing Test 1'
                      : 'Masalan: Cambridge IELTS 20 Academic Speaking Test 1'
                  }
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Tavsif</label>
                <textarea
                  rows={2}
                  value={newDesc}
                  onChange={(e) => setNewDesc(e.target.value)}
                  placeholder="Test haqida ma'lumot yoki yo'riqnoma..."
                  className="w-full px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400"
                />
              </div>

              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">Davomiyligi (daqiqa)</label>
                  <input
                    type="number"
                    value={newDuration}
                    onChange={(e) => setNewDuration(parseInt(e.target.value) || 60)}
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
                  className="flex-1 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-slate-700 dark:text-slate-300 text-xs font-bold hover:bg-slate-50 dark:hover:bg-slate-800 transition-all cursor-pointer"
                >
                  Bekor qilish
                </button>
                <button
                  type="submit"
                  className="flex-1 py-2.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold shadow-sm transition-all cursor-pointer"
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
      <div className="flex items-center gap-2.5 border-b border-slate-200 dark:border-slate-800 pb-3 flex-wrap">
        <button
          onClick={() => setActiveTab('tests')}
          className={`px-4 py-2.5 rounded-xl font-bold text-sm transition-all flex items-center gap-2 cursor-pointer ${
            activeTab === 'tests'
              ? 'bg-slate-900 dark:bg-emerald-600 text-white shadow-sm'
              : 'text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800'
          }`}
        >
          <BookOpen className="w-4 h-4" />
          <span>Testlar Boshqaruvi ({tests.length})</span>
        </button>

        {selectedTest && (
          <div
            className={`px-3.5 py-1.5 rounded-xl font-bold text-sm transition-all flex items-center gap-2 ${
              activeTab === 'editor'
                ? 'bg-emerald-600 text-white shadow-sm'
                : 'bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 hover:bg-emerald-100 dark:hover:bg-emerald-900/60'
            }`}
          >
            <button
              onClick={() => setActiveTab('editor')}
              className="flex items-center gap-2 cursor-pointer max-w-[260px] sm:max-w-md truncate"
            >
              <Sparkles className="w-4 h-4 shrink-0" />
              <span className="truncate">Bo‘limlar va Savollar: {selectedTest.title}</span>
            </button>
            <button
              onClick={(e) => {
                e.stopPropagation();
                setSelectedTest(null);
                setActiveTab('tests');
              }}
              className="p-1 hover:bg-black/20 rounded-lg transition-colors ml-1 cursor-pointer shrink-0"
              title="Yopish"
            >
              <X className="w-3.5 h-3.5" />
            </button>
          </div>
        )}

        <button
          onClick={() => { setActiveTab('users'); loadUsers(); }}
          className={`px-4 py-2.5 rounded-xl font-bold text-sm transition-all flex items-center gap-2 cursor-pointer ${
            activeTab === 'users'
              ? 'bg-slate-900 dark:bg-emerald-600 text-white shadow-sm'
              : 'text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800'
          }`}
        >
          <Users className="w-4 h-4" />
          <span>Foydalanuvchilar va Rollar ({users.length})</span>
        </button>
      </div>

      {activeTab === 'users' && (
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
                            className={`px-3 py-1 rounded-lg text-xs font-extrabold uppercase ${
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
                            className="px-3 py-1.5 text-xs sm:text-sm font-bold rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-800 dark:text-slate-200 outline-none focus:ring-2 focus:ring-emerald-500 cursor-pointer disabled:opacity-50"
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
      )}

      {(activeTab === 'tests' || (activeTab === 'editor' && !selectedTest)) && (
        <section className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm space-y-4">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <h2 className="text-lg font-bold text-slate-900 dark:text-white">Mavjud Testlar Ro‘yxati</h2>
            <p className="text-xs text-slate-500 dark:text-slate-400 mt-0.5">
              Testni tanlash (belgilash) uchun to‘g‘ridan-to‘g‘ri ustiga bosing yoki bo‘limlarni boshqarishga o‘ting.
            </p>
          </div>
          <div className="flex items-center gap-2 flex-wrap">
            {/* Saralash tartibi switcher */}
            <div className="flex items-center bg-slate-100 dark:bg-slate-800 p-1 rounded-xl text-xs font-semibold">
              <button
                type="button"
                onClick={() => setAdminSortOrder('newest')}
                className={`px-3 py-1.5 rounded-lg transition-all cursor-pointer flex items-center gap-1.5 ${
                  adminSortOrder === 'newest'
                    ? 'bg-white dark:bg-slate-700 text-slate-900 dark:text-white shadow-xs font-bold'
                    : 'text-slate-500 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white'
                }`}
              >
                <ArrowDownUp className="w-3.5 h-3.5 text-emerald-500" />
                <span>Eng yangilari birinchi</span>
              </button>
              <button
                type="button"
                onClick={() => setAdminSortOrder('cambridge')}
                className={`px-3 py-1.5 rounded-lg transition-all cursor-pointer flex items-center gap-1.5 ${
                  adminSortOrder === 'cambridge'
                    ? 'bg-white dark:bg-slate-700 text-slate-900 dark:text-white shadow-xs font-bold'
                    : 'text-slate-500 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white'
                }`}
              >
                <span>Kitob tartibida (13–21)</span>
              </button>
            </div>
            <span className="text-xs text-slate-500 dark:text-slate-400 font-semibold bg-slate-100 dark:bg-slate-800 px-3 py-1.5 rounded-xl">
              Jami: {tests.length} ta test
            </span>
          </div>
        </div>

        {/* Yangi test yaratilgandagi banner */}
        {newTestSuccessBanner && (
          <div className="p-4 rounded-xl bg-emerald-500/10 border border-emerald-500/30 text-emerald-800 dark:text-emerald-300 flex items-center justify-between gap-3 animate-fade-in shadow-xs">
            <div className="flex items-center gap-2.5">
              <Sparkles className="w-5 h-5 text-emerald-600 dark:text-emerald-400 shrink-0" />
              <span className="text-sm font-bold">{newTestSuccessBanner}</span>
            </div>
            {selectedTest && (
              <button
                onClick={() => handleOpenTestEditor(selectedTest.id)}
                className="px-3.5 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg text-xs font-black shadow-xs flex items-center gap-1.5 cursor-pointer shrink-0"
              >
                <span>Bo‘lim va savollar kiritish</span>
                <ChevronRight className="w-3.5 h-3.5" />
              </button>
            )}
          </div>
        )}

        {/* Filter Tabs */}
        {(() => {
          const readingTests = tests.filter((t) => t.title.toLowerCase().includes('reading'));
          const listeningTests = tests.filter((t) => t.title.toLowerCase().includes('listening'));
          const writingTests = tests.filter((t) => t.title.toLowerCase().includes('writing'));
          const speakingTests = tests.filter((t) => t.title.toLowerCase().includes('speaking'));

          const rawFilteredTests =
            filterTab === 'reading'
              ? readingTests
              : filterTab === 'listening'
              ? listeningTests
              : filterTab === 'writing'
              ? writingTests
              : filterTab === 'speaking'
              ? speakingTests
              : tests;

          // Saralash: yangi yaratilgan test har doim 1-o'rinda, qolganlari esa tanlangan tartibda
          const filteredTests = [...rawFilteredTests].sort(sortAdminTests);

          return (
            <>
              <div className="flex flex-wrap items-center gap-2 border-b border-slate-100 dark:border-slate-800 pb-3">
                <button
                  onClick={() => setFilterTab('all')}
                  className={`px-4 py-2 rounded-xl text-sm font-bold transition-all flex items-center gap-2 cursor-pointer ${
                    filterTab === 'all'
                      ? 'bg-slate-900 dark:bg-slate-100 text-white dark:text-slate-900 shadow-sm'
                      : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-700'
                  }`}
                >
                  <span>Barchasi</span>
                  <span
                    className={`px-2 py-0.5 rounded-full text-xs font-extrabold ${
                      filterTab === 'all'
                        ? 'bg-slate-700 dark:bg-slate-300 text-white dark:text-slate-900'
                        : 'bg-slate-200 dark:bg-slate-700 text-slate-700 dark:text-slate-300'
                    }`}
                  >
                    {tests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('reading')}
                  className={`px-4 py-2 rounded-xl text-sm font-bold transition-all flex items-center gap-2 cursor-pointer ${
                    filterTab === 'reading'
                      ? 'bg-emerald-600 text-white shadow-sm'
                      : 'bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 hover:bg-emerald-100 dark:hover:bg-emerald-900/60'
                  }`}
                >
                  <BookOpen className="w-4 h-4" />
                  <span>📖 Reading</span>
                  <span className="px-2 py-0.5 rounded-full text-xs font-extrabold bg-emerald-700 text-white">
                    {readingTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('listening')}
                  className={`px-4 py-2 rounded-xl text-sm font-bold transition-all flex items-center gap-2 cursor-pointer ${
                    filterTab === 'listening'
                      ? 'bg-blue-600 text-white shadow-sm'
                      : 'bg-blue-50 dark:bg-blue-950/40 text-blue-700 dark:text-blue-300 hover:bg-blue-100 dark:hover:bg-blue-900/60'
                  }`}
                >
                  <Headphones className="w-4 h-4" />
                  <span>🎧 Listening</span>
                  <span className="px-2 py-0.5 rounded-full text-xs font-extrabold bg-blue-700 text-white">
                    {listeningTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('writing')}
                  className={`px-4 py-2 rounded-xl text-sm font-bold transition-all flex items-center gap-2 cursor-pointer ${
                    filterTab === 'writing'
                      ? 'bg-orange-600 text-white shadow-sm'
                      : 'bg-orange-50 dark:bg-orange-950/40 text-orange-700 dark:text-orange-300 hover:bg-orange-100 dark:hover:bg-orange-900/60'
                  }`}
                >
                  <Edit3 className="w-4 h-4" />
                  <span>✍️ Writing</span>
                  <span className="px-2 py-0.5 rounded-full text-xs font-extrabold bg-orange-700 text-white">
                    {writingTests.length}
                  </span>
                </button>

                <button
                  onClick={() => setFilterTab('speaking')}
                  className={`px-4 py-2 rounded-xl text-sm font-bold transition-all flex items-center gap-2 cursor-pointer ${
                    filterTab === 'speaking'
                      ? 'bg-purple-600 text-white shadow-sm'
                      : 'bg-purple-50 dark:bg-purple-950/40 text-purple-700 dark:text-purple-300 hover:bg-purple-100 dark:hover:bg-purple-900/60'
                  }`}
                >
                  <Mic className="w-4 h-4" />
                  <span>🎙️ Speaking</span>
                  <span className="px-2 py-0.5 rounded-full text-xs font-extrabold bg-purple-700 text-white">
                    {speakingTests.length}
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
                    const isNewlyCreated = test.id === newlyCreatedTestId;
                    const isSelected = selectedTest?.id === test.id;
                    return (
                      <div
                        key={test.id}
                        onClick={() => handleSelectTest(test.id)}
                        className={`p-4 rounded-2xl border transition-all cursor-pointer ${
                          isSelected
                            ? 'bg-emerald-50/70 dark:bg-emerald-950/40 border-emerald-400 dark:border-emerald-600 ring-2 ring-emerald-500/30 shadow-md'
                            : isNewlyCreated
                            ? 'bg-amber-50/50 dark:bg-amber-950/30 border-amber-300 dark:border-amber-600/70 ring-2 ring-amber-500/30 shadow-sm'
                            : 'bg-white dark:bg-slate-800/80 hover:bg-slate-50/80 dark:hover:bg-slate-800 border-slate-200/80 dark:border-slate-700/80 shadow-xs'
                        }`}
                      >
                        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                          <div className="min-w-0 flex-1 space-y-1.5">
                            <div className="flex items-center gap-2.5 flex-wrap">
                              {isNewlyCreated && (
                                <span className="px-2.5 py-0.5 rounded-full text-[11px] font-black bg-gradient-to-r from-amber-500 to-orange-500 text-white shadow-xs animate-pulse flex items-center gap-1">
                                  <Sparkles className="w-3 h-3" /> YANGI QO‘SHILGAN
                                </span>
                              )}
                              {isSelected && (
                                <span className="px-2.5 py-0.5 rounded-full text-[11px] font-black bg-emerald-600 text-white shadow-xs flex items-center gap-1">
                                  <CheckCircle2 className="w-3 h-3" /> TANLANGAN
                                </span>
                              )}
                              {isReading ? (
                                <span className="px-3 py-1 rounded-lg text-xs font-extrabold bg-emerald-100 dark:bg-emerald-950/60 text-emerald-800 dark:text-emerald-300 flex items-center gap-1.5">
                                  <BookOpen className="w-3.5 h-3.5" /> Reading
                                </span>
                              ) : isListening ? (
                                <span className="px-3 py-1 rounded-lg text-xs font-extrabold bg-blue-100 dark:bg-blue-950/60 text-blue-800 dark:text-blue-300 flex items-center gap-1.5">
                                  <Headphones className="w-3.5 h-3.5" /> Listening
                                </span>
                              ) : isWriting ? (
                                <span className="px-3 py-1 rounded-lg text-xs font-extrabold bg-orange-100 dark:bg-orange-950/60 text-orange-800 dark:text-orange-300 flex items-center gap-1.5">
                                  <Edit3 className="w-3.5 h-3.5" /> Writing
                                </span>
                              ) : isSpeaking ? (
                                <span className="px-3 py-1 rounded-lg text-xs font-extrabold bg-purple-100 dark:bg-purple-950/60 text-purple-800 dark:text-purple-300 flex items-center gap-1.5">
                                  <Mic className="w-3.5 h-3.5" /> Speaking
                                </span>
                              ) : (
                                <span className="px-3 py-1 rounded-lg text-xs font-extrabold bg-slate-100 dark:bg-slate-800 text-slate-800 dark:text-slate-300 flex items-center gap-1.5">
                                  <FileText className="w-3.5 h-3.5" /> General
                                </span>
                              )}
                              <span className="font-extrabold text-slate-900 dark:text-white text-base sm:text-lg">{test.title}</span>
                              <span className="px-2.5 py-0.5 rounded-md text-xs font-bold bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300">
                                {test.level}
                              </span>
                            </div>
                            <p className="text-sm text-slate-600 dark:text-slate-300 mt-1 line-clamp-2 leading-relaxed">{test.description}</p>
                            <span className="text-xs text-slate-400 dark:text-slate-400 font-medium block">Davomiyligi: {test.duration_minutes} daqiqa</span>
                          </div>

                          <div className="flex items-center gap-2 shrink-0 self-start sm:self-center" onClick={(e) => e.stopPropagation()}>
                            <button
                              onClick={() => handleOpenTestEditor(test.id)}
                              className="px-5 py-3 rounded-xl text-sm font-extrabold whitespace-nowrap bg-emerald-600 hover:bg-emerald-700 text-white transition-all shadow-md hover:shadow-lg flex items-center gap-2 shrink-0 cursor-pointer"
                            >
                              <BookOpen className="w-4.5 h-4.5" />
                              <span>Bo‘limlar va Savollar</span>
                            </button>
                            <a
                              href={`/admin?testId=${test.id}`}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="p-3 text-slate-400 hover:text-emerald-600 hover:bg-emerald-50 dark:hover:bg-emerald-950/50 rounded-xl transition-colors shrink-0 cursor-pointer"
                              title="Yangi brauzer tabida ochish"
                            >
                              <ExternalLink className="w-5 h-5" />
                            </a>
                            <button
                              onClick={() => handleDeleteTest(test.id)}
                              className="p-3 text-slate-400 hover:text-rose-600 hover:bg-rose-50 dark:hover:bg-rose-950/50 rounded-xl transition-colors shrink-0 cursor-pointer"
                              title="Testni o‘chirish"
                            >
                              <Trash2 className="w-5 h-5" />
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
      )}

      {/* Selected Test Sections & Questions Inspector */}
      {activeTab === 'editor' && selectedTest && (
        <section id="selected-test-section" className="bg-white dark:bg-slate-900 rounded-2xl border-2 border-emerald-600/40 p-6 sm:p-7 shadow-sm space-y-6 scroll-mt-6">
          {/* Top Breadcrumb & Actions Bar */}
          <div className="flex items-center justify-between pb-3 border-b border-slate-100 dark:border-slate-800 flex-wrap gap-2">
            <button
              onClick={() => setActiveTab('tests')}
              className="text-xs sm:text-sm font-extrabold text-emerald-600 dark:text-emerald-400 hover:text-emerald-700 flex items-center gap-1.5 transition-colors cursor-pointer bg-emerald-50 dark:bg-emerald-950/50 px-3.5 py-2 rounded-xl"
            >
              <ArrowLeft className="w-4 h-4" />
              <span>← Barcha Testlar Ro‘yxatiga Qaytish</span>
            </button>

            <div className="flex items-center gap-2">
              <a
                href={`/admin?testId=${selectedTest.id}`}
                target="_blank"
                rel="noopener noreferrer"
                className="px-3.5 py-2 rounded-xl border border-slate-200 dark:border-slate-700 text-xs font-bold text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center gap-1.5 transition-colors cursor-pointer"
                title="Ushbu testni yangi brauzer tabida ochish"
              >
                <ExternalLink className="w-3.5 h-3.5" />
                <span className="hidden sm:inline">Yangi Brauzer Tabida</span>
              </a>
              <button
                onClick={() => {
                  setSelectedTest(null);
                  setActiveTab('tests');
                }}
                className="px-3.5 py-2 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-300 rounded-xl text-xs font-bold transition-colors cursor-pointer"
              >
                Yopish
              </button>
            </div>
          </div>

          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-4 border-b border-slate-100 dark:border-slate-800">
            <div>
              <span className="text-xs sm:text-sm font-extrabold uppercase tracking-wider text-emerald-600 dark:text-emerald-400">Tanlangan Test:</span>
              <h2 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white mt-0.5">{selectedTest.title}</h2>
            </div>

            <div className="flex items-center gap-3 shrink-0">
              <button
                onClick={handleOpenAddSection}
                className="px-5 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-sm font-extrabold shadow-md hover:shadow-lg transition-all flex items-center gap-2 whitespace-nowrap shrink-0 cursor-pointer"
              >
                <Plus className="w-5 h-5" />
                <span>
                  {getTestModule(selectedTest) === 'reading'
                    ? 'Yangi Reading Passage Qo‘shish'
                    : getTestModule(selectedTest) === 'listening'
                    ? 'Yangi Listening Bo‘lim Qo‘shish'
                    : getTestModule(selectedTest) === 'writing'
                    ? 'Yangi Writing Topshiriq Qo‘shish'
                    : 'Yangi Speaking Bo‘lim Qo‘shish'}
                </span>
              </button>
              <button
                onClick={() => setSelectedTest(null)}
                className="px-4 py-3 bg-slate-100 dark:bg-slate-800 hover:bg-slate-200 dark:hover:bg-slate-700 text-slate-700 dark:text-slate-300 rounded-xl text-sm font-bold transition-colors whitespace-nowrap shrink-0 cursor-pointer"
              >
                Yopish
              </button>
            </div>
          </div>

          {/* Add Section Form (Modal / Inline) */}
          {showAddSection && (
            <div className="bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 rounded-2xl p-5 space-y-4 shadow-sm">
              <div className="flex items-center justify-between pb-2 border-b border-slate-200 dark:border-slate-700">
                <h3 className="text-sm sm:text-base font-bold text-slate-900 dark:text-white flex items-center gap-2">
                  <Plus className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
                  <span>
                    {getTestModule(selectedTest) === 'reading'
                      ? 'Yangi Reading Passage (Matn) Qo‘shish'
                      : getTestModule(selectedTest) === 'listening'
                      ? 'Yangi Listening Audio Bo‘limi Qo‘shish'
                      : getTestModule(selectedTest) === 'writing'
                      ? 'Yangi Writing Topshirig‘i Qo‘shish'
                      : 'Yangi Speaking Bo‘limi Qo‘shish'}
                  </span>
                </h3>
                <button
                  type="button"
                  onClick={() => setShowAddSection(false)}
                  className="text-xs text-slate-400 hover:text-slate-600 dark:hover:text-slate-300 font-bold px-2 py-1 rounded-lg hover:bg-slate-200 dark:hover:bg-slate-700 transition-colors cursor-pointer"
                >
                  Bekor qilish
                </button>
              </div>

              <form onSubmit={handleCreateSection} className="space-y-4">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                      Test Moduli
                    </label>
                    <div className="w-full px-3.5 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-slate-100/90 dark:bg-slate-800 text-sm font-extrabold text-slate-900 dark:text-slate-100 flex items-center gap-2">
                      {sectionType === 'reading' && (
                        <>
                          <span className="w-2.5 h-2.5 rounded-full bg-emerald-500 shrink-0"></span>
                          <BookOpen className="w-4 h-4 text-emerald-600 dark:text-emerald-400 shrink-0" />
                          <span>📖 Reading (Matn va savollar)</span>
                        </>
                      )}
                      {sectionType === 'listening' && (
                        <>
                          <span className="w-2.5 h-2.5 rounded-full bg-blue-500 shrink-0"></span>
                          <Headphones className="w-4 h-4 text-blue-600 dark:text-blue-400 shrink-0" />
                          <span>🎧 Listening (Audio eshitish)</span>
                        </>
                      )}
                      {sectionType === 'writing' && (
                        <>
                          <span className="w-2.5 h-2.5 rounded-full bg-amber-500 shrink-0"></span>
                          <Edit3 className="w-4 h-4 text-amber-600 dark:text-amber-400 shrink-0" />
                          <span>✍️ Writing (Insho matn muharriri)</span>
                        </>
                      )}
                      {sectionType === 'speaking' && (
                        <>
                          <span className="w-2.5 h-2.5 rounded-full bg-purple-500 shrink-0"></span>
                          <Mic className="w-4 h-4 text-purple-600 dark:text-purple-400 shrink-0" />
                          <span>🎙️ Speaking (Ovoz yozish)</span>
                        </>
                      )}
                      <span className="text-[11px] font-semibold text-slate-500 dark:text-slate-400 ml-auto hidden sm:inline">
                        (Avtomatik biriktirilgan)
                      </span>
                    </div>
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
                  className="py-2.5 px-5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs sm:text-sm font-bold shadow-sm transition-all cursor-pointer"
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
              <div className="p-6 text-center bg-slate-50 dark:bg-slate-800/50 rounded-2xl border border-slate-200 dark:border-slate-800 space-y-3">
                <p className="text-sm font-semibold text-slate-600 dark:text-slate-300">
                  Ushbu testda hali bo‘limlar mavjud emas.
                </p>
                <button
                  type="button"
                  onClick={handleOpenAddSection}
                  className="px-5 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs sm:text-sm font-extrabold shadow-md inline-flex items-center gap-2 cursor-pointer"
                >
                  <Plus className="w-4 h-4" />
                  <span>
                    Birinchi {
                      getTestModule(selectedTest) === 'reading' ? 'Reading Passage' :
                      getTestModule(selectedTest) === 'listening' ? 'Listening Section' :
                      getTestModule(selectedTest) === 'writing' ? 'Writing Task' : 'Speaking Part'
                    }ni Qo‘shish
                  </span>
                </button>
              </div>
            ) : (
              selectedTest.sections.map((sec, secIdx) => {
                const isReading = sec.type === 'reading';
                const questions = sec.questions || [];

                return (
                  <div key={sec.id} className="border border-slate-200 dark:border-slate-800 rounded-2xl p-6 space-y-5 bg-white dark:bg-slate-800/60 shadow-sm">
                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-3.5 border-b border-slate-100 dark:border-slate-700/60">
                      <div className="flex items-center gap-3">
                        <span className="px-3 py-1.5 rounded-lg text-xs font-black uppercase tracking-wider bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-200 shadow-2xs">
                          {sec.type}
                        </span>
                        <h4 className="font-black text-slate-900 dark:text-white text-base sm:text-lg">{sec.title}</h4>
                      </div>

                      <div className="flex items-center gap-2 flex-wrap self-start sm:self-auto">
                        <button
                          type="button"
                          onClick={() => handleOpenEditSection(sec)}
                          className="px-3.5 py-2 bg-slate-100 hover:bg-slate-200 dark:bg-slate-700 dark:hover:bg-slate-600 text-slate-700 dark:text-slate-200 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-1.5 cursor-pointer"
                        >
                          <Edit3 className="w-4 h-4" />
                          <span>Tahrirlash</span>
                        </button>
                        <button
                          type="button"
                          onClick={() => handleDeleteSection(sec.id)}
                          className="px-3.5 py-2 bg-rose-50 hover:bg-rose-100 dark:bg-rose-950/60 dark:hover:bg-rose-900/60 text-rose-600 dark:text-rose-400 rounded-xl text-xs sm:text-sm font-bold transition-all flex items-center gap-1.5 cursor-pointer"
                        >
                          <Trash2 className="w-4 h-4" />
                          <span>O‘chirish</span>
                        </button>
                        <button
                          onClick={() => {
                            setSelectedSectionIdForQuestion(sec.id);
                            if (sec.type === 'writing') {
                              setSelectedConstructorType('essay');
                              setQuestionCategory('essay');
                            } else if (sec.type === 'speaking') {
                              setSelectedConstructorType('speaking');
                              setQuestionCategory('speaking');
                            } else {
                              setSelectedConstructorType('mc_single');
                              setQuestionCategory('multiple_choice');
                            }
                            setTimeout(() => {
                              document.getElementById(`constructor-sec-${sec.id}`)?.scrollIntoView({ behavior: 'smooth' });
                            }, 120);
                          }}
                          className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs sm:text-sm font-extrabold shadow-md hover:shadow-lg transition-all flex items-center gap-1.5 whitespace-nowrap cursor-pointer"
                        >
                          <Plus className="w-4 h-4" />
                          <span>Savol Qo‘shish</span>
                        </button>
                      </div>
                    </div>

                    {/* Reading Passage Preview */}
                    {isReading && (
                      <div className="bg-emerald-50/50 dark:bg-emerald-950/30 p-4 sm:p-5 rounded-xl border border-emerald-100 dark:border-emerald-900/50 space-y-2">
                        <span className="text-sm font-extrabold text-emerald-900 dark:text-emerald-200 block">
                          📖 Chap tomonda chiqadigan matn (Reading Passage):
                        </span>
                        <p className="text-sm text-slate-700 dark:text-slate-300 line-clamp-3 leading-relaxed">
                          {sec.passage_text || 'Matn kiritilmagan'}
                        </p>
                      </div>
                    )}

                    {/* Questions in Section */}
                    <div className="space-y-3">
                      <span className="text-sm font-extrabold text-slate-600 dark:text-slate-300 block">
                        O‘ng tomonda chiqadigan savollar ({questions.length} ta):
                      </span>

                      {questions.length === 0 ? (
                        <p className="text-sm text-slate-400 dark:text-slate-500 italic py-2">Hali savollar qo‘shilmagan.</p>
                      ) : (
                        <div className="space-y-2.5">
                          {questions.map((q, qIdx) => (
                            <div key={q.id || qIdx} className="p-4 bg-slate-50 dark:bg-slate-900/80 rounded-xl border border-slate-200 dark:border-slate-700/80 text-sm space-y-2">
                              <div className="flex items-center justify-between font-bold text-slate-900 dark:text-slate-100 text-sm sm:text-base">
                                <span>#{qIdx + 1}. {q.question_text}</span>
                                <span className="text-emerald-700 dark:text-emerald-400 font-extrabold px-2.5 py-0.5 rounded-lg bg-emerald-100/70 dark:bg-emerald-950/70">{q.points} ball</span>
                              </div>
                              {q.options && q.options.length > 0 && (
                                <div className="text-slate-600 dark:text-slate-300 pl-3 text-xs sm:text-sm font-medium">
                                  {q.options.length === 1 && typeof q.options[0] === 'string' && (q.options[0].startsWith('http') || q.options[0].startsWith('/') || q.options[0].includes('/uploads/')) ? (
                                    <div className="mt-1.5 max-w-sm">
                                      <span className="text-xs font-bold text-amber-700 dark:text-amber-400 block mb-1">📊 Biriktirilgan Jadval/Diagramma rasmi:</span>
                                      <img src={q.options[0]} alt="Table/Diagram" className="max-h-36 rounded-lg border border-slate-200 dark:border-slate-700 object-contain bg-white dark:bg-slate-900 p-1" />
                                    </div>
                                  ) : (
                                    <span>Variantlar: {q.options.join(' | ')}</span>
                                  )}
                                </div>
                              )}
                              {q.correct_answer && (
                                <div className="text-emerald-800 dark:text-emerald-300 font-bold pl-3 text-xs sm:text-sm">
                                  To‘g‘ri javob: {q.correct_answer}
                                </div>
                              )}

                              {/* Explanation Status & Edit Button */}
                              <div className="mt-2 pt-2.5 border-t border-slate-200/80 dark:border-slate-700/80 flex flex-wrap items-center justify-between gap-2.5">
                                <div className="flex items-center gap-2 flex-wrap">
                                  <span className="text-xs font-bold text-slate-500 dark:text-slate-400">💡 Izoh:</span>
                                  {q.explanation_text ? (
                                    <span className="px-2 py-0.5 rounded-md text-xs font-bold bg-indigo-100 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300">📝 Matn</span>
                                  ) : null}
                                  {q.explanation_audio_url ? (
                                    <span className="px-2 py-0.5 rounded-md text-xs font-bold bg-purple-100 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300">🎙️ Audio</span>
                                  ) : null}
                                  {q.explanation_video_url ? (
                                    <span className="px-2 py-0.5 rounded-md text-xs font-bold bg-rose-100 dark:bg-rose-950/60 text-rose-700 dark:text-rose-300">🎬 Video</span>
                                  ) : null}
                                  {q.explanation_image_url ? (
                                    <span className="px-2 py-0.5 rounded-md text-xs font-bold bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300">🖼️ Rasm</span>
                                  ) : null}
                                  {!q.explanation_text && !q.explanation_audio_url && !q.explanation_video_url && !q.explanation_image_url ? (
                                    <span className="text-xs text-slate-400 dark:text-slate-500 italic">Mavjud emas</span>
                                  ) : null}
                                </div>

                                <div className="flex items-center gap-2 flex-wrap">
                                  <button
                                    type="button"
                                    onClick={() => handleOpenEditQuestion(q)}
                                    className="px-3 py-1.5 rounded-xl bg-slate-100 hover:bg-slate-200 dark:bg-slate-700 dark:hover:bg-slate-600 text-slate-700 dark:text-slate-200 text-xs font-bold transition-all flex items-center gap-1 cursor-pointer"
                                  >
                                    <Edit3 className="w-3.5 h-3.5" />
                                    <span>Tahrirlash</span>
                                  </button>
                                  <button
                                    type="button"
                                    onClick={() => handleDeleteQuestion(q.id)}
                                    className="px-3 py-1.5 rounded-xl bg-rose-50 hover:bg-rose-100 dark:bg-rose-950/60 dark:hover:bg-rose-900/60 text-rose-600 dark:text-rose-400 text-xs font-bold transition-all flex items-center gap-1 cursor-pointer"
                                  >
                                    <Trash2 className="w-3.5 h-3.5" />
                                    <span>O‘chirish</span>
                                  </button>
                                  <button
                                    type="button"
                                    onClick={() => handleOpenEditExp(q)}
                                    className="px-3 py-1.5 rounded-xl bg-indigo-50 hover:bg-indigo-100 dark:bg-indigo-950/60 dark:hover:bg-indigo-900/60 text-indigo-700 dark:text-indigo-300 text-xs font-bold transition-all shadow-2xs flex items-center gap-1.5 cursor-pointer"
                                  >
                                    <Sparkles className="w-3.5 h-3.5" />
                                    <span>{q.explanation_text || q.explanation_audio_url || q.explanation_video_url || q.explanation_image_url ? 'Izoh' : '+ Izoh'}</span>
                                  </button>
                                </div>
                              </div>
                            </div>
                          ))}
                        </div>
                      )}
                    </div>

                    {/* Universal IELTS Question Constructor */}
                    {selectedSectionIdForQuestion === sec.id && (
                      <div id={`constructor-sec-${sec.id}`} className="mt-5 pt-5 border-t border-slate-200 dark:border-slate-700/80 p-5 sm:p-6 bg-slate-50 dark:bg-slate-900/80 rounded-2xl space-y-5 border border-slate-200/80 dark:border-slate-700/60 shadow-sm scroll-mt-6">
                        <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-700">
                          <div>
                            <h5 className="text-base sm:text-lg font-black text-slate-900 dark:text-white uppercase flex items-center gap-2">
                              <Sparkles className="w-5 h-5 text-emerald-600" />
                              <span>Universal IELTS Savol Konstruktori</span>
                            </h5>
                            <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1">
                              Bo‘lim: <span className="font-extrabold text-slate-700 dark:text-slate-200">{sec.title}</span>
                            </p>
                          </div>
                          <button
                            type="button"
                            onClick={() => setSelectedSectionIdForQuestion(null)}
                            className="text-xs sm:text-sm text-slate-500 hover:text-slate-800 dark:hover:text-slate-200 font-bold px-3 py-1.5 rounded-xl hover:bg-slate-200 dark:hover:bg-slate-800 transition-colors cursor-pointer"
                          >
                            Bekor qilish
                          </button>
                        </div>

                        <form onSubmit={handleCreateQuestion} className="space-y-5">
                          {/* Step 1: Choose IELTS Question Type (Filtered by Section Type) */}
                          {(() => {
                            const availableTypes = IELTS_CONSTRUCTOR_TYPES.filter((cat) =>
                              cat.sectionTypes.includes(sec.type as any)
                            );
                            const secLabel =
                              sec.type === 'reading'
                                ? 'IELTS Reading'
                                : sec.type === 'listening'
                                ? 'IELTS Listening'
                                : sec.type === 'writing'
                                ? 'IELTS Writing'
                                : 'IELTS Speaking';

                            return (
                              <div className="space-y-2">
                                <div className="flex items-center justify-between">
                                  <label className="block text-sm sm:text-base font-extrabold text-slate-800 dark:text-slate-200 flex items-center gap-2">
                                    <Sparkles className="w-4 h-4 text-emerald-600" />
                                    <span>1. {secLabel} Savol Turini Tanlang:</span>
                                  </label>
                                  <span className="text-xs font-bold text-slate-600 dark:text-slate-300 bg-slate-200/70 dark:bg-slate-800 px-3 py-1 rounded-lg">
                                    {availableTypes.length} ta savol turi
                                  </span>
                                </div>

                                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 xl:grid-cols-6 gap-2 sm:gap-2.5 p-2.5 sm:p-3 rounded-2xl border border-slate-200 dark:border-slate-800 bg-slate-100/60 dark:bg-slate-900/60">
                                  {availableTypes.map((cat) => {
                                    const isSel = selectedConstructorType === cat.id;
                                    return (
                                      <button
                                        key={cat.id}
                                        type="button"
                                        onClick={() => {
                                          setSelectedConstructorType(cat.id);
                                          setQuestionCategory(cat.baseCategory);
                                          if (cat.id === 'tf_ng') setCorrectAnswer('TRUE');
                                          else if (cat.id === 'yn_ng') setCorrectAnswer('YES');
                                          else if (cat.baseCategory === 'completion') {
                                            if (correctAnswer === 'TRUE' || correctAnswer === 'YES') setCorrectAnswer('');
                                          } else if (cat.defaultOptions) {
                                            setMatchingOptions(cat.defaultOptions);
                                            if (!correctAnswer || correctAnswer === 'TRUE' || correctAnswer === 'YES') {
                                              setCorrectAnswer(cat.defaultOptions[0].split('.')[0].trim());
                                            }
                                          }
                                        }}
                                        className={`p-2.5 sm:p-3 rounded-xl border text-left transition-all cursor-pointer flex flex-col justify-between ${
                                          isSel
                                            ? 'border-emerald-500 bg-emerald-50 dark:bg-emerald-950/80 ring-2 ring-emerald-500/30 shadow-md'
                                            : 'border-slate-200 dark:border-slate-750 bg-white dark:bg-slate-800/90 hover:border-emerald-400 dark:hover:border-emerald-500 hover:bg-slate-50 dark:hover:bg-slate-750 shadow-2xs'
                                        }`}
                                      >
                                        <div>
                                          <div className="flex items-center justify-between gap-1 mb-1">
                                            <span
                                              className={`text-[10px] sm:text-[11px] font-black px-1.5 py-0.5 rounded truncate max-w-full inline-block ${
                                                isSel
                                                  ? 'bg-emerald-200 dark:bg-emerald-900 text-emerald-900 dark:text-emerald-100'
                                                  : 'bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300'
                                              }`}
                                            >
                                              {cat.badge}
                                            </span>
                                            {isSel && (
                                              <span className="w-2.5 h-2.5 rounded-full bg-emerald-500 shrink-0" />
                                            )}
                                          </div>
                                          <div
                                            className={`text-xs sm:text-sm font-extrabold leading-tight ${
                                              isSel
                                                ? 'text-emerald-950 dark:text-emerald-200'
                                                : 'text-slate-900 dark:text-slate-100'
                                            }`}
                                          >
                                            {cat.title}
                                          </div>
                                        </div>
                                        <div className="text-[10px] sm:text-[11px] text-slate-500 dark:text-slate-400 mt-1 font-medium leading-tight line-clamp-1">
                                          {cat.sub}
                                        </div>
                                      </button>
                                    );
                                  })}
                                </div>
                              </div>
                            );
                          })()}

                          {/* Step 2: Question Text / Instructions */}
                          <div>
                            <div className="flex items-center justify-between mb-1.5">
                              <label className="block text-sm sm:text-base font-extrabold text-slate-800 dark:text-slate-200">
                                2. Savol Matni yoki Ko‘rsatma:
                              </label>
                              <span className="text-xs sm:text-sm font-extrabold text-emerald-700 dark:text-emerald-400 bg-emerald-50 dark:bg-emerald-950/60 px-3 py-1 rounded-lg border border-emerald-200 dark:border-emerald-800">
                                Tanlangan: {IELTS_CONSTRUCTOR_TYPES.find((c) => c.id === selectedConstructorType)?.title || 'Multiple Choice'}
                              </span>
                            </div>
                            <textarea
                              required
                              rows={questionCategory === 'essay' || questionCategory === 'speaking' ? 5 : 3}
                              value={newQuestionText}
                              onChange={(e) => setNewQuestionText(e.target.value)}
                              placeholder={
                                IELTS_CONSTRUCTOR_TYPES.find((c) => c.id === selectedConstructorType)?.placeholder ||
                                'Savol matnini kiriting...'
                              }
                              className="w-full px-4 py-3 rounded-xl border border-slate-300 dark:border-slate-700 text-sm sm:text-base focus:ring-2 focus:ring-emerald-500 outline-none bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 leading-relaxed shadow-2xs"
                            />
                          </div>

                          {/* Step 3: Dynamic Category-Specific Inputs */}

                          {/* A. Multiple Choice (A, B, C, D) */}
                          {questionCategory === 'multiple_choice' && (
                            <div className="space-y-3 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200 block">
                                3. Variantlar va To‘g‘ri Javob (Radio orqali belgilang):
                              </span>
                              {['A', 'B', 'C', 'D'].map((letter, idx) => {
                                const optVal = mcOptions[idx];
                                const isCorrect = correctAnswer === optVal && optVal.trim() !== '';
                                return (
                                  <div key={letter} className="flex items-center gap-3">
                                    <input
                                      type="radio"
                                      name="mc_correct_radio"
                                      checked={isCorrect}
                                      onChange={() => setCorrectAnswer(optVal)}
                                      title="Ushbu variantni to‘g‘ri javob deb belgilash"
                                      className="w-5 h-5 text-emerald-600 focus:ring-emerald-500 cursor-pointer shrink-0"
                                    />
                                    <span className="w-7 text-sm sm:text-base font-black text-slate-600 dark:text-slate-300">{letter}.</span>
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
                                      className="flex-1 px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm sm:text-base bg-slate-50/50 dark:bg-slate-900 text-slate-900 dark:text-slate-100 focus:ring-2 focus:ring-emerald-500"
                                    />
                                  </div>
                                );
                              })}
                            </div>
                          )}

                          {/* B. Multiple Selection (Choose 2/3) */}
                          {questionCategory === 'multiple_selection' && (
                            <div className="space-y-3 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200 block">
                                3. Variantlar (A–E) va To‘g‘ri Javoblar (Checkbox orqali 2 ta yoki 3 tasini belgilang):
                              </span>
                              {['A', 'B', 'C', 'D', 'E'].map((letter, idx) => {
                                const optVal = multiOptions[idx];
                                const isChecked = multiCorrectAnswers.includes(letter);
                                return (
                                  <div key={letter} className="flex items-center gap-3">
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
                                      className="w-5 h-5 text-indigo-600 rounded focus:ring-indigo-500 cursor-pointer shrink-0"
                                    />
                                    <span className="w-7 text-sm sm:text-base font-black text-slate-600 dark:text-slate-300">{letter}.</span>
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
                                      className="flex-1 px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm sm:text-base bg-slate-50/50 dark:bg-slate-900 text-slate-900 dark:text-slate-100 focus:ring-2 focus:ring-indigo-500"
                                    />
                                  </div>
                                );
                              })}
                              <div className="text-xs sm:text-sm text-slate-600 dark:text-slate-300 pt-1 font-semibold">
                                Belgilangan to‘g‘ri javoblar: <span className="font-extrabold text-indigo-600 dark:text-indigo-400">{multiCorrectAnswers.join(', ') || 'Hali belgilanmadi'}</span>
                              </div>
                            </div>
                          )}

                          {/* C. True / False / Not Given */}
                          {questionCategory === 'true_false_not_given' && (
                            <div className="space-y-3 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200 block">
                                3. To‘g‘ri Javobni Tanlang:
                              </span>
                              <div className="grid grid-cols-3 gap-3">
                                {['TRUE', 'FALSE', 'NOT GIVEN'].map((ans) => {
                                  const isSel = correctAnswer === ans;
                                  return (
                                    <button
                                      key={ans}
                                      type="button"
                                      onClick={() => setCorrectAnswer(ans)}
                                      className={`py-3.5 px-5 rounded-xl text-sm sm:text-base font-extrabold transition-all border cursor-pointer text-center ${
                                        isSel
                                          ? 'bg-emerald-600 text-white border-emerald-600 shadow-md ring-2 ring-emerald-500/30'
                                          : 'bg-slate-50 dark:bg-slate-900 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 hover:bg-slate-100 hover:border-slate-300'
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
                            <div className="space-y-3 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200 block">
                                3. To‘g‘ri Javobni Tanlang:
                              </span>
                              <div className="grid grid-cols-3 gap-3">
                                {['YES', 'NO', 'NOT GIVEN'].map((ans) => {
                                  const isSel = correctAnswer === ans;
                                  return (
                                    <button
                                      key={ans}
                                      type="button"
                                      onClick={() => setCorrectAnswer(ans)}
                                      className={`py-3.5 px-5 rounded-xl text-sm sm:text-base font-extrabold transition-all border cursor-pointer text-center ${
                                        isSel
                                          ? 'bg-teal-600 text-white border-teal-600 shadow-md ring-2 ring-teal-500/30'
                                          : 'bg-slate-50 dark:bg-slate-900 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 hover:bg-slate-100 hover:border-slate-300'
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
                            <div className="space-y-4 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              {/* If Table Completion is chosen: show Dedicated Table Upload & Template options! */}
                              {selectedConstructorType === 'table_completion' && (
                                <div className="p-4 rounded-xl bg-amber-50/70 dark:bg-amber-950/30 border border-amber-200 dark:border-amber-800 space-y-3">
                                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
                                    <span className="text-sm font-extrabold text-amber-950 dark:text-amber-200 flex items-center gap-2">
                                      <Table className="w-4 h-4 text-amber-600" />
                                      <span>📊 Jadvalni Yuklash / Kiritish (Ixtiyoriy):</span>
                                    </span>
                                    <button
                                      type="button"
                                      onClick={() => {
                                        setNewQuestionText(
                                          `| Kategoriya | Tafsilot | Holati |\n| --- | --- | --- |\n| 1. Tadqiqot obyekti | Coral Reefs | Tinch okeani |\n| 2. Aniqlangan yil | [ 1 ] | 1995-yil |\n| 3. Asosiy tahdid | [ 2 ] | Harorat oshishi |`
                                        );
                                      }}
                                      className="text-xs font-bold text-amber-700 dark:text-amber-300 hover:text-amber-800 px-3 py-1.5 rounded-lg bg-amber-100 dark:bg-amber-900/60 hover:bg-amber-200 transition-colors flex items-center gap-1 cursor-pointer self-start sm:self-auto"
                                      title="Savol matniga tayyor jadval shablonini joylash"
                                    >
                                      <Table className="w-3.5 h-3.5" />
                                      <span>+ Jadval Shablonini Matnga Joylash</span>
                                    </button>
                                  </div>

                                  <div className="flex flex-col sm:flex-row items-center gap-3">
                                    <label className="px-5 py-3 bg-white dark:bg-slate-800 hover:bg-amber-100/60 dark:hover:bg-amber-900/40 text-slate-800 dark:text-slate-200 border border-amber-300 dark:border-amber-700 rounded-xl text-sm font-extrabold transition-colors cursor-pointer flex items-center gap-2 shrink-0 shadow-2xs">
                                      <Upload className="w-4 h-4 text-amber-600" />
                                      <span>{isUploadingTableImg ? 'Yuklanmoqda...' : 'Jadval Rasmini Yuklash (.png/.jpg)'}</span>
                                      <input
                                        type="file"
                                        accept="image/*"
                                        onChange={handleTableImageUpload}
                                        className="hidden"
                                        disabled={isUploadingTableImg}
                                      />
                                    </label>
                                    <input
                                      type="text"
                                      value={tableImageUrl}
                                      onChange={(e) => setTableImageUrl(e.target.value)}
                                      placeholder="Yoki to‘g‘ridan-to‘g‘ri jadval rasmi URL manzilini kiriting..."
                                      className="flex-1 w-full px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                    />
                                  </div>

                                  {tableImageUrl && (
                                    <div className="p-3 bg-white dark:bg-slate-900 rounded-xl border border-amber-200 dark:border-amber-800 max-w-md space-y-2">
                                      <div className="flex items-center justify-between">
                                        <span className="text-xs font-bold text-emerald-600 dark:text-emerald-400">✓ Jadval rasmi biriktirildi</span>
                                        <button
                                          type="button"
                                          onClick={() => setTableImageUrl('')}
                                          className="text-xs text-rose-600 hover:underline font-bold cursor-pointer"
                                        >
                                          O‘chirish
                                        </button>
                                      </div>
                                      <img src={tableImageUrl} alt="Table preview" className="w-full h-auto rounded-lg object-contain max-h-48 border border-slate-200 dark:border-slate-700" />
                                    </div>
                                  )}
                                </div>
                              )}

                              <div>
                                <label className="block text-sm font-extrabold text-slate-800 dark:text-slate-200 mb-1">
                                  3. To‘g‘ri javob so‘z(lar)i (Jadvaldagi bo‘sh joy uchun javob):
                                </label>
                                <input
                                  type="text"
                                  required
                                  value={correctAnswer}
                                  onChange={(e) => setCorrectAnswer(e.target.value)}
                                  placeholder="Masalan: 1985 yoki university / college"
                                  className="w-full px-4 py-3 rounded-xl border border-amber-300 dark:border-amber-700 text-sm sm:text-base focus:ring-2 focus:ring-amber-500 outline-none bg-amber-50/20 dark:bg-amber-950/20 text-slate-900 dark:text-slate-100 font-bold"
                                />
                                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1">
                                  * Eslatma: Talaba javob yozganda registr (katta-kichik harf) e’tiborga olinmaydi. Agar bir nechta to‘g‘ri variant bo‘lsa, ularni <code className="text-amber-600 font-bold">/</code> belgisi bilan ajrating (masalan: <code className="text-amber-600">centre / center</code>).
                                </p>
                              </div>
                            </div>
                          )}

                          {/* F. Matching (Headings / Features) */}
                          {questionCategory === 'matching' && (
                            <div className="space-y-3.5 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              <div className="flex items-center justify-between">
                                <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200">
                                  3. Moslashtiriladigan variantlar ro‘yxati (i, ii, iii...):
                                </span>
                                <button
                                  type="button"
                                  onClick={() => setMatchingOptions([...matchingOptions, ''])}
                                  className="text-xs sm:text-sm font-extrabold text-purple-600 hover:text-purple-700 dark:text-purple-400 flex items-center gap-1.5 cursor-pointer px-3 py-1.5 rounded-lg hover:bg-purple-50 dark:hover:bg-purple-950/50"
                                >
                                  <Plus className="w-4 h-4" /> Variant qo‘shish
                                </button>
                              </div>

                              <div className="space-y-2.5">
                                {matchingOptions.map((opt, idx) => (
                                  <div key={idx} className="flex items-center gap-2.5">
                                    <input
                                      type="text"
                                      value={opt}
                                      onChange={(e) => {
                                        const next = [...matchingOptions];
                                        next[idx] = e.target.value;
                                        setMatchingOptions(next);
                                      }}
                                      placeholder={`Masalan: ${idx + 1}. The impact on climate`}
                                      className="flex-1 px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm sm:text-base bg-slate-50/50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                    />
                                    {matchingOptions.length > 2 && (
                                      <button
                                        type="button"
                                        onClick={() => setMatchingOptions(matchingOptions.filter((_, i) => i !== idx))}
                                        className="p-2 text-slate-400 hover:text-rose-600 rounded-lg hover:bg-rose-50 dark:hover:bg-rose-950/40"
                                        title="O‘chirish"
                                      >
                                        <Trash2 className="w-4 h-4" />
                                      </button>
                                    )}
                                  </div>
                                ))}
                              </div>

                              <div className="pt-1">
                                <label className="block text-sm font-extrabold text-slate-800 dark:text-slate-200 mb-1.5">
                                  Ushbu savol uchun to‘g‘ri javob (masalan, iii yoki B):
                                </label>
                                <input
                                  type="text"
                                  required
                                  value={correctAnswer}
                                  onChange={(e) => setCorrectAnswer(e.target.value)}
                                  placeholder="Masalan: iii"
                                  className="w-full px-4 py-2.5 rounded-xl border border-purple-300 dark:border-purple-700 text-sm sm:text-base bg-purple-50/20 dark:bg-purple-950/20 text-slate-900 dark:text-slate-100 font-extrabold"
                                />
                              </div>
                            </div>
                          )}

                          {/* G. Writing Task (Task 1 & Task 2) */}
                          {questionCategory === 'essay' && (
                            <div className="space-y-3.5 p-5 bg-white dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700 shadow-2xs">
                              <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200 block">
                                Task 1 Diagramma/Grafik Rasmi (Ixtiyoriy):
                              </span>
                              <div className="flex flex-col sm:flex-row items-center gap-3">
                                <label className="px-5 py-3 bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 dark:hover:bg-slate-650 text-slate-800 dark:text-slate-200 rounded-xl text-sm font-extrabold transition-colors cursor-pointer flex items-center gap-2 shrink-0">
                                  <Upload className="w-4 h-4" />
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
                                  className="flex-1 w-full px-4 py-2.5 rounded-xl border border-slate-300 dark:border-slate-700 text-sm bg-slate-50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                />
                              </div>
                              {writingImageUrl && (
                                <div className="mt-2 p-2 bg-slate-100 dark:bg-slate-900 rounded-xl max-w-sm">
                                  <img src={writingImageUrl} alt="Task preview" className="w-full h-auto rounded-lg object-contain max-h-48" />
                                </div>
                              )}
                            </div>
                          )}

                          {/* Step 4: Multi-modal Explanation (Text, File from computer, or Link) */}
                          <div className="p-5 bg-white dark:bg-slate-800 rounded-xl border border-indigo-200/80 dark:border-indigo-900/60 space-y-4 shadow-2xs">
                            <div className="flex items-center justify-between">
                              <div className="flex items-center gap-2">
                                <Sparkles className="w-5 h-5 text-indigo-600 dark:text-indigo-400" />
                                <span className="text-sm font-extrabold text-slate-800 dark:text-slate-200">
                                  💡 Javob Tushuntirishi (Explanation) - Ixtiyoriy:
                                </span>
                              </div>
                              <div className="flex items-center gap-2">
                                <button
                                  type="button"
                                  onClick={() => handleGenerateAiExplanation(false)}
                                  className="px-3 py-1.5 rounded-xl bg-purple-50 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300 border border-purple-200 dark:border-purple-800 text-xs font-extrabold hover:bg-purple-100 transition-colors flex items-center gap-1.5 cursor-pointer"
                                >
                                  <Sparkles className="w-3.5 h-3.5" />
                                  <span>✨ AI Shablon</span>
                                </button>
                                <button
                                  type="button"
                                  onClick={() => setShowNewExpSection(!showNewExpSection)}
                                  className="text-xs sm:text-sm font-bold text-indigo-600 dark:text-indigo-400 hover:underline cursor-pointer px-2 py-1"
                                >
                                  {showNewExpSection ? 'Yig‘ish' : 'Ochish / Kiritish'}
                                </button>
                              </div>
                            </div>

                            {showNewExpSection && (
                              <div className="space-y-4 pt-3 border-t border-slate-100 dark:border-slate-700 animate-in fade-in duration-200">
                                {/* 1. Matnli tushuntirish */}
                                <div className="space-y-2">
                                  <label className="block text-xs sm:text-sm font-extrabold text-slate-800 dark:text-slate-200 flex items-center justify-between">
                                    <span className="flex items-center gap-2">
                                      <FileText className="w-4 h-4 text-indigo-600 dark:text-indigo-400" />
                                      <span>Tushuntirish matni (Matn):</span>
                                    </span>
                                    <span className="text-xs text-slate-400 font-normal">
                                      (Matn yozmasdan faqat fayl saqlash ham mumkin)
                                    </span>
                                  </label>
                                  <textarea
                                    rows={4}
                                    value={newExpText}
                                    onChange={(e) => setNewExpText(e.target.value)}
                                    placeholder="Nega aynan shu variant to‘g‘ri? Matndagi yoki audiodagi kalit dalillar va sinonimlarni tushuntiring..."
                                    className="w-full px-4 py-3 text-sm sm:text-base rounded-xl border border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-900 text-slate-900 dark:text-slate-100 focus:ring-2 focus:ring-indigo-500"
                                  />
                                </div>

                                {/* 2. Kompyuterdan fayl biriktirish */}
                                <div className="space-y-2">
                                  <label className="block text-xs sm:text-sm font-extrabold text-slate-800 dark:text-slate-200 flex items-center justify-between">
                                    <span className="flex items-center gap-2">
                                      <Upload className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
                                      <span>Komp’yuterdan fayl biriktirish (Rasm, Audio yoki Video):</span>
                                    </span>
                                    <span className="text-xs text-slate-400 font-normal">
                                      (Faylsiz faqat matnni saqlash ham mumkin)
                                    </span>
                                  </label>

                                  {!newExpImageUrl && !newExpAudioUrl && !newExpVideoUrl ? (
                                    <label className="flex items-center justify-center gap-3 px-5 py-4 border-2 border-dashed border-slate-300 dark:border-slate-700 hover:border-indigo-500 dark:hover:border-indigo-400 rounded-xl bg-slate-50 hover:bg-indigo-50/40 dark:bg-slate-900 dark:hover:bg-slate-800/80 transition-colors cursor-pointer text-center group">
                                      <input
                                        type="file"
                                        accept="image/*,audio/*,video/*"
                                        onChange={(e) => {
                                          const f = e.target.files?.[0];
                                          if (f) handleUploadMediaFile(f, false);
                                          e.target.value = '';
                                        }}
                                        disabled={isUploadingExpMedia}
                                        className="hidden"
                                      />
                                      <Upload className="w-5 h-5 text-slate-400 group-hover:text-indigo-600 dark:group-hover:text-indigo-400 transition-colors shrink-0" />
                                      <div className="text-left">
                                        <span className="text-sm font-bold text-slate-800 dark:text-slate-200 group-hover:text-indigo-600 dark:group-hover:text-indigo-400">
                                          {isUploadingExpMedia ? 'Fayl yuklanmoqda...' : 'Komp’yuterdan fayl tanlash'}
                                        </span>
                                        <span className="block text-xs text-slate-500 dark:text-slate-400">
                                          Rasm (.png, .jpg), Audio (.mp3) yoki Video (.mp4)
                                        </span>
                                      </div>
                                    </label>
                                  ) : (
                                    <div className="p-4 rounded-xl border border-indigo-200 dark:border-indigo-800 bg-indigo-50/60 dark:bg-indigo-950/40 space-y-3">
                                      <div className="flex items-center justify-between">
                                        <div className="flex items-center gap-2">
                                          {newExpImageUrl && (
                                            <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-extrabold bg-emerald-100 dark:bg-emerald-950/80 text-emerald-700 dark:text-emerald-300">
                                              <ImageIcon className="w-3.5 h-3.5" /> Rasm
                                            </span>
                                          )}
                                          {newExpAudioUrl && (
                                            <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-extrabold bg-purple-100 dark:bg-purple-950/80 text-purple-700 dark:text-purple-300">
                                              <Volume2 className="w-3.5 h-3.5" /> Audio (MP3)
                                            </span>
                                          )}
                                          {newExpVideoUrl && (
                                            <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-extrabold bg-rose-100 dark:bg-rose-950/80 text-rose-700 dark:text-rose-300">
                                              <Video className="w-3.5 h-3.5" /> Video (MP4)
                                            </span>
                                          )}
                                          <span className="text-sm font-semibold text-slate-800 dark:text-slate-200 truncate max-w-sm">
                                            {newExpFileName || 'Biriktirilgan fayl'}
                                          </span>
                                        </div>
                                        <button
                                          type="button"
                                          onClick={() => handleRemoveExpMedia(false)}
                                          className="px-3 py-1.5 text-xs font-bold text-rose-600 hover:text-rose-700 hover:bg-rose-100 dark:hover:bg-rose-950/60 rounded-lg transition-colors flex items-center gap-1.5 cursor-pointer"
                                        >
                                          <X className="w-4 h-4" />
                                          <span>O‘chirish</span>
                                        </button>
                                      </div>

                                      {/* Previews */}
                                      {newExpImageUrl && (
                                        <div className="max-w-sm rounded-xl overflow-hidden border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900 p-1.5">
                                          <img src={newExpImageUrl} alt="Exp preview" className="rounded-lg border max-h-48 object-contain" />
                                        </div>
                                      )}
                                      {newExpAudioUrl && (
                                        <div className="max-w-md">
                                          <audio controls src={newExpAudioUrl} className="w-full h-10 rounded-lg" />
                                        </div>
                                      )}
                                      {newExpVideoUrl && (
                                        <div className="max-w-md rounded-xl overflow-hidden border border-slate-200 dark:border-slate-700 bg-black aspect-video">
                                          {parseEmbedVideoUrl(newExpVideoUrl).isEmbed ? (
                                            <iframe
                                              src={parseEmbedVideoUrl(newExpVideoUrl).url}
                                              className="w-full h-full border-0"
                                              allowFullScreen
                                            />
                                          ) : (
                                            <video controls src={newExpVideoUrl} className="w-full h-full object-contain" />
                                          )}
                                        </div>
                                      )}
                                    </div>
                                  )}

                                  {/* External Link */}
                                  <input
                                    type="text"
                                    value={newExpVideoUrl && !newExpImageUrl && !newExpAudioUrl && !newExpFileName.startsWith('video_') ? newExpVideoUrl : ''}
                                    onChange={(e) => handleSetExternalLink(e.target.value, false)}
                                    placeholder="Yoki YouTube / tashqi video havola manzilini kiriting..."
                                    className="w-full px-4 py-2.5 text-sm rounded-xl border border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-900 text-slate-900 dark:text-slate-100"
                                  />
                                </div>
                              </div>
                            )}
                          </div>

                          {/* Points and Submit */}
                          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pt-3 border-t border-slate-200 dark:border-slate-700">
                            <div className="flex items-center gap-3">
                              <label className="text-sm font-extrabold text-slate-800 dark:text-slate-200 whitespace-nowrap">
                                Savol Balli:
                              </label>
                              <input
                                type="number"
                                min="1"
                                max="50"
                                value={questionPoints}
                                onChange={(e) => setQuestionPoints(parseInt(e.target.value) || 1)}
                                className="w-24 px-4 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-sm font-extrabold bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-center"
                              />
                            </div>

                            <button
                              type="submit"
                              className="px-8 py-3.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-sm sm:text-base font-extrabold shadow-md hover:shadow-lg transition-all flex items-center justify-center gap-2 cursor-pointer"
                            >
                              <Plus className="w-5 h-5" />
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

      {/* Section Editing Modal */}
      {editingSection && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-950/80 backdrop-blur-md animate-in fade-in duration-200 overflow-y-auto">
          <div className="bg-white dark:bg-slate-800 rounded-2xl shadow-2xl border border-slate-200 dark:border-slate-700 w-full max-w-2xl max-h-[90vh] flex flex-col overflow-hidden">
            <div className="px-6 py-4 border-b border-slate-200 dark:border-slate-700 flex items-center justify-between bg-slate-50/50 dark:bg-slate-800/50">
              <h4 className="text-base font-bold text-slate-900 dark:text-white">
                Bo‘limni Tahrirlash ({editingSection.type})
              </h4>
              <button
                type="button"
                onClick={() => setEditingSection(null)}
                className="w-8 h-8 rounded-full flex items-center justify-center text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-700"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleSaveSectionEdit} className="p-6 overflow-y-auto space-y-4 text-sm">
              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                  Bo‘lim Nomi (Title)
                </label>
                <input
                  type="text"
                  value={editSecTitle}
                  onChange={(e) => setEditSecTitle(e.target.value)}
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                  Ko‘rsatma (Instructions)
                </label>
                <textarea
                  rows={3}
                  value={editSecInstructions}
                  onChange={(e) => setEditSecInstructions(e.target.value)}
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>

              {editingSection.type === 'reading' && (
                <div>
                  <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                    Reading Passage Matni
                  </label>
                  <textarea
                    rows={8}
                    value={editSecPassageText}
                    onChange={(e) => setEditSecPassageText(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500 font-mono text-xs"
                  />
                </div>
              )}

              {editingSection.type === 'listening' && (
                <div>
                  <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                    Audio Fayl Havolasi (Media URL)
                  </label>
                  <input
                    type="text"
                    value={editSecAudioUrl}
                    onChange={(e) => setEditSecAudioUrl(e.target.value)}
                    className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500 text-xs"
                  />
                </div>
              )}

              <div className="flex justify-end gap-2 pt-4 border-t border-slate-200 dark:border-slate-700">
                <button
                  type="button"
                  onClick={() => setEditingSection(null)}
                  className="px-4 py-2 rounded-xl border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-300 font-bold text-xs"
                >
                  Bekor qilish
                </button>
                <button
                  type="submit"
                  className="px-5 py-2 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-xs shadow-md"
                >
                  O‘zgarishlarni Saqlash
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Question Editing Modal */}
      {editingQuestion && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-950/80 backdrop-blur-md animate-in fade-in duration-200 overflow-y-auto">
          <div className="bg-white dark:bg-slate-800 rounded-2xl shadow-2xl border border-slate-200 dark:border-slate-700 w-full max-w-xl max-h-[90vh] flex flex-col overflow-hidden">
            <div className="px-6 py-4 border-b border-slate-200 dark:border-slate-700 flex items-center justify-between bg-slate-50/50 dark:bg-slate-800/50">
              <h4 className="text-base font-bold text-slate-900 dark:text-white">
                Savolni Tahrirlash (#{editingQuestion.order_index})
              </h4>
              <button
                type="button"
                onClick={() => setEditingQuestion(null)}
                className="w-8 h-8 rounded-full flex items-center justify-center text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-700"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleSaveQuestionEdit} className="p-6 overflow-y-auto space-y-4 text-sm">
              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                  Savol Matni (Question Text)
                </label>
                <textarea
                  rows={3}
                  value={editQText}
                  onChange={(e) => setEditQText(e.target.value)}
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                  To‘g‘ri Javob (Alternativalar uchun | bilan ajrating: football | soccer)
                </label>
                <input
                  type="text"
                  value={editQCorrectAnswer}
                  onChange={(e) => setEditQCorrectAnswer(e.target.value)}
                  placeholder="Masalan: True yoki 25 | twenty five"
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                  Variantlar (Har bir variantni | bilan ajrating)
                </label>
                <input
                  type="text"
                  value={editQOptions}
                  onChange={(e) => setEditQOptions(e.target.value)}
                  placeholder="A) Option 1 | B) Option 2 | C) Option 3"
                  className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">
                  Ball (Points)
                </label>
                <input
                  type="number"
                  min="0"
                  step="0.5"
                  value={editQPoints}
                  onChange={(e) => setEditQPoints(parseFloat(e.target.value) || 1)}
                  className="w-32 px-3.5 py-2 rounded-xl border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-700 text-slate-900 dark:text-white outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>

              <div className="flex justify-end gap-2 pt-4 border-t border-slate-200 dark:border-slate-700">
                <button
                  type="button"
                  onClick={() => setEditingQuestion(null)}
                  className="px-4 py-2 rounded-xl border border-slate-300 dark:border-slate-600 text-slate-700 dark:text-slate-300 font-bold text-xs"
                >
                  Bekor qilish
                </button>
                <button
                  type="submit"
                  className="px-5 py-2 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-xs shadow-md"
                >
                  O‘zgarishlarni Saqlash
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Existing Question Explanation Editing Modal */}
      {editingExpQuestion && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-950/80 backdrop-blur-md animate-in fade-in duration-200 overflow-y-auto">
          <div className="bg-white dark:bg-slate-800 rounded-2xl shadow-2xl border border-slate-200 dark:border-slate-700 w-full max-w-3xl max-h-[90vh] flex flex-col overflow-hidden">
            {/* Header */}
            <div className="px-6 py-4 sm:py-5 border-b border-slate-200 dark:border-slate-700 flex items-center justify-between bg-slate-50/50 dark:bg-slate-800/50">
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 rounded-xl bg-indigo-600 text-white flex items-center justify-center shadow-md shrink-0">
                  <Sparkles className="w-5 h-5" />
                </div>
                <div>
                  <h4 className="text-base sm:text-lg font-black text-slate-900 dark:text-white">
                    Savol Tushuntirishini Tahrirlash
                  </h4>
                  <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-0.5">
                    Savol #{editingExpQuestion.order_index} • <span className="font-bold text-slate-700 dark:text-slate-300">{editingExpQuestion.question_type.replace('_', ' ')}</span>
                  </p>
                </div>
              </div>
              <button
                type="button"
                onClick={() => setEditingExpQuestion(null)}
                className="p-2 rounded-xl text-slate-400 hover:text-slate-700 hover:bg-slate-100 dark:hover:bg-slate-700 transition-colors cursor-pointer"
              >
                <X className="w-6 h-6" />
              </button>
            </div>

            {/* Modal Body */}
            <div className="p-6 overflow-y-auto space-y-5">
              {/* Question Context */}
              <div className="p-4 bg-slate-50 dark:bg-slate-900/60 rounded-xl border border-slate-200 dark:border-slate-700 text-sm space-y-2">
                <div className="font-semibold text-slate-800 dark:text-slate-200 leading-relaxed">
                  <span className="font-extrabold text-slate-500 mr-1.5">Savol:</span>
                  {editingExpQuestion.question_text || '(Savol matnsiz)'}
                </div>
                {editingExpQuestion.correct_answer && (
                  <div className="font-extrabold text-emerald-600 dark:text-emerald-400 text-sm sm:text-base">
                    ✓ To‘g‘ri javob: {editingExpQuestion.correct_answer}
                  </div>
                )}
              </div>

              {/* 1. Matnli tushuntirish */}
              <div className="space-y-2">
                <div className="flex items-center justify-between">
                  <label className="text-sm font-extrabold text-slate-800 dark:text-slate-200 flex items-center gap-2">
                    <FileText className="w-4 h-4 text-indigo-600 dark:text-indigo-400" />
                    <span>Tushuntirish matni (Matn):</span>
                  </label>
                  <button
                    type="button"
                    onClick={() => handleGenerateAiExplanation(true)}
                    className="px-3 py-1.5 rounded-xl bg-purple-50 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300 border border-purple-200 dark:border-purple-800 text-xs font-extrabold hover:bg-purple-100 transition-colors flex items-center gap-1.5 cursor-pointer"
                  >
                    <Sparkles className="w-3.5 h-3.5" />
                    <span>✨ AI Shablon</span>
                  </button>
                </div>
                <textarea
                  rows={4}
                  value={editExpText}
                  onChange={(e) => setEditExpText(e.target.value)}
                  placeholder="Nega aynan shu javob to‘g‘ri? Matndagi yoki audiodagi kalit dalillar va sinonimlarni tushuntiring..."
                  className="w-full px-4 py-3 text-sm sm:text-base rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100 focus:ring-2 focus:ring-indigo-500"
                />
                <span className="text-xs text-slate-400 block">
                  Matn yozmasdan faqat fayl saqlash yoki ikkalasini birga saqlash mumkin.
                </span>
              </div>

              {/* 2. Kompyuterdan fayl biriktirish */}
              <div className="space-y-2.5">
                <label className="block text-sm font-extrabold text-slate-800 dark:text-slate-200 flex items-center justify-between">
                  <span className="flex items-center gap-2">
                    <Upload className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
                    <span>Komp’yuterdan fayl biriktirish (Rasm, Audio yoki Video):</span>
                  </span>
                  <span className="text-xs text-slate-400 font-normal">
                    (Faylsiz faqat matnni saqlash ham mumkin)
                  </span>
                </label>

                {!editExpImageUrl && !editExpAudioUrl && !editExpVideoUrl ? (
                  <label className="flex items-center justify-center gap-3 px-6 py-5 border-2 border-dashed border-slate-300 dark:border-slate-700 hover:border-indigo-500 dark:hover:border-indigo-400 rounded-2xl bg-slate-50 hover:bg-indigo-50/40 dark:bg-slate-900 dark:hover:bg-slate-800/80 transition-colors cursor-pointer text-center group">
                    <input
                      type="file"
                      accept="image/*,audio/*,video/*"
                      onChange={(e) => {
                        const f = e.target.files?.[0];
                        if (f) handleUploadMediaFile(f, true);
                        e.target.value = '';
                      }}
                      disabled={isUploadingEditExpMedia}
                      className="hidden"
                    />
                    <Upload className="w-6 h-6 text-slate-400 group-hover:text-indigo-600 transition-colors shrink-0" />
                    <div className="text-left">
                      <span className="text-sm sm:text-base font-bold text-slate-800 dark:text-slate-200 group-hover:text-indigo-600">
                        {isUploadingEditExpMedia ? 'Fayl yuklanmoqda...' : 'Komp’yuterdan fayl tanlash'}
                      </span>
                      <span className="block text-xs text-slate-500 dark:text-slate-400 mt-0.5">
                        Rasm (.png, .jpg), Audio (.mp3) yoki Video (.mp4)
                      </span>
                    </div>
                  </label>
                ) : (
                  <div className="p-4 rounded-xl border border-indigo-200 dark:border-indigo-800 bg-indigo-50/60 dark:bg-indigo-950/40 space-y-3">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-2">
                        {editExpImageUrl && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-extrabold bg-emerald-100 dark:bg-emerald-950/80 text-emerald-700 dark:text-emerald-300">
                            <ImageIcon className="w-3.5 h-3.5" /> Rasm
                          </span>
                        )}
                        {editExpAudioUrl && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-extrabold bg-purple-100 dark:bg-purple-950/80 text-purple-700 dark:text-purple-300">
                            <Volume2 className="w-3.5 h-3.5" /> Audio (MP3)
                          </span>
                        )}
                        {editExpVideoUrl && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-md text-xs font-extrabold bg-rose-100 dark:bg-rose-950/80 text-rose-700 dark:text-rose-300">
                            <Video className="w-3.5 h-3.5" /> Video (MP4)
                          </span>
                        )}
                        <span className="text-sm font-semibold text-slate-800 dark:text-slate-200 truncate max-w-sm">
                          {editExpFileName || 'Biriktirilgan fayl'}
                        </span>
                      </div>
                      <button
                        type="button"
                        onClick={() => handleRemoveExpMedia(true)}
                        className="px-3 py-1.5 text-xs font-bold text-rose-600 hover:text-rose-700 hover:bg-rose-100 dark:hover:bg-rose-950/60 rounded-lg transition-colors flex items-center gap-1.5 cursor-pointer"
                      >
                        <X className="w-4 h-4" />
                        <span>O‘chirish</span>
                      </button>
                    </div>

                    {/* Previews */}
                    {editExpImageUrl && (
                      <div className="max-w-sm rounded-xl overflow-hidden border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900 p-1.5">
                        <img src={editExpImageUrl} alt="Preview" className="max-h-48 object-contain rounded-lg" />
                      </div>
                    )}
                    {editExpAudioUrl && (
                      <div className="max-w-md">
                        <audio controls src={editExpAudioUrl} className="w-full h-10 rounded-lg" />
                      </div>
                    )}
                    {editExpVideoUrl && (
                      <div className="max-w-md rounded-xl overflow-hidden border border-slate-200 dark:border-slate-700 bg-black aspect-video">
                        {parseEmbedVideoUrl(editExpVideoUrl).isEmbed ? (
                          <iframe src={parseEmbedVideoUrl(editExpVideoUrl).url} className="w-full h-full border-0" allowFullScreen />
                        ) : (
                          <video controls src={editExpVideoUrl} className="w-full h-full object-contain" />
                        )}
                      </div>
                    )}
                  </div>
                )}

                {/* External link */}
                <input
                  type="text"
                  value={editExpVideoUrl && !editExpImageUrl && !editExpAudioUrl && !editExpFileName.startsWith('video_') ? editExpVideoUrl : ''}
                  onChange={(e) => handleSetExternalLink(e.target.value, true)}
                  placeholder="Yoki YouTube / tashqi video havola manzilini kiriting..."
                  className="w-full px-4 py-2.5 text-sm rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900 text-slate-900 dark:text-slate-100 focus:ring-2 focus:ring-indigo-500"
                />
              </div>
            </div>

            {/* Modal Footer */}
            <div className="px-6 py-4 border-t border-slate-200 dark:border-slate-700 flex items-center justify-end gap-3 bg-slate-50/50 dark:bg-slate-800/50">
              <button
                type="button"
                onClick={() => setEditingExpQuestion(null)}
                className="px-5 py-2.5 text-sm font-bold text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-700 rounded-xl transition-colors cursor-pointer"
              >
                Bekor qilish
              </button>
              <button
                type="button"
                onClick={handleSaveExistingExp}
                disabled={isSavingEditExp}
                className="px-6 py-2.5 text-sm sm:text-base font-extrabold text-white bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 rounded-xl shadow-md hover:shadow-lg transition-all flex items-center gap-2 cursor-pointer"
              >
                {isSavingEditExp ? (
                  <span>Saqlanmoqda...</span>
                ) : (
                  <>
                    <CheckCircle2 className="w-5 h-5" />
                    <span>Tushuntirishni Saqlash</span>
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
