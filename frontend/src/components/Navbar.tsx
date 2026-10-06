'use client';

import React, { useEffect, useState, useRef } from 'react';
import Link from 'next/link';
import { useRouter, usePathname } from 'next/navigation';
import {
  ChevronDown,
  LogOut,
  User as UserIcon,
  Menu,
  X,
  Settings,
  CheckSquare,
} from 'lucide-react';
import { getCurrentStoredUser, removeToken, User } from '@/lib/api';
import ThemeToggle from '@/components/ThemeToggle';

export default function Navbar() {
  const router = useRouter();
  const pathname = usePathname();
  const [user, setUser] = useState<User | null>(null);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [accountMenuOpen, setAccountMenuOpen] = useState(false);
  const accountRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    setUser(getCurrentStoredUser());
    setMobileMenuOpen(false);
    setAccountMenuOpen(false);
  }, [pathname]);

  // Close account menu on outside click
  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (accountRef.current && !accountRef.current.contains(event.target as Node)) {
        setAccountMenuOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleLogout = () => {
    removeToken();
    setUser(null);
    setAccountMenuOpen(false);
    router.push('/login');
  };

  const cambridgeBooks = [21, 20, 19, 18, 17, 16, 15, 14, 13];

  return (
    <header className="sticky top-0 z-50 bg-[#fff5f3]/95 dark:bg-[#0f1117]/95 backdrop-blur-md border-b border-[#f5dedb] dark:border-slate-800/80 transition-colors">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-18 flex items-center justify-between gap-4">
        {/* Left: Brand Logo & Title */}
        <Link href="/" className="flex items-center gap-3 shrink-0 group">
          <div className="w-10 h-10 rounded-full bg-gradient-to-tr from-[#b83331] to-[#d94e4c] text-white flex items-center justify-center font-bold text-sm shadow-md ring-2 ring-white dark:ring-slate-800 transition-transform group-hover:scale-105">
            🎓
          </div>
          <div className="flex flex-col">
            <span className="text-lg sm:text-xl font-black tracking-tight text-[#2d1b1b] dark:text-white uppercase">
              IELTS <span className="text-[#b83331] dark:text-[#ff6b68]">MATERIALS</span>
            </span>
            <span className="text-[10px] font-bold text-[#8c6b68] dark:text-slate-400 tracking-wider hidden sm:block">
              CEFR & Cambridge Multi-Level
            </span>
          </div>
        </Link>

        {/* Center: Desktop Navigation Links with Clean Dropdowns Matching ieltsmaterials.uz */}
        <nav className="hidden lg:flex items-center gap-1 xl:gap-2 text-sm font-bold text-[#2d1b1b] dark:text-slate-200">
          {/* Home Dropdown */}
          <div className="relative group">
            <Link
              href="/"
              className={`px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1 ${
                pathname === '/' ? 'text-[#b83331] dark:text-[#ff6b68]' : ''
              }`}
            >
              <span>Home</span>
              <span className="text-[10px] opacity-75">▾</span>
            </Link>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-48 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-2 space-y-1">
                <Link
                  href="/"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Home
                </Link>
                <Link
                  href="/student"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All Practice Tests
                </Link>
              </div>
            </div>
          </div>

          {/* Listening Dropdown (Exact match to screenshot) */}
          <div className="relative group">
            <Link
              href="/student?tab=listening"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1"
            >
              <span>Listening</span>
              <span className="text-[10px] opacity-75">▾</span>
            </Link>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-52 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-3 space-y-1.5">
                <Link
                  href="/student?tab=listening"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All
                </Link>
                <Link
                  href="/student?tab=listening&section=Section 1"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Section 1
                </Link>
                <Link
                  href="/student?tab=listening&section=Section 2"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Section 2
                </Link>
                <Link
                  href="/student?tab=listening&section=Section 3"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Section 3
                </Link>
                <Link
                  href="/student?tab=listening&section=Section 4"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Section 4
                </Link>
                <Link
                  href="/student?tab=listening"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Full Listening
                </Link>
              </div>
            </div>
          </div>

          {/* Reading Dropdown */}
          <div className="relative group">
            <Link
              href="/student?tab=reading"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1"
            >
              <span>Reading</span>
              <span className="text-[10px] opacity-75">▾</span>
            </Link>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-52 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-3 space-y-1.5">
                <Link
                  href="/student?tab=reading"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All
                </Link>
                <Link
                  href="/student?tab=reading&section=Passage 1"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Passage 1
                </Link>
                <Link
                  href="/student?tab=reading&section=Passage 2"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Passage 2
                </Link>
                <Link
                  href="/student?tab=reading&section=Passage 3"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Passage 3
                </Link>
                <Link
                  href="/student?tab=reading"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Full Reading
                </Link>
              </div>
            </div>
          </div>

          {/* Speaking Dropdown */}
          <div className="relative group">
            <Link
              href="/student?tab=speaking"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1"
            >
              <span>Speaking</span>
              <span className="text-[10px] opacity-75">▾</span>
            </Link>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-52 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-3 space-y-1.5">
                <Link
                  href="/student?tab=speaking"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All
                </Link>
                <Link
                  href="/student?tab=speaking&section=Part 1"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Part 1
                </Link>
                <Link
                  href="/student?tab=speaking&section=Part 2"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Part 2
                </Link>
                <Link
                  href="/student?tab=speaking&section=Part 3"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Part 3
                </Link>
                <Link
                  href="/student?tab=speaking"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Full Speaking
                </Link>
              </div>
            </div>
          </div>

          {/* Writing Dropdown */}
          <div className="relative group">
            <Link
              href="/student?tab=writing"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1"
            >
              <span>Writing</span>
              <span className="text-[10px] opacity-75">▾</span>
            </Link>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-52 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-3 space-y-1.5">
                <Link
                  href="/student?tab=writing"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All
                </Link>
                <Link
                  href="/student?tab=writing&section=Task 1"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Task 1
                </Link>
                <Link
                  href="/student?tab=writing&section=Task 2"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Task 2
                </Link>
                <Link
                  href="/student?tab=writing"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Full Writing
                </Link>
              </div>
            </div>
          </div>

          {/* Mock Dropdown */}
          <div className="relative group">
            <Link
              href="/student?tab=mock"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1"
            >
              <span>Mock</span>
              <span className="text-[10px] opacity-75">▾</span>
            </Link>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-52 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-3 space-y-1.5">
                <Link
                  href="/student?tab=mock"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All
                </Link>
                <Link
                  href="/student?tab=mock"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Full Mock Exam
                </Link>
                <Link
                  href="/student?tab=mock"
                  className="block px-5 py-2 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  Timed Simulation
                </Link>
              </div>
            </div>
          </div>

          {/* Books Dropdown */}
          <div className="relative group">
            <button className="px-3 py-2.5 rounded-lg transition-colors hover:text-[#b83331] dark:hover:text-[#ff6b68] flex items-center gap-1 cursor-pointer">
              <span>Books</span>
              <span className="text-[10px] opacity-75">▾</span>
            </button>
            <div className="absolute left-0 top-full pt-0 opacity-0 translate-y-1 pointer-events-none group-hover:opacity-100 group-hover:translate-y-0 group-hover:pointer-events-auto transition-all duration-150 z-50">
              <div className="w-52 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 shadow-xl py-3 space-y-1.5 max-h-[360px] overflow-y-auto">
                <Link
                  href="/student?book=all"
                  className="block px-5 py-1.5 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                >
                  All Books
                </Link>
                {cambridgeBooks.map((b) => (
                  <Link
                    key={b}
                    href={`/student?book=${b}`}
                    className="block px-5 py-1.5 text-xs sm:text-sm font-bold text-[#2d1b1b] dark:text-slate-200 hover:text-[#b83331] dark:hover:text-[#ff6b68] hover:bg-[#faeae7] dark:hover:bg-slate-800/60 transition-colors"
                  >
                    Cambridge {b}
                  </Link>
                ))}
              </div>
            </div>
          </div>

          {/* Admin & Examiner quick links */}
          {user?.role === 'admin' && (
            <Link
              href="/admin"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-purple-600 flex items-center gap-1 text-purple-700 dark:text-purple-400 font-bold"
            >
              <Settings className="w-3.5 h-3.5" />
              <span>Admin</span>
            </Link>
          )}

          {user?.role === 'examiner' && (
            <Link
              href="/examiner"
              className="px-3 py-2.5 rounded-lg transition-colors hover:text-indigo-600 flex items-center gap-1 text-indigo-700 dark:text-indigo-400 font-bold"
            >
              <CheckSquare className="w-3.5 h-3.5" />
              <span>Examiner</span>
            </Link>
          )}
        </nav>

        {/* Right: Account Button & Theme Toggle */}
        <div className="flex items-center gap-3">
          <ThemeToggle />

          {/* ACCOUNT Button (Coral Red pill button) */}
          <div className="relative" ref={accountRef}>
            {user ? (
              <div>
                <button
                  onClick={() => setAccountMenuOpen(!accountMenuOpen)}
                  className="bg-[#b83331] hover:bg-[#a02c2a] active:scale-95 text-white font-black text-xs uppercase tracking-wider px-5 py-2.5 rounded-full shadow-md shadow-rose-900/15 flex items-center gap-2 transition-all cursor-pointer"
                >
                  <span>ACCOUNT</span>
                  <span className="text-[10px] opacity-75">▾</span>
                </button>

                {/* Account Popover Menu */}
                {accountMenuOpen && (
                  <div className="absolute right-0 top-full mt-2 w-64 bg-[#fff5f3] dark:bg-[#161822] border-t-2 border-[#b83331] border-x border-b border-[#f3d9d6] dark:border-slate-800 rounded-b-2xl shadow-2xl p-4 space-y-3 z-50 animate-in fade-in zoom-in-95 duration-150">
                    <div className="pb-3 border-b border-slate-200/80 dark:border-slate-800">
                      <div className="font-extrabold text-sm text-[#2d1b1b] dark:text-white truncate">
                        {user.full_name || 'Foydalanuvchi'}
                      </div>
                      <div className="text-xs text-slate-500 truncate">{user.email}</div>
                      <div className="mt-2">
                        <span className="px-2.5 py-0.5 rounded-md text-[10px] font-black uppercase bg-white dark:bg-slate-800 text-[#b83331] dark:text-[#ff6b68] border border-[#fae2df] dark:border-slate-700">
                          {user.role}
                        </span>
                      </div>
                    </div>

                    <div className="space-y-1 text-xs font-bold text-slate-700 dark:text-slate-200">
                      <Link
                        href="/student"
                        onClick={() => setAccountMenuOpen(false)}
                        className="p-2 rounded-xl hover:bg-white dark:hover:bg-slate-800 flex items-center gap-2 transition-colors"
                      >
                        <span>Mening Imtihonlarim</span>
                      </Link>

                      {user.role === 'admin' && (
                        <Link
                          href="/admin"
                          onClick={() => setAccountMenuOpen(false)}
                          className="p-2 rounded-xl hover:bg-purple-50 dark:hover:bg-purple-950/40 flex items-center gap-2 text-purple-700 dark:text-purple-300 transition-colors"
                        >
                          <Settings className="w-4 h-4" />
                          <span>Admin Boshqaruv</span>
                        </Link>
                      )}

                      {user.role === 'examiner' && (
                        <Link
                          href="/examiner"
                          onClick={() => setAccountMenuOpen(false)}
                          className="p-2 rounded-xl hover:bg-indigo-50 dark:hover:bg-indigo-950/40 flex items-center gap-2 text-indigo-700 dark:text-indigo-300 transition-colors"
                        >
                          <CheckSquare className="w-4 h-4" />
                          <span>Examiner Tekshirish</span>
                        </Link>
                      )}

                      <button
                        onClick={handleLogout}
                        className="w-full p-2 rounded-xl text-left hover:bg-rose-50 dark:hover:bg-rose-950/40 text-rose-600 dark:text-rose-400 flex items-center gap-2 transition-colors pt-2 border-t border-slate-200 dark:border-slate-800"
                      >
                        <LogOut className="w-4 h-4" />
                        <span>Tizimdan Chiqish</span>
                      </button>
                    </div>
                  </div>
                )}
              </div>
            ) : (
              <Link
                href="/login"
                className="bg-[#b83331] hover:bg-[#a02c2a] active:scale-95 text-white font-black text-xs uppercase tracking-wider px-6 py-2.5 rounded-full shadow-md shadow-rose-900/15 transition-all inline-block"
              >
                ACCOUNT
              </Link>
            )}
          </div>

          {/* Mobile Hamburger Button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="lg:hidden p-2 rounded-xl bg-white dark:bg-slate-800 border border-[#f5dedb] dark:border-slate-700 text-slate-700 dark:text-slate-200 cursor-pointer"
            aria-label="Toggle Menu"
          >
            {mobileMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>
      </div>

      {/* Mobile Drawer Menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden border-t border-[#f5dedb] dark:border-slate-800 bg-[#fff5f3] dark:bg-slate-900 p-4 space-y-3 animate-in slide-in-from-top-2 duration-200">
          <div className="grid grid-cols-2 gap-2 text-xs font-bold">
            <Link
              href="/"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-white dark:bg-slate-800 text-center text-slate-800 dark:text-slate-200 border border-[#f5dedb] dark:border-slate-700"
            >
              Home
            </Link>
            <Link
              href="/student?tab=listening"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-white dark:bg-slate-800 text-center text-slate-800 dark:text-slate-200 border border-[#f5dedb] dark:border-slate-700"
            >
              Listening
            </Link>
            <Link
              href="/student?tab=reading"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-white dark:bg-slate-800 text-center text-slate-800 dark:text-slate-200 border border-[#f5dedb] dark:border-slate-700"
            >
              Reading
            </Link>
            <Link
              href="/student?tab=speaking"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-white dark:bg-slate-800 text-center text-slate-800 dark:text-slate-200 border border-[#f5dedb] dark:border-slate-700"
            >
              Speaking
            </Link>
            <Link
              href="/student?tab=writing"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-white dark:bg-slate-800 text-center text-slate-800 dark:text-slate-200 border border-[#f5dedb] dark:border-slate-700"
            >
              Writing
            </Link>
            <Link
              href="/student?tab=mock"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-white dark:bg-slate-800 text-center text-slate-800 dark:text-slate-200 border border-[#f5dedb] dark:border-slate-700"
            >
              Mock
            </Link>
          </div>

          <div className="pt-2">
            <span className="text-[11px] font-bold text-slate-500 uppercase block mb-1.5">
              Cambridge Kitoblari
            </span>
            <div className="flex flex-wrap gap-1.5">
              {cambridgeBooks.map((b) => (
                <Link
                  key={b}
                  href={`/student?book=${b}`}
                  onClick={() => setMobileMenuOpen(false)}
                  className="px-2.5 py-1 rounded-lg bg-white dark:bg-slate-800 text-slate-700 dark:text-slate-300 text-xs font-semibold border border-[#f5dedb] dark:border-slate-700"
                >
                  Book {b}
                </Link>
              ))}
            </div>
          </div>
        </div>
      )}
    </header>
  );
}
