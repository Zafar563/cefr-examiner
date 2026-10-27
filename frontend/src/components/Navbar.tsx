'use client';

import React, { useEffect, useState, useRef, Suspense } from 'react';
import Link from 'next/link';
import { useRouter, usePathname, useSearchParams } from 'next/navigation';
import {
  LogOut,
  Menu,
  X,
  Settings,
  Headphones,
  BookOpen,
  Mic,
  PenTool,
  Sparkles,
  Home as HomeIcon,
  User as UserIcon,
} from 'lucide-react';
import { getCurrentStoredUser, removeToken, User } from '@/lib/api';
import ThemeToggle from '@/components/ThemeToggle';

function NavbarContent() {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const [user, setUser] = useState<User | null>(null);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const [accountMenuOpen, setAccountMenuOpen] = useState(false);
  const [readingMenuOpen, setReadingMenuOpen] = useState(false);
  const [listeningMenuOpen, setListeningMenuOpen] = useState(false);
  const [speakingMenuOpen, setSpeakingMenuOpen] = useState(false);
  const [writingMenuOpen, setWritingMenuOpen] = useState(false);
  const [mockMenuOpen, setMockMenuOpen] = useState(false);

  const accountRef = useRef<HTMLDivElement>(null);
  const readingRef = useRef<HTMLDivElement>(null);
  const listeningRef = useRef<HTMLDivElement>(null);
  const speakingRef = useRef<HTMLDivElement>(null);
  const writingRef = useRef<HTMLDivElement>(null);
  const mockRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    setUser(getCurrentStoredUser());
    setMobileMenuOpen(false);
    setAccountMenuOpen(false);
    setReadingMenuOpen(false);
    setListeningMenuOpen(false);
    setSpeakingMenuOpen(false);
    setWritingMenuOpen(false);
    setMockMenuOpen(false);
  }, [pathname, searchParams]);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (accountRef.current && !accountRef.current.contains(event.target as Node)) {
        setAccountMenuOpen(false);
      }
      if (readingRef.current && !readingRef.current.contains(event.target as Node)) {
        setReadingMenuOpen(false);
      }
      if (listeningRef.current && !listeningRef.current.contains(event.target as Node)) {
        setListeningMenuOpen(false);
      }
      if (speakingRef.current && !speakingRef.current.contains(event.target as Node)) {
        setSpeakingMenuOpen(false);
      }
      if (writingRef.current && !writingRef.current.contains(event.target as Node)) {
        setWritingMenuOpen(false);
      }
      if (mockRef.current && !mockRef.current.contains(event.target as Node)) {
        setMockMenuOpen(false);
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

  // Determine active tab
  const isStudentPage = pathname === '/student';
  const currentTab = isStudentPage ? (searchParams.get('tab') || 'listening') : null;
  const isHome = pathname === '/';

  const navItems = [
    {
      id: 'home',
      label: 'Home',
      href: '/',
      icon: HomeIcon,
      isActive: isHome,
      activeClass: 'bg-indigo-50 dark:bg-indigo-950/70 text-indigo-600 dark:text-indigo-400 font-extrabold ring-1 ring-indigo-500/20 shadow-xs',
      hoverClass: 'hover:text-indigo-600 dark:hover:text-indigo-400 hover:bg-indigo-50/50 dark:hover:bg-indigo-950/30',
    },
    {
      id: 'listening',
      label: 'Listening',
      href: '/student?tab=listening',
      icon: Headphones,
      isActive: currentTab === 'listening',
      activeClass: 'bg-cyan-50 dark:bg-cyan-950/70 text-[#0a5c6e] dark:text-cyan-400 font-extrabold ring-1 ring-[#0a5c6e]/20 shadow-xs',
      hoverClass: 'hover:text-[#0a5c6e] dark:hover:text-cyan-400 hover:bg-cyan-50/50 dark:hover:bg-cyan-950/30',
    },
    {
      id: 'reading',
      label: 'Reading',
      href: '/student?tab=reading',
      icon: BookOpen,
      isActive: currentTab === 'reading',
      activeClass: 'bg-blue-50 dark:bg-blue-950/70 text-[#1967d2] dark:text-blue-400 font-extrabold ring-1 ring-blue-500/20 shadow-xs',
      hoverClass: 'hover:text-[#1967d2] dark:hover:text-blue-400 hover:bg-blue-50/50 dark:hover:bg-blue-950/30',
    },
    {
      id: 'speaking',
      label: 'Speaking',
      href: '/student?tab=speaking',
      icon: Mic,
      isActive: currentTab === 'speaking',
      activeClass: 'bg-emerald-50 dark:bg-emerald-950/70 text-emerald-600 dark:text-emerald-400 font-extrabold ring-1 ring-emerald-500/20 shadow-xs',
      hoverClass: 'hover:text-emerald-600 dark:hover:text-emerald-400 hover:bg-emerald-50/50 dark:hover:bg-emerald-950/30',
    },
    {
      id: 'writing',
      label: 'Writing',
      href: '/student?tab=writing',
      icon: PenTool,
      isActive: currentTab === 'writing',
      activeClass: 'bg-rose-50 dark:bg-rose-950/70 text-[#7a2259] dark:text-rose-400 font-extrabold ring-1 ring-[#7a2259]/20 shadow-xs',
      hoverClass: 'hover:text-[#7a2259] dark:hover:text-rose-400 hover:bg-rose-50/50 dark:hover:bg-rose-950/30',
    },
    {
      id: 'mock',
      label: 'Mock',
      href: '/student?tab=mock',
      icon: Sparkles,
      isActive: currentTab === 'mock',
      activeClass: 'bg-amber-50 dark:bg-amber-950/70 text-amber-600 dark:text-amber-400 font-extrabold ring-1 ring-amber-500/20 shadow-xs',
      hoverClass: 'hover:text-amber-600 dark:hover:text-amber-400 hover:bg-amber-50/50 dark:hover:bg-amber-950/30',
    },
  ];

  return (
    <header className="sticky top-0 z-50 bg-white/80 dark:bg-[#0b1120]/80 backdrop-blur-xl border-b border-slate-200/60 dark:border-white/10 shadow-xs transition-colors">
      <div className="w-full px-4 sm:px-6 lg:px-8 xl:px-12 h-20 flex items-center justify-between gap-4">
        {/* Left: Brand Logo & Title */}
        <Link href="/" className="flex items-center gap-3.5 shrink-0 group">
          <div className="w-12 h-12 rounded-2xl bg-white dark:bg-slate-800 p-1 shadow-md ring-2 ring-slate-200 dark:ring-slate-700 transition-transform group-hover:scale-105 flex items-center justify-center overflow-hidden">
            <img
              src="/logo.png"
              alt="CEFR MATERIALS"
              className="w-full h-full object-contain dark:hidden"
            />
            <img
              src="/logo-dark.png"
              alt="CEFR MATERIALS"
              className="w-full h-full object-contain hidden dark:block"
            />
          </div>
          <div className="flex flex-col">
            <span className="text-xl sm:text-2xl font-black tracking-tight text-slate-900 dark:text-white uppercase leading-tight">
              CEFR <span className="text-emerald-600 dark:text-amber-400">MATERIALS</span>
            </span>
            <span className="text-xs font-bold text-slate-500 dark:text-slate-400 tracking-wide mt-0.5 hidden sm:block">
              Practice & Assessment
            </span>
          </div>
        </Link>

        {/* Center: Desktop Navigation Tabs with Dropdowns */}
        <nav className="hidden lg:flex items-center gap-1.5 xl:gap-2 text-base font-bold text-slate-700 dark:text-slate-200">
          {navItems.map((item) => {
            const Icon = item.icon;

            // Listening Dropdown
            if (item.id === 'listening') {
              return (
                <div
                  key={item.id}
                  ref={listeningRef}
                  className="relative"
                  onMouseEnter={() => setListeningMenuOpen(true)}
                  onMouseLeave={() => setListeningMenuOpen(false)}
                >
                  <Link
                    href={item.href}
                    className={`px-4 py-2.5 rounded-xl text-sm xl:text-[15px] font-extrabold transition-all flex items-center gap-1.5 cursor-pointer ${
                      item.isActive
                        ? item.activeClass
                        : `text-slate-700 dark:text-slate-300 ${item.hoverClass}`
                    }`}
                  >
                    <Icon className="w-4.5 h-4.5 shrink-0" />
                    <span>{item.label}</span>
                    <span className="text-xs transition-transform duration-200">▾</span>
                  </Link>

                  {listeningMenuOpen && (
                    <div className="absolute left-0 top-full pt-1.5 z-50 min-w-[195px] animate-in fade-in slide-in-from-top-1 duration-150">
                      <div className="bg-white dark:bg-[#1e293b] rounded-2xl shadow-2xl border border-slate-200/90 dark:border-slate-700/80 py-1.5 overflow-hidden">
                        {[
                          { label: 'Section 1', href: '/student?tab=listening&section=1' },
                          { label: 'Section 2', href: '/student?tab=listening&section=2' },
                          { label: 'Section 3', href: '/student?tab=listening&section=3' },
                          { label: 'Section 4', href: '/student?tab=listening&section=4' },
                          { label: 'Full Listening', href: '/student?tab=listening&section=full' },
                        ].map((sub) => (
                          <Link
                            key={sub.label}
                            href={sub.href}
                            onClick={() => setListeningMenuOpen(false)}
                            className="block px-4 py-2.5 text-sm font-extrabold text-slate-800 dark:text-slate-200 hover:bg-cyan-50 dark:hover:bg-cyan-950/50 hover:text-[#0a5c6e] dark:hover:text-cyan-400 transition-colors"
                          >
                            {sub.label}
                          </Link>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            }

            // Reading Dropdown
            if (item.id === 'reading') {
              return (
                <div
                  key={item.id}
                  ref={readingRef}
                  className="relative"
                  onMouseEnter={() => setReadingMenuOpen(true)}
                  onMouseLeave={() => setReadingMenuOpen(false)}
                >
                  <Link
                    href={item.href}
                    className={`px-4 py-2.5 rounded-xl text-sm xl:text-[15px] font-extrabold transition-all flex items-center gap-1.5 cursor-pointer ${
                      item.isActive
                        ? item.activeClass
                        : `text-slate-700 dark:text-slate-300 ${item.hoverClass}`
                    }`}
                  >
                    <Icon className="w-4.5 h-4.5 shrink-0" />
                    <span>{item.label}</span>
                    <span className="text-xs transition-transform duration-200">▾</span>
                  </Link>

                  {readingMenuOpen && (
                    <div className="absolute left-0 top-full pt-1.5 z-50 min-w-[195px] animate-in fade-in slide-in-from-top-1 duration-150">
                      <div className="bg-white dark:bg-[#1e293b] rounded-2xl shadow-2xl border border-slate-200/90 dark:border-slate-700/80 py-1.5 overflow-hidden">
                        {[
                          { label: 'Passage 1', href: '/student?tab=reading&passage=1' },
                          { label: 'Passage 2', href: '/student?tab=reading&passage=2' },
                          { label: 'Passage 3', href: '/student?tab=reading&passage=3' },
                          { label: 'Full Reading', href: '/student?tab=reading&passage=full' },
                        ].map((sub) => (
                          <Link
                            key={sub.label}
                            href={sub.href}
                            onClick={() => setReadingMenuOpen(false)}
                            className="block px-4 py-2.5 text-sm font-extrabold text-slate-800 dark:text-slate-200 hover:bg-blue-50 dark:hover:bg-blue-950/50 hover:text-blue-600 dark:hover:text-blue-400 transition-colors"
                          >
                            {sub.label}
                          </Link>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            }

            // Speaking Dropdown
            if (item.id === 'speaking') {
              return (
                <div
                  key={item.id}
                  ref={speakingRef}
                  className="relative"
                  onMouseEnter={() => setSpeakingMenuOpen(true)}
                  onMouseLeave={() => setSpeakingMenuOpen(false)}
                >
                  <Link
                    href={item.href}
                    className={`px-4 py-2.5 rounded-xl text-sm xl:text-[15px] font-extrabold transition-all flex items-center gap-1.5 cursor-pointer ${
                      item.isActive
                        ? item.activeClass
                        : `text-slate-700 dark:text-slate-300 ${item.hoverClass}`
                    }`}
                  >
                    <Icon className="w-4.5 h-4.5 shrink-0" />
                    <span>{item.label}</span>
                    <span className="text-xs transition-transform duration-200">▾</span>
                  </Link>

                  {speakingMenuOpen && (
                    <div className="absolute left-0 top-full pt-1.5 z-50 min-w-[195px] animate-in fade-in slide-in-from-top-1 duration-150">
                      <div className="bg-white dark:bg-[#1e293b] rounded-2xl shadow-2xl border border-slate-200/90 dark:border-slate-700/80 py-1.5 overflow-hidden">
                        {[
                          { label: 'Speaking partner', href: '/student?tab=speaking&mode=partner' },
                          { label: 'Part 1 · Interview', href: '/student?tab=speaking&part=1' },
                          { label: 'Part 2 · Cue card', href: '/student?tab=speaking&part=2' },
                          { label: 'Part 3 · Discussion', href: '/student?tab=speaking&part=3' },
                          { label: 'My recordings', href: '/student?tab=speaking&mode=recordings' },
                        ].map((sub) => (
                          <Link
                            key={sub.label}
                            href={sub.href}
                            onClick={() => setSpeakingMenuOpen(false)}
                            className="block px-4 py-2.5 text-sm font-extrabold text-slate-800 dark:text-slate-200 hover:bg-emerald-50 dark:hover:bg-emerald-950/50 hover:text-emerald-600 dark:hover:text-emerald-400 transition-colors"
                          >
                            {sub.label}
                          </Link>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            }

            // Writing Dropdown (Matching Image 2)
            if (item.id === 'writing') {
              return (
                <div
                  key={item.id}
                  ref={writingRef}
                  className="relative"
                  onMouseEnter={() => setWritingMenuOpen(true)}
                  onMouseLeave={() => setWritingMenuOpen(false)}
                >
                  <Link
                    href={item.href}
                    className={`px-4 py-2.5 rounded-xl text-sm xl:text-[15px] font-extrabold transition-all flex items-center gap-1.5 cursor-pointer ${
                      item.isActive
                        ? item.activeClass
                        : `text-slate-700 dark:text-slate-300 ${item.hoverClass}`
                    }`}
                  >
                    <Icon className="w-4.5 h-4.5 shrink-0" />
                    <span>{item.label}</span>
                    <span className="text-xs transition-transform duration-200">▾</span>
                  </Link>

                  {writingMenuOpen && (
                    <div className="absolute left-0 top-full pt-1.5 z-50 min-w-[195px] animate-in fade-in slide-in-from-top-1 duration-150">
                      <div className="bg-white dark:bg-[#1e293b] rounded-2xl shadow-2xl border border-slate-200/90 dark:border-slate-700/80 py-1.5 overflow-hidden">
                        {[
                          { label: 'Task 1 Reports', href: '/student?tab=writing&task=1' },
                          { label: 'Task 2 Essays', href: '/student?tab=writing&task=2' },
                          { label: 'Band Feedback', href: '/student?tab=writing&mode=feedback' },
                        ].map((sub) => (
                          <Link
                            key={sub.label}
                            href={sub.href}
                            onClick={() => setWritingMenuOpen(false)}
                            className="block px-4 py-2.5 text-sm font-extrabold text-slate-800 dark:text-slate-200 hover:bg-rose-50 dark:hover:bg-rose-950/50 hover:text-[#7a2259] dark:hover:text-rose-400 transition-colors"
                          >
                            {sub.label}
                          </Link>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            }

            // Mock Dropdown (Matching user screenshot)
            if (item.id === 'mock') {
              return (
                <div
                  key={item.id}
                  ref={mockRef}
                  className="relative"
                  onMouseEnter={() => setMockMenuOpen(true)}
                  onMouseLeave={() => setMockMenuOpen(false)}
                >
                  <Link
                    href={item.href}
                    className={`px-4 py-2.5 rounded-xl text-sm xl:text-[15px] font-extrabold transition-all flex items-center gap-1.5 cursor-pointer ${
                      item.isActive
                        ? item.activeClass
                        : `text-slate-700 dark:text-slate-300 ${item.hoverClass}`
                    }`}
                  >
                    <Icon className="w-4.5 h-4.5 shrink-0" />
                    <span>{item.label}</span>
                    <span className="text-xs transition-transform duration-200">▾</span>
                  </Link>

                  {mockMenuOpen && (
                    <div className="absolute left-0 top-full pt-1.5 z-50 min-w-[180px] animate-in fade-in slide-in-from-top-1 duration-150">
                      <div className="bg-white dark:bg-[#1e293b] rounded-2xl shadow-2xl border border-slate-200/90 dark:border-slate-700/80 py-1.5 overflow-hidden">
                        {[
                          { label: 'Full Mock', href: '/student?tab=mock' },
                          { label: 'Mock Results', href: '/student?tab=mock&mode=results' },
                        ].map((sub) => (
                          <Link
                            key={sub.label}
                            href={sub.href}
                            onClick={() => setMockMenuOpen(false)}
                            className="block px-4 py-2.5 text-sm font-extrabold text-slate-800 dark:text-slate-200 hover:bg-amber-50 dark:hover:bg-amber-950/50 hover:text-amber-600 dark:hover:text-amber-400 transition-colors"
                          >
                            {sub.label}
                          </Link>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            }

            return (
              <Link
                key={item.id}
                href={item.href}
                className={`px-4 py-2.5 rounded-xl text-sm xl:text-[15px] font-extrabold transition-all flex items-center gap-2 cursor-pointer ${
                  item.isActive
                    ? item.activeClass
                    : `text-slate-700 dark:text-slate-300 ${item.hoverClass}`
                }`}
              >
                <Icon className="w-4.5 h-4.5 shrink-0" />
                <span>{item.label}</span>
              </Link>
            );
          })}

          {/* Admin quick links */}
          {user?.role === 'admin' && (
            <Link
              href="/admin"
              className={`px-3.5 py-2.5 rounded-xl text-sm font-bold transition-all flex items-center gap-1.5 ${
                pathname === '/admin'
                  ? 'bg-purple-50 dark:bg-purple-950/60 text-purple-600 dark:text-purple-400 ring-1 ring-purple-500/20'
                  : 'text-purple-700 dark:text-purple-400 hover:bg-purple-50/50'
              }`}
            >
              <Settings className="w-4 h-4" />
              <span>Admin</span>
            </Link>
          )}
        </nav>

        {/* Right: Account Button & Theme Toggle */}
        <div className="flex items-center gap-3">
          <ThemeToggle />

          {/* ACCOUNT Button */}
          <div className="relative" ref={accountRef}>
            {user ? (
              <div>
                <button
                  onClick={() => setAccountMenuOpen(!accountMenuOpen)}
                  className="bg-slate-900 hover:bg-slate-800 dark:bg-emerald-600 dark:hover:bg-emerald-700 active:scale-95 text-white font-black text-xs sm:text-sm uppercase tracking-wider px-6 py-2.5 rounded-full shadow-md shadow-slate-900/10 flex items-center gap-2 transition-all cursor-pointer"
                >
                  <span>ACCOUNT</span>
                  <span className="text-xs opacity-75">▾</span>
                </button>

                {/* Account Popover Menu */}
                {accountMenuOpen && (
                  <div className="absolute right-0 top-full mt-2 w-64 bg-white dark:bg-[#1e293b] border border-slate-200 dark:border-slate-800 rounded-2xl shadow-2xl p-4 space-y-3 z-50 animate-in fade-in zoom-in-95 duration-150">
                    <div className="pb-3 border-b border-slate-200/80 dark:border-slate-800">
                      <div className="font-extrabold text-sm text-slate-900 dark:text-white truncate">
                        {user.full_name || 'User'}
                      </div>
                      <div className="text-xs text-slate-500 truncate">{user.email}</div>
                      <div className="mt-2">
                        <span className="px-2.5 py-0.5 rounded-md text-[10px] font-black uppercase bg-indigo-50 dark:bg-indigo-950/60 text-indigo-700 dark:text-indigo-300 border border-indigo-200 dark:border-indigo-800">
                          {user.role}
                        </span>
                      </div>
                    </div>

                    <div className="space-y-1 text-xs font-bold text-slate-700 dark:text-slate-200">
                      <Link
                        href="/profile"
                        onClick={() => setAccountMenuOpen(false)}
                        className="p-2 rounded-xl hover:bg-rose-50 dark:hover:bg-rose-950/40 text-[#8b2323] dark:text-rose-400 flex items-center gap-2 transition-colors font-extrabold"
                      >
                        <UserIcon className="w-4 h-4 shrink-0" />
                        <span>My Profile (Account)</span>
                      </Link>

                      <Link
                        href="/student"
                        onClick={() => setAccountMenuOpen(false)}
                        className="p-2 rounded-xl hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center gap-2 transition-colors"
                      >
                        <span>My Exams</span>
                      </Link>

                      {user.role === 'admin' && (
                        <Link
                          href="/admin"
                          onClick={() => setAccountMenuOpen(false)}
                          className="p-2 rounded-xl hover:bg-purple-50 dark:hover:bg-purple-950/40 flex items-center gap-2 text-purple-700 dark:text-purple-300 transition-colors"
                        >
                          <Settings className="w-4 h-4" />
                          <span>Admin Panel</span>
                        </Link>
                      )}

                      <button
                        onClick={handleLogout}
                        className="w-full p-2 rounded-xl text-left hover:bg-rose-50 dark:hover:bg-rose-950/40 text-rose-600 dark:text-rose-400 flex items-center gap-2 transition-colors pt-2 border-t border-slate-200 dark:border-slate-800 cursor-pointer"
                      >
                        <LogOut className="w-4 h-4" />
                        <span>Sign Out</span>
                      </button>
                    </div>
                  </div>
                )}
              </div>
            ) : (
              <Link
                href="/login"
                className="bg-slate-900 hover:bg-slate-800 dark:bg-emerald-600 dark:hover:bg-emerald-700 active:scale-95 text-white font-black text-xs sm:text-sm uppercase tracking-wider px-6 py-2.5 rounded-full shadow-md shadow-slate-900/10 transition-all inline-block"
              >
                ACCOUNT
              </Link>
            )}
          </div>

          {/* Mobile Hamburger Button */}
          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            className="lg:hidden p-2 rounded-xl bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-200 cursor-pointer"
            aria-label="Toggle Menu"
          >
            {mobileMenuOpen ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
          </button>
        </div>
      </div>

      {/* Mobile Drawer Menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden border-t border-slate-200 dark:border-slate-800 bg-white/95 dark:bg-slate-900/95 backdrop-blur-md p-4 space-y-3 animate-in slide-in-from-top-2 duration-200">
          <div className="grid grid-cols-2 gap-2 text-xs font-bold">
            {navItems.map((item) => {
              const Icon = item.icon;
              return (
                <Link
                  key={item.id}
                  href={item.href}
                  onClick={() => setMobileMenuOpen(false)}
                  className={`p-2.5 rounded-xl text-center border flex items-center justify-center gap-1.5 transition-all ${
                    item.isActive
                      ? item.activeClass
                      : `bg-slate-50 dark:bg-slate-800 text-slate-700 dark:text-slate-300 border-slate-200 dark:border-slate-700 ${item.hoverClass}`
                  }`}
                >
                  <Icon className="w-4 h-4 shrink-0" />
                  <span>{item.label}</span>
                </Link>
              );
            })}
          </div>

          {/* Quick Listening Sections for Mobile */}
          {currentTab === 'listening' && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 space-y-1.5">
              <span className="text-[10px] font-black uppercase tracking-wider text-slate-400">Listening Sections:</span>
              <div className="flex flex-wrap gap-1.5">
                {[
                  { label: 'Section 1', href: '/student?tab=listening&section=1' },
                  { label: 'Section 2', href: '/student?tab=listening&section=2' },
                  { label: 'Section 3', href: '/student?tab=listening&section=3' },
                  { label: 'Section 4', href: '/student?tab=listening&section=4' },
                  { label: 'Full', href: '/student?tab=listening&section=full' },
                ].map((sub) => (
                  <Link
                    key={sub.label}
                    href={sub.href}
                    onClick={() => setMobileMenuOpen(false)}
                    className="px-2.5 py-1 rounded-lg bg-cyan-50 dark:bg-cyan-950/60 text-[#0a5c6e] dark:text-cyan-300 text-xs font-bold"
                  >
                    {sub.label}
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Quick Reading Passages for Mobile */}
          {currentTab === 'reading' && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 space-y-1.5">
              <span className="text-[10px] font-black uppercase tracking-wider text-slate-400">Reading Passages:</span>
              <div className="flex flex-wrap gap-1.5">
                {[
                  { label: 'Passage 1', href: '/student?tab=reading&passage=1' },
                  { label: 'Passage 2', href: '/student?tab=reading&passage=2' },
                  { label: 'Passage 3', href: '/student?tab=reading&passage=3' },
                  { label: 'Full', href: '/student?tab=reading&passage=full' },
                ].map((sub) => (
                  <Link
                    key={sub.label}
                    href={sub.href}
                    onClick={() => setMobileMenuOpen(false)}
                    className="px-2.5 py-1 rounded-lg bg-blue-50 dark:bg-blue-950/60 text-blue-700 dark:text-blue-300 text-xs font-bold"
                  >
                    {sub.label}
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Quick Speaking Parts for Mobile */}
          {currentTab === 'speaking' && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 space-y-1.5">
              <span className="text-[10px] font-black uppercase tracking-wider text-slate-400">Speaking Sections:</span>
              <div className="flex flex-wrap gap-1.5">
                {[
                  { label: 'Speaking partner', href: '/student?tab=speaking&mode=partner' },
                  { label: 'Part 1 · Interview', href: '/student?tab=speaking&part=1' },
                  { label: 'Part 2 · Cue card', href: '/student?tab=speaking&part=2' },
                  { label: 'Part 3 · Discussion', href: '/student?tab=speaking&part=3' },
                  { label: 'My recordings', href: '/student?tab=speaking&mode=recordings' },
                ].map((sub) => (
                  <Link
                    key={sub.label}
                    href={sub.href}
                    onClick={() => setMobileMenuOpen(false)}
                    className="px-2.5 py-1 rounded-lg bg-emerald-50 dark:bg-emerald-950/60 text-emerald-700 dark:text-emerald-300 text-xs font-bold"
                  >
                    {sub.label}
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Quick Writing Tasks for Mobile */}
          {currentTab === 'writing' && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 space-y-1.5">
              <span className="text-[10px] font-black uppercase tracking-wider text-slate-400">Writing Tasks:</span>
              <div className="flex flex-wrap gap-1.5">
                {[
                  { label: 'Task 1 Reports', href: '/student?tab=writing&task=1' },
                  { label: 'Task 2 Essays', href: '/student?tab=writing&task=2' },
                  { label: 'Band Feedback', href: '/student?tab=writing&mode=feedback' },
                ].map((sub) => (
                  <Link
                    key={sub.label}
                    href={sub.href}
                    onClick={() => setMobileMenuOpen(false)}
                    className="px-2.5 py-1 rounded-lg bg-rose-50 dark:bg-rose-950/60 text-[#7a2259] dark:text-rose-300 text-xs font-bold"
                  >
                    {sub.label}
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Quick Mock Links for Mobile */}
          {currentTab === 'mock' && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 space-y-1.5">
              <span className="text-[10px] font-black uppercase tracking-wider text-slate-400">Mock Sections:</span>
              <div className="flex flex-wrap gap-1.5">
                {[
                  { label: 'Full Mock', href: '/student?tab=mock' },
                  { label: 'Mock Results', href: '/student?tab=mock&mode=results' },
                ].map((sub) => (
                  <Link
                    key={sub.label}
                    href={sub.href}
                    onClick={() => setMobileMenuOpen(false)}
                    className="px-2.5 py-1 rounded-lg bg-amber-50 dark:bg-amber-950/60 text-amber-700 dark:text-amber-300 text-xs font-bold"
                  >
                    {sub.label}
                  </Link>
                ))}
              </div>
            </div>
          )}

          {user && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 flex items-center justify-between gap-2 text-xs font-bold">
              <Link
                href="/profile"
                onClick={() => setMobileMenuOpen(false)}
                className="flex-1 p-2.5 rounded-xl bg-rose-50 dark:bg-rose-950/40 text-center text-[#8b2323] dark:text-rose-400 border border-rose-200/80 dark:border-rose-800 flex items-center justify-center gap-1.5"
              >
                <UserIcon className="w-4 h-4" />
                <span>My Profile</span>
              </Link>
              <button
                onClick={handleLogout}
                className="p-2.5 rounded-xl bg-slate-100 dark:bg-slate-800 text-rose-600 dark:text-rose-400 border border-slate-200 dark:border-slate-700 flex items-center justify-center gap-1.5"
              >
                <LogOut className="w-4 h-4" />
                <span>Sign Out</span>
              </button>
            </div>
          )}

          {user && user.role === 'admin' && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 grid grid-cols-1 gap-2 text-xs font-bold">
              <Link
                href="/admin"
                onClick={() => setMobileMenuOpen(false)}
                className="p-2.5 rounded-xl bg-purple-50 dark:bg-purple-950/40 text-center text-purple-700 dark:text-purple-300 border border-purple-200/80 dark:border-purple-800 flex items-center justify-center gap-1.5"
              >
                <Settings className="w-4 h-4" />
                <span>Admin</span>
              </Link>
            </div>
          )}
        </div>
      )}
    </header>
  );
}

export default function Navbar() {
  return (
    <Suspense fallback={<div className="h-20 border-b border-slate-200 dark:border-slate-800 bg-white dark:bg-[#182235]" />}>
      <NavbarContent />
    </Suspense>
  );
}
