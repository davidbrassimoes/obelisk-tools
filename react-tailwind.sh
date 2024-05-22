#!/bin/bash

echo -n "Project name: "
read value

echo "creating $value"
npx create-react-app $value

echo "going to $value"
cd $value

echo "installing Tailwind CSS"
npm install -D tailwindcss
npx tailwindcss init

echo "updating tailwind.config.js"
echo "/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{js,jsx,ts,tsx}'],
  theme: {
    extend: {},
  },
  plugins: [],
};" > tailwind.config.js

echo "updating src/index.css"
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > src/index.css

echo "start code"
code .

echo "start dev server"
npm run start

read -p "Press enter to continue"