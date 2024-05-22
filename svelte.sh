#!/bin/bash

echo -n "Project name: "
read value

echo "creating $value"
npx create-svelte@latest $value

echo "going to $value"
cd $value

echo "start code"
code .

echo "installing"
npm install

echo "start dev server"
npm run dev -- --open

read -p "Press enter to continue"