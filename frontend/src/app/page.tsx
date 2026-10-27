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
            <span>Explore All 144 Tests</span>
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
            { label: 'Academic Tests', value: '144+', sub: 'Cambridge Books 13–21' },
            { label: 'Full Mock Time', value: '180m', sub: '4 Integrated Skills' },
            { label: 'Evaluation', value: 'Instant', sub: 'Band & CEFR Levels' },
            { label: 'Question Bank', value: '1,400+', sub: 'Verbatim Official Items' },
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

        {/* Bento Grid with Asymmetrical High-Impact Cards */}
        <BentoGrid className="grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
          {/* Card 1: Full Mock Exam Simulator (Hero Bento Card - spans 2 columns) */}
          <BentoCard
            title="Full Mock Exam Simulator"
            description="Experience an authentic, uninterrupted 180-minute examination simulating all 4 modules (Listening, Reading, Writing, Speaking) under strict exam timing."
            badge="180 MINS · FULL EXAM"
            badgeColor="from-amber-500 via-orange-500 to-amber-600"
            icon={<Award className="w-6 h-6 text-amber-500" />}
            href="/student?tab=mock"
            cta="Launch Full Mock"
            glowColor="rgba(245, 158, 11, 0.25)"
            className="md:col-span-2 bg-gradient-to-br from-amber-50/40 via-white/80 to-orange-50/30 dark:from-amber-950/20 dark:via-slate-900/60 dark:to-orange-950/10 border-amber-200/80 dark:border-amber-500/20"
          >
            <div className="mt-2 grid grid-cols-2 sm:grid-cols-4 gap-2.5 pt-3">
              {[
                { name: '1. Listening', count: '40 Qs · 30m', color: 'text-cyan-600 dark:text-cyan-400 bg-cyan-50 dark:bg-cyan-950/60' },
                { name: '2. Reading', count: '40 Qs · 60m', color: 'text-emerald-600 dark:text-emerald-400 bg-emerald-50 dark:bg-emerald-950/60' },
                { name: '3. Writing', count: '2 Tasks · 60m', color: 'text-purple-600 dark:text-purple-400 bg-purple-50 dark:bg-purple-950/60' },
                { name: '4. Speaking', count: '3 Parts · 15m', color: 'text-rose-600 dark:text-rose-400 bg-rose-50 dark:bg-rose-950/60' },
              ].map((skill, i) => (
                <div key={i} className={`p-3 rounded-2xl border border-current/10 ${skill.color}`}>
                  <span className="block text-xs font-bold">{skill.name}</span>
                  <span className="text-[11px] font-medium opacity-80">{skill.count}</span>
                </div>
              ))}
            </div>
          </BentoCard>

          {/* Card 2: Listening Laboratory */}
          <BentoCard
            title="Listening Laboratory"
            description="36 complete listening tests. Train with official exam pacing, 4 audio parts, max 2 plays rule, and detailed post-exam audioscript reviews."
            badge="AUDIO · 30 MINS"
            badgeColor="from-blue-600 to-cyan-500"
            icon={<Headphones className="w-6 h-6 text-blue-500" />}
            href="/student?tab=listening"
            cta="Open Listening"
            glowColor="rgba(59, 130, 246, 0.25)"
          >
            <div className="mt-2 flex items-center justify-between p-3 rounded-2xl bg-blue-50/60 dark:bg-blue-950/40 border border-blue-100 dark:border-blue-900/40 text-xs font-bold text-blue-700 dark:text-blue-300">
              <span className="flex items-center gap-2">
                <Clock className="w-4 h-4 text-blue-500" />
                <span>36 Official Tests</span>
              </span>
              <span className="px-2.5 py-0.5 rounded-full bg-blue-600 text-white text-[10px] font-black uppercase">
                40 Questions
              </span>
            </div>
          </BentoCard>

          {/* Card 3: Reading Passage Comprehension */}
          <BentoCard
            title="Reading Comprehension"
            description="37 academic tests across 3 passages each. Includes Drag & Drop matching headings, split-screen reading, and instant answer validation."
            badge="TEXTS · 60 MINS"
            badgeColor="from-emerald-500 to-teal-600"
            icon={<BookOpen className="w-6 h-6 text-emerald-500" />}
            href="/student?tab=reading"
            cta="Open Reading"
            glowColor="rgba(16, 185, 129, 0.25)"
          >
            <div className="mt-2 flex items-center justify-between p-3 rounded-2xl bg-emerald-50/60 dark:bg-emerald-950/40 border border-emerald-100 dark:border-emerald-900/40 text-xs font-bold text-emerald-700 dark:text-emerald-300">
              <span className="flex items-center gap-2">
                <CheckCircle2 className="w-4 h-4 text-emerald-500" />
                <span>37 Full Tests (111 Passages)</span>
              </span>
              <span className="px-2.5 py-0.5 rounded-full bg-emerald-600 text-white text-[10px] font-black uppercase">
                Passages 1–3
              </span>
            </div>
          </BentoCard>

          {/* Card 4: Writing Essay Studio */}
          <BentoCard
            title="Writing Essay Studio"
            description="Task 1 visual data reports and Task 2 discursive essays. Features real-time word counting, visual chart prompts, and 4-criteria rubric evaluation."
            badge="ESSAY · 60 MINS"
            badgeColor="from-rose-500 via-pink-600 to-purple-600"
            icon={<Edit3 className="w-6 h-6 text-rose-500" />}
            href="/student?tab=writing"
            cta="Open Writing"
            glowColor="rgba(244, 63, 94, 0.25)"
          >
            <div className="mt-2 flex items-center justify-between p-3 rounded-2xl bg-rose-50/60 dark:bg-rose-950/40 border border-rose-100 dark:border-rose-900/40 text-xs font-bold text-rose-700 dark:text-rose-300">
              <span className="flex items-center gap-2">
                <FileCheck2 className="w-4 h-4 text-rose-500" />
                <span>Task 1 (150w) & Task 2 (250w)</span>
              </span>
              <span className="px-2.5 py-0.5 rounded-full bg-rose-600 text-white text-[10px] font-black uppercase">
                Band Graded
              </span>
            </div>
          </BentoCard>

          {/* Card 5: Speaking Practice & AI Audio */}
          <BentoCard
            title="Speaking Voice Studio"
            description="Practice Parts 1, 2, and 3 with real examiner cue cards, in-browser audio recording, playback analysis, and speaking partner mode."
            badge="VOICE · 15 MINS"
            badgeColor="from-purple-500 to-violet-600"
            icon={<Mic className="w-6 h-6 text-purple-500" />}
            href="/student?tab=speaking"
            cta="Open Speaking"
            glowColor="rgba(168, 85, 247, 0.25)"
          >
            <div className="mt-2 flex items-center justify-between p-3 rounded-2xl bg-purple-50/60 dark:bg-purple-950/40 border border-purple-100 dark:border-purple-900/40 text-xs font-bold text-purple-700 dark:text-purple-300">
              <span className="flex items-center gap-2">
                <TrendingUp className="w-4 h-4 text-purple-500" />
                <span>3 Parts · Voice Recording</span>
              </span>
              <span className="px-2.5 py-0.5 rounded-full bg-purple-600 text-white text-[10px] font-black uppercase">
                Partner Mode
              </span>
            </div>
          </BentoCard>
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
