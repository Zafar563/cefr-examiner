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
  Filter,
  Users,
  Award,
} from 'lucide-react';
import {
  IeltsQuestionCategory,
  getQuestionCategory,
} from '@/lib/questionTypes';

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

const getTestMeta = (title: string) => {
  const bookMatch = title.match(/Cambridge\s+(?:IELTS\s+)?(\d+)/i);
  const testMatch = title.match(/Test\s+(\d+)/i);
  return {
    book: bookMatch ? `Cambridge ${bookMatch[1]}` : null,
    bookNum: bookMatch ? bookMatch[1] : null,
    testNum: testMatch ? `Test ${testMatch[1]}` : null,
  };
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
        badge: 'TASKS',
        title: 'Writing Real Exam Materials',
        subtitle: 'Practise Task 1 and Task 2 with real-exam prompts.',
        gradient: 'from-[#4a154b] via-[#8c2e6b] to-[#ea580c]',
        borderColor: 'border-[#8c2e6b]/40',
        buttonBg: 'bg-[#7a2259] hover:bg-[#641a47] text-white shadow-purple-950/20',
        ringColor: 'ring-[#7a2259]',
        icon: <PenTool className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#7a2259]',
      };
    case 'listening':
      return {
        badge: 'AUDIO',
        title: 'Listening Real Exam Materials',
        subtitle: 'Practise with real-exam listening audio. Each full test is 40 questions across 4 sections.',
        gradient: 'from-[#084857] via-[#0a5c6e] to-[#0e7490]',
        borderColor: 'border-cyan-800/40',
        buttonBg: 'bg-[#0a5c6e] hover:bg-[#084857] text-white shadow-cyan-900/20',
        ringColor: 'ring-[#0a5c6e]',
        icon: <Headphones className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#0a5c6e]',
      };
    case 'reading':
      return {
        badge: 'TEXTS',
        title: 'Reading Real Exam Materials',
        subtitle: 'Build your band score with real-exam reading practice. Each full test is 40 questions across 3 passages.',
        gradient: 'from-[#0d4f7c] via-[#156ea3] to-[#2597b8]',
        borderColor: 'border-cyan-700/40',
        buttonBg: 'bg-[#1967d2] hover:bg-[#1557b0] text-white shadow-blue-900/20',
        ringColor: 'ring-[#1967d2]',
        icon: <BookOpen className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#156ea3]',
      };
    case 'speaking':
      return {
        badge: 'VOICE',
        title: 'Speaking Real Exam Materials',
        subtitle: 'Practise speaking online with another student, or on your own.',
        gradient: 'from-[#047857] via-[#059669] to-[#0ea5e9]',
        borderColor: 'border-emerald-600/40',
        buttonBg: 'bg-[#059669] hover:bg-[#047857] text-white shadow-emerald-900/20',
        ringColor: 'ring-[#059669]',
        icon: <Mic className="w-44 h-44 xl:w-56 xl:h-56 stroke-[1.2]" />,
        stepBg: 'text-[#059669]',
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

const CAMBRIDGE_WRITING_TOPICS: Record<string, { task1: string; task2: string }> = {
  '13_1': {
    task1: 'Production and consumption of electricity in 10 countries',
    task2: 'Living in apartments vs suburban family houses',
  },
  '13_2': {
    task1: 'Consumer spending on six commodities in four countries',
    task2: 'University education free of charge for all students',
  },
  '13_3': {
    task1: 'Plan of the development of the city of Brandon',
    task2: 'History as a school subject vs science and technology',
  },
  '13_4': {
    task1: 'Changes in the town of Willington between 1780 and 2020',
    task2: 'Living away from parents when attending university',
  },
  '14_1': {
    task1: 'Export earnings of a country in five categories',
    task2: 'Environmental problems too big for individual management',
  },
  '14_2': {
    task1: 'Export of fruit from four nations from 2010 to 2020',
    task2: 'Music as a good way of bringing people together',
  },
  '14_3': {
    task1: 'Production of silk cloth through traditional methods',
    task2: 'Loss of traditional cultures due to modern technology',
  },
  '14_4': {
    task1: 'Energy production by fuel sources in Australia and France',
    task2: 'Working from home using computer technology and internet',
  },
  '15_1': {
    task1: 'Liverton Docks changes since 1980',
    task2: 'Teaching cooperation through team sports',
  },
  '15_2': {
    task1: 'Industrial and domestic water use in San Diego and worldwide',
    task2: 'Printed books and newspapers vs online electronic news',
  },
  '15_3': {
    task1: 'Anthropological museum layout changes after 2015 renovation',
    task2: 'Tourism industry benefits vs negative impact on local cultures',
  },
  '15_4': {
    task1: 'Coffee and tea buying and drinking habits in 5 cities in Australia',
    task2: 'Owning a home rather than renting in modern society',
  },
  '16_1': {
    task1: 'Manufacturing process of sugar from sugarcane plants',
    task2: 'Financial support for artists vs investments in public services',
  },
  '16_2': {
    task1: 'Manufacturing plastic products and recycling rates in Europe',
    task2: 'Remote online work vs traditional corporate offices',
  },
  '16_3': {
    task1: 'Southampton harbour development plans between 2000 and 2020',
    task2: 'High-earning executives receiving astronomical salaries',
  },
  '16_4': {
    task1: 'Electricity generation by renewable energy in four countries',
    task2: 'Space travel and tourism exploration vs Earth conservation',
  },
  '17_1': {
    task1: 'Industrial robotics utilization in automotive and electronics',
    task2: 'Fast food advertising aimed at children and youth obesity',
  },
  '17_2': {
    task1: 'Urban park pedestrian visitors by demographic groups',
    task2: 'Government restrictions on international corporate monopolies',
  },
  '17_3': {
    task1: 'Hydroelectric power dam architecture and power generation flow',
    task2: 'Artificial Intelligence automating intellectual professions',
  },
  '17_4': {
    task1: 'Commercial flight passengers across six global hub airports',
    task2: 'Compulsory community service for high school graduates',
  },
  '18_1': {
    task1: 'Household waste recycled between 1992 and 2002',
    task2: 'Rising public transport costs',
  },
  '18_2': {
    task1: 'Urban residential property prices across major provincial towns',
    task2: 'Consumer spending on luxury designer goods and status symbols',
  },
  '18_3': {
    task1: 'Wind turbine engineering process for offshore renewable energy',
    task2: 'Autonomous self-driving vehicles and urban road safety',
  },
  '18_4': {
    task1: 'Global coffee exports and pricing dynamics in commodity markets',
    task2: 'The primary purpose of scientific inquiry and human welfare',
  },
  '19_1': {
    task1: 'Online shopping by age group in Australia',
    task2: 'International relationships and global problems',
  },
  '19_2': {
    task1: 'Renewable solar energy generation capacity in six continents',
    task2: 'Cultural heritage preservation in rapidly modernising cities',
  },
  '19_3': {
    task1: 'Airport departure terminal renovations and passenger security flows',
    task2: 'Public education funding equality between rural and urban districts',
  },
  '19_4': {
    task1: 'Electric vehicle market penetration rates in key economies',
    task2: 'Ethical considerations in genetic engineering and biotechnology',
  },
  '20_1': {
    task1: 'Producing bottled and canned carbonated drinks',
    task2: 'Impact of high-speed transport infrastructure',
  },
  '20_2': {
    task1: 'Municipal waste disposal methods and incinerator emissions',
    task2: 'Digital communication replacing traditional personal meetings',
  },
  '20_3': {
    task1: 'Geothermal energy harvesting systems in volcanic regions',
    task2: 'Lifelong learning and professional retraining for older adults',
  },
  '20_4': {
    task1: 'Demographic shifts and dependency ratios in G7 nations',
    task2: 'Childhood formal academic tuition vs play-based education balance',
  },
  '21_1': {
    task1: 'Forest industry production from 1980 to 2000',
    task2: 'Talent vs hard work in sports achievements',
  },
  '21_2': {
    task1: 'High-speed rail passenger volumes and carbon emission savings',
    task2: 'Commercial advertising influence on consumer materialism',
  },
  '21_3': {
    task1: 'Desalination plant purification process for drinking water',
    task2: 'Preservation of endangered indigenous languages and folklore',
  },
  '21_4': {
    task1: 'Undergraduate student enrollment patterns in STEM versus Humanities',
    task2: 'High-density urban apartment towers vs suburban expansion',
  },
  '22_1': {
    task1: 'Car ownership in Britain from 1975 to 2005',
    task2: 'Government funding for arts and cultural facilities',
  },
  '22_2': {
    task1: 'Renewable wind energy installation capacities across EU states',
    task2: 'Universal basic income trials and citizen productivity',
  },
  '22_3': {
    task1: 'Automated package sorting logistics hub mechanical processes',
    task2: 'Tourism caps on historical landmarks to prevent degradation',
  },
  '22_4': {
    task1: 'Youth employment trends in digital gig-economy sectors',
    task2: 'Individual dietary choices vs public health tax policies',
  },
};

const getWritingTopics = (test: Test): { task1: string; task2: string } => {
  const meta = getTestMeta(test.title);
  if (meta.bookNum) {
    const testMatch = test.title.match(/Test\s+(\d+)/i);
    const testNum = testMatch ? testMatch[1] : '1';
    const key = `${meta.bookNum}_${testNum}`;
    if (CAMBRIDGE_WRITING_TOPICS[key]) {
      return CAMBRIDGE_WRITING_TOPICS[key];
    }
  }

  // Fallback to section questions or description
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

  return {
    task1: cleanTopicText(t1Topic) || 'Data visual report and summary',
    task2: cleanTopicText(t2Topic) || 'Discursive opinion essay',
  };
};

export interface SpeakingTopic {
  id: number;
  number: number;
  part: 1 | 2 | 3;
  title: string;
  questionsCount: number;
  isNew?: boolean;
}

const SPEAKING_PART_1_TOPICS: SpeakingTopic[] = [
  { id: 1, number: 1, part: 1, title: 'INSTRUCTIONS: how to practice answering part 1 speaking questions', questionsCount: 3 },
  { id: 2, number: 2, part: 1, title: 'Work and studies, schools and workplaces (always in use)', questionsCount: 5 },
  { id: 3, number: 3, part: 1, title: 'Hometown, area you live in (always in use)', questionsCount: 7 },
  { id: 4, number: 4, part: 1, title: 'Home and accommodation (always in use)', questionsCount: 6 },
  { id: 5, number: 5, part: 1, title: 'Street markets (September 2026 – April 2027)', questionsCount: 4, isNew: true },
  { id: 6, number: 6, part: 1, title: 'Travelling (September 2026 – April 2027)', questionsCount: 3 },
  { id: 7, number: 7, part: 1, title: 'Collecting things (September 2026 – April 2027)', questionsCount: 4, isNew: true },
  { id: 8, number: 8, part: 1, title: 'Computers and tablets (September 2026 – April 2027)', questionsCount: 4, isNew: true },
  { id: 9, number: 9, part: 1, title: 'Shoes (September 2026 – April 2027)', questionsCount: 5 },
  { id: 10, number: 10, part: 1, title: 'Recycling and rubbish (September 2026 – April 2027)', questionsCount: 5, isNew: true },
  { id: 11, number: 11, part: 1, title: 'Politeness (September 2026 – April 2027)', questionsCount: 3, isNew: true },
  { id: 12, number: 12, part: 1, title: 'Names (September 2026 – April 2027)', questionsCount: 4 },
  { id: 13, number: 13, part: 1, title: 'Being bored (September 2026 – April 2027)', questionsCount: 5, isNew: true },
  { id: 14, number: 14, part: 1, title: 'Teachers (May – December 2026)', questionsCount: 4 },
  { id: 15, number: 15, part: 1, title: 'Social media (May – December 2026)', questionsCount: 2 },
  { id: 16, number: 16, part: 1, title: 'Dreams and ambitions (May – December 2026)', questionsCount: 4 },
  { id: 17, number: 17, part: 1, title: 'Mirrors (May – December 2026)', questionsCount: 6 },
  { id: 18, number: 18, part: 1, title: 'Music (May – December 2026)', questionsCount: 4 },
  { id: 19, number: 19, part: 1, title: 'Tidiness (May – December 2026)', questionsCount: 4 },
  { id: 20, number: 20, part: 1, title: 'Websites (May – December 2026)', questionsCount: 2 },
  { id: 21, number: 21, part: 1, title: 'Watches (May – December 2026)', questionsCount: 3 },
  { id: 22, number: 22, part: 1, title: 'Shopping (May – December 2026)', questionsCount: 4 },
  { id: 23, number: 23, part: 1, title: 'Cars (May – December 2026)', questionsCount: 4 },
  { id: 24, number: 24, part: 1, title: 'Parks (May – December 2026)', questionsCount: 1 },
  { id: 25, number: 25, part: 1, title: 'Science (May – December 2026)', questionsCount: 1 },
  { id: 26, number: 26, part: 1, title: 'Outer space and stars (May – December 2026)', questionsCount: 5 },
  { id: 27, number: 27, part: 1, title: 'Headphones (May – December 2026)', questionsCount: 3 },
  { id: 28, number: 28, part: 1, title: 'Weather and seasons (always in use)', questionsCount: 4 },
  { id: 29, number: 29, part: 1, title: 'Daily routine and leisure hobbies', questionsCount: 5 },
  { id: 30, number: 30, part: 1, title: 'Sports and exercise (September 2026 – April 2027)', questionsCount: 4, isNew: true },
];

const SPEAKING_PART_2_TOPICS: SpeakingTopic[] = [
  { id: 101, number: 1, part: 2, title: 'Describe someone you know who has started a business', questionsCount: 4, isNew: true },
  { id: 102, number: 2, part: 2, title: 'Describe an interesting conversation you had with a stranger', questionsCount: 4 },
  { id: 103, number: 3, part: 2, title: 'Describe a historical period you would like to know more about', questionsCount: 4, isNew: true },
  { id: 104, number: 4, part: 2, title: 'Describe an unusual meal you had', questionsCount: 4 },
  { id: 105, number: 5, part: 2, title: 'Describe a piece of technology that you find difficult to use', questionsCount: 4, isNew: true },
  { id: 106, number: 6, part: 2, title: 'Describe a prize that you received (e.g. medal, money, trophy)', questionsCount: 4 },
  { id: 107, number: 7, part: 2, title: 'Describe a website you visit often that helps you in your studies', questionsCount: 4 },
  { id: 108, number: 8, part: 2, title: 'Describe a law on environmental protection your country should introduce', questionsCount: 4, isNew: true },
  { id: 109, number: 9, part: 2, title: 'Describe an occasion when you waited a long time for a nice thing', questionsCount: 4 },
  { id: 110, number: 10, part: 2, title: 'Describe a person who inspired you to do something creative', questionsCount: 4, isNew: true },
  { id: 111, number: 11, part: 2, title: 'Describe a beautiful city or town you have visited', questionsCount: 4 },
  { id: 112, number: 12, part: 2, title: 'Describe a speech you listened to that made a great impression', questionsCount: 4, isNew: true },
  { id: 113, number: 13, part: 2, title: 'Describe a movie that made you think a lot', questionsCount: 4 },
  { id: 114, number: 14, part: 2, title: 'Describe a noisy place you have been to', questionsCount: 4, isNew: true },
  { id: 115, number: 15, part: 2, title: 'Describe an outdoor sport you would like to try for the first time', questionsCount: 4 },
];

const SPEAKING_PART_3_TOPICS: SpeakingTopic[] = [
  { id: 201, number: 1, part: 3, title: 'Business & entrepreneurship in modern society', questionsCount: 5, isNew: true },
  { id: 202, number: 2, part: 3, title: 'Communication with strangers & interpersonal skills', questionsCount: 4 },
  { id: 203, number: 3, part: 3, title: 'History education & cultural heritage preservation', questionsCount: 5, isNew: true },
  { id: 204, number: 4, part: 3, title: 'Food culture, dining habits & traditional cuisine', questionsCount: 4 },
  { id: 205, number: 5, part: 3, title: 'Technology impact on older generations & digital divide', questionsCount: 5, isNew: true },
  { id: 206, number: 6, part: 3, title: 'Competition, awards & motivation in education', questionsCount: 4 },
  { id: 207, number: 7, part: 3, title: 'Online learning platforms & digital literacy', questionsCount: 5 },
  { id: 208, number: 8, part: 3, title: 'Environmental laws, government policy & personal responsibility', questionsCount: 5, isNew: true },
  { id: 209, number: 9, part: 3, title: 'Patience, modern instant gratification & time management', questionsCount: 4 },
  { id: 210, number: 10, part: 3, title: 'Creativity, art education & AI in creative industries', questionsCount: 5, isNew: true },
  { id: 211, number: 11, part: 3, title: 'Urban planning, tourism impact & preservation of towns', questionsCount: 4 },
  { id: 212, number: 12, part: 3, title: 'Public speaking, leadership qualities & persuasive rhetoric', questionsCount: 5, isNew: true },
  { id: 213, number: 13, part: 3, title: 'Cinema influence, storytelling & documentary making', questionsCount: 4 },
  { id: 214, number: 14, part: 3, title: 'Noise pollution in metropolitan cities & mental health', questionsCount: 5, isNew: true },
  { id: 215, number: 15, part: 3, title: 'Health benefits of extreme sports & safety regulations', questionsCount: 4 },
];

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
  // Reading Passage Filter: 'all' | '1' | '2' | '3' | 'full'
  const [readingPassageFilter, setReadingPassageFilter] = useState<'all' | '1' | '2' | '3' | 'full'>('full');
  // Speaking states
  const [speakingPart, setSpeakingPart] = useState<'1' | '2' | '3' | null>(null);
  const [speakingMode, setSpeakingMode] = useState<'partner' | 'recordings' | null>(null);
  const [speakingTopicSearch, setSpeakingTopicSearch] = useState<string>('');
  // Writing states
  const [writingTaskFilter, setWritingTaskFilter] = useState<'all' | '1' | '2'>('all');
  const [writingMode, setWritingMode] = useState<'feedback' | null>(null);
  // Mock states
  const [mockMode, setMockMode] = useState<'results' | null>(null);
  const [selectedBook, setSelectedBook] = useState<string>('all');
  const [selectedQuestionType, setSelectedQuestionType] = useState<IeltsQuestionCategory>('all');

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
    const passageParam = searchParams.get('passage');
    const partParam = searchParams.get('part');
    const taskParam = searchParams.get('task');
    const modeParam = searchParams.get('mode');

    if (tabParam && ['listening', 'reading', 'writing', 'speaking', 'mock'].includes(tabParam)) {
      setActiveTab(tabParam as any);
    } else if (!tabParam) {
      setActiveTab('listening');
    }

    if (passageParam && ['all', '1', '2', '3', 'full'].includes(passageParam)) {
      setReadingPassageFilter(passageParam as any);
    } else if (tabParam === 'reading' && !passageParam) {
      setReadingPassageFilter('full');
    }

    if (sectionParam) {
      if (['all', '1', '2', '3', '4', 'full'].includes(sectionParam)) {
        setListeningSectionFilter(sectionParam as any);
      } else {
        setSearchQuery(sectionParam);
      }
    } else if (tabParam === 'listening' && !sectionParam) {
      setListeningSectionFilter('full');
      setSearchQuery('');
    } else {
      setSearchQuery('');
    }

    if (tabParam === 'writing') {
      if (taskParam && ['1', '2'].includes(taskParam)) {
        setWritingTaskFilter(taskParam as any);
      } else {
        setWritingTaskFilter('all');
      }

      if (modeParam === 'feedback') {
        setWritingMode('feedback');
      } else {
        setWritingMode(null);
      }
    } else {
      setWritingTaskFilter('all');
      setWritingMode(null);
    }

    if (tabParam === 'speaking') {
      if (partParam && ['1', '2', '3'].includes(partParam)) {
        setSpeakingPart(partParam as any);
        setSpeakingMode(null);
      } else {
        setSpeakingPart(null);
      }

      if (modeParam && ['partner', 'recordings'].includes(modeParam)) {
        setSpeakingMode(modeParam as any);
        setSpeakingPart(null);
      } else if (!partParam) {
        setSpeakingMode(null);
      }
    } else {
      setSpeakingPart(null);
      setSpeakingMode(null);
    }

    if (tabParam === 'mock') {
      if (modeParam === 'results') {
        setMockMode('results');
      } else {
        setMockMode(null);
      }
    } else {
      setMockMode(null);
    }
  }, [searchParams]);

  // Reset selectedBook and selectedQuestionType when activeTab changes
  useEffect(() => {
    setSelectedBook('all');
    setSelectedQuestionType('all');
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
      alert('Error starting mock exam: ' + e.message);
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
      const session = await apiStartSession(testId, forceNew, targetSectionIndex);
      const secQuery = targetSectionIndex !== undefined ? `?section=${targetSectionIndex}` : '';
      router.push(`/student/test/${session.id}${secQuery}`);
    } catch (e: any) {
      alert('Error starting test: ' + e.message);
      setStartingTestId(null);
    }
  };

  const formatDate = (dateStr?: string) => {
    if (!dateStr) return 'Recently';
    try {
      const d = new Date(dateStr);
      return isNaN(d.getTime())
        ? 'Recently'
        : d.toLocaleDateString('en-US') + ' ' + d.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
    } catch {
      return 'Recently';
    }
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

  const handleBackToSpeakingOverview = () => {
    setSpeakingPart(null);
    setSpeakingMode(null);
    setSpeakingTopicSearch('');
    const url = new URL(window.location.href);
    url.searchParams.set('tab', 'speaking');
    url.searchParams.delete('part');
    url.searchParams.delete('mode');
    window.history.replaceState({}, '', url.toString());
  };

  const handleSelectSpeakingPart = (p: '1' | '2' | '3') => {
    setSpeakingPart(p);
    setSpeakingMode(null);
    setSpeakingTopicSearch('');
    const url = new URL(window.location.href);
    url.searchParams.set('tab', 'speaking');
    url.searchParams.set('part', p);
    url.searchParams.delete('mode');
    window.history.replaceState({}, '', url.toString());
  };

  const handleGoOnlineSpeaking = () => {
    setSpeakingMode('partner');
    setSpeakingPart(null);
    const url = new URL(window.location.href);
    url.searchParams.set('tab', 'speaking');
    url.searchParams.set('mode', 'partner');
    url.searchParams.delete('part');
    window.history.replaceState({}, '', url.toString());
  };

  const handleOpenLocalSpeaking = () => {
    handleSelectSpeakingPart('1');
  };

  const handleGoRecordingsSpeaking = () => {
    setSpeakingMode('recordings');
    setSpeakingPart(null);
    const url = new URL(window.location.href);
    url.searchParams.set('tab', 'speaking');
    url.searchParams.set('mode', 'recordings');
    url.searchParams.delete('part');
    window.history.replaceState({}, '', url.toString());
  };

  const handleStartSpeakingTopic = (topic: SpeakingTopic) => {
    if (typeof window !== 'undefined') {
      sessionStorage.setItem('current_speaking_topic', JSON.stringify(topic));
    }
    const speakingTest =
      speakingTests[0] || tests.find((t) => t.title.toLowerCase().includes('speaking')) || tests[0];
    if (speakingTest) {
      handleStartTest(speakingTest.id, false, topic.part - 1);
    } else {
      alert('Speaking test bazada topilmadi. Mock orqali foydalanishingiz mumkin.');
    }
  };

  const activePartTopics = useMemo(() => {
    let list: SpeakingTopic[] = [];
    if (speakingPart === '1') list = SPEAKING_PART_1_TOPICS;
    else if (speakingPart === '2') list = SPEAKING_PART_2_TOPICS;
    else if (speakingPart === '3') list = SPEAKING_PART_3_TOPICS;

    if (!speakingTopicSearch.trim()) return list;
    const q = speakingTopicSearch.toLowerCase().trim();
    return list.filter((t) => t.title.toLowerCase().includes(q));
  }, [speakingPart, speakingTopicSearch]);

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

  const testContainsQuestionType = (test: Test, category: IeltsQuestionCategory): boolean => {
    if (category === 'all') return true;

    if (test.sections && Array.isArray(test.sections)) {
      for (const sec of test.sections) {
        if (sec.questions && Array.isArray(sec.questions)) {
          for (const q of sec.questions) {
            if (getQuestionCategory(q) === category) return true;
          }
        }
        const inst = (sec.instructions || '').toLowerCase();
        if (category === 'true_false_not_given' && (inst.includes('true') && inst.includes('false') && inst.includes('not given'))) return true;
        if (category === 'yes_no_not_given' && (inst.includes('yes') && inst.includes('no') && inst.includes('not given'))) return true;
        if (category === 'multiple_choice' && (inst.includes('multiple choice') || inst.includes('choose the correct letter'))) return true;
        if (category === 'completion' && (inst.includes('complete the') || inst.includes('one word only') || inst.includes('fill in') || inst.includes('summary'))) return true;
        if (category === 'matching' && (inst.includes('match') || inst.includes('heading'))) return true;
      }
    }

    const desc = (test.description || '').toLowerCase();
    if (category === 'true_false_not_given' && (desc.includes('true/false') || desc.includes('true, false'))) return true;
    if (category === 'yes_no_not_given' && (desc.includes('yes/no') || desc.includes('yes, no'))) return true;
    if (category === 'multiple_choice' && desc.includes('multiple choice')) return true;
    if (category === 'completion' && (desc.includes('completion') || desc.includes('summary') || desc.includes('blank'))) return true;
    if (category === 'matching' && desc.includes('matching')) return true;

    return false;
  };

  const displayedTests = useMemo(() => {
    return currentCategoryTests.filter((t) => {
      if (selectedBook !== 'all') {
        const meta = getTestMeta(t.title);
        if (meta.bookNum !== selectedBook) return false;
      }
      if (selectedQuestionType !== 'all') {
        if (!testContainsQuestionType(t, selectedQuestionType)) return false;
      }
      return true;
    });
  }, [currentCategoryTests, selectedBook, selectedQuestionType]);

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

    if (activeTab === 'reading' && ['1', '2', '3'].includes(readingPassageFilter)) {
      handleStartTest(randomTest.id, false, parseInt(readingPassageFilter, 10) - 1);
    } else if (activeTab === 'listening' && ['1', '2', '3', '4'].includes(listeningSectionFilter)) {
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
        <p className="text-slate-600 dark:text-slate-400 font-semibold text-sm">Loading examination database...</p>
      </div>
    );
  }

  const getPassageTopic = (t: Test, idx: number): string => {
    let topic = t.sections?.[idx]?.title || '';
    if (!topic && t.description) {
      const m = t.description.match(/\((.*?)\)/);
      if (m) {
        const parts = m[1].split(',').map((p) => p.trim());
        if (parts[idx]) topic = parts[idx];
      }
    }
    return cleanTopicText(topic) || `Academic Reading Passage ${idx + 1}`;
  };

  const getListeningSectionTopic = (t: Test, idx: number): string => {
    const sec = t.sections?.[idx];
    let topic = sec?.title || '';
    let cleaned = cleanTopicText(topic);

    // If cleaned is empty or just "Part 1" / "Section 1"
    if (!cleaned || /^(?:part|section)\s*\d+$/i.test(cleaned)) {
      if (sec?.instructions) {
        const instClean = cleanTopicText(sec.instructions, 80);
        if (
          instClean &&
          !instClean.toLowerCase().includes('questions 1-') &&
          !instClean.toLowerCase().includes('ielts-reading')
        ) {
          cleaned = instClean;
        }
      }
      if ((!cleaned || /^(?:part|section)\s*\d+$/i.test(cleaned)) && sec?.questions?.[0]?.question_text) {
        const qText = sec.questions[0].question_text;
        const noHtml = qText.replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim();
        const match = noHtml.match(/^([A-Z\s]{4,45})(?:\s+Type|\s+Personal|\s+Name|\s+Date|:)/);
        if (match && match[1].trim().length > 4) {
          cleaned = cleanTopicText(match[1]);
        } else {
          const firstLine = noHtml.split(/[.\n]/)[0]?.trim();
          if (firstLine && firstLine.length > 5 && !firstLine.includes('{')) {
            cleaned = cleanTopicText(firstLine, 75);
          }
        }
      }
    }

    if (!cleaned || /^(?:part|section)\s*\d+$/i.test(cleaned)) {
      const fallbackTopics = [
        'Social conversation & form completion',
        'Local facilities & public guide',
        'Academic discussion & study project',
        'University lecture & research talk',
      ];
      return fallbackTopics[idx] || `Listening Section ${idx + 1}`;
    }

    return cleaned;
  };

  const renderTestCard = (test: Test, index: number = 0) => {
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

    // Reading specific card rendering matching Image 2
    if (activeTab === 'reading' && ['1', '2', '3'].includes(readingPassageFilter)) {
      const pNum = parseInt(readingPassageFilter, 10);
      const secIdx = pNum - 1;
      const topicText = getPassageTopic(test, secIdx);

      return (
        <div
          key={test.id}
          style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
          className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-2xl border border-slate-200/80 dark:border-white/10 border-l-[4px] border-l-[#0ea5e9] p-5 shadow-xs hover:border-sky-500/60 dark:hover:border-sky-400/60 hover:shadow-xl hover:shadow-sky-500/5 transition-all flex flex-col justify-between space-y-4 group"
        >
          {/* Top: Passage Title + Status Badge + Start Button */}
          <div className="flex items-center justify-between gap-3">
            <div className="min-w-0">
              <h3 className="text-xl sm:text-2xl font-black text-slate-800 dark:text-slate-100 whitespace-nowrap">
                Passage {pNum}
              </h3>
              <span className="text-[11px] font-bold text-slate-400 block mt-0.5 truncate">
                {displayTitle}
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : isOngoing ? (
                <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border border-amber-300 dark:border-amber-700 bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 whitespace-nowrap">
                  <span>CONTINUE</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-extrabold border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 bg-white dark:bg-slate-800 whitespace-nowrap">
                  <span className="w-2 h-2 rounded-full border border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              <button
                onClick={() => handleStartTest(test.id, hasCompleted, secIdx)}
                disabled={startingTestId === test.id}
                className="px-6 py-2 rounded-xl text-sm font-black text-white bg-[#1967d2] hover:bg-[#1557b0] transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer"
              >
                {startingTestId === test.id ? '...' : isOngoing ? 'Continue' : 'Start'}
              </button>
            </div>
          </div>

          {/* INSIDE THIS READING */}
          <div className="space-y-1.5 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS READING
            </div>
            <div className="bg-slate-50 dark:bg-slate-800/80 rounded-xl px-3.5 py-2.5 border border-slate-100 dark:border-slate-700/60 text-xs sm:text-[13px] font-bold text-slate-800 dark:text-slate-200 truncate">
              {topicText}
            </div>
          </div>
        </div>
      );
    }

    if (activeTab === 'reading' && (readingPassageFilter === 'full' || readingPassageFilter === 'all')) {
      const p1Topic = getPassageTopic(test, 0);
      const p2Topic = getPassageTopic(test, 1);
      const p3Topic = getPassageTopic(test, 2);

      return (
        <div
          key={test.id}
          style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
          className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-2xl border border-slate-200/80 dark:border-white/10 border-l-[4px] border-l-[#0ea5e9] p-5 shadow-xs hover:border-sky-500/60 dark:hover:border-sky-400/60 hover:shadow-xl hover:shadow-sky-500/5 transition-all flex flex-col justify-between space-y-4 group"
        >
          <div className="flex items-center justify-between gap-3">
            <div>
              <h3 className="text-lg sm:text-xl font-black text-slate-800 dark:text-slate-100">
                {displayTitle}
              </h3>
              <span className="text-xs font-bold text-slate-400 block mt-0.5">
                Full Reading (3 passages • 60 min)
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : isOngoing ? (
                <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border border-amber-300 dark:border-amber-700 bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 whitespace-nowrap">
                  <span>CONTINUE</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-extrabold border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 bg-white dark:bg-slate-800 whitespace-nowrap">
                  <span className="w-2 h-2 rounded-full border border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              <button
                onClick={() => handleStartTest(test.id, hasCompleted)}
                disabled={startingTestId === test.id}
                className="px-6 py-2 rounded-xl text-sm font-black text-white bg-[#1967d2] hover:bg-[#1557b0] transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer"
              >
                {startingTestId === test.id ? '...' : isOngoing ? 'Continue' : 'Start'}
              </button>
            </div>
          </div>

          <div className="space-y-1.5 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS READING (3 PASSAGES)
            </div>
            <div className="space-y-1.5">
              {[p1Topic, p2Topic, p3Topic].map((t, idx) => (
                <div
                  key={idx}
                  className="bg-slate-50 dark:bg-slate-800/80 rounded-xl px-3.5 py-2 border border-slate-100 dark:border-slate-700/60 text-xs font-bold text-slate-800 dark:text-slate-200 flex items-center justify-between"
                >
                  <span className="truncate">
                    <span className="text-slate-400 mr-2 font-mono text-[11px]">Passage {idx + 1}:</span>
                    {t}
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>
      );
    }

    // Listening specific card rendering matching user screenshot
    if (activeTab === 'listening' && ['1', '2', '3', '4'].includes(listeningSectionFilter)) {
      const sNum = parseInt(listeningSectionFilter, 10);
      const secIdx = sNum - 1;
      const topicText = getListeningSectionTopic(test, secIdx);

      return (
        <div
          key={test.id}
          style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
          className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-2xl border border-slate-200/80 dark:border-white/10 border-l-[4px] border-l-[#0a5c6e] dark:border-l-[#087ea4] p-5 shadow-xs hover:border-cyan-500/60 dark:hover:border-cyan-400/60 hover:shadow-xl hover:shadow-cyan-500/5 transition-all flex flex-col justify-between space-y-4 group"
        >
          {/* Top: Section Title + Status Badge + Start Button */}
          <div className="flex items-center justify-between gap-3">
            <div className="min-w-0">
              <h3 className="text-xl sm:text-2xl font-black text-slate-800 dark:text-slate-100 whitespace-nowrap">
                Section {sNum}
              </h3>
              <span className="text-[11px] font-bold text-slate-400 block mt-0.5 truncate">
                {displayTitle}
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : isOngoing ? (
                <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border border-amber-300 dark:border-amber-700 bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 whitespace-nowrap">
                  <span>CONTINUE</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-extrabold border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 bg-white dark:bg-slate-800 whitespace-nowrap">
                  <span className="w-2 h-2 rounded-full border border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              <button
                onClick={() => handleStartTest(test.id, hasCompleted, secIdx)}
                disabled={startingTestId === test.id}
                className="px-6 py-2 rounded-xl text-sm font-black text-white bg-[#0a5c6e] hover:bg-[#084857] transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer"
              >
                {startingTestId === test.id ? '...' : isOngoing ? 'Continue' : 'Start'}
              </button>
            </div>
          </div>

          {/* INSIDE THIS LISTENING */}
          <div className="space-y-1.5 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS LISTENING
            </div>
            <div className="bg-slate-50 dark:bg-slate-800/80 rounded-xl px-3.5 py-2.5 border border-slate-100 dark:border-slate-700/60 text-xs sm:text-[13px] font-bold text-slate-800 dark:text-slate-200 truncate">
              {topicText}
            </div>
          </div>
        </div>
      );
    }

    if (activeTab === 'listening' && (listeningSectionFilter === 'full' || listeningSectionFilter === 'all')) {
      const s1Topic = getListeningSectionTopic(test, 0);
      const s2Topic = getListeningSectionTopic(test, 1);
      const s3Topic = getListeningSectionTopic(test, 2);
      const s4Topic = getListeningSectionTopic(test, 3);

      return (
        <div
          key={test.id}
          style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
          className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-2xl border border-slate-200/80 dark:border-white/10 border-l-[4px] border-l-[#0a5c6e] dark:border-l-[#087ea4] p-5 shadow-xs hover:border-cyan-500/60 dark:hover:border-cyan-400/60 hover:shadow-xl hover:shadow-cyan-500/5 transition-all flex flex-col justify-between space-y-4 group"
        >
          <div className="flex items-center justify-between gap-3">
            <div>
              <h3 className="text-lg sm:text-xl font-black text-slate-800 dark:text-slate-100">
                {displayTitle}
              </h3>
              <span className="text-xs font-bold text-slate-400 block mt-0.5">
                Full Listening (4 sections • 30 min)
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : isOngoing ? (
                <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border border-amber-300 dark:border-amber-700 bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 whitespace-nowrap">
                  <span>CONTINUE</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-extrabold border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 bg-white dark:bg-slate-800 whitespace-nowrap">
                  <span className="w-2 h-2 rounded-full border border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              <button
                onClick={() => handleStartTest(test.id, hasCompleted)}
                disabled={startingTestId === test.id}
                className="px-6 py-2 rounded-xl text-sm font-black text-white bg-[#0a5c6e] hover:bg-[#084857] transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer"
              >
                {startingTestId === test.id ? '...' : isOngoing ? 'Continue' : 'Start'}
              </button>
            </div>
          </div>

          <div className="space-y-1.5 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS LISTENING (4 SECTIONS)
            </div>
            <div className="space-y-1.5">
              {[s1Topic, s2Topic, s3Topic, s4Topic].map((t, idx) => (
                <div
                  key={idx}
                  className="bg-slate-50 dark:bg-slate-800/80 rounded-xl px-3.5 py-2 border border-slate-100 dark:border-slate-700/60 text-xs font-bold text-slate-800 dark:text-slate-200 flex items-center justify-between"
                >
                  <span className="truncate">
                    <span className="text-slate-400 mr-2 font-mono text-[11px]">Section {idx + 1}:</span>
                    {t}
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>
      );
    }

    // Speaking specific card rendering matching IELTS layout
    if (activeTab === 'speaking') {
      const p1Topic = cleanTopicText(test.sections?.[0]?.title || '') || 'Part 1: Interview & Everyday Topics';
      const p2Topic = cleanTopicText(test.sections?.[1]?.title || '') || 'Part 2: Individual Long Turn (Cue Card)';
      const p3Topic = cleanTopicText(test.sections?.[2]?.title || '') || 'Part 3: Two-way In-depth Discussion';

      return (
        <div
          key={test.id}
          style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
          className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-2xl border border-slate-200/80 dark:border-white/10 border-l-[4px] border-l-[#059669] p-5 shadow-xs hover:border-emerald-500/60 dark:hover:border-emerald-400/60 hover:shadow-xl hover:shadow-emerald-500/5 transition-all flex flex-col justify-between space-y-4 group"
        >
          <div className="flex items-center justify-between gap-3">
            <div>
              <h3 className="text-lg sm:text-xl font-black text-slate-800 dark:text-slate-100">
                {displayTitle}
              </h3>
              <span className="text-xs font-bold text-slate-400 block mt-0.5">
                Full Speaking (Parts 1–3 • 15 min)
              </span>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : isOngoing ? (
                <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border border-amber-300 dark:border-amber-700 bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 whitespace-nowrap">
                  <span>CONTINUE</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-extrabold border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 bg-white dark:bg-slate-800 whitespace-nowrap">
                  <span className="w-2 h-2 rounded-full border border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              <button
                onClick={() => handleStartTest(test.id, hasCompleted)}
                disabled={startingTestId === test.id}
                className="px-6 py-2 rounded-xl text-sm font-black text-white bg-[#059669] hover:bg-[#047857] transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer"
              >
                {startingTestId === test.id ? '...' : isOngoing ? 'Continue' : 'Start'}
              </button>
            </div>
          </div>

          <div className="space-y-1.5 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS SPEAKING (3 PARTS)
            </div>
            <div className="space-y-1.5">
              {[
                { label: 'Part 1', topic: p1Topic, sec: 0 },
                { label: 'Part 2', topic: p2Topic, sec: 1 },
                { label: 'Part 3', topic: p3Topic, sec: 2 },
              ].map((p) => (
                <div
                  key={p.sec}
                  onClick={() => handleStartTest(test.id, hasCompleted, p.sec)}
                  className="bg-slate-50 dark:bg-slate-800/80 hover:bg-slate-100 dark:hover:bg-slate-800 rounded-xl px-3 py-2 border border-slate-100 dark:border-slate-700/60 text-xs font-bold text-slate-800 dark:text-slate-200 flex items-center justify-between cursor-pointer group"
                >
                  <span className="truncate">
                    <span className="text-slate-400 mr-2 font-mono text-[11px]">{p.label}:</span>
                    {p.topic}
                  </span>
                  <span className="text-[10px] font-bold text-slate-400 group-hover:text-emerald-600 dark:group-hover:text-emerald-400 flex items-center gap-0.5 shrink-0 ml-1 transition-colors">
                    <span>Practice</span>
                    <ChevronRight className="w-3 h-3 group-hover:translate-x-0.5 transition-transform" />
                  </span>
                </div>
              ))}
            </div>
          </div>
        </div>
      );
    }

    // Writing specific card rendering matching Image 1
    if (activeTab === 'writing') {
      const { task1, task2 } = getWritingTopics(test);

      return (
        <div
          key={test.id}
          style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
          className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-2xl border border-slate-200/80 dark:border-white/10 border-l-[4px] border-l-[#7a2259] p-5 shadow-xs hover:border-purple-500/60 dark:hover:border-purple-400/60 hover:shadow-xl hover:shadow-purple-500/5 transition-all flex flex-col justify-between space-y-4 group"
        >
          {/* Top: Title + Status Badge + Start Button */}
          <div className="flex items-center justify-between gap-3">
            <div className="min-w-0">
              <h3 className="text-xl sm:text-2xl font-black text-slate-800 dark:text-slate-100 whitespace-nowrap">
                {displayTitle}
              </h3>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {hasCompleted ? (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-bold border border-emerald-300 dark:border-emerald-700 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-700 dark:text-emerald-300 whitespace-nowrap">
                  <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" />
                  <span>COMPLETED</span>
                </span>
              ) : isOngoing ? (
                <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold border border-amber-300 dark:border-amber-700 bg-amber-50 dark:bg-amber-950/40 text-amber-700 dark:text-amber-300 whitespace-nowrap">
                  <span>CONTINUE</span>
                </span>
              ) : (
                <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-extrabold border border-slate-300 dark:border-slate-600 text-slate-600 dark:text-slate-300 bg-white dark:bg-slate-800 whitespace-nowrap">
                  <span className="w-2 h-2 rounded-full border border-slate-400 dark:border-slate-500"></span>
                  <span>NOT DONE</span>
                </span>
              )}

              <button
                onClick={() => handleStartTest(test.id, hasCompleted)}
                disabled={startingTestId === test.id}
                className="px-6 py-2 rounded-xl text-sm font-black text-white bg-[#7a2259] hover:bg-[#641a47] transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer"
              >
                {startingTestId === test.id ? '...' : isOngoing ? 'Continue' : 'Start'}
              </button>
            </div>
          </div>

          {/* INSIDE THIS TEST */}
          <div className="space-y-1.5 pt-1">
            <div className="text-[10px] font-black tracking-wider text-slate-400 dark:text-slate-500 uppercase">
              INSIDE THIS TEST
            </div>
            <div className="space-y-1.5">
              <div
                onClick={() => handleStartTest(test.id, hasCompleted, 0)}
                className={`bg-slate-50 dark:bg-slate-800/80 rounded-xl px-3.5 py-2.5 border border-slate-100 dark:border-slate-700/60 cursor-pointer hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors group ${
                  writingTaskFilter === '1' ? 'ring-2 ring-[#7a2259]/60 bg-rose-50/40 dark:bg-rose-950/30' : ''
                }`}
              >
                <div className="flex items-center justify-between">
                  <span className="text-[10px] font-black text-slate-400 dark:text-slate-500 uppercase tracking-wider">
                    TASK 1
                  </span>
                  <span className="text-[10px] font-bold text-slate-400 group-hover:text-[#7a2259] dark:group-hover:text-rose-400 flex items-center gap-0.5 transition-colors">
                    <span>Practice (20 min)</span>
                    <ChevronRight className="w-3 h-3 group-hover:translate-x-0.5 transition-transform" />
                  </span>
                </div>
                <div className="text-xs sm:text-[13px] font-bold text-slate-800 dark:text-slate-200 mt-0.5 truncate">
                  {task1}
                </div>
              </div>

              <div
                onClick={() => handleStartTest(test.id, hasCompleted, 1)}
                className={`bg-slate-50 dark:bg-slate-800/80 rounded-xl px-3.5 py-2.5 border border-slate-100 dark:border-slate-700/60 cursor-pointer hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors group ${
                  writingTaskFilter === '2' ? 'ring-2 ring-[#7a2259]/60 bg-rose-50/40 dark:bg-rose-950/30' : ''
                }`}
              >
                <div className="flex items-center justify-between">
                  <span className="text-[10px] font-black text-slate-400 dark:text-slate-500 uppercase tracking-wider">
                    TASK 2
                  </span>
                  <span className="text-[10px] font-bold text-slate-400 group-hover:text-[#7a2259] dark:group-hover:text-rose-400 flex items-center gap-0.5 transition-colors">
                    <span>Practice (40 min)</span>
                    <ChevronRight className="w-3 h-3 group-hover:translate-x-0.5 transition-transform" />
                  </span>
                </div>
                <div className="text-xs sm:text-[13px] font-bold text-slate-800 dark:text-slate-200 mt-0.5 truncate">
                  {task2}
                </div>
              </div>
            </div>
          </div>
        </div>
      );
    }

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
        style={{ animationDelay: `${Math.min(index, 15) * 45}ms` }}
        className="animate-card-cascade bg-white/85 dark:bg-slate-900/70 backdrop-blur-xl rounded-3xl border border-slate-200/80 dark:border-white/10 p-5 sm:p-6 flex flex-col justify-between shadow-xs hover:border-amber-500/60 dark:hover:border-amber-400/60 hover:shadow-xl hover:shadow-amber-500/5 transition-all duration-300 group"
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
              {insideItems.map((item, idx) => {
                const isFullTestView =
                  activeTab === 'mock' ||
                  readingPassageFilter === 'full' ||
                  listeningSectionFilter === 'full';
                const canPracticeSection = !isFullTestView && item.sectionIndex !== undefined;

                return (
                  <div
                    key={idx}
                    onClick={() =>
                      canPracticeSection &&
                      handleStartTest(test.id, hasCompleted, item.sectionIndex)
                    }
                    className={`rounded-2xl p-3 border transition-all ${
                      canPracticeSection
                        ? 'bg-slate-50/90 dark:bg-slate-800/60 hover:bg-slate-100 dark:hover:bg-slate-800 border-slate-200/80 dark:border-slate-700/80 cursor-pointer group/item hover:border-slate-300 dark:hover:border-slate-600'
                        : 'bg-slate-50/70 dark:bg-slate-800/40 border-slate-200/60 dark:border-slate-800'
                    }`}
                  >
                    <div className="flex items-center justify-between">
                      <span className="text-[11px] font-black text-slate-400 dark:text-slate-400 uppercase tracking-wider">
                        {item.label}
                      </span>
                      {canPracticeSection && (
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
                );
              })}
            </div>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div
      key={`${activeTab}_${readingPassageFilter}_${listeningSectionFilter}_${writingTaskFilter}_${speakingPart || ''}_${speakingMode || ''}_${writingMode || ''}_${mockMode || ''}`}
      className="animate-tab-entrance space-y-8 py-4 sm:py-6 w-full mx-auto px-2 sm:px-4 lg:px-6"
    >
      {/* If Speaking Part is selected, show Part Topics Library matching Image 2 */}
      {activeTab === 'speaking' && speakingPart ? (
        <section className="space-y-6">
          {/* Header row matching Image 2 */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 pb-2 border-b border-slate-200/80 dark:border-slate-800">
            <div className="flex flex-wrap items-center gap-3">
              <button
                onClick={handleBackToSpeakingOverview}
                className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-750 transition-colors shadow-2xs cursor-pointer"
              >
                <span>←</span>
                <span>Back to Local</span>
              </button>
              <span className="inline-flex items-center px-3 py-1 rounded-full bg-[#16a34a] text-white text-[11px] font-black uppercase tracking-wider">
                PART {speakingPart}
              </span>
              <h2 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white">
                {speakingPart === '1' ? 'Interview' : speakingPart === '2' ? 'Cue card' : 'Discussion'}
              </h2>
            </div>

            {/* Search topics input matching Image 2 */}
            <div className="relative w-full sm:w-72">
              <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2 pointer-events-none" />
              <input
                type="text"
                value={speakingTopicSearch}
                onChange={(e) => setSpeakingTopicSearch(e.target.value)}
                placeholder="Search topics"
                className="w-full pl-9 pr-8 py-2 rounded-full border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 placeholder:text-slate-400 text-xs sm:text-sm font-semibold focus:outline-none focus:ring-2 focus:ring-emerald-500/20 shadow-2xs"
              />
              {speakingTopicSearch && (
                <button
                  onClick={() => setSpeakingTopicSearch('')}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
                >
                  <X className="w-3.5 h-3.5" />
                </button>
              )}
            </div>
          </div>

          {/* Topics Grid matching Image 2 */}
          <div
            key={`speaking_topics_${speakingPart}`}
            className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3.5"
          >
            {activePartTopics.length === 0 ? (
              <div className="col-span-full p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
                <p className="font-bold text-slate-700 dark:text-slate-300">Mavzular topilmadi</p>
                <p className="text-xs text-slate-400 mt-1">Boshqa so‘z bilan qidirib ko‘ring.</p>
              </div>
            ) : (
              activePartTopics.map((topic, idx) => (
                <div
                  key={topic.id}
                  style={{ animationDelay: `${Math.min(idx, 20) * 30}ms` }}
                  onClick={() => handleStartSpeakingTopic(topic)}
                  className="animate-card-cascade bg-white dark:bg-slate-900 rounded-2xl border border-slate-200/90 dark:border-slate-800 hover:border-emerald-500/80 dark:hover:border-emerald-500/80 p-3.5 sm:p-4 shadow-2xs hover:shadow-md transition-all cursor-pointer group flex items-start justify-between gap-3"
                >
                  <div className="flex items-start gap-3 min-w-0">
                    <div className="w-9 h-9 rounded-xl bg-[#16a34a] text-white font-black text-sm flex items-center justify-center shrink-0 shadow-2xs">
                      {topic.number}
                    </div>
                    <div className="min-w-0">
                      <h4 className="text-[13px] sm:text-sm font-bold text-slate-900 dark:text-slate-100 group-hover:text-emerald-600 dark:group-hover:text-emerald-400 transition-colors leading-snug line-clamp-2">
                        {topic.title}
                      </h4>
                      <span className="text-[11px] font-semibold text-slate-400 block mt-1">
                        {topic.questionsCount} questions
                      </span>
                    </div>
                  </div>

                  {topic.isNew && (
                    <span className="px-2 py-0.5 rounded-full border border-emerald-500 text-emerald-600 dark:text-emerald-400 text-[10px] font-extrabold uppercase shrink-0 tracking-wider">
                      NEW
                    </span>
                  )}
                </div>
              ))
            )}
          </div>
        </section>
      ) : activeTab === 'speaking' && speakingMode === 'partner' ? (
        <section className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-6 sm:p-8 shadow-xs space-y-6">
          <div className="flex items-center justify-between gap-4">
            <button
              onClick={handleBackToSpeakingOverview}
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-750 transition-colors shadow-2xs cursor-pointer"
            >
              <span>←</span>
              <span>Back to Speaking Overview</span>
            </button>
            <span className="inline-flex items-center px-3 py-1 rounded-full bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 text-xs font-black uppercase tracking-wider">
              ONLINE PARTNER
            </span>
          </div>

          <div className="max-w-2xl space-y-4">
            <div className="p-3 w-fit rounded-2xl bg-emerald-50 dark:bg-emerald-950/50 text-emerald-600 dark:text-emerald-400">
              <Users className="w-8 h-8" />
            </div>
            <h2 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white">
              Online Speaking Partner
            </h2>
            <p className="text-sm text-slate-600 dark:text-slate-300 leading-relaxed">
              Practice IELTS Speaking with real candidates via live audio or video. Take turns asking and answering questions across Parts 1, 2, and 3.
            </p>

            <div className="pt-2 space-y-3">
              <label className="text-xs font-black uppercase tracking-wider text-slate-400">
                Select Target Band:
              </label>
              <div className="flex flex-wrap gap-2.5">
                {['Band 6.0 – 6.5', 'Band 7.0 – 7.5', 'Band 8.0+'].map((b, i) => (
                  <button
                    key={b}
                    className={`px-4 py-2 rounded-xl text-xs font-bold border transition-all cursor-pointer ${
                      i === 1
                        ? 'bg-emerald-600 text-white border-emerald-600 shadow-xs'
                        : 'bg-slate-50 dark:bg-slate-800 text-slate-700 dark:text-slate-200 border-slate-200 dark:border-slate-700 hover:bg-slate-100'
                    }`}
                  >
                    {b}
                  </button>
                ))}
              </div>
            </div>

            <div className="pt-4 flex items-center gap-3">
              <button
                onClick={() => alert('Online Speaking Partner feature is currently in beta!')}
                className="px-6 py-3 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white font-black text-sm shadow-md transition-all active:scale-95 cursor-pointer flex items-center gap-2"
              >
                <Sparkles className="w-4 h-4" />
                <span>Start Partner Search</span>
              </button>
              <span className="text-xs font-bold text-slate-400 flex items-center gap-1.5">
                <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                14 candidates online now
              </span>
            </div>
          </div>
        </section>
      ) : activeTab === 'speaking' && speakingMode === 'recordings' ? (
        <section className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-6 sm:p-8 shadow-xs space-y-6">
          <div className="flex items-center justify-between gap-4">
            <button
              onClick={handleBackToSpeakingOverview}
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-750 transition-colors shadow-2xs cursor-pointer"
            >
              <span>←</span>
              <span>Back to Speaking Overview</span>
            </button>
            <span className="inline-flex items-center px-3 py-1 rounded-full bg-emerald-100 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 text-xs font-black uppercase tracking-wider">
              MY RECORDINGS
            </span>
          </div>

          <div className="space-y-3">
            <h2 className="text-2xl font-black text-slate-900 dark:text-white">
              My Audio Recordings
            </h2>
            <p className="text-sm text-slate-500 dark:text-slate-400">
              All your submitted Speaking audio recordings and AI evaluation feedback.
            </p>
          </div>

          {safeHistory.filter((h) => {
            const t = tests.find((x) => x.id === h.test_id);
            return t && t.title.toLowerCase().includes('speaking');
          }).length === 0 ? (
            <div className="p-12 text-center bg-slate-50 dark:bg-slate-800/40 rounded-2xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
              <Mic className="w-10 h-10 text-slate-400 mx-auto mb-2 opacity-50" />
              <p className="font-bold text-slate-700 dark:text-slate-300">No audio recordings yet</p>
              <p className="text-xs text-slate-400 mt-1">Practice Speaking Part 1, 2, or 3 to create your first recording.</p>
            </div>
          ) : (
            <div className="space-y-3">
              {safeHistory
                .filter((h) => {
                  const t = tests.find((x) => x.id === h.test_id);
                  return t && t.title.toLowerCase().includes('speaking');
                })
                .map((sess) => {
                  const t = tests.find((x) => x.id === sess.test_id);
                  return (
                    <div
                      key={sess.id}
                      className="p-4 rounded-2xl border border-slate-200 dark:border-slate-700 bg-slate-50/60 dark:bg-slate-800/60 flex items-center justify-between gap-4"
                    >
                      <div>
                        <h4 className="text-sm font-bold text-slate-800 dark:text-slate-100">
                          {t?.title || 'Speaking Session'}
                        </h4>
                        <span className="text-xs text-slate-400 font-medium">
                          {formatDate(sess.started_at)} • Status: {sess.status}
                        </span>
                      </div>
                      <Link
                        href={`/student/results/${sess.id}`}
                        className="px-4 py-1.5 rounded-xl text-xs font-bold bg-emerald-600 text-white hover:bg-emerald-700 transition-colors shadow-2xs"
                      >
                        View Results
                      </Link>
                    </div>
                  );
                })}
            </div>
          )}
        </section>
      ) : activeTab === 'writing' && writingMode === 'feedback' ? (
        <section className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-6 sm:p-8 shadow-xs space-y-6">
          <div className="flex items-center justify-between gap-4">
            <button
              onClick={() => {
                setWritingMode(null);
                setWritingTaskFilter('all');
                const url = new URL(window.location.href);
                url.searchParams.set('tab', 'writing');
                url.searchParams.delete('mode');
                url.searchParams.delete('task');
                window.history.replaceState({}, '', url.toString());
              }}
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-750 transition-colors shadow-2xs cursor-pointer"
            >
              <span>←</span>
              <span>Back to Writing Overview</span>
            </button>
            <span className="inline-flex items-center px-3 py-1 rounded-full bg-rose-100 dark:bg-rose-950/60 text-[#7a2259] dark:text-rose-300 text-xs font-black uppercase tracking-wider">
              BAND FEEDBACK
            </span>
          </div>

          <div className="space-y-3">
            <h2 className="text-2xl font-black text-slate-900 dark:text-white">
              My Essays & Band Scores
            </h2>
            <p className="text-sm text-slate-500 dark:text-slate-400">
              Submitted Task 1 and Task 2 essays, AI evaluation, and scores across the 4 criteria (Task Achievement, Coherence & Cohesion, Lexical Resource, Grammatical Range & Accuracy).
            </p>
          </div>

          {safeHistory.filter((h) => {
            const t = tests.find((x) => x.id === h.test_id);
            return t && t.title.toLowerCase().includes('writing');
          }).length === 0 ? (
            <div className="p-12 text-center bg-slate-50 dark:bg-slate-800/40 rounded-2xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
              <PenTool className="w-10 h-10 text-slate-400 mx-auto mb-2 opacity-50" />
              <p className="font-bold text-slate-700 dark:text-slate-300">No essays submitted yet</p>
              <p className="text-xs text-slate-400 mt-1">Start one of the Writing tests above to submit your first essay.</p>
            </div>
          ) : (
            <div className="space-y-3">
              {safeHistory
                .filter((h) => {
                  const t = tests.find((x) => x.id === h.test_id);
                  return t && t.title.toLowerCase().includes('writing');
                })
                .map((sess) => {
                  const t = tests.find((x) => x.id === sess.test_id);
                  return (
                    <div
                      key={sess.id}
                      className="p-4 rounded-2xl border border-slate-200 dark:border-slate-700 bg-slate-50/60 dark:bg-slate-800/60 flex items-center justify-between gap-4"
                    >
                      <div>
                        <h4 className="text-sm font-bold text-slate-800 dark:text-slate-100">
                          {t?.title || 'Writing Session'}
                        </h4>
                        <span className="text-xs text-slate-400 font-medium">
                          {formatDate(sess.started_at)} • Status: {sess.status}
                        </span>
                      </div>
                      <Link
                        href={`/student/results/${sess.id}`}
                        className="px-4 py-1.5 rounded-xl text-xs font-bold bg-[#7a2259] text-white hover:bg-[#641a47] transition-colors shadow-2xs"
                      >
                        View Results
                      </Link>
                    </div>
                  );
                })}
            </div>
          )}
        </section>
      ) : activeTab === 'mock' && mockMode === 'results' ? (
        <section className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 p-6 sm:p-8 shadow-xs space-y-6">
          <div className="flex items-center justify-between gap-4">
            <button
              onClick={() => {
                setMockMode(null);
                const url = new URL(window.location.href);
                url.searchParams.set('tab', 'mock');
                url.searchParams.delete('mode');
                window.history.replaceState({}, '', url.toString());
              }}
              className="inline-flex items-center gap-1.5 px-4 py-2 rounded-full border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-750 transition-colors shadow-2xs cursor-pointer"
            >
              <span>←</span>
              <span>Back to Full Mock</span>
            </button>
            <span className="inline-flex items-center px-3 py-1 rounded-full bg-amber-100 dark:bg-amber-950/60 text-amber-800 dark:text-amber-300 text-xs font-black uppercase tracking-wider">
              MOCK RESULTS
            </span>
          </div>

          <div className="space-y-3">
            <h2 className="text-2xl font-black text-slate-900 dark:text-white">
              My Full Mock Exam Results
            </h2>
            <p className="text-sm text-slate-500 dark:text-slate-400">
              All completed Full Mock exams, sectional scores, and your overall CEFR / IELTS band level.
            </p>
          </div>

          {safeHistory.filter((h) => {
            const t = tests.find((x) => x.id === h.test_id);
            return (
              t?.title.toLowerCase().includes('mock') ||
              h.test_title?.toLowerCase().includes('mock') ||
              (!t?.title.toLowerCase().includes('listening') &&
                !t?.title.toLowerCase().includes('reading') &&
                !t?.title.toLowerCase().includes('writing') &&
                !t?.title.toLowerCase().includes('speaking'))
            );
          }).length === 0 ? (
            <div className="p-12 text-center bg-slate-50 dark:bg-slate-800/40 rounded-2xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500 space-y-4">
              <Award className="w-12 h-12 text-amber-500 mx-auto opacity-70" />
              <div>
                <p className="font-bold text-slate-700 dark:text-slate-300 text-base">No full mock exams completed yet</p>
                <p className="text-xs text-slate-400 mt-1 max-w-md mx-auto">
                  Take a complete 4-skill examination combining Listening, Reading, Writing, and Speaking to determine your overall CEFR level and band score.
                </p>
              </div>
              <button
                onClick={() => handleStartRandomMock(false)}
                disabled={startingMock}
                className="px-6 py-2.5 rounded-xl bg-amber-600 hover:bg-amber-700 text-white font-black text-sm transition-all shadow-md active:scale-95 disabled:opacity-50 cursor-pointer inline-flex items-center gap-2"
              >
                <Sparkles className="w-4 h-4" />
                <span>Start Random Mock</span>
              </button>
            </div>
          ) : (
            <div className="space-y-4">
              {safeHistory
                .filter((h) => {
                  const t = tests.find((x) => x.id === h.test_id);
                  return (
                    t?.title.toLowerCase().includes('mock') ||
                    h.test_title?.toLowerCase().includes('mock') ||
                    (!t?.title.toLowerCase().includes('listening') &&
                      !t?.title.toLowerCase().includes('reading') &&
                      !t?.title.toLowerCase().includes('writing') &&
                      !t?.title.toLowerCase().includes('speaking'))
                  );
                })
                .map((sess) => {
                  const t = tests.find((x) => x.id === sess.test_id);
                  const isExpired =
                    sess.status === 'in_progress' && sess.expires_at
                      ? new Date(sess.expires_at).getTime() < Date.now()
                      : false;

                  return (
                    <div
                      key={sess.id}
                      className="p-5 rounded-2xl border border-slate-200 dark:border-slate-700 bg-slate-50/70 dark:bg-slate-800/60 flex flex-col sm:flex-row sm:items-center justify-between gap-4"
                    >
                      <div className="space-y-1">
                        <div className="flex items-center gap-2.5 flex-wrap">
                          <h4 className="text-base font-extrabold text-slate-900 dark:text-white">
                            {sess.test_title || t?.title || `Full Mock Exam #${sess.id}`}
                          </h4>
                          {sess.result && (
                            <span className="px-2.5 py-0.5 rounded-full text-xs font-black bg-amber-500 text-white shadow-xs">
                              {sess.result.cefr_level ? `CEFR ${sess.result.cefr_level}` : 'Graded'}
                            </span>
                          )}
                        </div>
                        <p className="text-xs text-slate-500 dark:text-slate-400">
                          Date started: {formatDate(sess.started_at)} • Status:{' '}
                          <span className="font-bold">
                            {sess.status === 'in_progress'
                              ? isExpired
                                ? 'Expired'
                                : 'In Progress'
                              : sess.status === 'submitted'
                              ? 'Under Review'
                              : 'Graded'}
                          </span>
                        </p>
                        {sess.result && (
                          <div className="text-xs font-semibold text-slate-600 dark:text-slate-300 pt-1">
                            Score: <b className="text-slate-900 dark:text-white">{sess.result.total_score}</b> / {sess.result.max_score} ({sess.result.percentage}%)
                          </div>
                        )}
                      </div>

                      <div className="flex items-center gap-2 shrink-0">
                        {sess.status === 'in_progress' && !isExpired ? (
                          <Link
                            href={`/student/test/${sess.id}`}
                            className="px-5 py-2 rounded-xl text-xs font-black bg-amber-600 hover:bg-amber-700 text-white transition-colors shadow-2xs"
                          >
                            Continue
                          </Link>
                        ) : (
                          <Link
                            href={`/student/results/${sess.id}`}
                            className="px-5 py-2 rounded-xl text-xs font-black bg-slate-900 hover:bg-slate-800 dark:bg-slate-100 dark:hover:bg-white text-white dark:text-slate-900 transition-colors shadow-2xs"
                          >
                            View Full Results
                          </Link>
                        )}
                      </div>
                    </div>
                  );
                })}
            </div>
          )}
        </section>
      ) : (
        <>
          {/* 1. Main Hero Banner Container (Unified matching ieltsmaterials layout) */}
          <section className="space-y-5">
            <div className={`animate-banner-in relative overflow-hidden rounded-3xl bg-gradient-to-r ${theme.gradient} p-6 sm:p-8 lg:p-9 text-white shadow-xl border ${theme.borderColor}`}>
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

                {/* Row 3: 3 Numbered Steps / Guide Pills (hidden for Writing matching Image 1) */}
                {activeTab !== 'writing' && (
                  <div className="flex flex-wrap items-center gap-2 sm:gap-2.5 pt-0.5">
                    <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                      <span className={`w-4.5 h-4.5 rounded-full bg-white ${theme.stepBg} font-black text-[11px] flex items-center justify-center shrink-0`}>
                        1
                      </span>
                      <span>
                        {activeTab === 'reading'
                          ? 'Pick a passage or a Full Reading'
                          : activeTab === 'listening'
                          ? 'Pick a section or a Full Listening'
                          : activeTab === 'speaking'
                          ? 'Speak with a partner or on your own'
                          : 'Select a Cambridge test or individual part'}
                      </span>
                    </div>

                    <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                      <span className={`w-4.5 h-4.5 rounded-full bg-white ${theme.stepBg} font-black text-[11px] flex items-center justify-center shrink-0`}>
                        2
                      </span>
                      <span>
                        {activeTab === 'reading'
                          ? 'Take the test – 60 minutes total'
                          : activeTab === 'listening'
                          ? 'Take the test – 30 min audio + 2 min to review answers'
                          : activeTab === 'speaking'
                          ? '15 minutes total – Part 1, Part 2 and Part 3'
                          : 'Complete the tasks under official exam timer'}
                      </span>
                    </div>

                    <div className="bg-white/10 hover:bg-white/15 backdrop-blur-xs border border-white/20 rounded-full px-3.5 py-1.5 text-xs font-semibold text-white flex items-center gap-2 transition-colors">
                      <span className={`w-4.5 h-4.5 rounded-full bg-white ${theme.stepBg} font-black text-[11px] flex items-center justify-center shrink-0`}>
                        3
                      </span>
                      <span>
                        {activeTab === 'reading' || activeTab === 'listening'
                          ? 'See your band and review your answers'
                          : activeTab === 'speaking'
                          ? 'Transcripts and AI scoring'
                          : 'Instant automated scoring and band calculation'}
                      </span>
                    </div>
                  </div>
                )}

                {/* Row 4: Action Buttons for Mock OR Progress Bar & Pick One Button */}
                {activeTab === 'mock' ? (
                  <div className="pt-2 flex flex-wrap items-center gap-3">
                    <button
                      onClick={() => handleStartRandomMock(false)}
                      disabled={startingMock}
                      className="px-6 py-3 bg-white text-rose-900 hover:bg-slate-100 font-black rounded-xl text-xs sm:text-sm shadow-lg transition-all flex items-center gap-2 disabled:opacity-50 cursor-pointer active:scale-95"
                    >
                      {startingMock ? (
                        <>
                          <div className="w-4 h-4 border-2 border-rose-900 border-t-transparent rounded-full animate-spin" />
                          <span>Preparing Mock Exam...</span>
                        </>
                      ) : (
                        <>
                          <Zap className="w-4 h-4 fill-rose-900 text-rose-900" />
                          <span>Start Full Mock Exam</span>
                          <ChevronRight className="w-4 h-4" />
                        </>
                      )}
                    </button>

                    <button
                      onClick={() => handleStartRandomMock(true)}
                      disabled={startingMock}
                      className="px-4 py-3 bg-white/10 hover:bg-white/20 text-white font-bold rounded-xl text-xs sm:text-sm transition-all border border-white/20 flex items-center gap-1.5 disabled:opacity-50 cursor-pointer active:scale-95"
                    >
                      <RefreshCw className="w-4 h-4" />
                      <span>New Variant</span>
                    </button>

                    <span className="text-xs text-white/80 font-medium ml-1">
                      180 minutes • 4 modules (Listening, Reading, Writing, Speaking)
                    </span>
                  </div>
                ) : (
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
                        {completedCount} / {activeTab === 'writing' ? 100 : totalCount} tests completed
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
                )}

                {/* Row 5: FILTER BY SECTION (For Listening, hidden when Full Listening is selected) */}
                {activeTab === 'listening' && listeningSectionFilter !== 'full' && (
                  <div className="space-y-2 pt-2">
                    <div className="text-[11px] font-black uppercase tracking-wider text-cyan-100/90">
                      FILTER BY SECTION
                    </div>
                    <div className="flex flex-wrap items-center gap-2">
                      {[
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
                            onClick={() => {
                              setListeningSectionFilter(tab.id as any);
                              const url = new URL(window.location.href);
                              url.searchParams.set('tab', 'listening');
                              url.searchParams.set('section', tab.id);
                              window.history.replaceState({}, '', url.toString());
                            }}
                            className={`px-4 py-1.5 rounded-full text-xs font-black transition-all cursor-pointer ${
                              isActive
                                ? 'bg-white text-[#0a4e5e] shadow-md ring-2 ring-white/60'
                                : 'bg-white/15 hover:bg-white/25 text-white border border-white/25'
                            }`}
                          >
                            {tab.label}
                          </button>
                        );
                      })}
                    </div>
                  </div>
                )}

                {/* Row 5: FILTER BY PASSAGE (For Reading, hidden when Full Reading is selected) */}
                {activeTab === 'reading' && readingPassageFilter !== 'full' && (
                  <div className="space-y-2 pt-2">
                    <div className="text-[11px] font-black uppercase tracking-wider text-cyan-100/90">
                      FILTER BY PASSAGE
                    </div>
                    <div className="flex flex-wrap items-center gap-2">
                      {[
                        { id: '1', label: 'Passage 1' },
                        { id: '2', label: 'Passage 2' },
                        { id: '3', label: 'Passage 3' },
                        { id: 'full', label: 'Full Reading' },
                      ].map((tab) => {
                        const isActive = readingPassageFilter === tab.id;
                        return (
                          <button
                            key={tab.id}
                            onClick={() => {
                              setReadingPassageFilter(tab.id as any);
                              const url = new URL(window.location.href);
                              url.searchParams.set('tab', 'reading');
                              url.searchParams.set('passage', tab.id);
                              window.history.replaceState({}, '', url.toString());
                            }}
                            className={`px-4 py-1.5 rounded-full text-xs font-black transition-all cursor-pointer ${
                              isActive
                                ? 'bg-white text-[#0d4f7c] shadow-md ring-2 ring-white/60'
                                : 'bg-white/15 hover:bg-white/25 text-white border border-white/25'
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

            {/* Speaking Hub Special Actions (matching media_1792932211499_562e39f7.png) */}
            {activeTab === 'speaking' && (
              <div className="space-y-4 pt-2">
                {/* The 2 Large Cards: Speak with a partner & Practise on your own */}
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#022c22] via-[#064e3b] to-[#047857] p-6 sm:p-7 text-white shadow-lg border border-emerald-700/40 flex flex-col justify-between space-y-4">
                    <div className="space-y-2.5">
                      <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-[10px] font-black uppercase tracking-wider bg-white/15 text-emerald-200 border border-emerald-400/30">
                        ONLINE
                      </span>
                      <h3 className="text-xl sm:text-2xl font-black text-white tracking-tight">
                        Speak with a partner
                      </h3>
                      <p className="text-xs sm:text-[13px] text-emerald-100/90 leading-relaxed font-medium">
                        Practise real Cambridge IELTS speaking face-to-face or voice-only with other candidates. Match instantly based on target band score.
                      </p>
                    </div>
                    <div className="pt-2">
                      <button
                        onClick={handleGoOnlineSpeaking}
                        className="px-5 py-2.5 rounded-xl bg-white text-emerald-950 font-black text-xs sm:text-sm hover:bg-emerald-50 transition-all shadow-md active:scale-95 cursor-pointer flex items-center gap-1.5"
                      >
                        <span>Go online</span>
                        <ChevronRight className="w-4 h-4" />
                      </button>
                    </div>
                  </div>

                  <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-[#082f49] via-[#0369a1] to-[#0284c7] p-6 sm:p-7 text-white shadow-lg border border-sky-700/40 flex flex-col justify-between space-y-4">
                    <div className="space-y-2.5">
                      <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-[10px] font-black uppercase tracking-wider bg-white/15 text-sky-200 border border-sky-400/30">
                        LOCAL
                      </span>
                      <h3 className="text-xl sm:text-2xl font-black text-white tracking-tight">
                        Practise on your own
                      </h3>
                      <p className="text-xs sm:text-[13px] text-sky-100/90 leading-relaxed font-medium">
                        Record answers to Part 1, Part 2, and Part 3 prompts. Get instant transcriptions, grammar feedback, and AI band scoring.
                      </p>
                    </div>
                    <div className="pt-2">
                      <button
                        onClick={handleOpenLocalSpeaking}
                        className="px-5 py-2.5 rounded-xl bg-white text-sky-950 font-black text-xs sm:text-sm hover:bg-sky-50 transition-all shadow-md active:scale-95 cursor-pointer flex items-center gap-1.5"
                      >
                        <span>Open local</span>
                        <ChevronRight className="w-4 h-4" />
                      </button>
                    </div>
                  </div>
                </div>

                {/* 3 Category Shortcuts */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  <div
                    onClick={() => handleSelectSpeakingPart('1')}
                    className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200/90 dark:border-slate-800 p-4 hover:border-emerald-500/80 dark:hover:border-emerald-500/80 hover:shadow-md transition-all cursor-pointer group flex items-center justify-between"
                  >
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-xl bg-[#16a34a] text-white font-black text-sm flex items-center justify-center shrink-0">
                        P1
                      </div>
                      <div>
                        <h4 className="text-sm font-extrabold text-slate-800 dark:text-slate-100 group-hover:text-emerald-600 transition-colors">
                          Part 1 · Interview
                        </h4>
                        <span className="text-xs font-semibold text-slate-400">30 topics available</span>
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-slate-400 group-hover:text-emerald-600 group-hover:translate-x-0.5 transition-all" />
                  </div>

                  <div
                    onClick={() => handleSelectSpeakingPart('2')}
                    className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200/90 dark:border-slate-800 p-4 hover:border-emerald-500/80 dark:hover:border-emerald-500/80 hover:shadow-md transition-all cursor-pointer group flex items-center justify-between"
                  >
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-xl bg-[#16a34a] text-white font-black text-sm flex items-center justify-center shrink-0">
                        P2
                      </div>
                      <div>
                        <h4 className="text-sm font-extrabold text-slate-800 dark:text-slate-100 group-hover:text-emerald-600 transition-colors">
                          Part 2 · Cue card
                        </h4>
                        <span className="text-xs font-semibold text-slate-400">15 cue cards with notes</span>
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-slate-400 group-hover:text-emerald-600 group-hover:translate-x-0.5 transition-all" />
                  </div>

                  <div
                    onClick={() => handleSelectSpeakingPart('3')}
                    className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200/90 dark:border-slate-800 p-4 hover:border-emerald-500/80 dark:hover:border-emerald-500/80 hover:shadow-md transition-all cursor-pointer group flex items-center justify-between"
                  >
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-xl bg-[#16a34a] text-white font-black text-sm flex items-center justify-center shrink-0">
                        P3
                      </div>
                      <div>
                        <h4 className="text-sm font-extrabold text-slate-800 dark:text-slate-100 group-hover:text-emerald-600 transition-colors">
                          Part 3 · Discussion
                        </h4>
                        <span className="text-xs font-semibold text-slate-400">15 deep discussion topics</span>
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-slate-400 group-hover:text-emerald-600 group-hover:translate-x-0.5 transition-all" />
                  </div>
                </div>
              </div>
            )}

            {/* Subheader: CHOOSE TEST + Cambridge Book Pills + Search Input */}
            {activeTab !== 'mock' && (
              <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 pt-2">
                <div className="flex items-center gap-2 overflow-x-auto pb-1 md:pb-0 scrollbar-none flex-wrap sm:flex-nowrap">
                  <span className="text-xs font-black uppercase tracking-wider text-slate-700 dark:text-slate-300 shrink-0 mr-1">
                    {activeTab === 'reading'
                      ? 'CHOOSE ANY READING TEST'
                      : activeTab === 'listening'
                      ? 'CHOOSE ANY LISTENING TEST'
                      : activeTab === 'speaking'
                      ? 'CHOOSE ANY SPEAKING TEST'
                      : 'CHOOSE TEST'}
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
                  {activeTab === 'writing' && (
                    <div className="flex items-center gap-1.5 shrink-0">
                      {[
                        { id: 'all', label: 'All Tasks' },
                        { id: '1', label: 'Task 1 Reports' },
                        { id: '2', label: 'Task 2 Essays' },
                      ].map((tf) => (
                        <button
                          key={tf.id}
                          onClick={() => {
                            setWritingTaskFilter(tf.id as any);
                            const url = new URL(window.location.href);
                            url.searchParams.set('tab', 'writing');
                            if (tf.id !== 'all') {
                              url.searchParams.set('task', tf.id);
                            } else {
                              url.searchParams.delete('task');
                            }
                            window.history.replaceState({}, '', url.toString());
                          }}
                          className={`px-3 py-1.5 rounded-full text-xs font-bold transition-all cursor-pointer ${
                            writingTaskFilter === tf.id
                              ? 'bg-[#7a2259] text-white shadow-xs'
                              : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-100'
                          }`}
                        >
                          {tf.label}
                        </button>
                      ))}
                    </div>
                  )}
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
            )}

            {/* Row of Question Type Filters (Before starting test) */}
            {activeTab !== 'mock' && (activeTab === 'reading' || activeTab === 'listening') && (
              <div className="flex items-center gap-2 overflow-x-auto pb-1 pt-1 scrollbar-none flex-wrap border-t border-slate-100 dark:border-slate-800">
                <span className="text-xs font-black uppercase tracking-wider text-slate-500 dark:text-slate-400 shrink-0 mr-1 flex items-center gap-1.5">
                  <Filter className="w-3.5 h-3.5" />
                  <span>QUESTION TYPE:</span>
                </span>
                {[
                  { id: 'all', label: 'All' },
                  { id: 'true_false_not_given', label: 'True / False / NG' },
                  { id: 'yes_no_not_given', label: 'Yes / No / NG' },
                  { id: 'multiple_choice', label: 'Multiple Choice' },
                  { id: 'completion', label: 'Completion / Blanks' },
                  { id: 'matching', label: 'Matching' },
                ].map((cat) => {
                  const isSelected = selectedQuestionType === cat.id;
                  return (
                    <button
                      key={cat.id}
                      onClick={() => setSelectedQuestionType(cat.id as any)}
                      className={`px-3 py-1.5 rounded-full text-xs font-bold transition-all shrink-0 cursor-pointer ${
                        isSelected
                          ? 'bg-emerald-600 text-white shadow-xs ring-1 ring-emerald-500'
                          : 'bg-white dark:bg-slate-800 text-slate-600 dark:text-slate-300 border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-750'
                      }`}
                    >
                      {cat.label}
                    </button>
                  );
                })}
              </div>
            )}
          </section>

          {/* 2. Test Grid (3 columns on desktop matching screenshot) */}
          <section className="space-y-6">
        {activeTab === 'mock' ? (
          <div className="relative overflow-hidden bg-white/70 dark:bg-slate-900/60 backdrop-blur-xl rounded-3xl border border-slate-200/80 dark:border-white/10 p-6 sm:p-8 shadow-xl shadow-slate-900/5 dark:shadow-black/20 space-y-6 group">
            <div className="absolute -top-24 -right-24 w-72 h-72 bg-gradient-to-br from-amber-500/10 to-rose-500/10 rounded-full blur-3xl pointer-events-none group-hover:from-amber-500/20 group-hover:to-rose-500/20 transition-all duration-700" />
            <div className="flex items-center gap-3">
              <div className="p-2.5 rounded-2xl bg-amber-500/10 dark:bg-amber-400/10 text-amber-600 dark:text-amber-400 border border-amber-500/20">
                <Sparkles className="w-5 h-5" />
              </div>
              <div>
                <h3 className="text-lg font-black text-slate-900 dark:text-white tracking-tight">
                  How is the Full Mock Exam Structured?
                </h3>
                <p className="text-xs font-medium text-slate-500 dark:text-slate-400 mt-0.5">
                  The following 4 modules are dynamically assembled from our official examination question bank:
                </p>
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 relative z-10">
              <div className="p-4.5 rounded-2xl bg-cyan-50/50 dark:bg-cyan-950/20 backdrop-blur-md border border-cyan-200/50 dark:border-cyan-800/30 hover:border-cyan-400/70 hover:shadow-lg hover:shadow-cyan-500/10 transition-all duration-300 group/module">
                <div className="flex items-center justify-between text-cyan-800 dark:text-cyan-300 font-extrabold text-sm">
                  <span className="flex items-center gap-1.5"><Headphones className="w-4 h-4" /> 1. Listening</span>
                  <span className="text-[11px] px-2 py-0.5 rounded-full bg-cyan-100/80 dark:bg-cyan-900/60 font-black">{listeningTests.length} tests</span>
                </div>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed mt-1.5">40 questions across 4 audio sections (30 mins + 2 mins review).</p>
              </div>

              <div className="p-4.5 rounded-2xl bg-emerald-50/50 dark:bg-emerald-950/20 backdrop-blur-md border border-emerald-200/50 dark:border-emerald-800/30 hover:border-emerald-400/70 hover:shadow-lg hover:shadow-emerald-500/10 transition-all duration-300 group/module">
                <div className="flex items-center justify-between text-emerald-800 dark:text-emerald-300 font-extrabold text-sm">
                  <span className="flex items-center gap-1.5"><BookOpen className="w-4 h-4" /> 2. Reading</span>
                  <span className="text-[11px] px-2 py-0.5 rounded-full bg-emerald-100/80 dark:bg-emerald-900/60 font-black">{readingTests.length} tests</span>
                </div>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed mt-1.5">40 questions across 3 academic passages (60 mins).</p>
              </div>

              <div className="p-4.5 rounded-2xl bg-purple-50/50 dark:bg-purple-950/20 backdrop-blur-md border border-purple-200/50 dark:border-purple-800/30 hover:border-purple-400/70 hover:shadow-lg hover:shadow-purple-500/10 transition-all duration-300 group/module">
                <div className="flex items-center justify-between text-purple-800 dark:text-purple-300 font-extrabold text-sm">
                  <span className="flex items-center gap-1.5"><PenTool className="w-4 h-4" /> 3. Writing</span>
                  <span className="text-[11px] px-2 py-0.5 rounded-full bg-purple-100/80 dark:bg-purple-900/60 font-black">{writingTests.length} tests</span>
                </div>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed mt-1.5">Task 1 (Visual Report) & Task 2 (Discursive Essay) (60 mins).</p>
              </div>

              <div className="p-4.5 rounded-2xl bg-rose-50/50 dark:bg-rose-950/20 backdrop-blur-md border border-rose-200/50 dark:border-rose-800/30 hover:border-rose-400/70 hover:shadow-lg hover:shadow-rose-500/10 transition-all duration-300 group/module">
                <div className="flex items-center justify-between text-rose-800 dark:text-rose-300 font-extrabold text-sm">
                  <span className="flex items-center gap-1.5"><Mic className="w-4 h-4" /> 4. Speaking</span>
                  <span className="text-[11px] px-2 py-0.5 rounded-full bg-rose-100/80 dark:bg-rose-900/60 font-black">{speakingTests.length} tests</span>
                </div>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed mt-1.5">Full interactive interview covering Parts 1, 2, and 3 (11–14 mins).</p>
              </div>
            </div>

            <div className="p-3.5 rounded-2xl bg-slate-50/80 dark:bg-slate-800/50 backdrop-blur-sm border border-slate-200/70 dark:border-white/5 flex items-center justify-between gap-3 text-xs text-slate-600 dark:text-slate-300">
              <span className="flex items-center gap-2 font-medium">
                <Shuffle className="w-4 h-4 text-emerald-500 shrink-0" />
                <span>Click the <b className="text-slate-900 dark:text-white">"Start Full Mock Exam"</b> button above to begin your complete 180-minute practice test.</span>
              </span>
            </div>
          </div>
        ) : displayedTests.length === 0 ? (
          <div className="p-12 text-center bg-white dark:bg-slate-900 rounded-3xl border border-dashed border-slate-300 dark:border-slate-700 text-slate-500">
            <p className="font-bold text-slate-700 dark:text-slate-300">No tests found</p>
            <p className="text-xs text-slate-400 mt-1">Try adjusting your filter or search query.</p>
          </div>
        ) : (
          <div
            key={`${activeTab}_${readingPassageFilter}_${listeningSectionFilter}_${writingTaskFilter}_${selectedBook}_${selectedQuestionType}`}
            className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"
          >
            {displayedTests.map((t, idx) => renderTestCard(t, idx))}
          </div>
        )}
      </section>
      </>
      )}

      {/* 3. History & Results Section */}
      <section className="space-y-4 pt-6 border-t border-slate-200/80 dark:border-slate-800">
        <h2 className="text-lg sm:text-xl font-bold text-slate-900 dark:text-white flex items-center gap-2">
          <FileText className="w-5 h-5 text-indigo-600" />
          Test History & Results
        </h2>

        {safeHistory.length === 0 ? (
          <div className="p-8 text-center bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 text-slate-500 dark:text-slate-400 text-sm shadow-xs">
            You haven&apos;t taken any tests yet. Choose one from above to get started!
          </div>
        ) : (
          <div className="bg-white dark:bg-slate-900 rounded-3xl border border-slate-200 dark:border-slate-800 overflow-hidden shadow-xs">
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead className="bg-slate-100/80 dark:bg-slate-800/80 text-slate-700 dark:text-slate-300 text-xs uppercase font-bold border-b border-slate-200 dark:border-slate-800">
                  <tr>
                    <th className="py-3.5 px-4">Test Title</th>
                    <th className="py-3.5 px-4">Date Started</th>
                    <th className="py-3.5 px-4">Status</th>
                    <th className="py-3.5 px-4">Score / Percentage</th>
                    <th className="py-3.5 px-4">CEFR Level</th>
                    <th className="py-3.5 px-4 text-right">Action</th>
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
                                Expired
                              </span>
                            ) : (
                              <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-amber-100 dark:bg-amber-950/60 text-amber-800 dark:text-amber-300">
                                In Progress
                              </span>
                            )
                          ) : s.status === 'submitted' ? (
                            <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-blue-100 dark:bg-blue-950/60 text-blue-800 dark:text-blue-300">
                              Under Review
                            </span>
                          ) : (
                            <span className="px-2.5 py-1 rounded-full text-xs font-bold bg-emerald-100 dark:bg-emerald-950/60 text-emerald-800 dark:text-emerald-300">
                              Graded
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
                                Continue
                              </Link>
                            ) : (
                              <Link
                                href={`/student/results/${s.id}`}
                                className="text-xs font-bold text-indigo-700 dark:text-indigo-300 bg-indigo-50 dark:bg-indigo-950/60 hover:bg-indigo-100 dark:hover:bg-indigo-900/60 px-3 py-1.5 rounded-xl transition-all"
                              >
                                View Results
                              </Link>
                            )}
                            <button
                              onClick={() => handleStartTest(s.test_id, true)}
                              disabled={startingTestId === s.test_id}
                              className="text-xs font-bold text-emerald-700 dark:text-emerald-300 bg-emerald-50 dark:bg-emerald-950/60 hover:bg-emerald-100 dark:hover:bg-emerald-900/60 px-2.5 py-1.5 rounded-xl transition-all flex items-center gap-1 shrink-0 cursor-pointer"
                              title="Retake this test"
                            >
                              <RotateCcw className="w-3.5 h-3.5" />
                              <span className="hidden sm:inline">Retake</span>
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
          <p className="text-slate-600 dark:text-slate-400 font-semibold text-sm">Loading...</p>
        </div>
      }
    >
      <StudentDashboardContent />
    </Suspense>
  );
}
