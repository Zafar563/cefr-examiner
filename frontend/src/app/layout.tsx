import type { Metadata } from 'next';
import './globals.css';
import AppLayoutShell from '@/components/AppLayoutShell';

export const metadata: Metadata = {
  title: 'CEFR MATERIALS — Examination & Mock Test Platform',
  description: 'Comprehensive preparation and assessment platform for CEFR / IELTS Listening, Reading, Writing, and Speaking.',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        <script
          dangerouslySetInnerHTML={{
            __html: `
              try {
                var saved = localStorage.getItem('cefr_theme');
                if (saved !== 'light') {
                  document.documentElement.classList.add('dark');
                } else {
                  document.documentElement.classList.remove('dark');
                }
              } catch (e) {}
            `,
          }}
        />
      </head>
      <body className="bg-slate-50 dark:bg-[#141c2b] text-slate-900 dark:text-slate-100 min-h-screen flex flex-col transition-colors duration-200">
        <AppLayoutShell>{children}</AppLayoutShell>
      </body>
    </html>
  );
}
