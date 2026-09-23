'use client';

import React, { useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter, usePathname } from 'next/navigation';
import { Award, BookOpen, CheckSquare, Settings, LogOut, User as UserIcon } from 'lucide-react';
import { getCurrentStoredUser, removeToken, User } from '@/lib/api';

export default function Navbar() {
  const router = useRouter();
  const pathname = usePathname();
  const [user, setUser] = useState<User | null>(null);

  useEffect(() => {
    setUser(getCurrentStoredUser());
  }, [pathname]);

  const handleLogout = () => {
    removeToken();
    setUser(null);
    router.push('/login');
  };

  return (
    <header className="bg-white border-b border-slate-200 sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        {/* Brand Logo */}
        <Link href="/" className="flex items-center gap-2">
          <div className="w-10 h-10 rounded-xl bg-emerald-600 flex items-center justify-center text-white font-bold shadow-md shadow-emerald-200">
            <Award className="w-6 h-6" />
          </div>
          <div>
            <span className="text-xl font-bold text-slate-900 tracking-tight">CEFR</span>
            <span className="text-xs font-semibold text-emerald-600 ml-1.5 uppercase px-2 py-0.5 bg-emerald-50 rounded-full border border-emerald-200">
              Mock Platform
            </span>
          </div>
        </Link>

        {/* Navigation Links */}
        <nav className="hidden md:flex items-center gap-1 text-sm font-medium">
          <Link
            href="/student"
            className={`px-3.5 py-2 rounded-lg transition-colors flex items-center gap-1.5 ${
              pathname.startsWith('/student')
                ? 'bg-emerald-50 text-emerald-700 font-semibold'
                : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
            }`}
          >
            <BookOpen className="w-4 h-4" />
            Testlar (Student)
          </Link>

          {(user?.role === 'examiner' || user?.role === 'admin') && (
            <Link
              href="/examiner"
              className={`px-3.5 py-2 rounded-lg transition-colors flex items-center gap-1.5 ${
                pathname.startsWith('/examiner')
                  ? 'bg-emerald-50 text-emerald-700 font-semibold'
                  : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <CheckSquare className="w-4 h-4" />
              Tekshirish (Examiner)
            </Link>
          )}

          {user?.role === 'admin' && (
            <Link
              href="/admin"
              className={`px-3.5 py-2 rounded-lg transition-colors flex items-center gap-1.5 ${
                pathname.startsWith('/admin')
                  ? 'bg-emerald-50 text-emerald-700 font-semibold'
                  : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <Settings className="w-4 h-4" />
              Boshqaruv (Admin)
            </Link>
          )}
        </nav>

        {/* User profile & Actions */}
        <div className="flex items-center gap-3">
          {user ? (
            <div className="flex items-center gap-3">
              <div className="text-right hidden sm:block">
                <div className="text-sm font-semibold text-slate-800">{user.full_name}</div>
                <div className="text-xs text-slate-500 capitalize flex items-center justify-end gap-1">
                  <span className="w-2 h-2 rounded-full bg-emerald-500"></span>
                  {user.role}
                </div>
              </div>

              <button
                onClick={handleLogout}
                className="p-2 text-slate-500 hover:text-rose-600 hover:bg-rose-50 rounded-lg transition-colors title='Chiqish'"
                title="Tizimdan chiqish"
              >
                <LogOut className="w-5 h-5" />
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-2">
              <Link
                href="/login"
                className="px-4 py-2 text-sm font-medium text-slate-700 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-colors"
              >
                Kirish
              </Link>
              <Link
                href="/login?tab=register"
                className="px-4 py-2 text-sm font-semibold text-white bg-emerald-600 hover:bg-emerald-700 rounded-lg shadow-sm transition-colors"
              >
                Ro‘yxatdan o‘tish
              </Link>
            </div>
          )}
        </div>
      </div>
    </header>
  );
}
