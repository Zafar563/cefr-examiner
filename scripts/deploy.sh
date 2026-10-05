#!/usr/bin/env bash

# ==============================================================================
# CEFR Platformasi - Serverda Konteynerlarni Yangilash va Deploy Skripti
# ==============================================================================

set -e

DEPLOY_DIR="/var/www/cefr-examiner"

if [ -d "$DEPLOY_DIR" ]; then
  cd "$DEPLOY_DIR"
fi

echo "🚀 [1/4] Serverda loyiha tekshirilmoqda: $(pwd)"

# 1. .env faylini tekshirish
if [ ! -f .env ]; then
  if [ -f .env.example ]; then
    cp .env.example .env
    echo "⚠️ .env fayli mavjud emas edi, .env.example dan yaratildi."
  else
    echo "❌ Xatolik: .env fayli topilmadi!"
    exit 1
  fi
fi

# 2. Docker va Docker Compose tekshiruvi
if docker compose version &> /dev/null; then
  COMPOSE_CMD="docker compose"
elif command -v docker-compose &> /dev/null; then
  COMPOSE_CMD="docker-compose"
else
  echo "❌ XATO: Docker Compose o‘rnatilmagan!"
  exit 1
fi

echo "🐳 [2/4] Konteynerlar build qilinib, ishga tushirilmoqda..."
$COMPOSE_CMD pull postgres redis || true
$COMPOSE_CMD up -d --build --remove-orphans

echo "🔍 [3/4] Konteynerlar holati tekshirilmoqda..."
sleep 5
$COMPOSE_CMD ps

echo "🧹 [4/4] Eskirgan Docker qoldiqlari tozalanmoqda..."
docker image prune -f || true

echo "🎉 ========================================================"
echo "🎉 CEFR Platformasi muvaffaqiyatli yangilandi va deploy qilindi!"
echo "🎉 ========================================================"
