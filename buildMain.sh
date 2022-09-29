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
  sshpass -p "$SITEPASS" ssh cdrchops@63.142.255.175 "\/home/cdrchops/backupDB.sh Tk02030#"
}

function pullDatabaseFromServer() {
  echo "pulling sql dump from server"
  sshpass -p "$SITEPASS" scp cdrchops@63.142.255.175:/home/cdrchops/dump.sql.gz ./dump.sql.gz
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
    sshpass -p "$SITEPASS" scp ./dictionary/build/libs/dictionary-0.1.war cdrchops@63.142.255.175:~/ROOT.war
}

function goToServer() {
    sshpass -p "$SITEPASS" ssh cdrchops@63.142.255.175
}

function restartServer() {
    echo "restarting server"
    sshpass -p "$SITEPASS" ssh cdrchops@63.142.255.175 "\/home/cdrchops/deployWar.sh"
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
    //copyGrooscript
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
    #buildGrooscript
    #buildGrooscriptPlugin
    #buildDeconstructor

  #    build "transliteration"
  #    build "utilities"
  #    build "conjugation"
  #    build "dateTime"
  #    build "deconstruction"
    buildDictionary
}


################################################
# GIT
################################################
# GIT COMMANDS
    # clone
    # reset
    # add
    # commit
    # update local git
    # status
    # add commit directory

function gitPush() {
    echo "git push"
}

function gitClone() {
    echo -e "clone repos"
    host=https://$GITHASH@github.com
    # This is already chacked out as evidenced by the ability to read this script
    # https://github.com/CherokeeLanguage/cedproject.git
    git clone $host/CherokeeLanguage/cherokeetransliteration.git transliteration
    git clone $host/CherokeeLanguage/cherokeeutilities.git utilities
    git clone $host/CherokeeLanguage/cherokeeconjugation.git conjugation
    #git clone $host/CherokeeLanguage/cedLibrariesForWindows.git
    git clone $host/CherokeeLanguage/cherokeedictionary.git dictionary
    git clone $host/CherokeeLanguage/cedgrammarguide.git grammar
    git clone $host/CherokeeLanguage/CherokeeDateTime.git dateTime
    #git clone $host/CherokeeLanguage/cherokeeDeconstructor.git deconstructor
    #git clone $host/cdrchops/grooscript.git grooscript
    #git clone $host/cdrchops/grooscript-plugins.git
    #git clone $host/CherokeeLanguage/reactCED.git reactCED
    #git clone https://github.com/node-gradle/gradle-node-plugin
}

function installSDKsLinux() {
    #!/bin/bash
    #https://www.windowscentral.com/how-backup-windows-subsystem-linux-wsl-distribution
    sudo apt update && sudo apt upgrade
    sudo apt dist-upgrade
    sudo apt-get install dist-upgrade git wget curl zip unzip lsb-release gnupg sshpass -Y
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    sdk install java 8.0.292.j9-adpt
    sdk install gradle 6.9.2
    sdk install gradle 3.5
    sdk install grails 4.0.11
    sudo apt-get install mariadb-client mariadb-server

    #https://serverspace.io/support/help/how-to-install-mysql-on-debian-10/
    #sudo apt-get install default-mysql-server #don't use this one
    wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
    sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb
    #apt-get update
    #sudo apt install mysql-server
    #sudo apt-get install mysql-community-server
    #/usr/bin/mysql -u root -p

    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source ~/.bashrc
    nvm install node

    npm install gulp-cli
}

function tasks() {
    compgen -A function
}

$6