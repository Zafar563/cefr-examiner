'use client';

import React from 'react';
import Link from 'next/link';
import { motion } from 'framer-motion';
import { ArrowUpRight } from 'lucide-react';

interface BentoGridProps {
  children: React.ReactNode;
  className?: string;
}

export function BentoGrid({ children, className = '' }: BentoGridProps) {
  return (
    <div
      className={`grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 sm:gap-6 ${className}`}
    >
      {children}
    </div>
  );
}

interface BentoCardProps {
  title: string;
  description: string;
  header?: React.ReactNode;
  icon?: React.ReactNode;
  badge?: string;
  badgeColor?: string;
  href?: string;
  cta?: string;
  className?: string;
  glowColor?: string;
  children?: React.ReactNode;
  size?: 'normal' | 'large';
  titleClassName?: string;
  descriptionClassName?: string;
}

export function BentoCard({
  title,
  description,
  header,
  icon,
  badge,
  badgeColor = 'from-blue-500 to-indigo-500',
  href,
  cta = 'Explore',
  className = '',
  glowColor = 'rgba(56, 189, 248, 0.15)',
  children,
  size = 'normal',
  titleClassName,
  descriptionClassName,
}: BentoCardProps) {
  const isLarge = size === 'large';

  const CardContent = (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, margin: '-50px' }}
      transition={{ duration: 0.5, ease: 'easeOut' }}
      whileHover={{ y: -4 }}
      className={`group relative flex flex-col justify-between overflow-hidden rounded-3xl border border-slate-200/80 dark:border-white/10 bg-white/75 dark:bg-slate-900/60 ${
        isLarge ? 'p-7 sm:p-9 lg:p-11 min-h-[300px]' : 'p-6 sm:p-7'
      } backdrop-blur-xl shadow-xl shadow-slate-900/5 dark:shadow-none transition-all duration-300 hover:border-slate-300 dark:hover:border-white/20 hover:shadow-2xl hover:shadow-blue-500/10 ${className}`}
    >
      {/* Background Soft Glow Beam on Hover */}
      <div
        className="pointer-events-none absolute -inset-px rounded-3xl opacity-0 transition-opacity duration-500 group-hover:opacity-100"
        style={{
          background: `radial-gradient(600px circle at var(--mouse-x, 50%) var(--mouse-y, 50%), ${glowColor}, transparent 40%)`,
        }}
      />

      {/* Decorative gradient blur overlay */}
      <div className="pointer-events-none absolute -right-16 -top-16 h-40 w-40 rounded-full bg-gradient-to-br from-blue-500/10 via-indigo-500/10 to-transparent blur-2xl transition-all duration-500 group-hover:scale-125" />

      {/* Header / Graphic Slot */}
      {header && <div className="relative z-10 mb-4 overflow-hidden rounded-2xl">{header}</div>}

      {/* Main Body */}
      <div className={`relative z-10 flex flex-1 flex-col justify-between ${isLarge ? 'space-y-6' : 'space-y-4'}`}>
        <div>
          {/* Badge & Icon Row */}
          <div className={`flex items-center justify-between gap-3 ${isLarge ? 'mb-5' : 'mb-3'}`}>
            {icon && (
              <div className={`flex items-center justify-center rounded-2xl bg-white/90 dark:bg-white/10 text-slate-900 dark:text-white ring-1 ring-black/5 dark:ring-white/10 shadow-xs transition-transform duration-300 group-hover:scale-105 ${
                isLarge ? 'h-14 w-14' : 'h-11 w-11'
              }`}>
                {icon}
              </div>
            )}
            {badge && (
              <span className={`inline-flex items-center gap-2 rounded-full font-bold uppercase tracking-wider text-white shadow-xs bg-gradient-to-r ${badgeColor} ${
                isLarge ? 'px-4 py-1.5 text-xs sm:text-[13px]' : 'px-3 py-1 text-[11px]'
              }`}>
                <span className="w-2 h-2 rounded-full bg-white animate-pulse" />
                {badge}
              </span>
            )}
          </div>

          {/* Title & Description */}
          <h3
            className={
              titleClassName ||
              (isLarge
                ? 'text-2xl sm:text-3xl lg:text-[34px] font-extrabold text-slate-900 dark:text-white tracking-tight leading-tight group-hover:text-amber-600 dark:group-hover:text-amber-400 transition-colors'
                : 'text-xl sm:text-[22px] font-bold text-slate-900 dark:text-white tracking-tight leading-snug group-hover:text-blue-600 dark:group-hover:text-sky-400 transition-colors')
            }
          >
            {title}
          </h3>
          <p
            className={
              descriptionClassName ||
              (isLarge
                ? 'mt-3 text-base sm:text-lg lg:text-[19px] leading-relaxed text-slate-600 dark:text-slate-300 font-normal max-w-3xl'
                : 'mt-2 text-sm sm:text-[15px] leading-relaxed text-slate-600 dark:text-slate-300/90 font-normal')
            }
          >
            {description}
          </p>
        </div>

        {/* Custom Inner Slot (metrics, chips, visual preview) */}
        {children && <div className="pt-2">{children}</div>}

        {/* CTA Link Action */}
        {href && (
          <div className={`pt-4 border-t border-slate-100 dark:border-white/5 flex items-center justify-between font-bold text-blue-600 dark:text-sky-400 group-hover:translate-x-1 transition-transform ${
            isLarge ? 'text-sm sm:text-base text-amber-600 dark:text-amber-400' : 'text-xs sm:text-sm'
          }`}>
            <span className="uppercase tracking-wider">{cta}</span>
            <ArrowUpRight className={`${isLarge ? 'w-5 h-5' : 'w-4 h-4'} transition-transform group-hover:translate-x-1 group-hover:-translate-y-1`} />
          </div>
        )}
      </div>
    </motion.div>
  );

  if (href) {
    return (
      <Link href={href} className="block h-full">
        {CardContent}
      </Link>
    );
  }

  return CardContent;
}
