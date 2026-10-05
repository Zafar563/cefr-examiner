#!/usr/bin/env bash

# ==============================================================================
# CEFR Platformasi - Serverni avtomatlashtirilgan sozlash skripti (Ubuntu/Debian)
# ==============================================================================
# Foydalanish:
#   curl -sSL https://raw.githubusercontent.com/Zafar563/cefr-examiner/main/scripts/setup-server.sh | sudo bash
#   yoki:
#   chmod +x scripts/setup-server.sh && sudo ./scripts/setup-server.sh
# ==============================================================================

set -e

echo "=========================================================="
echo "🚀 CEFR Platformasi: Serverni sozlash boshlandi..."
echo "=========================================================="

# Root huquqini tekshirish
if [ "$EUID" -ne 0 ]; then
  echo "❌ Iltimos, ushbu skriptni sudo yoki root foydalanuvchisi sifatida ishga tushiring:"
  echo "   sudo bash $0"
  exit 1
fi

# 1. Tizim paketlarini yangilash
echo "📦 [1/6] Tizim paketlari yangilanmoqda..."
apt-get update -y
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    ufw \
    htop \
    nano \
    tar \
    unzip

# 2. Docker va Docker Compose plaginini rasmiy repozitoriydan o'rnatish
echo "🐳 [2/6] Docker va Docker Compose o'rnatilmoqda..."
if ! command -v docker &> /dev/null; then
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg --yes
    chmod a+r /etc/apt/keyrings/docker.gpg

    UBUNTU_CODENAME=$(lsb_release -cs 2>/dev/null || echo "jammy")
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $UBUNTU_CODENAME stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update -y
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    systemctl enable --now docker
    echo "✅ Docker muvaffaqiyatli o'rnatildi: $(docker --version)"
else
    echo "✅ Docker allaqachon o'rnatilgan: $(docker --version)"
fi

# 3. Nginx o'rnatish
echo "🌐 [3/6] Nginx veb-serveri tekshirilmoqda..."
if ! command -v nginx &> /dev/null; then
    apt-get install -y nginx certbot python3-certbot-nginx
    systemctl enable --now nginx
    echo "✅ Nginx va Certbot o'rnatildi."
else
    echo "✅ Nginx allaqachon mavjud."
fi

# 4. Fayervol (UFW) xavfsizlik qoidalarini sozlash
echo "🛡️ [4/6] UFW fayervol qoidalari sozlanmoqda..."
ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp

# To'g'ridan-to'g'ri portlar orqali kirish (ixtiyoriy, Nginx ishlatilmasa ham ishlashi uchun)
ufw allow 3000/tcp comment 'Next.js Frontend'
ufw allow 8080/tcp comment 'Go Backend API'
ufw allow 8000/tcp comment 'Python Media Service'

ufw --force enable
echo "✅ Fayervol yoqildi (Portlar: 22, 80, 443, 3000, 8080, 8000 ochildi)."

# 5. Loyiha katalogini yaratish va ruxsatlarni to'g'rilash
echo "📁 [5/6] Loyiha katalogi (/var/www/cefr-examiner) tayyorlanmoqda..."
TARGET_DIR="/var/www/cefr-examiner"
mkdir -p "$TARGET_DIR"

# Agar standart 'ubuntu' foydalanuvchisi mavjud bo'lsa, unga huquq berish
if id "ubuntu" &>/dev/null; then
    usermod -aG docker ubuntu
    chown -R ubuntu:ubuntu "$TARGET_DIR"
elif id "root" &>/dev/null; then
    chown -R root:root "$TARGET_DIR"
fi

echo "✅ Loyiha katalogi tayyor: $TARGET_DIR"

# 6. SSH kalit ma'lumotlarini chiqarish
echo "🔑 [6/6] SSH kirish ma'lumotlari..."
echo "=========================================================="
echo "🎉 Server muvaffaqiyatli tayyorlandi!"
echo ""
echo "📌 Keyingi qadamlar:"
echo "1. GitHub repozitoriyangizga kiring: Settings -> Secrets and variables -> Actions"
echo "2. Quyidagi Secrets ni qo'shing:"
echo "   - SERVER_HOST: $(curl -s https://ifconfig.me || echo 'SIZNING_SERVER_IP')"
echo "   - SERVER_USER: root (yoki ubuntu)"
echo "   - SERVER_SSH_KEY: Serveringizga ulanadigan shaxsiy (private) SSH kaliti"
echo "   - SERVER_PORT: 22"
echo "   - DEPLOY_PATH: /var/www/cefr-examiner"
echo "   - ENV_FILE: .env faylingizning barcha mazmuni"
echo "=========================================================="
