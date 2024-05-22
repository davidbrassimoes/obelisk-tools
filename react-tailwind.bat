@echo off
set /p value="Project name: "

echo creating %value%
call npx create-react-app %value%

echo going to %value%
cd %value%

echo installing Tailwind CSS
call npm install -D tailwindcss
call npx tailwindcss init

echo updating tailwind.config.js
echo /** @type {import('tailwindcss').Config} */ > tailwind.config.js
echo module.exports = { >> tailwind.config.js
echo   content: ["./src/**/*.{js,jsx,ts,tsx}"], >> tailwind.config.js
echo   theme: { >> tailwind.config.js
echo     extend: {}, >> tailwind.config.js
echo   }, >> tailwind.config.js
echo   plugins: [], >> tailwind.config.js
echo }; >> tailwind.config.js

echo updating src/index.css
echo @tailwind base; > src/index.css
echo @tailwind components; >> src/index.css
echo @tailwind utilities; >> src/index.css

echo start code
start code .

echo start dev server
call npm run start

pause