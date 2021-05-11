#!/bin/bash

function prop {
    grep "${1}" ./build.properties|cut -d'=' -f2
}

function gitClone() {
    echo -e "clone repos"
    git clone https://github.com/cdrchops/cherokeetransliteration.git transliteration
    git clone https://github.com/cdrchops/cherokeeutilities.git utilities
    git clone https://github.com/cdrchops/cherokeeconjugation.git conjugation
    git clone https://github.com/cdrchops/cedLibrariesForWindows.git
    git clone https://github.com/cdrchops/cherokeedictionary.git dictionary
    git clone https://github.com/cdrchops/cedgrammarguide.git grammar
    git clone https://github.com/cdrchops/CherokeeDateTime.git dateTime
    git clone https://github.com/cdrchops/cherokeeDecontstructor.git deconstructor
     git clone https://github.com/cdrchops/reactCED.git reactCED
}

function pull() {
    git pull
}

function reset() {
    git reset --hard
}

function directories() {
    cd ./utilities/
    $1
    cd ../dateTime
    $1
    cd ../transliteration/
    $1
    cd ../conjugation/
    $1
    cd ../deconstructor/
    $1
    cd ../dictionary/
    $1
    cd ..
}

function resetLocalFromGit() {
    echo "reset local from git"
    directories reset
}

function updateLocalFromGit() {
    echo "update local from git"
    directories pull
}

function build() {
    echo "build "$1
    cd $1
    gradle clean build publishToMavenLocal publish
    cd ..
}

#takes a parameter for the path
function buildDictionary() {
    copyGrammarGuide
    echo -e "build dictionary"
    cd $1dictionary
    grails clean
    grails prod war
    cd ..
}

function copyGrammarGuide() {
    cp ./grammar/hold1.txt ./dictionary/grails-app/assets/javascripts/hold1.txt
    cp ./grammar/hold2.txt ./dictionary/grails-app/assets/javascripts/hold2.txt
}

function buildAll() {
    echo -e "building all"
    build "transliteration"
    build "utilities"
    build "conjugation"
    build "dateTime"
#    build "deconstruction"
    buildDictionary
}

function backupDatabaseOnServer() {
    echo "backing up database on server"
#    ssh cdrchops@63.142.255.175 "\/home/cdrchops/backupDB.sh"
#    ssh -l $(prop 'USERNAME') $(prop 'HOSTS') "\/home/cdrchops/backupDB.sh"
}

function pullDatabaseFromServer() {
    echo "pulling sql dump from server"
#    scp cdrchops@63.142.255.175:~/dump.sql.gz ./dump.sql.gz
#    scp $(prop 'USERNAME')"@"$(prop 'HOSTS'):~/dump.sql.gz ./backup/dump.sql.gz
}

function updateServerWithLatestWar() {
    echo "updateServerWithLatestWar"
#    scp ./dictionary/build/libs/dictionary-0.1.war cdrchops@63.142.255.175:~/ROOT.war
}

function startReactServer() {
    ./gradlew server:bootRun
}

function startReactClient() {
    ./gradlew client:start
}

function stopReactClient() {
  # taskkill -F -IM node.exe #windows
    lsof -i :3000
}
function stopReactServer() {
    lsof -i :8080
}

function startBothClientAndServer() {
    ./gradlew bootRun -parallel
}

function stopBothClientAndServer() {
    stopReactClient
    stopReactServer
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
  echo "10 - reset repositories from git"
  echo "11 - upload latest war to site"
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
    10) resetLocalFromGit
      ;;
    11) updateServerWithLatestWar
      ;;
  esac
  echo -e "Press Enter to continue \c"
  read input
done
