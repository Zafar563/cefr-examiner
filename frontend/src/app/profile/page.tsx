'use client';

import React, { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import {
  User as UserIcon,
  LayoutGrid,
  Clock,
  TrendingUp,
  ShieldCheck,
  LogOut,
  Camera,
  CheckCircle2,
  AlertCircle,
  Award,
  ChevronRight,
  RotateCcw,
  Sparkles,
} from 'lucide-react';
import {
  getCurrentStoredUser,
  setCurrentStoredUser,
  removeToken,
  User,
  apiGetStudentHistory,
  TestSession,
} from '@/lib/api';

export default function ProfilePage() {
  const router = useRouter();
  const fileInputRef = useRef<HTMLInputElement>(null);

  const [user, setUser] = useState<User | null>(null);
  const [activeTab, setActiveTab] = useState<'account' | 'overview' | 'history' | 'progress' | 'logins'>('account');
  const [history, setHistory] = useState<TestSession[]>([]);
  const [loading, setLoading] = useState(true);

  // Form states
  const [fullName, setFullName] = useState('');
  const [username, setUsername] = useState('');
  const [dateOfBirth, setDateOfBirth] = useState('');
  const [email, setEmail] = useState('');
  const [phoneNumber, setPhoneNumber] = useState('');
  const [sex, setSex] = useState<'Male' | 'Female' | 'Other'>('Male');
  const [avatarUrl, setAvatarUrl] = useState<string>('');

  // UI state
  const [savedSuccess, setSavedSuccess] = useState(false);
  const [imageError, setImageError] = useState<string | null>(null);

  useEffect(() => {
    const currentUser = getCurrentStoredUser();
    if (!currentUser) {
      router.push('/login');
      return;
    }
    setUser(currentUser);
    setEmail(currentUser.email || '');

    // Load saved extra profile details for this specific email from localStorage
    const savedProfileKey = `cefr_profile_${currentUser.email}`;
    const rawSaved = localStorage.getItem(savedProfileKey);
    let profileData: any = {};
    if (rawSaved) {
      try {
        profileData = JSON.parse(rawSaved);
      } catch (e) {}
    }

    setFullName(profileData.fullName || currentUser.full_name || '');
    setUsername(profileData.username || currentUser.username || (currentUser.email ? currentUser.email.split('@')[0] : ''));
    setDateOfBirth(profileData.dateOfBirth || currentUser.date_of_birth || '');
    setPhoneNumber(profileData.phoneNumber || currentUser.phone_number || '');
    setSex(profileData.sex || currentUser.gender || 'Male');
    setAvatarUrl(profileData.avatarUrl || currentUser.avatar_url || '');

    // Load test history
    apiGetStudentHistory()
      .then((data) => setHistory(Array.isArray(data) ? data : []))
      .catch(() => setHistory([]))
      .finally(() => setLoading(false));
  }, [router]);

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!user) return;

    const profileData = {
      fullName,
      username,
      dateOfBirth,
      email,
      phoneNumber,
      sex,
      avatarUrl,
    };

    // Save per-email profile
    localStorage.setItem(`cefr_profile_${user.email}`, JSON.stringify(profileData));

    // Also update current user object in storage
    const updatedUser: User = {
      ...user,
      full_name: fullName,
      username,
      phone_number: phoneNumber,
      date_of_birth: dateOfBirth,
      gender: sex,
      avatar_url: avatarUrl,
    };
    setCurrentStoredUser(updatedUser);
    setUser(updatedUser);

    setSavedSuccess(true);
    setTimeout(() => setSavedSuccess(false), 3500);
  };

  const handleImageUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    setImageError(null);
    const file = e.target.files?.[0];
    if (!file) return;

    if (file.size > 1024 * 1024) {
      setImageError('Rasm hajmi 1MB dan oshmasligi kerak.');
      return;
    }

    const reader = new FileReader();
    reader.onloadend = () => {
      const base64 = reader.result as string;
      setAvatarUrl(base64);

      if (user) {
        // Automatically save avatar in profile
        const savedProfileKey = `cefr_profile_${user.email}`;
        const rawSaved = localStorage.getItem(savedProfileKey);
        const existing = rawSaved ? JSON.parse(rawSaved) : {};
        existing.avatarUrl = base64;
        localStorage.setItem(savedProfileKey, JSON.stringify(existing));

        const updatedUser: User = {
          ...user,
          avatar_url: base64,
        };
        setCurrentStoredUser(updatedUser);
        setUser(updatedUser);
      }
    };
    reader.readAsDataURL(file);
  };

  const handleLogout = () => {
    removeToken();
    router.push('/login');
  };

  const completedSessions = history.filter(
    (h) => h.status === 'submitted' || h.status === 'graded' || (h.expires_at && new Date(h.expires_at).getTime() <= Date.now())
  );
  const bestLevel = completedSessions.find((s) => s.result?.cefr_level)?.result?.cefr_level || 'B2';

  if (!user) {
    return (
      <div className="py-24 text-center">
        <div className="w-12 h-12 border-4 border-rose-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
        <p className="text-slate-500 font-semibold text-sm">Yuklanmoqda...</p>
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto py-6 sm:py-8 space-y-6">
      <div className="flex flex-col md:flex-row gap-6 lg:gap-8 items-start">
        {/* ======================================================== */}
        {/* LEFT SIDEBAR NAVIGATION CARD */}
        {/* ======================================================== */}
        <aside className="w-full md:w-64 lg:w-72 shrink-0 bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 rounded-3xl p-4 sm:p-5 shadow-xs space-y-5">
          {/* User Mini Card */}
          <div className="p-3 bg-slate-50 dark:bg-slate-800/60 rounded-2xl border border-slate-200/60 dark:border-slate-700/60 flex items-center gap-3">
            <div className="w-12 h-12 rounded-2xl bg-slate-200 dark:bg-slate-700 overflow-hidden flex items-center justify-center shrink-0 border border-slate-300 dark:border-slate-600">
              {avatarUrl ? (
                <img src={avatarUrl} alt={username} className="w-full h-full object-cover" />
              ) : (
                <UserIcon className="w-6 h-6 text-slate-400 dark:text-slate-500" />
              )}
            </div>
            <div className="min-w-0 flex-1">
              <div className="font-extrabold text-sm text-slate-900 dark:text-white truncate">
                {username || fullName || 'Foydalanuvchi'}
              </div>
              <div className="text-xs text-slate-500 dark:text-slate-400 truncate">
                {email}
              </div>
            </div>
          </div>

          {/* Navigation Items */}
          <nav className="space-y-1.5 text-xs sm:text-sm font-bold">
            <button
              onClick={() => setActiveTab('overview')}
              className={`w-full flex items-center gap-3 px-4 py-3 rounded-2xl transition-all cursor-pointer ${
                activeTab === 'overview'
                  ? 'bg-[#8b2323] text-white shadow-md'
                  : 'text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800'
              }`}
            >
              <LayoutGrid className="w-4 h-4 shrink-0" />
              <span>Overview</span>
            </button>

            <button
              onClick={() => setActiveTab('account')}
              className={`w-full flex items-center gap-3 px-4 py-3 rounded-2xl transition-all cursor-pointer ${
                activeTab === 'account'
                  ? 'bg-[#8b2323] text-white shadow-md'
                  : 'text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800'
              }`}
            >
              <UserIcon className="w-4 h-4 shrink-0" />
              <span>Account</span>
            </button>

            <button
              onClick={() => setActiveTab('history')}
              className={`w-full flex items-center gap-3 px-4 py-3 rounded-2xl transition-all cursor-pointer ${
                activeTab === 'history'
                  ? 'bg-[#8b2323] text-white shadow-md'
                  : 'text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800'
              }`}
            >
              <Clock className="w-4 h-4 shrink-0" />
              <span>History</span>
            </button>

            <button
              onClick={() => setActiveTab('progress')}
              className={`w-full flex items-center gap-3 px-4 py-3 rounded-2xl transition-all cursor-pointer ${
                activeTab === 'progress'
                  ? 'bg-[#8b2323] text-white shadow-md'
                  : 'text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800'
              }`}
            >
              <TrendingUp className="w-4 h-4 shrink-0" />
              <span>Learning progress</span>
            </button>

            <button
              onClick={() => setActiveTab('logins')}
              className={`w-full flex items-center gap-3 px-4 py-3 rounded-2xl transition-all cursor-pointer ${
                activeTab === 'logins'
                  ? 'bg-[#8b2323] text-white shadow-md'
                  : 'text-slate-700 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-800'
              }`}
            >
              <ShieldCheck className="w-4 h-4 shrink-0" />
              <span>Log ins</span>
            </button>
          </nav>

          <div className="pt-2 border-t border-slate-200/80 dark:border-slate-800">
            <button
              onClick={handleLogout}
              className="w-full flex items-center gap-3 px-4 py-3 rounded-2xl text-rose-600 dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950/40 border border-transparent hover:border-rose-200 dark:hover:border-rose-900 transition-all font-bold text-xs sm:text-sm cursor-pointer"
            >
              <LogOut className="w-4 h-4 shrink-0" />
              <span>Log out</span>
            </button>
          </div>
        </aside>

        {/* ======================================================== */}
        {/* RIGHT MAIN CONTENT AREA */}
        {/* ======================================================== */}
        <main className="flex-1 w-full space-y-6">
          {activeTab === 'account' && (
            <>
              {/* Header Title */}
              <div>
                <h1 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
                  Account
                </h1>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1.5 leading-relaxed">
                  Update your profile details here. The account page keeps your form data and profile image saved for the currently signed-in email.
                </p>
              </div>

              {/* Feedback Success Alert */}
              {savedSuccess && (
                <div className="p-4 rounded-2xl bg-emerald-50 dark:bg-emerald-950/60 border border-emerald-200 dark:border-emerald-800 text-emerald-800 dark:text-emerald-300 text-xs sm:text-sm font-bold flex items-center gap-2 animate-in fade-in duration-200">
                  <CheckCircle2 className="w-4 h-4 shrink-0 text-emerald-600" />
                  <span>Profilingiz ma'lumotlari muvaffaqiyatli saqlandi!</span>
                </div>
              )}

              {/* Premium Test Access Banner with Red Stamp */}
              <div className="bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800 rounded-3xl p-5 sm:p-6 shadow-xs relative overflow-hidden flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div className="space-y-1 relative z-10 max-w-xl">
                  <h3 className="text-base sm:text-lg font-black text-[#8b2323] dark:text-rose-400">
                    Premium Test Access
                  </h3>
                  <p className="text-xs text-slate-600 dark:text-slate-400">
                    Only approved emails can open premium tests.
                  </p>
                  <p className="text-xs font-semibold text-slate-500 dark:text-slate-400">
                    {user.role === 'admin'
                      ? 'Your account is verified as Administrator.'
                      : user.role === 'examiner'
                      ? 'Your account is verified as Examiner.'
                      : 'Your account is active and verified for student examinations.'}
                  </p>
                </div>

                {/* Stamp on right */}
                <div className="shrink-0 self-start sm:self-center">
                  <div className="border-2 border-dashed border-[#8b2323] dark:border-rose-500/80 rounded-xl px-4 py-2 text-center -rotate-2 select-none">
                    <div className="text-[10px] font-mono tracking-widest text-[#8b2323] dark:text-rose-400 opacity-60 uppercase">
                      //// VERIFIED ////
                    </div>
                    <div className="text-xs sm:text-sm font-black tracking-widest text-[#8b2323] dark:text-rose-400 uppercase">
                      {user.role === 'admin' || user.role === 'examiner' ? 'APPROVED' : 'STUDENT'}
                    </div>
                    <div className="text-[9px] font-mono text-[#8b2323] dark:text-rose-400 opacity-60">
                      CEFR-EXAMINER.UZ
                    </div>
                  </div>
                </div>
              </div>

              {/* Two Column Form & Avatar Section */}
              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                {/* Form Card (2 Columns on large screens) */}
                <div className="lg:col-span-2 bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800 rounded-3xl p-6 shadow-xs">
                  <form onSubmit={handleSave} className="space-y-4">
                    {/* Full Name */}
                    <div>
                      <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1.5">
                        Full Name <span className="text-rose-500">*</span>
                      </label>
                      <input
                        type="text"
                        required
                        value={fullName}
                        onChange={(e) => setFullName(e.target.value)}
                        placeholder="Zafar Tohirov"
                        className="w-full px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-xs sm:text-sm font-semibold focus:outline-none focus:border-rose-500 focus:ring-1 focus:ring-rose-500"
                      />
                    </div>

                    {/* Username & Date Of Birth */}
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                      <div>
                        <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1.5">
                          Username <span className="text-rose-500">*</span>
                        </label>
                        <input
                          type="text"
                          required
                          value={username}
                          onChange={(e) => setUsername(e.target.value)}
                          placeholder="zafartohirov306"
                          className="w-full px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-xs sm:text-sm font-semibold focus:outline-none focus:border-rose-500 focus:ring-1 focus:ring-rose-500"
                        />
                      </div>

                      <div>
                        <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1.5">
                          Date Of Birth
                        </label>
                        <input
                          type="date"
                          value={dateOfBirth}
                          onChange={(e) => setDateOfBirth(e.target.value)}
                          className="w-full px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-xs sm:text-sm font-semibold focus:outline-none focus:border-rose-500 focus:ring-1 focus:ring-rose-500"
                        />
                      </div>
                    </div>

                    {/* Email & Phone Number */}
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                      <div>
                        <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1.5">
                          E-Mail
                        </label>
                        <input
                          type="email"
                          disabled
                          value={email}
                          className="w-full px-4 py-2.5 rounded-xl border border-slate-200/60 dark:border-slate-700 bg-slate-50 dark:bg-slate-800/50 text-slate-500 dark:text-slate-400 text-xs sm:text-sm font-semibold cursor-not-allowed"
                        />
                      </div>

                      <div>
                        <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1.5">
                          Phone Number <span className="text-rose-500">*</span>
                        </label>
                        <input
                          type="tel"
                          required
                          value={phoneNumber}
                          onChange={(e) => setPhoneNumber(e.target.value)}
                          placeholder="+998 90 123 45 67"
                          className="w-full px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 text-xs sm:text-sm font-semibold focus:outline-none focus:border-rose-500 focus:ring-1 focus:ring-rose-500"
                        />
                      </div>
                    </div>

                    {/* Sex (Gender) */}
                    <div>
                      <label className="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-2">
                        Sex
                      </label>
                      <div className="flex items-center gap-6">
                        {(['Male', 'Female', 'Other'] as const).map((g) => (
                          <label key={g} className="flex items-center gap-2 cursor-pointer text-xs sm:text-sm font-semibold text-slate-700 dark:text-slate-300">
                            <input
                              type="radio"
                              name="sex"
                              value={g}
                              checked={sex === g}
                              onChange={() => setSex(g)}
                              className="w-4 h-4 text-[#8b2323] focus:ring-rose-500"
                            />
                            <span>{g}</span>
                          </label>
                        ))}
                      </div>
                    </div>

                    {/* Save Button */}
                    <div className="pt-2">
                      <button
                        type="submit"
                        className="bg-[#8b2323] hover:bg-[#701a1a] text-white font-black text-xs sm:text-sm px-7 py-3 rounded-2xl shadow-md shadow-rose-900/10 active:scale-95 transition-all cursor-pointer flex items-center gap-2"
                      >
                        <span>Save information</span>
                        <span>-&gt;</span>
                      </button>
                    </div>
                  </form>
                </div>

                {/* Profile Picture Card */}
                <div className="bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800 rounded-3xl p-6 shadow-xs flex flex-col items-center justify-between text-center space-y-4">
                  {/* Big Image Preview Box */}
                  <div className="w-48 h-48 sm:w-52 sm:h-52 rounded-3xl bg-slate-100 dark:bg-slate-800 border-2 border-dashed border-slate-300 dark:border-slate-700 flex items-center justify-center overflow-hidden relative shadow-inner">
                    {avatarUrl ? (
                      <img
                        src={avatarUrl}
                        alt="Profile picture"
                        className="w-full h-full object-cover"
                      />
                    ) : (
                      <UserIcon className="w-24 h-24 text-slate-300 dark:text-slate-600" />
                    )}
                  </div>

                  {/* Caption */}
                  <p className="text-xs text-slate-500 dark:text-slate-400 px-2 leading-relaxed">
                    The image size must be under 1MB and the aspect ratio should stay close to 1:1.
                  </p>

                  {imageError && (
                    <p className="text-xs font-bold text-rose-500">{imageError}</p>
                  )}

                  {/* Hidden Input */}
                  <input
                    type="file"
                    ref={fileInputRef}
                    accept="image/*"
                    onChange={handleImageUpload}
                    className="hidden"
                  />

                  {/* Upload Button */}
                  <button
                    type="button"
                    onClick={() => fileInputRef.current?.click()}
                    className="w-full py-2.5 px-4 rounded-xl border border-[#8b2323]/40 dark:border-rose-500/40 text-[#8b2323] dark:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950/40 font-bold text-xs sm:text-sm transition-all cursor-pointer flex items-center justify-center gap-2"
                  >
                    <Camera className="w-4 h-4" />
                    <span>Upload profile picture</span>
                  </button>
                </div>
              </div>
            </>
          )}

          {/* ======================================================== */}
          {/* TAB: OVERVIEW */}
          {/* ======================================================== */}
          {activeTab === 'overview' && (
            <div className="space-y-6">
              <div>
                <h1 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
                  Overview
                </h1>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1.5">
                  Platformadagi faolligingiz va asosiy natijalar qisqacha ko‘rinishi.
                </p>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-3 gap-5">
                <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 space-y-2">
                  <span className="text-xs font-bold text-slate-500">Topshirilgan testlar</span>
                  <div className="text-3xl font-black text-slate-900 dark:text-white">{completedSessions.length}</div>
                </div>
                <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 space-y-2">
                  <span className="text-xs font-bold text-slate-500">Eng yuqori daraja</span>
                  <div className="text-3xl font-black text-emerald-600">{bestLevel}</div>
                </div>
                <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 space-y-2">
                  <span className="text-xs font-bold text-slate-500">Profil holati</span>
                  <div className="text-base font-extrabold text-indigo-600 flex items-center gap-1.5 mt-2">
                    <CheckCircle2 className="w-4 h-4" />
                    <span>Faol / Tasdiqlangan</span>
                  </div>
                </div>
              </div>

              <div className="p-6 bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-3xl flex items-center justify-between gap-4">
                <div>
                  <h3 className="text-lg font-bold">Imtihon topshirishga tayyormisiz?</h3>
                  <p className="text-xs text-white/80 mt-1">Listening, Reading, Writing va Speaking bo‘yicha 144 ta to‘liq akademik test mavjud.</p>
                </div>
                <Link
                  href="/student"
                  className="px-5 py-2.5 rounded-xl bg-white text-indigo-600 font-black text-xs uppercase tracking-wider shrink-0 hover:bg-slate-100 transition-colors"
                >
                  Testlarga o‘tish
                </Link>
              </div>
            </div>
          )}

          {/* ======================================================== */}
          {/* TAB: HISTORY */}
          {/* ======================================================== */}
          {activeTab === 'history' && (
            <div className="space-y-6">
              <div>
                <h1 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
                  Test Tarixi
                </h1>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1.5">
                  Siz topshirgan barcha testlar va ularning batafsil ballari.
                </p>
              </div>

              {history.length === 0 ? (
                <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-12 text-center text-slate-500 space-y-3">
                  <Clock className="w-10 h-10 mx-auto text-slate-400 opacity-60" />
                  <p className="font-bold text-slate-700 dark:text-slate-300">Hozircha testlar topshirilmagan</p>
                  <Link
                    href="/student"
                    className="inline-block px-5 py-2.5 rounded-xl bg-indigo-600 text-white font-bold text-xs"
                  >
                    Birinchi testni boshlash
                  </Link>
                </div>
              ) : (
                <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl overflow-hidden shadow-xs">
                  <div className="overflow-x-auto">
                    <table className="w-full text-left text-xs sm:text-sm">
                      <thead className="bg-slate-50 dark:bg-slate-800/60 text-slate-500 border-b border-slate-200 dark:border-slate-800">
                        <tr>
                          <th className="py-3.5 px-4 font-bold">Imtihon</th>
                          <th className="py-3.5 px-4 font-bold">Sana</th>
                          <th className="py-3.5 px-4 font-bold">Holat</th>
                          <th className="py-3.5 px-4 font-bold">Ball</th>
                          <th className="py-3.5 px-4 font-bold">CEFR</th>
                          <th className="py-3.5 px-4 font-bold text-right">Amal</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-100 dark:divide-slate-800">
                        {history.map((s) => (
                          <tr key={s.id} className="hover:bg-slate-50/80 dark:hover:bg-slate-800/40">
                            <td className="py-4 px-4 font-bold text-slate-900 dark:text-white">
                              {s.test_title || `Test #${s.test_id}`}
                            </td>
                            <td className="py-4 px-4 text-slate-500 text-xs">
                              {s.started_at ? new Date(s.started_at).toLocaleDateString('uz-UZ') : 'Yaqinda'}
                            </td>
                            <td className="py-4 px-4">
                              <span className="px-2 py-0.5 rounded-md text-[11px] font-bold bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300">
                                {s.status}
                              </span>
                            </td>
                            <td className="py-4 px-4 font-semibold text-slate-700 dark:text-slate-300">
                              {s.result ? `${s.result.total_score} / ${s.result.max_score}` : '—'}
                            </td>
                            <td className="py-4 px-4 font-black text-indigo-600">
                              {s.result?.cefr_level || '—'}
                            </td>
                            <td className="py-4 px-4 text-right">
                              {s.status === 'in_progress' ? (
                                <Link
                                  href={`/student/test/${s.id}`}
                                  className="text-xs font-bold text-emerald-600 hover:underline"
                                >
                                  Davom ettirish
                                </Link>
                              ) : (
                                <Link
                                  href={`/student/results/${s.id}`}
                                  className="text-xs font-bold text-indigo-600 hover:underline"
                                >
                                  Natija
                                </Link>
                              )}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}
            </div>
          )}

          {/* ======================================================== */}
          {/* TAB: PROGRESS */}
          {/* ======================================================== */}
          {activeTab === 'progress' && (
            <div className="space-y-6">
              <div>
                <h1 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
                  Learning Progress
                </h1>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1.5">
                  IELTS ko‘nikmalaringiz bo‘yicha o‘zlashtirish ko‘rsatkichlari.
                </p>
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {[
                  { name: 'Listening', color: 'blue', tests: 36, progress: '75%' },
                  { name: 'Reading', color: 'emerald', tests: 36, progress: '60%' },
                  { name: 'Speaking', color: 'purple', tests: 36, progress: '50%' },
                  { name: 'Writing', color: 'amber', tests: 36, progress: '40%' },
                ].map((skill) => (
                  <div key={skill.name} className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-5 space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="font-extrabold text-sm text-slate-900 dark:text-white">{skill.name}</span>
                      <span className="text-xs text-slate-500">{skill.tests} testlar</span>
                    </div>
                    <div className="w-full bg-slate-100 dark:bg-slate-800 h-2.5 rounded-full overflow-hidden">
                      <div className="bg-[#8b2323] h-full rounded-full" style={{ width: skill.progress }}></div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* ======================================================== */}
          {/* TAB: LOGINS */}
          {/* ======================================================== */}
          {activeTab === 'logins' && (
            <div className="space-y-6">
              <div>
                <h1 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
                  Log ins
                </h1>
                <p className="text-xs sm:text-sm text-slate-500 dark:text-slate-400 mt-1.5">
                  Xavfsizlik va oxirgi faol seanslar tarixi.
                </p>
              </div>

              <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 space-y-4">
                <div className="flex items-center justify-between pb-4 border-b border-slate-100 dark:border-slate-800">
                  <div>
                    <div className="font-bold text-sm text-slate-900 dark:text-white">Joriy qurilma / Brauzer</div>
                    <div className="text-xs text-slate-500 mt-0.5">Faol seans • Ushbu kompyuter</div>
                  </div>
                  <span className="px-3 py-1 rounded-full text-xs font-black bg-emerald-100 text-emerald-800 dark:bg-emerald-950/60 dark:text-emerald-300">
                    Online
                  </span>
                </div>
                <div className="text-xs text-slate-500">
                  Hisobingiz xavfsiz JWT token orqali himoyalangan.
                </div>
              </div>
            </div>
          )}
        </main>
      </div>
    </div>
  );
}
