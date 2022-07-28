#!/bin/bash

USERNAME=$1
SITEPASS=$2
HOSTS=$3
GITHASH=$4
DBPASS=$5

#echo $SITEPASS
#echo $USERNAME
#echo $DBPASS
#echo $HOSTS
#echo $GITHASH

# GIT COMMANDS
    # clone
    # reset
    # add
    # commit
    # update local git
    # status
    # add commit directory

################################################
# DATABASE
################################################
# Database
    # DONE - backup
    # DONE - download
    # upload
    # import locally
    # import on a server

function backupDatabaseOnServer() {
  echo "backing up database on server"
  sshpass -p $SITEPASS ssh $USERNAME@63.142.255.175 "\/home/cdrchops/backupDB.sh $DBPASS"
}

function pullDatabaseFromServer() {
  echo "pulling sql dump from server"
  sshpass -p $SITEPASS scp $USERNAME@63.142.255.175:/home/cdrchops/dump.sql.gz ./dump.sql.gz
}

# site
    # DONE - upload latest war
    # DONE - go to server
    # DONE - restart server
    # start react server
    # stop react client
    # start react client
    # stop react server
    # start both react client and server
    # stop both react client and server
function updateServerWithLatestWar() {
    echo "updateServerWithLatestWar"
    sshpass -p $SITEPASS scp ./dictionary/build/libs/dictionary-0.1.war $USERNAME@63.142.255.175:~/ROOT.war
}

function goToServer() {
    sshpass -p $SITEPASS ssh $USERNAME@63.142.255.175
}

function restartServer() {
    echo "restarting server"
    sshpass -p $SITEPASS ssh $USERNAME@63.142.255.175 "\/home/cdrchops/deployWar.sh"
}

# build
    # DONE - copyGrammarGuide
    # DONE - copyGrooscript
    # build - each project - try to rely on gradle as much as possible
function copyGrammarGuide() {
    echo -e "copy grammar guide to dictionary"
    cp ./grammar/hold1.txt ./dictionary/grails-app/assets/javascripts/hold1.txt
    cp ./grammar/hold2.txt ./dictionary/grails-app/assets/javascripts/hold2.txt
}

function copyGrooscript() {
    echo -e "copy grooscript conversion to dictionary"
    cp ./deconstructor/src/main/webapp/js/**/*.js ./dictionary/grails-app/assets/javascripts/deconstructor
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
    copyGrooscript
    echo -e "build dictionary"
    cd $1dictionary
    grails clean
    grails prod war
    cd ..
}

function buildUtilities() {
    build "utilities" ./
}

function buildTransliteration() {
    build "transliteration" ./
}

function buildConjugation() {
    build "conjugation" ./
}

function buildDateTime() {
    build "dateTime" ./
}

function buildGrooscript() {
    build "grooscript" ./
#    cd grooscript
#    gradle clean build publishToMavenLocal
#    cd ..
}

function buildGrooscriptPlugin() {
    build "grooscript-plugins" ./
#    cd grooscript-plugins
#    gradle clean build publishToMavenLocal
#    cd ..
}

function buildDeconstructor() {
    cd deconstructor
    gradle clean build convert
    cd ..
}

function buildAll() {
    echo -e "building all"
    buildTransliteration
    buildUtilities
    buildConjugation
    buildDateTime
    buildGrooscript
    buildGrooscriptPlugin
    buildDeconstructor

  #    build "transliteration"
  #    build "utilities"
  #    build "conjugation"
  #    build "dateTime"
  #    build "deconstruction"
    buildDictionary
}

# installs
    # win
        # install gradle latest
        # install gradle 3.5
        # install groovy latest
        # install grails latest
        # install jdk 1.8
        # install nvm
        # install nodejs
        # install mysql

function tasks() {
    compgen -A function
}

$6