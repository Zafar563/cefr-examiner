export const getCoreApiUrl = (): string => {
  if (typeof window !== 'undefined') {
    // Brauzerda: agar sahifa localhost bo'lmasa, nisbiy manzil (Nginx reverse proxy) ishlatiladi
    if (window.location.hostname !== 'localhost' && window.location.hostname !== '127.0.0.1') {
      return '';
    }
    const apiUrl = process.env.NEXT_PUBLIC_API_URL;
    if (apiUrl && !apiUrl.includes(':8080')) {
      return apiUrl;
    }
    return 'http://localhost:8088';
  }
  return process.env.CORE_API_URL || process.env.NEXT_PUBLIC_API_URL || 'http://core-backend:8080';
};

export const getMediaApiUrl = (): string => {
  if (typeof window !== 'undefined') {
    if (window.location.hostname !== 'localhost' && window.location.hostname !== '127.0.0.1') {
      return '';
    }
    return process.env.NEXT_PUBLIC_MEDIA_URL || 'http://localhost:8000';
  }
  return process.env.MEDIA_API_URL || process.env.NEXT_PUBLIC_MEDIA_URL || 'http://media-service:8000';
};

export interface User {
  id: number;
  email: string;
  full_name: string;
  role: 'student' | 'examiner' | 'admin';
  created_at?: string;
  username?: string;
  phone_number?: string;
  date_of_birth?: string;
  gender?: string;
  avatar_url?: string;
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
  explanation_text?: string;
  explanation_audio_url?: string;
  media_url?: string;
  explanation_video_url?: string;
  explanation_image_url?: string;
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
  explanation_text?: string;
  explanation_audio_url?: string;
  explanation_video_url?: string;
  explanation_image_url?: string;
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
  target_section_index?: number | null;
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
    if (res.status === 401) {
      removeToken();
      if (typeof window !== 'undefined' && !window.location.pathname.includes('/login')) {
        window.location.href = '/login?expired=1';
      }
    }
    const errorData = await res.json().catch(() => ({ error: 'An unexpected error occurred' }));
    throw new Error(errorData.error || errorData.detail || 'Request failed');
  }
  return res.json();
}

// Auth API
export const apiLogin = async (email: string, password: string) => {
  const res = await fetch(`${getCoreApiUrl()}/api/v1/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password }),
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: 'Login error' }));
    throw new Error(err.error || 'Invalid email or password');
  }
  const data = await res.json();
  setToken(data.token);
  setCurrentStoredUser(data.user);
  return data;
};

export const apiRegister = async (fullName: string, email: string, password: string, role: string = 'student') => {
  const res = await fetch(`${getCoreApiUrl()}/api/v1/auth/register`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ full_name: fullName, email, password, role }),
  });
  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: 'Registration error' }));
    throw new Error(err.error || 'Failed to register account');
  }
  const data = await res.json();
  setToken(data.token);
  setCurrentStoredUser(data.user);
  return data;
};

export const apiGetMe = async (): Promise<User> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/auth/me`);
};

// Tests API
export const apiGetTests = async (): Promise<Test[]> => {
  try {
    const res = await fetch(`${getCoreApiUrl()}/api/v1/tests`);
    if (!res.ok) return [];
    const data = await res.json();
    return Array.isArray(data) ? data : [];
  } catch (e) {
    return [];
  }
};

export const apiGetTestDetails = async (id: number): Promise<Test> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/tests/${id}`);
};

// Session & Test Taking API
export const apiStartSession = async (
  testId: number,
  forceNew: boolean = false,
  targetSectionIndex?: number | null
): Promise<TestSession> => {
  const query = new URLSearchParams();
  if (forceNew) query.set('force_new', 'true');
  if (targetSectionIndex !== undefined && targetSectionIndex !== null) {
    query.set('section', targetSectionIndex.toString());
  }
  const qStr = query.toString() ? `?${query.toString()}` : '';
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/tests/${testId}/start${qStr}`, {
    method: 'POST',
    body: JSON.stringify(
      targetSectionIndex !== undefined && targetSectionIndex !== null
        ? { target_section_index: targetSectionIndex }
        : {}
    ),
  });
};

export const apiStartRandomMock = async (forceNew: boolean = false): Promise<TestSession> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/mock/start?force_new=${forceNew}`, {
    method: 'POST',
  });
};

export const apiGetSession = async (sessionId: number): Promise<TestSession> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/sessions/${sessionId}`);
};

export const apiSaveAnswer = async (sessionId: number, questionId: number, answerText: string, audioUrl: string = '') => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/sessions/${sessionId}/answer`, {
    method: 'POST',
    body: JSON.stringify({
      question_id: questionId,
      user_answer_text: answerText,
      audio_file_url: audioUrl,
    }),
  });
};

export const apiSubmitSession = async (sessionId: number): Promise<TestSession> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/sessions/${sessionId}/submit`, {
    method: 'POST',
  });
};

export const apiGetStudentHistory = async (): Promise<TestSession[]> => {
  try {
    const data = await fetchWithAuth(`${getCoreApiUrl()}/api/v1/student/history`);
    return Array.isArray(data) ? data : [];
  } catch (e) {
    return [];
  }
};

// Examiner API
export const apiGetExaminerSubmissions = async (): Promise<TestSession[]> => {
  try {
    const data = await fetchWithAuth(`${getCoreApiUrl()}/api/v1/examiner/submissions`);
    return Array.isArray(data) ? data : [];
  } catch (e) {
    return [];
  }
};

export const apiGradeAnswer = async (answerId: number, score: number, feedback: string) => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/examiner/grade`, {
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
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/tests`, {
    method: 'POST',
    body: JSON.stringify({ title, description, level, duration_minutes: durationMinutes }),
  });
};

export const apiDeleteTest = async (testId: number) => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/tests/${testId}`, {
    method: 'DELETE',
  });
};

export const apiCreateSection = async (testId: number, sectionData: any): Promise<Section> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/tests/${testId}/sections`, {
    method: 'POST',
    body: JSON.stringify(sectionData),
  });
};

export const apiCreateQuestion = async (sectionId: number, questionData: any): Promise<Question> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/sections/${sectionId}/questions`, {
    method: 'POST',
    body: JSON.stringify(questionData),
  });
};

// Media Service API
export const apiUploadAudio = async (blob: Blob, filename: string = 'recording.webm'): Promise<{ url: string; filename: string }> => {
  const mediaUrl = getMediaApiUrl();
  const formData = new FormData();
  formData.append('file', blob, filename);

  const res = await fetch(`${mediaUrl}/api/v1/media/upload/audio`, {
    method: 'POST',
    body: formData,
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ detail: 'Error uploading audio' }));
    throw new Error(err.detail || 'Failed to save audio');
  }

  const data = await res.json();
  // Return streamable URL
  return {
    url: `${mediaUrl}${data.url}`,
    filename: data.filename,
  };
};

export const apiUploadImage = async (file: File | Blob, filename: string = 'image.png'): Promise<{ url: string; filename: string }> => {
  const mediaUrl = getMediaApiUrl();
  const formData = new FormData();
  formData.append('file', file, filename);

  const res = await fetch(`${mediaUrl}/api/v1/media/upload/image`, {
    method: 'POST',
    body: formData,
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ detail: 'Error uploading image' }));
    throw new Error(err.detail || 'Failed to save image');
  }

  const data = await res.json();
  return {
    url: `${mediaUrl}${data.url}`,
    filename: data.filename,
  };
};

export const apiUploadVideo = async (file: File | Blob, filename: string = 'video.mp4'): Promise<{ url: string; filename: string }> => {
  const mediaUrl = getMediaApiUrl();
  const formData = new FormData();
  formData.append('file', file, filename);

  const res = await fetch(`${mediaUrl}/api/v1/media/upload/video`, {
    method: 'POST',
    body: formData,
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ detail: 'Error uploading video' }));
    throw new Error(err.detail || 'Failed to save video');
  }

  const data = await res.json();
  return {
    url: `${mediaUrl}${data.url}`,
    filename: data.filename,
  };
};

export const apiUpdateQuestionExplanation = async (
  questionId: number,
  data: {
    explanation_text?: string;
    explanation_audio_url?: string;
    explanation_video_url?: string;
    explanation_image_url?: string;
  }
): Promise<{ message: string }> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/questions/${questionId}/explanation`, {
    method: 'PUT',
    body: JSON.stringify(data),
  });
};

// Users management API (Admin only)
export const apiGetUsers = async (): Promise<User[]> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/users`);
};

export const apiUpdateUserRole = async (userId: number, role: 'student' | 'examiner' | 'admin') => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/users/${userId}/role`, {
    method: 'PUT',
    body: JSON.stringify({ role }),
  });
};

/**
 * Sorts Cambridge tests strictly from 13 to 21 ascending,
 * followed by test number (1 to 4), and then any remaining tests.
 */

// User Profile & Password APIs
export const apiGetProfile = async (): Promise<User> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/user/profile`);
};

export const apiUpdateProfile = async (profileData: {
  full_name: string;
  phone_number?: string;
  date_of_birth?: string;
  gender?: string;
  avatar_url?: string;
}): Promise<User> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/user/profile`, {
    method: 'PUT',
    body: JSON.stringify(profileData),
  });
};

export const apiUpdatePassword = async (
  currentPassword: string,
  newPassword: string
): Promise<{ message: string }> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/user/password`, {
    method: 'PUT',
    body: JSON.stringify({ current_password: currentPassword, new_password: newPassword }),
  });
};

// Admin CRUD additions
export const apiUpdateTest = async (
  testId: number,
  data: { title: string; description: string; level: string; duration_minutes: number }
): Promise<Test> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/tests/${testId}`, {
    method: 'PUT',
    body: JSON.stringify(data),
  });
};

export const apiUpdateSection = async (
  sectionId: number,
  data: { title: string; instructions: string; audio_url?: string | null; passage_text?: string | null }
): Promise<Section> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/sections/${sectionId}`, {
    method: 'PUT',
    body: JSON.stringify(data),
  });
};

export const apiDeleteSection = async (sectionId: number): Promise<{ message: string }> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/sections/${sectionId}`, {
    method: 'DELETE',
  });
};

export const apiUpdateQuestion = async (questionId: number, data: any): Promise<Question> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/questions/${questionId}`, {
    method: 'PUT',
    body: JSON.stringify(data),
  });
};

export const apiDeleteQuestion = async (questionId: number): Promise<{ message: string }> => {
  return fetchWithAuth(`${getCoreApiUrl()}/api/v1/admin/questions/${questionId}`, {
    method: 'DELETE',
  });
};

export const sortCambridgeTests = (a: Test, b: Test): number => {
  const getBook = (title: string): number => {
    const m = title.match(/Cambridge IELTS (\d+)/i);
    if (!m) return 999;
    const n = parseInt(m[1], 10);
    return n >= 13 ? n : 100 + n;
  };
  const getTestNum = (title: string): number => {
    const m = title.match(/Test (\d+)/i);
    return m ? parseInt(m[1], 10) : 0;
  };
  const bookDiff = getBook(a.title) - getBook(b.title);
  if (bookDiff !== 0) return bookDiff;
  const testDiff = getTestNum(a.title) - getTestNum(b.title);
  if (testDiff !== 0) return testDiff;
  return b.id - a.id;
};
