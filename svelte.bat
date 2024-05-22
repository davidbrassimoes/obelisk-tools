@echo off
set /p value="Project name: "

echo creating %value%
call npm create svelte@latest %value%

echo going to %value%
cd %value%

echo start code
start code .

echo installing
call npm install

echo start dev server
call npm run dev -- --open

pause