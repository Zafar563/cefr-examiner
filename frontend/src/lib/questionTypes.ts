import { Question } from './api';

export type IeltsQuestionCategory =
  | 'all'
  | 'multiple_choice'
  | 'multiple_selection'
  | 'true_false_not_given'
  | 'yes_no_not_given'
  | 'completion'
  | 'matching'
  | 'essay'
  | 'speaking';

export interface QuestionCategoryMeta {
  id: IeltsQuestionCategory;
  label: string;
  shortLabel: string;
  badgeClass: string;
  activeClass: string;
  description: string;
  iconName: string;
}

export const IELTS_QUESTION_CATEGORIES: Record<IeltsQuestionCategory, QuestionCategoryMeta> = {
  all: {
    id: 'all',
    label: 'All Questions',
    shortLabel: 'All',
    badgeClass: 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 border-slate-300 dark:border-slate-700',
    activeClass: 'bg-slate-900 text-white dark:bg-slate-100 dark:text-slate-900 shadow-sm',
    description: 'View all question types',
    iconName: 'Layers',
  },
  multiple_choice: {
    id: 'multiple_choice',
    label: 'Multiple Choice',
    shortLabel: 'Multiple Choice',
    badgeClass: 'bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300 border-blue-200 dark:border-blue-800',
    activeClass: 'bg-blue-600 text-white shadow-blue-500/25',
    description: 'Choose 1 correct option from options (A, B, C, D)',
    iconName: 'CheckCircle2',
  },
  multiple_selection: {
    id: 'multiple_selection',
    label: 'Multiple Selection (Choose 2/3)',
    shortLabel: 'Choose 2/3',
    badgeClass: 'bg-indigo-50 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300 border-indigo-200 dark:border-indigo-800',
    activeClass: 'bg-indigo-600 text-white shadow-indigo-500/25',
    description: 'Choose multiple correct answers (Choose TWO / THREE)',
    iconName: 'CheckSquare',
  },
  true_false_not_given: {
    id: 'true_false_not_given',
    label: 'True / False / Not Given',
    shortLabel: 'True/False/NG',
    badgeClass: 'bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 border-emerald-200 dark:border-emerald-800',
    activeClass: 'bg-emerald-600 text-white shadow-emerald-500/25',
    description: 'Identify if statements agree with the text (True, False, Not Given)',
    iconName: 'Scale',
  },
  yes_no_not_given: {
    id: 'yes_no_not_given',
    label: 'Yes / No / Not Given',
    shortLabel: 'Yes/No/NG',
    badgeClass: 'bg-teal-50 dark:bg-teal-950/60 text-teal-700 dark:text-teal-300 border-teal-200 dark:border-teal-800',
    activeClass: 'bg-teal-600 text-white shadow-teal-500/25',
    description: "Identify writer's views and claims (Yes, No, Not Given)",
    iconName: 'HelpCircle',
  },
  completion: {
    id: 'completion',
    label: 'Fill in the Blanks / Completion',
    shortLabel: 'Completion',
    badgeClass: 'bg-amber-50 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300 border-amber-200 dark:border-amber-800',
    activeClass: 'bg-amber-600 text-white shadow-amber-500/25',
    description: 'Complete notes, summary, table or sentences with words from the text',
    iconName: 'Edit3',
  },
  matching: {
    id: 'matching',
    label: 'Matching (Headings / Features)',
    shortLabel: 'Matching',
    badgeClass: 'bg-purple-50 dark:bg-purple-950/60 text-purple-700 dark:text-purple-300 border-purple-200 dark:border-purple-800',
    activeClass: 'bg-purple-600 text-white shadow-purple-500/25',
    description: 'Match paragraphs with headings, features, or details',
    iconName: 'GitCompare',
  },
  essay: {
    id: 'essay',
    label: 'Writing Task',
    shortLabel: 'Writing Task',
    badgeClass: 'bg-fuchsia-50 dark:bg-fuchsia-950/60 text-fuchsia-700 dark:text-fuchsia-300 border-fuchsia-200 dark:border-fuchsia-800',
    activeClass: 'bg-fuchsia-600 text-white shadow-fuchsia-500/25',
    description: 'Task 1 visual report and Task 2 academic essay writing',
    iconName: 'PenTool',
  },
  speaking: {
    id: 'speaking',
    label: 'Speaking Prompt',
    shortLabel: 'Speaking',
    badgeClass: 'bg-rose-50 dark:bg-rose-950/60 text-rose-700 dark:text-rose-300 border-rose-200 dark:border-rose-800',
    activeClass: 'bg-rose-600 text-white shadow-rose-500/25',
    description: 'Record audio responses for Part 1, Part 2, and Part 3 prompts',
    iconName: 'Mic',
  },
};

/**
 * Algorithm to detect precise IELTS / CEFR question category
 */
export function getQuestionCategory(q: Question): IeltsQuestionCategory {
  if (q.question_type === 'essay') return 'essay';
  if (q.question_type === 'speaking_prompt') return 'speaking';

  const rawOpts = Array.isArray(q.options) ? q.options : [];
  const opts = rawOpts.map((o) => String(o).trim().toUpperCase());
  const text = (q.question_text || '').toLowerCase();

  // 1. True / False / Not Given
  const isTfng =
    opts.includes('TRUE') &&
    opts.includes('FALSE') &&
    (opts.includes('NOT GIVEN') || opts.some((o) => o.includes('NOT GIVEN')));
  if (
    isTfng ||
    text.includes('true/false/not given') ||
    text.includes('true, false, not given') ||
    text.includes('true / false / not given')
  ) {
    return 'true_false_not_given';
  }

  // 2. Yes / No / Not Given
  const isYnng =
    opts.includes('YES') &&
    opts.includes('NO') &&
    (opts.includes('NOT GIVEN') || opts.some((o) => o.includes('NOT GIVEN')));
  if (
    isYnng ||
    text.includes('yes/no/not given') ||
    text.includes('yes, no, not given') ||
    text.includes('yes / no / not given')
  ) {
    return 'yes_no_not_given';
  }

  // 3. Multiple Selection (Choose TWO or THREE)
  if (
    q.question_type === 'multiple_choice' ||
    text.includes('choose two') ||
    text.includes('choose three') ||
    text.includes('which two') ||
    text.includes('which three')
  ) {
    return 'multiple_selection';
  }

  // 4. Matching (Headings, Features, Information)
  const hasRomanNumerals = opts.some((o) => /^[ivxlcdm]+\.?\s+/i.test(o));
  const isMatching =
    hasRomanNumerals ||
    text.includes('which paragraph contains') ||
    text.includes('heading') ||
    text.includes('match each') ||
    text.includes('look at the following');
  if (isMatching) {
    return 'matching';
  }

  // 5. Completion / Fill in Blanks
  if (
    q.question_type === 'text_input' ||
    opts.length === 0 ||
    text.includes('complete the') ||
    text.includes('no more than') ||
    text.includes('one word only') ||
    text.includes('___') ||
    text.includes('write one word')
  ) {
    return 'completion';
  }

  // Default: Multiple Choice
  return 'multiple_choice';
}
