'use client';

import React, { useEffect, useState } from 'react';
import Link from 'next/link';
import { useRouter, usePathname } from 'next/navigation';
import { Award, BookOpen, CheckSquare, Settings, LogOut, User as UserIcon } from 'lucide-react';
import { getCurrentStoredUser, removeToken, User } from '@/lib/api';
import ThemeToggle from '@/components/ThemeToggle';

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
    <header className="glass-nav sticky top-0 z-50 transition-all">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        {/* Brand Logo */}
        <Link href="/" className="flex items-center gap-3 group">
          <div className="w-10 h-10 rounded-xl bg-gradient-to-tr from-emerald-600 to-teal-500 flex items-center justify-center text-white font-bold shadow-md shadow-emerald-500/25 ring-1 ring-emerald-400/30 transition-transform group-hover:scale-105">
            <Award className="w-5 h-5 text-white" />
          </div>
          <div className="flex flex-col">
            <div className="flex items-center gap-1.5">
              <span className="text-xl font-extrabold text-slate-900 dark:text-white tracking-tight group-hover:text-emerald-700 dark:group-hover:text-emerald-400 transition-colors">
                CEFR<span className="text-emerald-600 dark:text-emerald-400">.uz</span>
              </span>
              <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-300 uppercase px-2 py-0.5 bg-emerald-50 dark:bg-emerald-950/60 rounded-full border border-emerald-200/80 dark:border-emerald-800 shadow-xs">
                Official Mock
              </span>
            </div>
            <span className="text-[11px] font-medium text-slate-500 dark:text-slate-400 hidden sm:inline">
              Cambridge 13–21 & Multi-level
            </span>
          </div>
        </Link>

        {/* Navigation Links */}
        <nav className="hidden md:flex items-center gap-1 text-sm font-medium bg-slate-100/70 dark:bg-slate-800/80 p-1 rounded-xl border border-slate-200/60 dark:border-slate-700/60">
          <Link
            href="/student"
            className={`px-3.5 py-1.5 rounded-lg transition-all flex items-center gap-2 ${
              pathname.startsWith('/student')
                ? 'bg-white dark:bg-slate-700 text-emerald-700 dark:text-emerald-400 font-bold shadow-xs'
                : 'text-slate-600 dark:text-slate-300 hover:text-slate-900 dark:hover:text-white hover:bg-white/50 dark:hover:bg-slate-700/50'
            }`}
          >
            <BookOpen className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
            <span>Testlar</span>
          </Link>

          {(user?.role === 'examiner' || user?.role === 'admin') && (
            <Link
              href="/examiner"
              className={`px-3.5 py-1.5 rounded-lg transition-all flex items-center gap-2 ${
                pathname.startsWith('/examiner')
                  ? 'bg-white dark:bg-slate-700 text-emerald-700 dark:text-emerald-400 font-bold shadow-xs'
                  : 'text-slate-600 dark:text-slate-300 hover:text-slate-900 dark:hover:text-white hover:bg-white/50 dark:hover:bg-slate-700/50'
              }`}
            >
              <CheckSquare className="w-4 h-4 text-teal-600 dark:text-teal-400" />
              <span>Tekshirish</span>
            </Link>
          )}

          {user?.role === 'admin' && (
            <Link
              href="/admin"
              className={`px-3.5 py-1.5 rounded-lg transition-all flex items-center gap-2 ${
                pathname.startsWith('/admin')
                  ? 'bg-white dark:bg-slate-700 text-emerald-700 dark:text-emerald-400 font-bold shadow-xs'
                  : 'text-slate-600 dark:text-slate-300 hover:text-slate-900 dark:hover:text-white hover:bg-white/50 dark:hover:bg-slate-700/50'
              }`}
            >
              <Settings className="w-4 h-4 text-slate-700 dark:text-slate-300" />
              <span>Boshqaruv</span>
            </Link>
          )}
        </nav>

        {/* User profile, Theme Toggle & Actions */}
        <div className="flex items-center gap-2.5 sm:gap-3">
          {/* Tungi/Kunduzgi rejim tugmasi */}
          <ThemeToggle />

          {user ? (
            <div className="flex items-center gap-2.5">
              <div className="flex items-center gap-2.5 bg-slate-50 dark:bg-slate-800/90 border border-slate-200/80 dark:border-slate-700 px-3 py-1.5 rounded-xl">
                <div className="w-8 h-8 rounded-lg bg-gradient-to-tr from-emerald-600 to-teal-600 text-white flex items-center justify-center text-xs font-bold shadow-xs uppercase">
                  {user.full_name?.charAt(0) || 'U'}
                </div>
                <div className="text-left hidden sm:block">
                  <div className="text-xs font-bold text-slate-800 dark:text-slate-200 leading-tight">{user.full_name}</div>
                  <div className="text-[10px] font-semibold text-emerald-600 dark:text-emerald-400 capitalize flex items-center gap-1">
                    <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 animate-pulse"></span>
                    {user.role}
                  </div>
                </div>
              </div>

              <button
                onClick={handleLogout}
                className="p-2 text-slate-400 hover:text-rose-600 dark:hover:text-rose-400 hover:bg-rose-50 dark:hover:bg-rose-950/40 rounded-xl transition-all border border-transparent hover:border-rose-100 dark:hover:border-rose-900/50"
                title="Tizimdan chiqish"
              >
                <LogOut className="w-4 h-4" />
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-2">
              <Link
                href="/login"
                className="px-3 sm:px-4 py-2 text-sm font-semibold text-slate-700 dark:text-slate-200 hover:text-slate-900 dark:hover:text-white hover:bg-slate-100 dark:hover:bg-slate-800 rounded-xl transition-all"
              >
                Kirish
              </Link>
              <Link
                href="/login?tab=register"
                className="px-3 sm:px-4 py-2 text-sm font-bold text-white bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 rounded-xl shadow-sm shadow-emerald-600/20 transition-all hover:shadow-md"
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
