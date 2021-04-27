#!/bin/bash

function prop {
    grep "${1}" ./build.properties|cut -d'=' -f2
}

function gitClone() {
    echo -e "clone repos"
    git clone https://github.com/cdrchops/cherokeetransliteration.git transliteration
    git clone https://github.com/cdrchops/cherokeeutilities.git utilities
    git clone https://github.com/cdrchops/cherokeeconjugation.git conjugation
#    git clone https://github.com/cdrchops/cedLibrariesForWindows.git
    git clone https://github.com/cdrchops/cherokeedictionary.git dictionary
    git clone https://github.com/cdrchops/cedgrammarguide.git grammar
    git clone https://github.com/cdrchops/CherokeeDateTime.git dateTime
}

function updateLocalFromGit() {
    cd ./utilities/
    git pull
    cd ../dateTime
    git pull
    cd ../transliteration/
    git pull
    cd ../grammar/
    git pull
    cd ../conjugation/
    git pull
    cd ../dictionary/
    git pull
    cd ..
}

#takes a parameter for the path either ./ or ../
function buildTranslit() {
    echo -e "build transliteration"
    cd $1transliteration
    gradle clean build publishToMavenLocal publish
    cd ..
}

#takes a parameter for the path
function buildUtils() {
    echo -e "build utilities"
    cd $1utilities
    gradle clean build publishToMavenLocal publish
    cd ..
}

#takes a parameter for the path
function buildConjugation() {
    echo -e "build conjugation"
    cd $1conjugation
    gradle clean build publishToMavenLocal publish
    cd ..
}

function buildDateTime() {
    echo -e "build dateTime"
    cd $1dateTime
    gradle clean build publishToMavenLocal publish
    cd ..
}

#takes a parameter for the path
function buildDictionary() {
    copyGrammarGuide
    echo -e "build dictionary"
    cd $1dictionary
    grails clean
    grails war
    cd ..
}

function copyGrammarGuide() {
  cp ./grammar/hold1.txt ./dictionary/grails-app/assets/javascripts/hold1.txt
  cp ./grammar/hold2.txt ./dictionary/grails-app/assets/javascripts/hold2.txt
}

function buildAll() {
    echo -e "building all"
    buildTranslit ./
    buildUtils ./
    buildConjugation ./
    buildDictionary ./
    buildDateTime ./
}

function backupDatabaseOnServer() {
    echo "backing up database on server"
    username=$(prop 'USERNAME')
    hosts=$(prop 'HOSTS')
    #todo: fix this so it doesn't have a crappy cli entry
    ssh -l ${username} ${hosts} "\/home/cdrchops/backupDB.sh"
}

function pullDatabaseFromServer() {
    echo "pulling sql dump from server"
    username=$(prop 'USERNAME')
    hosts=$(prop 'HOSTS')
    cd backup
    scp ${username}"@"${hosts}:~/dump.sql.gz ./dump.sql.gz
    cd ..
}

while true
do
  clear
  echo "Menu ----"
  echo "1 - clone repos"
  echo "2 - build all"
  echo "3 - build transliteration"
  echo "4 - build utilities"
  echo "5 - build conjugation"
  echo "6 - build dictionary"
  echo "7 - backup database on server"
  echo "8 - backup database from server"
  echo "9 - pull latest from git"
#  echo "2 - reset all repos"
#  echo "3 - reset translit"
#  echo "3 - reset utils"
#  echo "3 - reset conjugation"
#  echo "3 - reset dictionary"
  echo "q - quit"
  echo ""
  read answer
  echo ""
  case "$answer" in
    q) exit ;;
    1) gitClone
      ;;
    2) buildAll
      ;;
    3) buildTranslit ./
      ;;
    4) buildUtils ./
      ;;
    5) buildConjugation ./
      ;;
    6) buildDictionary ./
      ;;
    7) backupDatabaseOnServer
      ;;
    8) pullDatabaseFromServer
      ;;
    9) updateLocalFromGit
      ;;
  esac
  echo -e "Press Enter to continue \c"
  read input
done
