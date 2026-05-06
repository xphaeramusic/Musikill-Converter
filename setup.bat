@echo off
setlocal
title Musikill - Setup do Conversor

echo.
echo  ============================================
echo    Musikill - Setup do Conversor
echo  ============================================
echo.

set SCRIPT_DIR=%~dp0
if "%SCRIPT_DIR:~-1%"=="\" set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%
if not exist "%SCRIPT_DIR%\resources" mkdir "%SCRIPT_DIR%\resources"

echo  Instalando dependencias Node.js...
call npm install
if %errorlevel% neq 0 (
    echo  [ERRO] Falha no npm install.
    pause
    exit /b 1
)

echo  Copiando ffmpeg e ffprobe para resources\...
node -e "const fs=require('fs'); fs.copyFileSync(require('ffmpeg-static'), 'resources\\ffmpeg.exe'); fs.copyFileSync(require('@ffprobe-installer/ffprobe').path, 'resources\\ffprobe.exe'); console.log('[OK] ffmpeg.exe e ffprobe.exe copiados.');"
if %errorlevel% neq 0 (
    echo  [ERRO] Falha ao copiar ffmpeg ou ffprobe.
    pause
    exit /b 1
)

echo.
echo  ============================================
echo    Conversor pronto!
echo.
echo    Dev:    npm start
echo    Build:  npm run build:win
echo  ============================================
echo.
pause
