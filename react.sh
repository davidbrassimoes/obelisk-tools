#!/bin/bash

echo -n "Project name: "
read value

echo "creating $value"
npx create-react-app $value

echo "going to $value"
cd $value

echo "start code"
code .

echo "installing"
npm install

echo "start dev server"
npm run start

read -p "Press enter to continue"