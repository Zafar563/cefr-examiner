'use client';

import React, { useState } from 'react';
import {
  Sparkles,
  ChevronDown,
  ChevronUp,
  FileText,
  Volume2,
  Video,
  ImageIcon,
  Maximize2,
  X,
  ExternalLink,
} from 'lucide-react';

interface QuestionExplanationViewerProps {
  text?: string;
  audioUrl?: string;
  videoUrl?: string;
  imageUrl?: string;
  defaultExpanded?: boolean;
  title?: string;
  isIncorrect?: boolean;
}

export function parseEmbedVideoUrl(url?: string): { isEmbed: boolean; url: string } {
  if (!url) return { isEmbed: false, url: '' };
  const trimmed = url.trim();

  // YouTube watch link: https://www.youtube.com/watch?v=XYZ or https://youtu.be/XYZ
  const ytWatchMatch = trimmed.match(/(?:youtube\.com\/(?:watch\?v=|embed\/)|youtu\.be\/)([\w-]{11})/);
  if (ytWatchMatch && ytWatchMatch[1]) {
    return { isEmbed: true, url: `https://www.youtube.com/embed/${ytWatchMatch[1]}` };
  }

  // Vimeo: https://vimeo.com/123456
  const vimeoMatch = trimmed.match(/vimeo\.com\/(?:video\/)?(\d+)/);
  if (vimeoMatch && vimeoMatch[1]) {
    return { isEmbed: true, url: `https://player.vimeo.com/video/${vimeoMatch[1]}` };
  }

  // Direct video file
  return { isEmbed: false, url: trimmed };
}

export default function QuestionExplanationViewer({
  text,
  audioUrl,
  videoUrl,
  imageUrl,
  defaultExpanded = false,
  title = 'Javob Tushuntirishi / Izoh',
  isIncorrect = false,
}: QuestionExplanationViewerProps) {
  const hasText = Boolean(text && text.trim());
  const hasAudio = Boolean(audioUrl && audioUrl.trim());
  const hasVideo = Boolean(videoUrl && videoUrl.trim());
  const hasImage = Boolean(imageUrl && imageUrl.trim());

  const hasAnyExplanation = hasText || hasAudio || hasVideo || hasImage;

  // Auto-expand if question was answered incorrectly, or defaultExpanded
  const [isExpanded, setIsExpanded] = useState<boolean>(defaultExpanded || isIncorrect);
  const [lightboxOpen, setLightboxOpen] = useState<boolean>(false);

  if (!hasAnyExplanation) {
    return null;
  }

  const embedInfo = parseEmbedVideoUrl(videoUrl);

  return (
    <div className="mt-3 overflow-hidden rounded-xl border border-indigo-200/80 dark:border-indigo-900/60 bg-gradient-to-r from-indigo-50/50 to-purple-50/30 dark:from-indigo-950/30 dark:to-purple-950/20 shadow-sm transition-all">
      {/* Header bar / Accordion trigger */}
      <button
        type="button"
        onClick={() => setIsExpanded(!isExpanded)}
        className="w-full px-3.5 py-2.5 flex items-center justify-between text-left hover:bg-indigo-100/50 dark:hover:bg-indigo-900/40 transition-colors cursor-pointer select-none"
      >
        <div className="flex items-center gap-2 flex-wrap">
          <div className="w-6 h-6 rounded-lg bg-indigo-600 dark:bg-indigo-500 text-white flex items-center justify-center shrink-0 shadow-sm">
            <Sparkles className="w-3.5 h-3.5" />
          </div>
          <span className="text-xs font-bold text-indigo-950 dark:text-indigo-200">
            {title}
          </span>

          {/* Media Badges */}
          <div className="flex items-center gap-1.5 ml-1">
            {hasText && (
              <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-bold bg-white dark:bg-slate-800 text-indigo-700 dark:text-indigo-300 border border-indigo-100 dark:border-indigo-800 shadow-2xs">
                <FileText className="w-2.5 h-2.5" /> Matn
              </span>
            )}
            {hasAudio && (
              <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-bold bg-white dark:bg-slate-800 text-purple-700 dark:text-purple-300 border border-purple-100 dark:border-purple-800 shadow-2xs">
                <Volume2 className="w-2.5 h-2.5" /> MP3 Audio
              </span>
            )}
            {hasVideo && (
              <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-bold bg-white dark:bg-slate-800 text-rose-700 dark:text-rose-300 border border-rose-100 dark:border-rose-800 shadow-2xs">
                <Video className="w-2.5 h-2.5" /> Video
              </span>
            )}
            {hasImage && (
              <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-[10px] font-bold bg-white dark:bg-slate-800 text-emerald-700 dark:text-emerald-300 border border-emerald-100 dark:border-emerald-800 shadow-2xs">
                <ImageIcon className="w-2.5 h-2.5" /> Rasm
              </span>
            )}
          </div>
        </div>

        <div className="flex items-center gap-1 text-indigo-600 dark:text-indigo-400 shrink-0">
          <span className="text-[11px] font-semibold hidden sm:inline">
            {isExpanded ? 'Yopish' : 'Tushuntirishni ko‘rish'}
          </span>
          {isExpanded ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
        </div>
      </button>

      {/* Expanded Content */}
      {isExpanded && (
        <div className="p-4 border-t border-indigo-100 dark:border-indigo-900/50 space-y-4 bg-white/60 dark:bg-slate-900/60">
          {/* 1. Text Explanation */}
          {hasText && (
            <div className="p-3.5 rounded-xl bg-white dark:bg-slate-800/90 border border-indigo-100 dark:border-slate-700 shadow-2xs">
              <div className="text-[11px] font-bold uppercase tracking-wider text-indigo-600 dark:text-indigo-400 mb-1 flex items-center gap-1.5">
                <FileText className="w-3.5 h-3.5" /> Matnli tushuntirish
              </div>
              <p className="text-xs text-slate-800 dark:text-slate-200 leading-relaxed whitespace-pre-wrap">
                {text}
              </p>
            </div>
          )}

          {/* 2. Image Explanation */}
          {hasImage && imageUrl && (
            <div className="p-3.5 rounded-xl bg-white dark:bg-slate-800/90 border border-emerald-100 dark:border-slate-700 shadow-2xs space-y-2">
              <div className="text-[11px] font-bold uppercase tracking-wider text-emerald-600 dark:text-emerald-400 flex items-center justify-between">
                <span className="flex items-center gap-1.5">
                  <ImageIcon className="w-3.5 h-3.5" /> Tushuntiruvchi rasm / diagramma
                </span>
                <button
                  type="button"
                  onClick={() => setLightboxOpen(true)}
                  className="text-[11px] font-bold text-emerald-700 dark:text-emerald-300 hover:underline flex items-center gap-1 cursor-pointer"
                >
                  <Maximize2 className="w-3 h-3" /> Kattalashtirish
                </button>
              </div>

              <div
                className="relative group cursor-pointer overflow-hidden rounded-lg border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-900 max-w-md"
                onClick={() => setLightboxOpen(true)}
              >
                <img
                  src={imageUrl}
                  alt="Explanation diagram"
                  className="w-full h-auto max-h-60 object-contain rounded-lg transition-transform duration-200 group-hover:scale-102"
                />
                <div className="absolute inset-0 bg-black/30 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-white text-xs font-bold gap-1.5">
                  <Maximize2 className="w-4 h-4" /> Bosing: to‘liq hajmda ko‘rish
                </div>
              </div>
            </div>
          )}

          {/* 3. Audio (MP3) Explanation */}
          {hasAudio && audioUrl && (
            <div className="p-3.5 rounded-xl bg-white dark:bg-slate-800/90 border border-purple-100 dark:border-slate-700 shadow-2xs space-y-2">
              <div className="text-[11px] font-bold uppercase tracking-wider text-purple-600 dark:text-purple-400 flex items-center gap-1.5">
                <Volume2 className="w-3.5 h-3.5" /> Audio tushuntirish (MP3)
              </div>
              <div className="w-full">
                <audio
                  controls
                  preload="metadata"
                  src={audioUrl}
                  className="w-full h-10 rounded-lg outline-hidden"
                >
                  Brauzeringiz audio tegini qo‘llab-quvvatlamaydi.
                </audio>
              </div>
            </div>
          )}

          {/* 4. Video (MP4 or YouTube) Explanation */}
          {hasVideo && videoUrl && (
            <div className="p-3.5 rounded-xl bg-white dark:bg-slate-800/90 border border-rose-100 dark:border-slate-700 shadow-2xs space-y-2">
              <div className="text-[11px] font-bold uppercase tracking-wider text-rose-600 dark:text-rose-400 flex items-center justify-between">
                <span className="flex items-center gap-1.5">
                  <Video className="w-3.5 h-3.5" /> Video tushuntirish
                </span>
                {embedInfo.isEmbed && (
                  <a
                    href={videoUrl}
                    target="_blank"
                    rel="noreferrer"
                    className="text-[11px] font-bold text-rose-600 dark:text-rose-400 hover:underline flex items-center gap-1"
                  >
                    Asl havola <ExternalLink className="w-3 h-3" />
                  </a>
                )}
              </div>

              <div className="w-full max-w-xl overflow-hidden rounded-xl bg-black border border-slate-800 aspect-video shadow-md">
                {embedInfo.isEmbed ? (
                  <iframe
                    src={embedInfo.url}
                    title="Video explanation"
                    className="w-full h-full border-0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  />
                ) : (
                  <video
                    controls
                    preload="metadata"
                    src={embedInfo.url}
                    className="w-full h-full object-contain"
                  >
                    Brauzeringiz video tegini qo‘llab-quvvatlamaydi.
                  </video>
                )}
              </div>
            </div>
          )}
        </div>
      )}

      {/* Lightbox Modal for Image */}
      {lightboxOpen && imageUrl && (
        <div
          className="fixed inset-0 z-50 bg-black/85 backdrop-blur-xs flex items-center justify-center p-4 cursor-pointer animate-in fade-in duration-200"
          onClick={() => setLightboxOpen(false)}
        >
          <div className="relative max-w-4xl max-h-[90vh] bg-white dark:bg-slate-900 rounded-2xl overflow-hidden shadow-2xl p-2 cursor-default" onClick={(e) => e.stopPropagation()}>
            <button
              type="button"
              onClick={() => setLightboxOpen(false)}
              className="absolute top-3 right-3 z-10 p-1.5 rounded-full bg-slate-800/80 text-white hover:bg-slate-900 transition-colors cursor-pointer"
            >
              <X className="w-5 h-5" />
            </button>
            <img
              src={imageUrl}
              alt="Full size explanation diagram"
              className="max-h-[85vh] w-auto mx-auto rounded-xl object-contain"
            />
          </div>
        </div>
      )}
    </div>
  );
}
