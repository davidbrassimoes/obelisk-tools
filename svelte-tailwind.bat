@echo off
set /p value="Project name: "

echo creating %value%
call npm create svelte@latest %value%

echo going to %value%
cd %value%

echo installing
call npm install

echo installing Tailwind CSS
call npm install -D tailwindcss postcss autoprefixer
call npx tailwindcss init -p

echo updating svelte.config.js
echo import adapter from '@sveltejs/adapter-auto'; > svelte.config.js
echo import { vitePreprocess } from '@sveltejs/vite-plugin-svelte'; >> svelte.config.js
echo /** @type {import('@sveltejs/kit').Config} */ >> svelte.config.js
echo const config = { >> svelte.config.js
echo   kit: { >> svelte.config.js
echo     adapter: adapter() >> svelte.config.js
echo   }, >> svelte.config.js
echo   preprocess: vitePreprocess() >> svelte.config.js
echo }; >> svelte.config.js
echo export default config; >> svelte.config.js

echo updating tailwind.config.js
echo /** @type {import('tailwindcss').Config} */ > tailwind.config.js
echo export default { >> tailwind.config.js
echo   content: ['./src/**/*.{html,js,svelte,ts}'], >> tailwind.config.js
echo   theme: { >> tailwind.config.js
echo     extend: {} >> tailwind.config.js
echo   }, >> tailwind.config.js
echo   plugins: [] >> tailwind.config.js
echo }; >> tailwind.config.js

echo creating src/app.css
echo @tailwind base; > src/app.css
echo @tailwind components; >> src/app.css
echo @tailwind utilities; >> src/app.css

echo creating src/routes/+layout.svelte
echo test >> src/routes/+layout.svelte
echo ^<script^> > src/routes/+layout.svelte
echo import "../app.css"; >> src/routes/+layout.svelte
echo ^</script^> >> src/routes/+layout.svelte
echo ^<slot /^> >> src/routes/+layout.svelte

echo start code
start code .

echo start dev server
call npm run dev -- --open

pause