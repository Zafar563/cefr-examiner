# 🚀 CEFR Platformasi: GitHub Actions CI/CD va Serverga Avtomatik Deploy Qo'llanmasi

Ushbu qo'llanma yordamida siz **CEFR Examiner** tizimini (PostgreSQL, Redis, Go Backend, Python Media Service, Next.js Frontend) istalgan VPS serverga (Ubuntu / Debian) GitHub Actions orqali **100% avtomatik** deploy qilishingiz mumkin.

Har safar `main` tarmog'iga yangi kod `git push` qilinganda, GitHub Actions:
1. Kodni sinovdan o'tkazadi (Go backend va Next.js frontend yig'ilishini tekshiradi).
2. Serveringizga xavfsiz SSH orqali ulanadi.
3. Yangi o'zgarishlarni yuklab oladi.
4. Docker konteynerlarini yangitdan yig'ib (build qilib), qayta ishga tushiradi.
5. Eskirgan Docker qoldiqlarini avtomatik tozalaydi.

---

## 📋 Mundarija
1. [Serverga qo'yiladigan talablar](#1-serverga-qoyiladigan-talablar)
2. [1-Qadam: Serverni 1 ta buyruq bilan tayyorlash](#2-1-qadam-serverni-tayyorlash)
3. [2-Qadam: SSH Kalitlarini sozlash](#3-2-qadam-ssh-kalitlarini-sozlash)
4. [3-Qadam: GitHub Secrets ni to'ldirish](#4-3-qadam-github-secrets-ni-toldirish)
5. [4-Qadam: Deploy jarayonini ishga tushirish](#5-4-qadam-deploy-jarayonini-ishga-tushirish)
6. [5-Qadam: Domen va Bepul SSL (HTTPS) ulash](#6-5-qadam-domen-va-bepul-ssl-https-ulash)
7. [Foydali Docker buyruqlari](#7-foydali-docker-buyruqlari)

---

## 1. Serverga qo'yiladigan talablar
- **OT:** Ubuntu 22.04 LTS yoki Ubuntu 24.04 LTS (Debian 11/12 ham mos keladi).
- **Resurslar:** Kamida 2 GB RAM (tavsiya: 4 GB RAM Next.js yig'ilishi tezroq bo'lishi uchun) va 2 vCPU.
- **Disk:** Kamida 20 GB SSD/NVMe.

---

## 2. 1-Qadam: Serverni tayyorlash

Serveringizga SSH orqali kiring (`ssh root@SERVER_IP`) va tayyorlab qo'yilgan avtomatlashtirilgan sozlash skriptini ishga tushiring:

```bash
curl -sSL https://raw.githubusercontent.com/Zafar563/cefr-examiner/main/scripts/setup-server.sh | sudo bash
```

> **Ushbu skript nima qiladi?**
> - Tizim paketlarini yangilaydi.
> - Docker Engine va eng so'nggi Docker Compose plaginini rasmiy manbadan o'rnatadi.
> - Nginx va Certbot (bepul SSL uchun) o'rnatadi.
> - UFW fayervolini xavfsiz sozlaydi (Portlar: 22, 80, 443, 3000, 8080, 8000).
> - Deploy katalogini yaratadi: `/var/www/cefr-examiner`.

---

## 3. 2-Qadam: SSH Kalitlarini sozlash

GitHub Actions serveringizga xavfsiz ulanishi uchun unga SSH Private Key kerak bo'ladi.

### Serveringizda yangi SSH kalit juftligini yaratish:
Serveringiz konsolida quyidagi buyruqni bering:

```bash
ssh-keygen -t ed25519 -C "github-actions-cefr" -f ~/.ssh/github_actions -N ""
```

Bu ikkita fayl yaratadi:
- `~/.ssh/github_actions.pub` (Ochiq kalit / Public Key)
- `~/.ssh/github_actions` (Yopiq kalit / Private Key)

### Ochiq kalitni ruxsat berilganlar ro'yxatiga qo'shish:
```bash
cat ~/.ssh/github_actions.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

### Yopiq kalitni (Private Key) nusxalash:
Quyidagi buyruqni berib, ekranga chiqqan barcha matnni (`-----BEGIN OPENSSH PRIVATE KEY-----` dan `-----END OPENSSH PRIVATE KEY-----` gacha) nusxalab oling:

```bash
cat ~/.ssh/github_actions
```

---

## 4. 3-Qadam: GitHub Secrets ni to'ldirish

1. Brauzeringizda GitHub repozitoriyangizga o'ting:  
   👉 **`https://github.com/Zafar563/cefr-examiner`**
2. **Settings** -> chap menyudan **Secrets and variables** -> **Actions** bo'limiga kiring.
3. **New repository secret** tugmasini bosib, quyidagi 6 ta maxfiy o'zgaruvchini kiriting:

| Secret Nomi | Tavsifi | Namuna Qiymat |
| :--- | :--- | :--- |
| `SERVER_HOST` | Serveringizning ommaviy IP manzili yoki domeni | `185.200.123.45` |
| `SERVER_USER` | Serverdagi foydalanuvchi nomi | `root` (yoki `ubuntu`) |
| `SERVER_SSH_KEY` | Yuqoridagi 2-qadamda olingan **Private Key** | `-----BEGIN OPENSSH PRIVATE KEY...` |
| `SERVER_PORT` | SSH port raqami (agar o'zgartirilmagan bo'lsa) | `22` |
| `DEPLOY_PATH` | Serverda loyiha joylashadigan yo'l | `/var/www/cefr-examiner` |
| `ENV_FILE` | Serverdagi to'liq `.env` fayl matni | *(Quyidagi namunaga qarang)* |

### `ENV_FILE` uchun tavsiya etilgan ishlab chiqarish (Production) namunasi:
*(Agar IP orqali ishlatayotgan bo'lsangiz `185.200.123.45` o'rniga o'z IP'ingizni yozing; agar domen bo'lsa `https://exam.domain.uz` deb yozing)*:

```env
PORT_CORE_BACKEND=8080
PORT_MEDIA_SERVICE=8000
PORT_FRONTEND=3000

POSTGRES_USER=cefr_user
POSTGRES_PASSWORD=qattiq_va_maxfiy_parol_2026!
POSTGRES_DB=cefr_db
POSTGRES_HOST=postgres
POSTGRES_PORT=5432
DATABASE_URL=postgres://cefr_user:qattiq_va_maxfiy_parol_2026!@postgres:5432/cefr_db?sslmode=disable

REDIS_HOST=redis
REDIS_PORT=6379
REDIS_ADDR=redis:6379

JWT_SECRET=super_kuchli_jwt_token_kaliti_2026_xavfsizlik_uchun_ozgartiring

MEDIA_SERVICE_URL=http://media-service:8000

# Agar Nginx orqali bitta domen (masalan https://exam.domain.uz) ulasangiz:
# NEXT_PUBLIC_API_URL=https://exam.domain.uz
# NEXT_PUBLIC_MEDIA_URL=https://exam.domain.uz

# Agar Nginx siz, to'g'ridan-to'g'ri IP va portlar bilan ishlatmoqchi bo'lsangiz:
NEXT_PUBLIC_API_URL=http://185.200.123.45:8080
NEXT_PUBLIC_MEDIA_URL=http://185.200.123.45:8000

STORAGE_DIR=/app/storage/uploads
```

---

## 5. 4-Qadam: Deploy jarayonini ishga tushirish

### 1-Usul: Avtomatik (Har safar push qilinganda)
Kompyuteringizda o'zgarishlarni commit qilib, `main` tarmog'iga yuboring:

```bash
git add .
git commit -m "feat: setup automated github actions CI/CD deployment"
git push origin main
```

### 2-Usul: Qo'lda (Manual) tugma orqali
1. GitHub repozitoriyangizda **Actions** bo'limiga kiring.
2. Chap tomondan **CI/CD Pipeline & Deploy to Server** nomli workflowni tanlang.
3. O'ng tarafdagi **Run workflow** tugmasini bosing va **Run workflow** ni tasdiqlang.

GitHub Actions real vaqt rejimida barcha konteynerlarni yig'adi, tekshiradi va serverda ishga tushiradi!

---

## 6. 5-Qadam: Domen va Bepul SSL (HTTPS) ulash (Tavsiya etiladi)

Platformani chiroyli domen orqali (masalan, `exam.sizningdomen.uz`) va xavfsiz HTTPS bilan ishlatish uchun:

1. Serveringizda tayyor Nginx konfiguratsiya faylidan foydalaning:
```bash
sudo cp /var/www/cefr-examiner/nginx/cefr.conf /etc/nginx/sites-available/cefr
```

2. Faylni ochib domeningizni yozing:
```bash
sudo nano /etc/nginx/sites-available/cefr
# server_name _ o'rniga: server_name exam.sizningdomen.uz; qilib saqlang (Ctrl+O, Enter, Ctrl+X)
```

3. Konfiguratsiyani faollashtiring:
```bash
sudo ln -s /etc/nginx/sites-available/cefr /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

4. Bepul SSL (Let's Encrypt) sertifikatini o'rnating:
```bash
sudo certbot --nginx -d exam.sizningdomen.uz
```
Certbot avtomatik ravishda HTTPS ni yoqadi va muddati tugashidan oldin o'zi yangilab turadi!

---

## 7. Foydali Docker buyruqlari

Serveringizda loyiha holatini ko'rish uchun `/var/www/cefr-examiner` papkasiga o'ting:

```bash
cd /var/www/cefr-examiner
```

- **Konteynerlar holatini tekshirish:**
  ```bash
  docker compose ps
  ```
- **Loglarni jonli ko'rish:**
  ```bash
  docker compose logs -f
  ```
- **Faqat bitta xizmat logini ko'rish (masalan, backend):**
  ```bash
  docker compose logs -f core-backend
  ```
- **Tizimni qayta ishga tushirish:**
  ```bash
  docker compose restart
  ```
- **To'xtatish va qayta yig'ish:**
  ```bash
  docker compose down
  docker compose up -d --build
  ```
- **Ma'lumotlar bazasini zahiralash (Backup olish):**
  ```bash
  docker compose exec postgres pg_dump -U cefr_user cefr_db > backup_$(date +%F).sql
  ```
