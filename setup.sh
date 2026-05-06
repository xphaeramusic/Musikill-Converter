#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   Musikill — Setup do Conversor          ║"
echo "╚══════════════════════════════════════════╝"
echo ""

mkdir -p resources

echo "📦  Instalando dependências Node.js..."
npm install --quiet

echo "📦  Copiando ffmpeg e ffprobe para resources/..."
node -e "
const fs = require('fs');
fs.copyFileSync(require('ffmpeg-static'), 'resources/ffmpeg');
fs.copyFileSync(require('@ffprobe-installer/ffprobe').path, 'resources/ffprobe');
fs.chmodSync('resources/ffmpeg', 0o755);
fs.chmodSync('resources/ffprobe', 0o755);
console.log('ffmpeg e ffprobe copiados.');
"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║  ✅  Conversor pronto para uso           ║"
echo "║                                          ║"
echo "║  Dev:    npm start                       ║"
echo "║  Build:  npm run build:mac               ║"
echo "╚══════════════════════════════════════════╝"
echo ""
