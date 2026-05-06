# Musikill Converter

Conversor de mídia desktop feito em Electron, com processamento local e `ffmpeg` embutido no projeto.

## O que o app faz

- Converte arquivos de áudio e vídeo localmente
- Suporta múltiplos arquivos por vez
- Permite salvar individualmente ou em lote
- Usa `ffmpeg` e `ffprobe` incluídos no projeto

## Formatos suportados

### Áudio

`MP3`, `AAC`, `M4A`, `WAV`, `FLAC`, `OGG`, `Opus`

### Vídeo

`MP4 (H.264)`, `MP4 (H.265)`, `MKV`, `MOV`, `AVI`, `WebM`, `GIF`

## Desenvolvimento

Instalar dependências:

```bash
npm install
```

Preparar os binários do conversor:

```bash
./setup.sh
```

Rodar o app:

```bash
npm start
```

## Build

macOS:

```bash
npm run build:mac
```

Windows:

```bash
npm run build:win
```

## Estrutura

- [src/main.js](src/main.js): processo principal e pipeline de conversão
- [src/preload.js](src/preload.js): ponte IPC
- [src/renderer/index.html](src/renderer/index.html): interface do conversor
- [resources](resources): logo, ícones e binários `ffmpeg`/`ffprobe`

## Observações

- O projeto atual é somente conversor.
- Não há mais fluxo de separação de stems no app.
