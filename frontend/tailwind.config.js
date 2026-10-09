/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        slate: {
          50: '#f1f4f9',   // Soft Nordic matte paper for light mode (0 eye fatigue)
          100: '#eef2f6',
          200: '#cbd5e1',
          300: '#94a3b8',
          400: '#64748b',
          500: '#475569',
          600: '#334155',
          700: '#2c3b54',  // Nordic slate subtle border
          750: '#222f44',
          800: '#26344d',  // Nordic slate borders & secondary surfaces
          850: '#182235',  // Inset panels & header surfaces
          900: '#1e293b',  // Main card surface (comfortable graphite slate)
          950: '#141c2b',  // Main page background (calm matte Nordic graphite-slate)
        },
        cefr: {
          50: '#f0fdf4',
          100: '#dcfce7',
          500: '#22c55e',
          600: '#16a34a',
          700: '#15803d',
          900: '#14532d',
        },
        navy: {
          800: '#1e293b',
          850: '#182235',
          900: '#141c2b',
          950: '#0e1420',
        },
        nordic: {
          bg: '#141c2b',
          header: '#182235',
          card: '#1e293b',
          surface: '#26344d',
          border: '#2c3b54',
          accent: '#38bdf8',
          paper: '#f1f4f9',
        },
      },
    },
  },
  plugins: [],
};
