#!/bin/bash

# TODO: unzip and import sql to database then delete local database zip file

function prop() {
    grep "${1}" ./build.properties | cut -d'=' -f2
}

function gitClone() {
    echo -e "clone repos"
    git clone https://github.com/CherokeeLanguage/cherokeetransliteration.git transliteration
    git clone https://github.com/CherokeeLanguage/cherokeeutilities.git utilities
    git clone https://github.com/CherokeeLanguage/cherokeeconjugation.git conjugation
    git clone https://github.com/CherokeeLanguage/cedLibrariesForWindows.git
    git clone https://github.com/CherokeeLanguage/cherokeedictionary.git dictionary
    git clone https://github.com/CherokeeLanguage/cedgrammarguide.git grammar
    git clone https://github.com/CherokeeLanguage/CherokeeDateTime.git dateTime
    git clone https://github.com/CherokeeLanguage/cherokeeDeconstructor.git deconstructor
    git clone https://github.com/CherokeeLanguage/reactCED.git reactCED
}

function pull() {
    git pull
}

function reset() {
    git reset --hard
}

function status() {
    git status
}

function addCommit() {
    git add .
    git commit -m "$1"
    git push
}

function directories() {
    echo "in utilities"
    cd ./utilities/
    $1 $2
    echo "in date time"
    cd ../dateTime
    $1 $2
    echo "in transliteration"
    cd ../transliteration/
    $1 $2
    echo "in conjugation"
    cd ../conjugation/
    $1 $2
    echo "in deconstructor"
    cd ../deconstructor/
    $1 $2
    echo "in reactCED"
    cd ../reactCED/
    $1 $2
    echo "in dictionary"
    cd ../dictionary/
    $1 $2
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

function statusLocalFromGit() {
    echo "status local from git"
    directories status
}

function addCommitToGit() {
    echo "commit message?"
    read answer
    echo ""
    directories addCommit answer
}

function build() {
    echo "build "$1
    cd $1
    gradle clean build publishToMavenLocal publish
    cd ..
}

function copyGrammarGuide() {
    cp ./grammar/hold1.txt ./dictionary/grails-app/assets/javascripts/hold1.txt
    cp ./grammar/hold2.txt ./dictionary/grails-app/assets/javascripts/hold2.txt
}

function addCommitDirectory() {
    cd $1
    echo "commit message?"
    read answer
    echo ""
    addCommit $1 answer
    cd ..
}

function addCommitUtilities() {
    addCommitDirectory "utilities"
}

function addCommitTransliteration() {
    addCommitDirectory "transliteration"
}

function addCommitConjugation() {
    addCommitDirectory "conjugation"
}

function addCommitDateTime() {
    addCommitDirectory "dateTime"
}

function addCommitDictionary() {
    addCommitDirectory "dictionary"
}

function addCommitReactCED() {
    addCommitDirectory "reactCED"
}

function addCommitDeconstructor() {
    addCommitDirectory "deconstructor"
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

function buildDeconstructor() {
    cd deconstructor
    gradle convert
    cd ..
}

function buildAll() {
    echo -e "building all"
    buildTransliteration
    buildUtilities
    buildConjugation
    buildDateTime
#    build "transliteration"
#    build "utilities"
#    build "conjugation"
#    build "dateTime"
    #    build "deconstruction"
    buildDictionary
}

function backupDatabaseOnServer() {
    echo "backing up database on server"
    #    ssh cdrchops@63.142.255.175 "\/home/cdrchops/backupDB.sh"
    ssh -l $(prop 'USERNAME') $(prop 'HOSTS') "\/home/cdrchops/backupDB.sh"
}

function pullDatabaseFromServer() {
    echo "pulling sql dump from server"
    #    scp cdrchops@63.142.255.175:~/dump.sql.gz ./dump.sql.gz
    scp $(prop 'USERNAME')"@"$(prop 'HOSTS'):~/dump.sql.gz ./backup/dump.sql.gz
}

function updateServerWithLatestWar() {
    echo "updateServerWithLatestWar"
    scp ./dictionary/build/libs/dictionary-0.1.war cdrchops@63.142.255.175:~/ROOT.war
#    scp ./dictionary/build/libs/dictionary-0.1.war $(prop 'USERNAME')"@"$(prop 'HOSTS'):~/ROOT.war
}

function goToServer() {
    ssh cdrchops@63.142.255.175
}

function restartServer() {
  echo "restarting server"
  ssh -l $(prop 'USERNAME') $(prop 'HOSTS') "\/home/cdrchops/stopTomcat.sh"
  ssh -l $(prop 'USERNAME') $(prop 'HOSTS') "\/home/cdrchops/copyWar.sh"
  ssh -l $(prop 'USERNAME') $(prop 'HOSTS') "\/home/cdrchops/startTomcat.sh"
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

function installGradleSDKLinuxMac() {
    echo "installing gradle 6.8.3 via sdk"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install gradle 6.8.3
}

function installGrailsSDKLinuxMac() {
    echo "installing grails 4.0.10 via sdk"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install grails 4.0.10
}

function installJDKSDKLinuxMac() {
    echo "installing jdk 8 via sdk"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 8.0.292.j9-adpt
}

function installGroovySDKLinuxMac() {
    echo "installing groovy 3.0.8 via sdk"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install groovy 3.0.8
}

function installSDKManLinuxMac() {
    echo "install sdkman"
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    sdk version
}

function installSDKMANAllLinuxMac() {
    installSDKManLinuxMac
    installGradleSDKLinuxMac
    installGrailsSDKLinuxMac
    installGroovySDKLinuxMac
    installJDKSDKLinuxMac
}

function installGradleSDKWindows() {
    echo "installing gradle 6.8.3"
    #    source "$HOME/.sdkman/bin/sdkman-init.sh"
    #    sdk install gradle 6.8.3
    #https://gradle.org/next-steps/?version=6.8.3&format=bin
}

function installGrailsSDKWindows() {
    echo "installing grails 4.0.10"
    #    source "$HOME/.sdkman/bin/sdkman-init.sh"
    #    sdk install grails 4.0.10
    #    https://github.com/grails/grails-core/releases/download/v4.0.10/grails-4.0.10.zip
}

function installJDKSDKWindows() {
    echo "installing jdk 8"
    #    source "$HOME/.sdkman/bin/sdkman-init.sh"
    #    sdk install java 8.0.292.j9-adpt
    #    https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html
}

function installGroovySDKWindows() {
    echo "installing groovy 3.0.8"
    #    source "$HOME/.sdkman/bin/sdkman-init.sh"
    #    sdk install groovy 3.0.8
}

function installAllWindows() {
    installGradleSDKWindows
    installGrailsSDKWindows
    installGroovySDKWindows
    installJDKSDKWindows
}

function installNodeLinuxMac() {
    echo "install node linux/mac"
    #    https://nodejs.org/dist/v14.17.0/node-v14.17.0.pkg
    #    https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.xz
}

function installNPMLinuxMac() {
    npm install npm@latest -g
}

function installNodeWindows() {
    echo "install node for windows"
    #    https://nodejs.org/dist/v14.17.0/node-v14.17.0-x64.msi
}

function installNPMWindows() {
    npm install npm@latest -g
}

function installMysqlDatabase() {
    rootpasswd=Tk02030#
    MAINDB=smallDb
    PASSWDDB="Tk02030#"
    mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -uroot -p${rootpasswd} -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
    mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
    mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
    mysql -uroot -p${rootpasswd} smallDb <./backups/cedSmallDb.sql
}

#backups
#cedLibrariesForWindows
#conjugation - b
#dateTime - b
#deconstructor - b
#dictionary - b
#grammar - b
#reactCED - b
#cnt - need project
#transliteration - b
#utilities - b

while true; do
    clear
    echo $(prop 'USERNAME') $(prop 'HOSTS')
    echo "CHECKOUT AND BUILD COMMANDS"

    echo "1 - clone repos"
    echo "2 - pull latest from git"
    echo "3 - status of repositories from git"
    echo "4 - reset repositories from git"
    echo "-----------------------"
    echo "GIT ADD AND COMMIT"
    echo ""
    echo "10 - add and commit ALL repositories to git"
    echo "11 - add and commit transliteration"
    echo "12 - add and commit utilities"
    echo "13 - add and commit conjugation"
    echo "14 - add and commit date time library"
    echo "15 - add and commit react"
    echo "16 - add and commit deconstructor"
    echo "19 - add and commit dictionary (production)"
    echo "-----------------------"
    echo "BUILD COMMANDS"
    echo ""
    echo "30 - build all"
    echo "31 - build transliteration"
    echo "32 - build utilities"
    echo "33 - build conjugation"
    echo "34 - build date time library"
    echo "35 - build react"
    echo "36 - build deconstructor"
    echo "39 - build dictionary (production)"
    echo "-----------------------"
    echo "ALL SERVER COMMANDS"
    echo ""
    echo "70 - backup database on server"
    echo "71 - backup database from server"
    echo "72 - upload latest war to site"
    echo "73 - go to server"
    echo "74 - restartServer with latest war"
    echo "-----------------------"
    echo "ALL LINUX/MAC COMMANDS"
    echo ""
    echo "80 - linux/mac install node"
    echo "81 - linux/mac install npm"
    echo "82 - linux/mac install sdkman gradle grails jdk groovy"
    echo "83 - linux/mac install sdkman"
    echo "84 - linux/mac install gradle 6.8.3"
    echo "85 - linux/mac install grails 4.0.10"
    echo "86 - linux/mac install jdk 8"
    echo "87 - linux/mac install groovy 3.0.8"
    echo "-----------------------"
    echo "ALL WINDOWS COMMANDS"
    echo ""
    echo "90 - windows install node"
    echo "91 - windows install npm"
    echo "92 - windows install gradle grails jdk groovy"
    echo "93 - windows install gradle"
    echo "94 - windows install grails"
    echo "95 - windows install jdk"
    echo "96 - windows install groovy"
    echo "-----------------------"
    echo "ALL DATABASE COMMANDS"
    echo ""
    echo "100 - mysql install database"
    echo "q - quit"
    echo ""
    read answer
    echo ""
    case "$answer" in
    q) exit ;;
    1)
        gitClone
        ;;
    2)
        updateLocalFromGit
        ;;
    3)
        statusLocalFromGit
        ;;
    4)
        resetLocalFromGit
        ;;
    10)
        addCommitToGit
        ;;
    11)
        buildTransliteration
        ;;
    12)
        addCommitUtilities
        ;;
    13)
        addCommitConjugation
        ;;
    14)
        addCommitDateTime
        ;;
    15)
        addCommitReactCEDReact ./
        ;;
    16)
        addCommitDeconstructor ./
        ;;
    19)
        addCommitDictionary ./
        ;;
    30)
        buildAll
        ;;
    31)
        buildTransliteration
        ;;
    32)
        buildUtilities
        ;;
    33)
        buildConjugation
        ;;
    34)
        buildDateTime
        ;;
    35)
        buildReactCED ./
        ;;
    36)
        buildDeconstructor ./
        ;;
    39)
        buildDictionary ./
        ;;
    70)
        backupDatabaseOnServer
        ;;
    71)
        pullDatabaseFromServer
        ;;
    72)
        updateServerWithLatestWar
        ;;
    73)
        goToServer
        ;;
    74)
        restartServer
        ;;
    80)
        installNodeLinuxMac
        ;;
    81)
        installNPMLinuxMac
        ;;
    82)
        installSDKMANAllLinuxMac
        ;;
    83)
        installSDKManLinuxMac
        ;;
    84)
        installGradleSDKLinuxMac
        ;;
    85)
        installGrailsSDKLinuxMac
        ;;
    86)
        installJDKSDKLinuxMac
        ;;
    87)
        installGroovySDKLinuxMac
        ;;
    90)
        installNodeWindows
        ;;
    91)
        installNPMWindows
        ;;
    92)
        installAllWindows
        ;;
    93)
        installGradleSDKWindows
        ;;
    94)
        installGrailsSDKWindows
        ;;
    95)
        installJDKSDKWindows
        ;;
    96)
        installGroovySDKWindows
        ;;
    100)
        installMysqlDatabase
        ;;
    esac
    echo -e "Press Enter to continue \c"
    read input
done
