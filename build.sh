#!/bin/bash

function gitClone() {
    echo -e "clone repos"
    git clone https://github.com/cdrchops/cherokee-transliteration.git transliteration
    git clone https://github.com/cdrchops/cherokee-utilities.git utilities
    git clone https://github.com/cdrchops/cherokeeconjugation.git conjugation
    git clone https://github.com/cdrchops/cedLibrariesForWindows.git
    git clone https://github.com/cdrchops/cherokeedictionary.git dictionary
}

#takes a parameter for the path either ./ or ../
function buildTranslit() {
    echo -e "build transliteration"
    cd $1transliteration
    gradle clean build publishToMavenLocal publish
}

#takes a parameter for the path
function buildUtils() {
    echo -e "build utilities"
    cd $1utilities
    gradle clean build publishToMavenLocal publish
}

#takes a parameter for the path
function buildConjugation() {
    echo -e "build conjugation"
    cd $1conjugation
    gradle clean build publishToMavenLocal publish
}

#takes a parameter for the path
function buildDictionary() {
    echo -e "build dictionary"
    cd $1dictionary
    grails clean
    grails war
}

function buildAll() {
    echo -e "building all"
    buildTranslit ./
    buildUtils ../
    buildConjugation ../
    buildDictionary ../
}

function updateSite() {

}

function backupDatabase() {

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
  esac
  echo -e "Press Enter to continue \c"
  read input
done
