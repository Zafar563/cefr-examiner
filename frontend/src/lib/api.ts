const CORE_API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080';
const MEDIA_API_URL = process.env.NEXT_PUBLIC_MEDIA_URL || 'http://localhost:8000';

export interface User {
  id: number;
  email: string;
  full_name: string;
  role: 'student' | 'examiner' | 'admin';
  created_at?: string;
}

export interface Question {
  id: number;
  section_id: number;
  question_type: 'single_choice' | 'multiple_choice' | 'text_input' | 'essay' | 'speaking_prompt';
  question_text: string;
  options?: string[];
  correct_answer?: string;
  points: number;
  order_index: number;
}

export interface Section {
  id: number;
  test_id: number;
  type: 'listening' | 'reading' | 'writing' | 'speaking';
  title: string;
  instructions: string;
  audio_url?: string;
  passage_text?: string;
  order_index: number;
  questions?: Question[];
}

export interface Test {
  id: number;
  title: string;
  description: string;
  level: string;
  duration_minutes: number;
  is_active: boolean;
  created_at?: string;
  sections?: Section[];
}

export interface Answer {
  id: number;
  session_id: number;
  question_id: number;
  user_answer_text?: string;
  audio_file_url?: string;
  score: number;
  examiner_feedback?: string;
  is_graded: boolean;
  question_text?: string;
  section_type?: string;
  correct_answer?: string;
}

export interface TestResult {
  id: number;
  session_id: number;
  listening_score: number;
  reading_score: number;
  writing_score: number;
  speaking_score: number;
  total_score: number;
  max_score: number;
  percentage: number;
  cefr_level: string;
  is_final: boolean;
  feedback_summary?: string;
}

export interface TestSession {
  id: number;
  user_id: number;
  test_id: number;
  test_title?: string;
  student_name?: string;
  student_email?: string;
  status: 'in_progress' | 'submitted' | 'graded';
  started_at: string;
  expires_at: string;
  submitted_at?: string;
  current_section_index: number;
  answers?: Answer[];
  result?: TestResult;
}

// Token helper
export const getToken = (): string | null => {
  if (typeof window !== 'undefined') {
    return localStorage.getItem('cefr_token');
  }
  return null;
};

export const setToken = (token: string) => {
  if (typeof window !== 'undefined') {
    localStorage.setItem('cefr_token', token);
  }
};

export const removeToken = () => {
  if (typeof window !== 'undefined') {
    localStorage.removeItem('cefr_token');
    localStorage.removeItem('cefr_user');
  }
};

export const getCurrentStoredUser = (): User | null => {
  if (typeof window !== 'undefined') {
    const raw = localStorage.getItem('cefr_user');
    if (raw) {
      try {
        return JSON.parse(raw);
      } catch (e) {
        return null;
      }
    }
  }
  return null;
};

export const setCurrentStoredUser = (user: User) => {
  if (typeof window !== 'undefined') {
    localStorage.setItem('cefr_user', JSON.stringify(user));
  }
};

// Generic fetch with auth
async function fetchWithAuth(url: string, options: RequestInit = {}) {
  const token = getToken();
  const headers: HeadersInit = {
    'Content-Type': 'application/json',
    ...(options.headers || {}),
  };

  if (token) {
    (headers as Record<string, string>)['Authorization'] = `Bearer ${token}`;
  }

  const res = await fetch(url, { ...options, headers });
  if (!res.ok) {
    const errorData = await res.json().catch(() => ({ error: 'Kutilmagan xatolik yuz berdi' }));
    throw new Error(errorData.error || errorData.detail || 'So‘rov bajarilmadi');
  }
  return res.json();
}

// Auth API
export const apiLogin = async (email: string, password: string) => {
  const res = await fetch(`${CORE_API_URL}/api/v1/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password }),
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: 'Kirishda xatolik' }));
    throw new Error(err.error || 'Login yoki parol xato');
  }
  const data = await res.json();
  setToken(data.token);
  setCurrentStoredUser(data.user);
  return data;
};

export const apiRegister = async (fullName: string, email: string, password: string, role: string = 'student') => {
  const res = await fetch(`${CORE_API_URL}/api/v1/auth/register`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ full_name: fullName, email, password, role }),
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: 'Ro‘yxatdan o‘tishda xatolik' }));
    throw new Error(err.error || 'Ro‘yxatdan o‘tib bo‘lmadi');
  }
  const data = await res.json();
  setToken(data.token);
  setCurrentStoredUser(data.user);
  return data;
};

export const apiGetMe = async (): Promise<User> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/auth/me`);
};

// Tests API
export const apiGetTests = async (): Promise<Test[]> => {
  try {
    const res = await fetch(`${CORE_API_URL}/api/v1/tests`);
    if (!res.ok) return [];
    const data = await res.json();
    return Array.isArray(data) ? data : [];
  } catch (e) {
    return [];
  }
};

export const apiGetTestDetails = async (id: number): Promise<Test> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/tests/${id}`);
};

// Session & Test Taking API
export const apiStartSession = async (testId: number): Promise<TestSession> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/tests/${testId}/start`, {
    method: 'POST',
  });
};

export const apiGetSession = async (sessionId: number): Promise<TestSession> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/sessions/${sessionId}`);
};

export const apiSaveAnswer = async (sessionId: number, questionId: number, answerText: string, audioUrl: string = '') => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/sessions/${sessionId}/answer`, {
    method: 'POST',
    body: JSON.stringify({
      question_id: questionId,
      user_answer_text: answerText,
      audio_file_url: audioUrl,
    }),
  });
};

export const apiSubmitSession = async (sessionId: number): Promise<TestSession> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/sessions/${sessionId}/submit`, {
    method: 'POST',
  });
};

export const apiGetStudentHistory = async (): Promise<TestSession[]> => {
  try {
    const data = await fetchWithAuth(`${CORE_API_URL}/api/v1/student/history`);
    return Array.isArray(data) ? data : [];
  } catch (e) {
    return [];
  }
};

// Examiner API
export const apiGetExaminerSubmissions = async (): Promise<TestSession[]> => {
  try {
    const data = await fetchWithAuth(`${CORE_API_URL}/api/v1/examiner/submissions`);
    return Array.isArray(data) ? data : [];
  } catch (e) {
    return [];
  }
};

export const apiGradeAnswer = async (answerId: number, score: number, feedback: string) => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/examiner/grade`, {
    method: 'POST',
    body: JSON.stringify({
      answer_id: answerId,
      score,
      feedback,
    }),
  });
};

// Admin API
export const apiCreateTest = async (title: string, description: string, level: string, durationMinutes: number): Promise<Test> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/admin/tests`, {
    method: 'POST',
    body: JSON.stringify({ title, description, level, duration_minutes: durationMinutes }),
  });
};

export const apiDeleteTest = async (testId: number) => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/admin/tests/${testId}`, {
    method: 'DELETE',
  });
};

export const apiCreateSection = async (testId: number, sectionData: any): Promise<Section> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/admin/tests/${testId}/sections`, {
    method: 'POST',
    body: JSON.stringify(sectionData),
  });
};

export const apiCreateQuestion = async (sectionId: number, questionData: any): Promise<Question> => {
  return fetchWithAuth(`${CORE_API_URL}/api/v1/admin/sections/${sectionId}/questions`, {
    method: 'POST',
    body: JSON.stringify(questionData),
  });
};

// Media Service API
export const apiUploadAudio = async (blob: Blob, filename: string = 'recording.webm'): Promise<{ url: string; filename: string }> => {
  const formData = new FormData();
  formData.append('file', blob, filename);

  const res = await fetch(`${MEDIA_API_URL}/api/v1/media/upload/audio`, {
    method: 'POST',
    body: formData,
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ detail: 'Audio yuklashda xatolik' }));
    throw new Error(err.detail || 'Audioni saqlash muvaffaqiyatsiz bo‘ldi');
  }

  const data = await res.json();
  // Return streamable URL
  return {
    url: `${MEDIA_API_URL}${data.url}`,
    filename: data.filename,
  };
};
