'use client';

import React, { useEffect, useState, useRef, Suspense } from 'react';
import Link from 'next/link';
import { useRouter, usePathname, useSearchParams } from 'next/navigation';
import {
  LogOut,
  Menu,
  X,
  Settings,
  CheckSquare,
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
  const accountRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    setUser(getCurrentStoredUser());
    setMobileMenuOpen(false);
    setAccountMenuOpen(false);
  }, [pathname, searchParams]);

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
      activeClass: 'bg-blue-50 dark:bg-blue-950/70 text-blue-600 dark:text-blue-400 font-extrabold ring-1 ring-blue-500/20 shadow-xs',
      hoverClass: 'hover:text-blue-600 dark:hover:text-blue-400 hover:bg-blue-50/50 dark:hover:bg-blue-950/30',
    },
    {
      id: 'reading',
      label: 'Reading',
      href: '/student?tab=reading',
      icon: BookOpen,
      isActive: currentTab === 'reading',
      activeClass: 'bg-emerald-50 dark:bg-emerald-950/70 text-emerald-600 dark:text-emerald-400 font-extrabold ring-1 ring-emerald-500/20 shadow-xs',
      hoverClass: 'hover:text-emerald-600 dark:hover:text-emerald-400 hover:bg-emerald-50/50 dark:hover:bg-emerald-950/30',
    },
    {
      id: 'speaking',
      label: 'Speaking',
      href: '/student?tab=speaking',
      icon: Mic,
      isActive: currentTab === 'speaking',
      activeClass: 'bg-purple-50 dark:bg-purple-950/70 text-purple-600 dark:text-purple-400 font-extrabold ring-1 ring-purple-500/20 shadow-xs',
      hoverClass: 'hover:text-purple-600 dark:hover:text-purple-400 hover:bg-purple-50/50 dark:hover:bg-purple-950/30',
    },
    {
      id: 'writing',
      label: 'Writing',
      href: '/student?tab=writing',
      icon: PenTool,
      isActive: currentTab === 'writing',
      activeClass: 'bg-amber-50 dark:bg-amber-950/70 text-amber-600 dark:text-amber-400 font-extrabold ring-1 ring-amber-500/20 shadow-xs',
      hoverClass: 'hover:text-amber-600 dark:hover:text-amber-400 hover:bg-amber-50/50 dark:hover:bg-amber-950/30',
    },
    {
      id: 'mock',
      label: 'Full Mock',
      href: '/student?tab=mock',
      icon: Sparkles,
      isActive: currentTab === 'mock',
      activeClass: 'bg-rose-50 dark:bg-rose-950/70 text-rose-600 dark:text-rose-400 font-extrabold ring-1 ring-rose-500/20 shadow-xs',
      hoverClass: 'hover:text-rose-600 dark:hover:text-rose-400 hover:bg-rose-50/50 dark:hover:bg-rose-950/30',
    },
  ];

  return (
    <header className="sticky top-0 z-50 bg-white/95 dark:bg-[#0f1422]/95 backdrop-blur-md border-b border-slate-200/90 dark:border-slate-800/80 transition-colors">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between gap-4">
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

        {/* Center: Desktop Navigation Tabs */}
        <nav className="hidden lg:flex items-center gap-1.5 xl:gap-2 text-base font-bold text-slate-700 dark:text-slate-200">
          {navItems.map((item) => {
            const Icon = item.icon;
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
                  <div className="absolute right-0 top-full mt-2 w-64 bg-white dark:bg-[#161822] border border-slate-200 dark:border-slate-800 rounded-2xl shadow-2xl p-4 space-y-3 z-50 animate-in fade-in zoom-in-95 duration-150">
                    <div className="pb-3 border-b border-slate-200/80 dark:border-slate-800">
                      <div className="font-extrabold text-sm text-slate-900 dark:text-white truncate">
                        {user.full_name || 'Foydalanuvchi'}
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
                        <span>Mening Profilim (Account)</span>
                      </Link>

                      <Link
                        href="/student"
                        onClick={() => setAccountMenuOpen(false)}
                        className="p-2 rounded-xl hover:bg-slate-100 dark:hover:bg-slate-800 flex items-center gap-2 transition-colors"
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

                      <button
                        onClick={handleLogout}
                        className="w-full p-2 rounded-xl text-left hover:bg-rose-50 dark:hover:bg-rose-950/40 text-rose-600 dark:text-rose-400 flex items-center gap-2 transition-colors pt-2 border-t border-slate-200 dark:border-slate-800 cursor-pointer"
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

          {user && (
            <div className="pt-2 border-t border-slate-200 dark:border-slate-800 flex items-center justify-between gap-2 text-xs font-bold">
              <Link
                href="/profile"
                onClick={() => setMobileMenuOpen(false)}
                className="flex-1 p-2.5 rounded-xl bg-rose-50 dark:bg-rose-950/40 text-center text-[#8b2323] dark:text-rose-400 border border-rose-200/80 dark:border-rose-800 flex items-center justify-center gap-1.5"
              >
                <UserIcon className="w-4 h-4" />
                <span>Mening Profilim</span>
              </Link>
              <button
                onClick={handleLogout}
                className="p-2.5 rounded-xl bg-slate-100 dark:bg-slate-800 text-rose-600 dark:text-rose-400 border border-slate-200 dark:border-slate-700 flex items-center justify-center gap-1.5"
              >
                <LogOut className="w-4 h-4" />
                <span>Chiqish</span>
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
    <Suspense fallback={<div className="h-18 border-b border-slate-200 dark:border-slate-800 bg-white dark:bg-[#0f1422]" />}>
      <NavbarContent />
    </Suspense>
  );
}
