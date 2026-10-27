'use client';

import React from 'react';
import Link from 'next/link';
import { motion } from 'framer-motion';
import {
  Headphones,
  BookOpen,
  Mic,
  Edit3,
  Clock,
  Sparkles,
  ArrowRight,
  ShieldCheck,
  CheckCircle2,
  FileCheck2,
  TrendingUp,
  Zap,
  Layers,
  Award,
} from 'lucide-react';
import { Spotlight } from '@/components/ui/Spotlight';
import { BentoGrid, BentoCard } from '@/components/ui/BentoGrid';

export default function HomePage() {
  return (
    <div className="relative min-h-screen w-full overflow-hidden pb-20">
      {/* 1. Hero Section with Aceternity Spotlight Effect */}
      <section className="relative flex flex-col items-center justify-center pt-8 pb-16 sm:pt-14 sm:pb-24 px-4 text-center overflow-hidden">
        {/* Spotlight Beam Glowing Across the Hero */}
        <Spotlight
          className="-top-40 left-0 md:left-60 md:-top-20"
          fill="#38bdf8"
        />

        {/* Ambient background glow dots */}
        <div className="absolute inset-0 bg-gradient-to-b from-blue-500/5 via-transparent to-transparent pointer-events-none" />

        {/* Floating Top Badge with Pulse */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="inline-flex items-center gap-2.5 px-4 py-2 rounded-full bg-white/80 dark:bg-slate-900/80 border border-slate-200/80 dark:border-white/10 shadow-lg backdrop-blur-md mb-6"
        >
          <span className="flex h-2 w-2 rounded-full bg-sky-500 animate-ping" />
          <span className="text-xs font-black uppercase tracking-widest text-slate-700 dark:text-sky-300">
            OFFICIAL CAMBRIDGE & CEFR EXAM SIMULATOR
          </span>
          <span className="px-2 py-0.5 rounded-full text-[10px] font-black bg-sky-500/10 text-sky-600 dark:text-sky-300 border border-sky-500/20">
            2026 EDITION
          </span>
        </motion.div>

        {/* Main Hero Headline */}
        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="max-w-5xl text-4xl sm:text-6xl lg:text-7xl font-black text-slate-900 dark:text-white tracking-tight leading-[1.1] sm:leading-[1.12]"
        >
          Master Your Exam with{' '}
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-sky-400 via-blue-500 to-indigo-500 dark:from-sky-300 dark:via-blue-400 dark:to-indigo-300">
            Precision & Confidence
          </span>
        </motion.h1>

        {/* Subtitle / Description */}
        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
          className="mt-6 max-w-2xl text-base sm:text-lg lg:text-xl font-medium text-slate-600 dark:text-slate-300 leading-relaxed"
        >
          The complete academic examination suite for Cambridge IELTS and CEFR.
          Experience real exam pacing, multi-skill full mock simulations, and AI-driven performance feedback.
        </motion.p>

        {/* Primary Action Buttons */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="mt-8 flex flex-wrap items-center justify-center gap-4"
        >
          <Link
            href="/student?tab=mock"
            className="group relative inline-flex items-center gap-2.5 px-8 py-4 rounded-2xl bg-gradient-to-r from-blue-600 via-indigo-600 to-sky-600 text-white font-black text-sm uppercase tracking-wider shadow-xl shadow-blue-500/25 transition-all duration-300 hover:shadow-2xl hover:shadow-blue-500/35 hover:-translate-y-0.5 active:scale-95 cursor-pointer"
          >
            <Zap className="w-4 h-4 fill-white" />
            <span>Start Full Mock Exam</span>
            <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-1" />
          </Link>

          <Link
            href="/student"
            className="inline-flex items-center gap-2 px-7 py-4 rounded-2xl bg-white/70 dark:bg-slate-900/60 hover:bg-white dark:hover:bg-slate-800/80 text-slate-800 dark:text-slate-100 font-black text-sm uppercase tracking-wider border border-slate-200 dark:border-white/10 shadow-lg backdrop-blur-md transition-all duration-200 hover:-translate-y-0.5 active:scale-95 cursor-pointer"
          >
            <span>Explore All Modules</span>
            <Layers className="w-4 h-4 text-slate-400" />
          </Link>
        </motion.div>

        {/* Key Metrics Strip with Glassmorphism */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="mt-12 sm:mt-16 grid grid-cols-2 sm:grid-cols-4 gap-3 sm:gap-6 w-full max-w-4xl"
        >
          {[
            { label: 'Exam Standards', value: 'CEFR', sub: 'A1 to C2 Band Scale' },
            { label: 'Full Mock Time', value: '180m', sub: '4 Integrated Skills' },
            { label: 'Evaluation', value: 'Instant', sub: 'Band & CEFR Levels' },
            { label: 'Question Format', value: 'Official', sub: 'Authentic Exam Formats' },
          ].map((stat, idx) => (
            <div
              key={idx}
              className="p-4 sm:p-5 rounded-2xl bg-white/50 dark:bg-slate-900/40 border border-slate-200/80 dark:border-white/10 backdrop-blur-md shadow-xs text-center space-y-1"
            >
              <div className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white tracking-tight">
                {stat.value}
              </div>
              <div className="text-xs font-bold text-slate-800 dark:text-slate-200">
                {stat.label}
              </div>
              <div className="text-[11px] font-medium text-slate-400 dark:text-slate-500">
                {stat.sub}
              </div>
            </div>
          ))}
        </motion.div>
      </section>

      {/* 2. Bento Grid Section */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
        <div className="flex flex-col sm:flex-row sm:items-end justify-between gap-4 border-b border-slate-200 dark:border-white/10 pb-6">
          <div>
            <div className="inline-flex items-center gap-1.5 text-xs font-black uppercase tracking-wider text-sky-600 dark:text-sky-400 mb-2">
              <Sparkles className="w-3.5 h-3.5" />
              <span>Modular Architecture</span>
            </div>
            <h2 className="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white tracking-tight">
              Integrated Examination Modules
            </h2>
            <p className="mt-2 text-sm text-slate-500 dark:text-slate-400 font-medium max-w-xl">
              Each module follows official Cambridge IELTS timing, question types, and scoring rubrics.
            </p>
          </div>

          <Link
            href="/student"
            className="inline-flex items-center gap-2 text-xs sm:text-sm font-black text-blue-600 dark:text-sky-400 hover:underline uppercase tracking-wider shrink-0"
          >
            <span>View All Modules</span>
            <ArrowRight className="w-4 h-4" />
          </Link>
        </div>

        {/* Uniform Grid - Equal Dimensions for All Cards */}
        <BentoGrid className="grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
          {/* Card 1: Full Mock Exam Simulator */}
          <BentoCard
            title="Full Mock Exam Simulator"
            description="Complete 180-minute practice exam covering all 4 modules under official timing."
            badge="180 MINS · FULL EXAM"
            badgeColor="from-amber-500 to-orange-600"
            icon={<Award className="w-5 h-5 text-amber-500" />}
            href="/student?tab=mock"
            cta="Launch Full Mock"
            ctaColor="text-amber-600 dark:text-amber-400"
            glowColor="rgba(245, 158, 11, 0.2)"
            className="hover:border-amber-400/60 dark:hover:border-amber-400/40"
          />

          {/* Card 2: Listening Laboratory */}
          <BentoCard
            title="Listening Laboratory"
            description="Train with authentic exam audio pacing, 4 parts, and complete audioscripts."
            badge="AUDIO · 30 MINS"
            badgeColor="from-blue-600 to-cyan-500"
            icon={<Headphones className="w-5 h-5 text-blue-500" />}
            href="/student?tab=listening"
            cta="Open Listening"
            ctaColor="text-blue-600 dark:text-sky-400"
            glowColor="rgba(59, 130, 246, 0.2)"
            className="hover:border-sky-400/60 dark:hover:border-sky-400/40"
          />

          {/* Card 3: Reading Comprehension */}
          <BentoCard
            title="Reading Comprehension"
            description="Master academic reading texts with split-screen view and drag & drop questions."
            badge="TEXTS · 60 MINS"
            badgeColor="from-emerald-500 to-teal-600"
            icon={<BookOpen className="w-5 h-5 text-emerald-500" />}
            href="/student?tab=reading"
            cta="Open Reading"
            ctaColor="text-emerald-600 dark:text-emerald-400"
            glowColor="rgba(16, 185, 129, 0.2)"
            className="hover:border-emerald-400/60 dark:hover:border-emerald-400/40"
          />

          {/* Card 4: Writing Essay Studio */}
          <BentoCard
            title="Writing Essay Studio"
            description="Write Task 1 visual reports and Task 2 discursive essays with live word count."
            badge="ESSAY · 60 MINS"
            badgeColor="from-rose-500 to-pink-600"
            icon={<Edit3 className="w-5 h-5 text-rose-500" />}
            href="/student?tab=writing"
            cta="Open Writing"
            ctaColor="text-rose-600 dark:text-rose-400"
            glowColor="rgba(244, 63, 94, 0.2)"
            className="hover:border-rose-400/60 dark:hover:border-rose-400/40"
          />

          {/* Card 5: Speaking Voice Studio */}
          <BentoCard
            title="Speaking Voice Studio"
            description="Interactive interview practice covering Parts 1, 2, and 3 with audio recording."
            badge="VOICE · 15 MINS"
            badgeColor="from-purple-500 to-violet-600"
            icon={<Mic className="w-5 h-5 text-purple-500" />}
            href="/student?tab=speaking"
            cta="Open Speaking"
            ctaColor="text-purple-600 dark:text-purple-400"
            glowColor="rgba(168, 85, 247, 0.2)"
            className="hover:border-purple-400/60 dark:hover:border-purple-400/40"
          />

          {/* Card 6: Results & Band Scoring */}
          <BentoCard
            title="Results & Analytics"
            description="Instant CEFR level score, band calculation, and detailed answer explanations."
            badge="CEFR · INSTANT"
            badgeColor="from-amber-500 to-emerald-600"
            icon={<Sparkles className="w-5 h-5 text-amber-500" />}
            href="/student?tab=mock&mode=results"
            cta="View My Results"
            ctaColor="text-emerald-600 dark:text-emerald-400"
            glowColor="rgba(16, 185, 129, 0.2)"
            className="hover:border-amber-400/60 dark:hover:border-emerald-400/40"
          />
        </BentoGrid>
      </section>

      {/* 3. Platform Capabilities & Exam Standards Banner */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-16">
        <div className="rounded-3xl border border-slate-200/80 dark:border-white/10 bg-white/70 dark:bg-slate-900/60 p-8 sm:p-12 backdrop-blur-xl shadow-xl flex flex-col md:flex-row items-center justify-between gap-8">
          <div className="space-y-3 max-w-2xl">
            <span className="inline-flex items-center gap-2 text-xs font-black uppercase tracking-wider text-emerald-600 dark:text-emerald-400">
              <ShieldCheck className="w-4 h-4" />
              <span>Verified Official Content</span>
            </span>
            <h3 className="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white tracking-tight">
              Ready to Determine Your Official CEFR Band Score?
            </h3>
            <p className="text-sm sm:text-base text-slate-600 dark:text-slate-300 leading-relaxed font-medium">
              Start with any single skill module or launch a complete full-length examination simulator.
              Your answers, scores, and progress are securely tracked and saved to your account.
            </p>
          </div>

          <div className="flex flex-col sm:flex-row gap-3 w-full sm:w-auto shrink-0">
            <Link
              href="/student?tab=mock"
              className="px-8 py-4 rounded-2xl bg-slate-900 hover:bg-slate-800 dark:bg-white dark:hover:bg-slate-100 text-white dark:text-slate-900 font-black text-sm uppercase tracking-wider shadow-lg transition-all text-center cursor-pointer active:scale-95"
            >
              Start Free Mock
            </Link>
            <Link
              href="/student"
              className="px-8 py-4 rounded-2xl border border-slate-300 dark:border-white/15 bg-white dark:bg-slate-800 text-slate-800 dark:text-white font-black text-sm uppercase tracking-wider shadow-xs hover:bg-slate-50 dark:hover:bg-slate-700 transition-all text-center cursor-pointer active:scale-95"
            >
              Choose Module
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
