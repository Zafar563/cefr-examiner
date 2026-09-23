'use client';

import React, { useState, useEffect, Suspense } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { apiLogin, apiRegister } from '@/lib/api';
import { LogIn, UserPlus, ShieldAlert } from 'lucide-react';

function LoginForm() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [isRegister, setIsRegister] = useState(false);

  useEffect(() => {
    if (searchParams.get('tab') === 'register') {
      setIsRegister(true);
    }
  }, [searchParams]);

  // Form states
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [fullName, setFullName] = useState('');
  const [role, setRole] = useState<'student' | 'examiner' | 'admin'>('student');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      if (isRegister) {
        const res = await apiRegister(fullName, email, password, role);
        if (res.user.role === 'admin') router.push('/admin');
        else if (res.user.role === 'examiner') router.push('/examiner');
        else router.push('/student');
      } else {
        const res = await apiLogin(email, password);
        if (res.user.role === 'admin') router.push('/admin');
        else if (res.user.role === 'examiner') router.push('/examiner');
        else router.push('/student');
      }
    } catch (err: any) {
      setError(err.message || 'Xatolik yuz berdi');
    } finally {
      setLoading(false);
    }
  };

  const setDemoCredentials = (demoEmail: string, demoRole: 'student' | 'examiner' | 'admin') => {
    setEmail(demoEmail);
    setPassword('password123');
    setIsRegister(false);
    setError('');
  };

  return (
    <div className="max-w-md mx-auto my-10 p-6 sm:p-8 bg-white rounded-2xl border border-slate-200 shadow-sm">
      <div className="flex border-b border-slate-100 mb-6">
        <button
          onClick={() => { setIsRegister(false); setError(''); }}
          className={`flex-1 py-3 text-sm font-semibold text-center border-b-2 transition-all ${
            !isRegister
              ? 'border-emerald-600 text-emerald-700'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          <LogIn className="w-4 h-4 inline-block mr-1.5" />
          Tizimga Kirish
        </button>
        <button
          onClick={() => { setIsRegister(true); setError(''); }}
          className={`flex-1 py-3 text-sm font-semibold text-center border-b-2 transition-all ${
            isRegister
              ? 'border-emerald-600 text-emerald-700'
              : 'border-transparent text-slate-500 hover:text-slate-700'
          }`}
        >
          <UserPlus className="w-4 h-4 inline-block mr-1.5" />
          Ro‘yxatdan O‘tish
        </button>
      </div>

      {error && (
        <div className="mb-4 p-3 rounded-xl bg-rose-50 border border-rose-200 text-rose-700 text-xs flex items-center gap-2">
          <ShieldAlert className="w-4 h-4 flex-shrink-0" />
          <span>{error}</span>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        {isRegister && (
          <div>
            <label className="block text-xs font-semibold text-slate-700 mb-1">To‘liq Ismingiz</label>
            <input
              type="text"
              required
              value={fullName}
              onChange={(e) => setFullName(e.target.value)}
              placeholder="Masalan, Jasur Rustamov"
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500"
            />
          </div>
        )}

        <div>
          <label className="block text-xs font-semibold text-slate-700 mb-1">Email Manzil</label>
          <input
            type="email"
            required
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="misol@cefr.uz"
            className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500"
          />
        </div>

        <div>
          <label className="block text-xs font-semibold text-slate-700 mb-1">Parol</label>
          <input
            type="password"
            required
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="••••••••"
            className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500"
          />
        </div>

        {isRegister && (
          <div>
            <label className="block text-xs font-semibold text-slate-700 mb-1">Rolni tanlang</label>
            <select
              value={role}
              onChange={(e) => setRole(e.target.value as any)}
              className="w-full px-3.5 py-2.5 rounded-xl border border-slate-300 text-sm focus:outline-none focus:ring-2 focus:ring-emerald-500 bg-white"
            >
              <option value="student">Student (O‘quvchi)</option>
              <option value="examiner">Examiner (O‘qituvchi / Tekshiruvchi)</option>
              <option value="admin">Admin (Tizim boshqaruvchisi)</option>
            </select>
          </div>
        )}

        <button
          type="submit"
          disabled={loading}
          className="w-full py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold rounded-xl text-sm shadow-md transition-all disabled:opacity-50 mt-2"
        >
          {loading ? 'Bajarilmoqda...' : isRegister ? 'Ro‘yxatdan o‘tish' : 'Tizimga kirish'}
        </button>
      </form>

      {/* Demo helper */}
      <div className="mt-6 pt-5 border-t border-slate-100">
        <p className="text-xs text-slate-500 font-medium mb-2 text-center">Tayyor Demo hisoblarni tanlash:</p>
        <div className="flex flex-wrap gap-2 justify-center">
          <button
            type="button"
            onClick={() => setDemoCredentials('student@cefr.uz', 'student')}
            className="px-2.5 py-1 text-xs font-medium rounded-lg bg-emerald-50 text-emerald-800 hover:bg-emerald-100 transition-colors"
          >
            Student
          </button>
          <button
            type="button"
            onClick={() => setDemoCredentials('examiner@cefr.uz', 'examiner')}
            className="px-2.5 py-1 text-xs font-medium rounded-lg bg-indigo-50 text-indigo-800 hover:bg-indigo-100 transition-colors"
          >
            Examiner
          </button>
          <button
            type="button"
            onClick={() => setDemoCredentials('admin@cefr.uz', 'admin')}
            className="px-2.5 py-1 text-xs font-medium rounded-lg bg-slate-100 text-slate-800 hover:bg-slate-200 transition-colors"
          >
            Admin
          </button>
        </div>
      </div>
    </div>
  );
}

export default function LoginPage() {
  return (
    <Suspense fallback={<div className="py-20 text-center text-slate-500">Yuklanmoqda...</div>}>
      <LoginForm />
    </Suspense>
  );
}
