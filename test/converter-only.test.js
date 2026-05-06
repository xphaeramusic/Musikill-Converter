const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const root = '/Volumes/VST/Codigos/Musikill';

function read(relPath) {
  return fs.readFileSync(path.join(root, relPath), 'utf8');
}

test('package/build and UI expose only the converter flow', () => {
  const packageJson = JSON.parse(read('package.json'));
  const preloadJs = read('src/preload.js');
  const mainJs = read('src/main.js');
  const indexHtml = read('src/renderer/index.html');

  assert.equal(packageJson.description, 'Conversor de mídia local & simples.');
  assert.deepEqual(packageJson.build.extraResources, [
    { from: 'resources/ffmpeg', to: 'ffmpeg' },
    { from: 'resources/ffprobe', to: 'ffprobe' },
    { from: 'resources/ffmpeg.exe', to: 'ffmpeg.exe' },
    { from: 'resources/ffprobe.exe', to: 'ffprobe.exe' },
  ]);

  assert.ok(!preloadJs.includes('startSeparation'));
  assert.ok(!preloadJs.includes('onSeparatorProgress'));

  assert.ok(!mainJs.includes('python'));
  assert.ok(!mainJs.includes('demucs'));
  assert.ok(!mainJs.includes('separator:start'));

  assert.ok(!indexHtml.includes('Separador'));
  assert.ok(!indexHtml.includes('separator'));
  assert.ok(indexHtml.includes('Conversor de mídia local'));
});
