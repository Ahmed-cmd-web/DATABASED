#!/bin/bash

BYellow='\033[1;33m'
BBlue='\033[1;34m'
BPurple='\033[1;35m'
BGreen='\033[1;32m'
NC='\033[;0m'

printf "${BPurple} Please enter the mongoDB url to connect with (default:mongodb://localhost:27017,leave it empty to use default):${BYellow}"
read url
printf "${BPurple} This is going to be the connection name: ${url:=mongodb://localhost:27017}/todo\n"
printf "${BPurple} Please enter a server PORT number to use for the backend server (default:8000,leave it empty to use default):${BYellow}"
read port

echo mongoDBURL="${url:=mongodb://localhost:27017}" '\n'SERVER_PORT="${port:=8000}" > backend/.env
echo REACT_APP_BACKEND_URL="http://localhost:${port:=8000}" > frontend/.env

cd backend
printf "${NC}Setup starting \n"
printf "${BBlue}grab a cup of coffee while setup runs 😉${NC}\n"

OS="`uname`"
if [[  "$OS" == 'Linux'  ]]  ||  [[  "$OS" == 'Darwin'  ]]
then
    n latest
else
    choco install nodist
    nodist local 20.x
fi
npm install yarn
yarn

cd ../frontend
yarn

clear
cd ..

printf "\n${BGreen}Setup done!,try running node index.js on the backend and yarn start on the frontend.\nThank you for using bash setup services 😊.\n"