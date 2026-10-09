import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/Navbar';

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
        <Navbar />
        <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8">
          {children}
        </main>
        <footer className="border-t border-slate-200 dark:border-slate-800 bg-white dark:bg-[#182235] py-8 text-center text-sm font-semibold text-slate-500 dark:text-slate-400 transition-colors duration-200">
          <p>© 2026 CEFR MATERIALS. Barcha huquqlar himoyalangan.</p>
        </footer>
      </body>
    </html>
  );
}
