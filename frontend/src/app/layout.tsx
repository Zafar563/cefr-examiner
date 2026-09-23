import type { Metadata } from 'next';
import './globals.css';
import Navbar from '@/components/Navbar';

export const metadata: Metadata = {
  title: 'CEFR Practice & Assessment Platform (Mock Test Tizimi)',
  description: 'Reading, Listening, Writing va Speaking bo‘yicha to‘liq CEFR imtihonini topshirish va darajani aniqlash platformasi.',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="uz">
      <body className="bg-slate-50 text-slate-900 min-h-screen flex flex-col">
        <Navbar />
        <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8">
          {children}
        </main>
        <footer className="border-t border-slate-200 bg-white py-6 text-center text-xs text-slate-500">
          <p>© 2026 CEFR Practice & Assessment Platform. Barcha huquqlar himoyalangan.</p>
          <p className="mt-1">Go Core Backend + Python Media Service + Next.js Frontend (Dockerized)</p>
        </footer>
      </body>
    </html>
  );
}
