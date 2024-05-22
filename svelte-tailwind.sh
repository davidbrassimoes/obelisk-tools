#!/bin/bash

echo -n "Project name: "
read value

echo "creating $value"
npx create-svelte@latest $value

echo "going to $value"
cd $value

echo "installing"
npm install

echo "installing Tailwind CSS"
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

echo "updating svelte.config.js"
echo "import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter()
  },
  preprocess: vitePreprocess()
};
export default config;" > svelte.config.js

echo "updating tailwind.config.js"
echo "/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: []
};" > tailwind.config.js

echo "creating src/app.css"
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > src/app.css

echo "creating src/routes/+layout.svelte"
echo "<script>
import \"../app.css\";
</script>
<slot />" > src/routes/+layout.svelte

echo "start code"
code .

echo "start dev server"
npm run dev -- --open

read -p "Press enter to continue"