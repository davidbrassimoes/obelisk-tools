@echo off
set /p value="Project name: "

echo creating %value%
call npx create-react-app %value%

echo going to %value%
cd %value%

echo start code
start code .

echo installing
call npm install

echo start dev server
call npm start

pause