import type { Metadata } from 'next';
import './globals.css';
import AppLayoutShell from '@/components/AppLayoutShell';

export const metadata: Metadata = {
  title: 'CEFR MATERIALS — Imtihon va Mock Test Platformasi',
  description: 'CEFR Listening, Reading, Writing va Speaking bo‘yicha to‘liq tayyorgarlik va baholash platformasi.',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="uz" suppressHydrationWarning>
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
