# CEFR Practice & Assessment Platform (Mock Test Tizimi)

Ingliz tili bo‘yicha xalqaro **CEFR (A1–C1)** ko‘nikmalarini (Reading, Listening, Writing, Speaking) kompleks baholash va real imtihon muhitini simulyatsiya qiluvchi to‘liq avtomatlashtirilgan platforma.

---

## 🏛️ Tizim Arxitekturasi

Platforma mikroxizmatlar va gibrid konteyner arxitekturasida loyihalashtirilgan:

- **Core Backend (`Go / Gin`):** Port `8080`
  - Foydalanuvchilar va RBAC huquqlari (Student, Examiner, Admin).
  - JWT autentifikatsiya va xavfsizlik (bcrypt).
  - Test sessiyalari, aniq soniyali taymer boshqaruvi.
  - Reading va Listening savollarini zudlik bilan avtomatik tekshirish.
  - CEFR darajalarini hisoblash matritsasi (A1 dan C1 gacha).
- **Media & Audio Service (`Python / FastAPI`):** Port `8000`
  - Brauzer orqali yozilgan Speaking audio yozuvlarini (WebM/WAV) qabul qilish va saqlash.
  - Admin yuklagan Listening audio treklari uchun audio-oqim (streaming).
  - Kelajakda avtomatik sun'iy intellekt (Speech-to-Text / Whisper) tahlilini ulashga tayyor.
- **Frontend (`Next.js 14 / TypeScript / Tailwind CSS`):** Port `3000`
  - **Listening:** Audio pleyer (maksimal 2 marta eshitish imkoniyati bilan).
  - **Reading:** Split-screen interfeys (chapda matn, o‘ngda savollar).
  - **Writing:** Real-vaqt so‘zlar sonini sanovchi muharrir (Task 1: min 150, Task 2: min 250 so‘z).
  - **Speaking:** Web Audio API / MediaRecorder orqali mikrofon yordamida ovoz yozish.
  - **Examiner Paneli:** Writing insholari va Speaking audio yozuvlarini baholash va izoh yozish.
  - **Admin Paneli:** Testlar, bo‘limlar, audio fayllar va savollarni boshqarish (CRUD).
- **PostgreSQL 16:** Asosiy relyatsion ma'lumotlar bazasi (avtomatik migratsiyalar va seed ma'lumotlar bilan).
- **Redis 7:** Taymer va sessiyalarni keshda saqlash.

---

## 🚀 Ishga Tushirish (Docker Compose)

Loyiha to‘liq Docker konteynerlariga moslashtirilgan. Barcha xizmatlarni bir vaqtning o‘zida ishga tushirish uchun quyidagi buyruqni bering:

```bash
docker compose up --build
```

Barcha servislar ishga tushgach:
- 🌐 **Web Ilova (Frontend):** [http://localhost:3000](http://localhost:3000)
- ⚙️ **Core Backend API (Go):** [http://localhost:8080/health](http://localhost:8080/health)
- 🎙️ **Media Service (Python):** [http://localhost:8000/docs](http://localhost:8000/docs)
- 🗄️ **PostgreSQL:** `localhost:5432`

---

## 🔑 Tayyor Demo Foydalanuvchilar

Baza yaratilishi bilan tizimda 3 xil rol uchun namunaviy hisoblar va to‘liq 4 ta bo‘limdan iborat rasmiy **CEFR Mock Test** tayyor holatda bo‘ladi:

| Rol | Email | Parol | Huquqlar |
| :--- | :--- | :--- | :--- |
| **Student** (O‘quvchi) | `student@cefr.uz` | `password123` | Test topshirish, taymer, audio eshitish, ovoz yozish, natijalar tahlili |
| **Examiner** (O‘qituvchi) | `examiner@cefr.uz` | `password123` | Writing insholarini o‘qish, Speaking audiolarni eshitish va ball/feedback berish |
| **Admin** (Administrator) | `admin@cefr.uz` | `password123` | Yangi testlar yaratish, audio yuklash, savollar qo‘shish, o‘chirish |

> *Ilovaning asosiy sahifasida ushbu hisoblarga 1 marta bosish bilan tezkor kirish tugmalari mavjud.*

---

## 📊 CEFR Darajasini Hisoblash Matritsasi

$$ \text{Umumiy Foiz} = \frac{\text{To'plangan Ballar Yig'indisi}}{\text{Maksimal Ball}} \times 100 $$

| Foiz Oralig‘i | CEFR Darajasi | Izoh |
| :---: | :---: | :--- |
| **80% – 100%** | **C1** | Advanced (Oliy daraja) |
| **65% – 79%** | **B2** | Upper-Intermediate (Mustaqil) |
| **50% – 64%** | **B1** | Intermediate (O‘rta) |
| **35% – 49%** | **A2** | Elementary |
| **0% – 34%** | **A1** | Beginner |

- **Reading & Listening:** O‘quvchi testni yakunlashi (Submit) bilan avtomatik tekshirilib, ballar zudlik bilan chiqadi.
- **Writing & Speaking:** Examiner paneliga tushadi. Examiner baholagach, umumiy ball qayta hisoblanadi va talabaning shaxsiy kabinetida yakuniy **CEFR darajasi (A1–C1)** yangilanadi.
