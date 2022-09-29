#!/bin/bash
#This file contains all of the stub functions that can be called by the menu
#only modify this file IF you're adding a function or modifying a function
# then run groovy CreateMenu.groovy from the CLI to create a new build script

# TODO: unzip and import sql to database then delete local database zip file
# TODO: make this with submenus https://askubuntu.com/questions/1146166/bash-how-to-create-a-menu-with-submenu
# TODO: figure out windows install items
# TODO: figure out why I can't run scripts from one command - like telling it to stopTomcat then copyWar then startTomcat - I can only SSH and not do it automatically
# TODO: update prod database with a command - should backup the database on the server then push the script to the server and update it on the server
# TODO: also make sure you can specify a script to say update a single table or insert values to test and the like - local should always have just the test data
#   scp C:\Users\torr\Documents\dumps/Dump20210519.sql cdrchops@63.142.255.175:~/Dump20210519.sql
#   mysql -uroot -p likespreadsheets < ./Dump20210519.sql
#scp ./Dump20210601.sql cdrchops@63.142.255.175:~/Dump.sql

#mysql -uroot -p cherokeedictionary < ./Dump.sql



#SITEPASS=$(prop 'SITEPASS')
#USERNAME=$(prop 'USERNAME')
#DBPASS=$(prop 'DBPASS')
#HOSTS=$(prop 'HOSTS')
#
#echo $SITEPASS
#echo $USERNAME
#echo $DBPASS
#echo $HOSTS

#sshpass -p $SITEPASS ssh $USERNAME@63.142.255.175 "\/home/cdrchops/backupDB.sh Tk02030#"



#sshpass -p $SITEPASS ssh $(prop 'USERNAME')@$(prop 'HOSTS') "\/home/cdrchops/backupDB.sh $DBPASS"

#sshpass -p $SITEPASS ssh $USERNAME@63.142.255.175 "\/home/cdrchops/backupDB.sh $DBPASS"
#sshpass -p $2 ssh $1@$3 \/home/cdrchops/backupDB.sh $5



################################################
# DEPLOY
################################################


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

################################################
# BUILD
################################################




################################################
# INSTALL
################################################

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



################################################
# MENUS
################################################


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
function CHECKOUT_AND_BUILD_COMMANDS() {
  clear
  PS3='Please <ENTER> submenu CHECKOUT AND BUILD COMMANDS option: '
  echo "CHECKOUT AND BUILD COMMANDS"
  options=("clone repos" "pull latest from git" "status of repositories from git" "reset repositories from git" "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "clone repos")
      gitClone
      ;;
    "pull latest from git")
      updateLocalFromGit
      ;;
    "status of repositories from git")
      statusLocalFromGit
      ;;
    "reset repositories from git")
      resetLocalFromGit
      ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

function GIT_ADD_AND_COMMIT() {
  clear
  PS3='Please <ENTER> submenu GIT ADD AND COMMIT option: '
  echo "GIT ADD AND COMMIT"
  options=("add and commit ALL repositories to git" "add and commit transliteration" "add and commit utilities" "add and commit conjugation" "add and commit date time library" "add and commit react" "add and commit deconstructor" "add and commit dictionary (production)" "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "add and commit ALL repositories to git")
      addCommitToGit
      ;;
    "add and commit transliteration")
      buildTransliteration
      ;;
    "add and commit utilities")
      addCommitUtilities
      ;;
    "add and commit conjugation")
      addCommitConjugation
      ;;
    "add and commit date time library")
      addCommitDateTime
      ;;
    "add and commit react")
      addCommitReactCEDReact ./
      ;;
    "add and commit deconstructor")
      addCommitDeconstructor ./
      ;;
    "add and commit dictionary (production)")
      addCommitDictionary ./
      ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

function BUILD_COMMANDS() {
  clear
  PS3='Please <ENTER> submenu BUILD COMMANDS option: '
  echo "BUILD COMMANDS"
  options=("build all" "build transliteration" "build utilities" "build conjugation" "build date time library" "build react" "build grooscript" "build grooscript plugin" "build deconstructor"  "build dictionary (production)" "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "build all")
      buildAll
      ;;
    "build transliteration")
      buildTransliteration
      ;;
    "build utilities")
      buildUtilities
      ;;
    "build conjugation")
      buildConjugation
      ;;
    "build date time library")
      buildDateTime
      ;;
    "build react")
      buildReactCED ./
      ;;
    "build deconstructor")
      buildDeconstructor ./
      ;;
    "build dictionary (production)")
      buildDictionary ./
      ;;
    "build grooscript")
        buildGrooscript ./
      ;;
    "build grooscript plugin")
      buildGrooscriptPlugin ./
    ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

function ALL_SERVER_COMMANDS() {
  clear
  PS3='Please <ENTER> submenu ALL SERVER COMMANDS option: '
  echo "ALL SERVER COMMANDS"
  options=("backup database on server" "backup database from server" "upload latest war to site" "go to server" "restartServer with latest war" "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "backup database on server")
      backupDatabaseOnServer
      ;;
    "backup database from server")
      pullDatabaseFromServer
      ;;
    "upload latest war to site")
      updateServerWithLatestWar
      ;;
    "go to server")
      goToServer
      ;;
    "restartServer with latest war")
      restartServer
      ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

function ALL_LINUXMAC_COMMANDS() {
  clear
  PS3='Please <ENTER> submenu ALL LINUX/MAC COMMANDS option: '
  echo "ALL LINUX/MAC COMMANDS"
  options=("linuxmac install node" "linuxmac install npm" "linuxmac install sdkman gradle grails jdk groovy" "linuxmac install sdkman" "linuxmac install gradle .." "linuxmac install grails .." "linuxmac install jdk " "linuxmac install groovy .." "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "linuxmac install node")
      installNodeLinuxMac
      ;;
    "linuxmac install npm")
      installNPMLinuxMac
      ;;
    "linuxmac install sdkman gradle grails jdk groovy")
      installSDKMANAllLinuxMac
      ;;
    "linuxmac install sdkman")
      installSDKManLinuxMac
      ;;
    "linuxmac install gradle ..")
      installGradleSDKLinuxMac
      ;;
    "linuxmac install grails ..")
      installGrailsSDKLinuxMac
      ;;
    "linuxmac install jdk ")
      installJDKSDKLinuxMac
      ;;
    "linuxmac install groovy ..")
      installGroovySDKLinuxMac
      ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

function ALL_WINDOWS_COMMANDS() {
  clear
  PS3='Please <ENTER> submenu ALL WINDOWS COMMANDS option: '
  echo "ALL WINDOWS COMMANDS"
  options=("windows install node" "windows install npm" "windows install gradle grails jdk groovy" "windows install gradle" "windows install grails" "windows install jdk" "windows install groovy" "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "windows install node")
      installNodeWindows
      ;;
    "windows install npm")
      installNPMWindows
      ;;
    "windows install gradle grails jdk groovy")
      installAllWindows
      ;;
    "windows install gradle")
      installGradleSDKWindows
      ;;
    "windows install grails")
      installGrailsSDKWindows
      ;;
    "windows install jdk")
      installJDKSDKWindows
      ;;
    "windows install groovy")
      installGroovySDKWindows
      ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

function ALL_DATABASE_COMMANDS() {
  clear
  PS3='Please <ENTER> submenu ALL DATABASE COMMANDS option: '
  echo "ALL DATABASE COMMANDS"
  options=("mysql install database" "Back to Main Menu")
  select opt in "${options[@]}"; do
    case $opt in
    "mysql install database")
      installMysqlDatabase
      ;;
    "Back to Main Menu")
      clear
      return
      ;;
    *)
      echo "invalid option $REPLY"
      ;;
    esac
  done
}

echo $(prop 'USERNAME') $(prop 'HOSTS')
PS3='Please <ENTER> main option: '
options=("CHECKOUT AND BUILD COMMANDS" "GIT ADD AND COMMIT" "BUILD COMMANDS" "ALL SERVER COMMANDS" "ALL LINUX/MAC COMMANDS" "ALL WINDOWS COMMANDS" "ALL DATABASE COMMANDS" "quit")
select opt in "${options[@]}"; do
  case $opt in
  "CHECKOUT AND BUILD COMMANDS")
    CHECKOUT_AND_BUILD_COMMANDS
    ;;
  "GIT ADD AND COMMIT")
    GIT_ADD_AND_COMMIT
    ;;
  "BUILD COMMANDS")
    BUILD_COMMANDS
    ;;
  "ALL SERVER COMMANDS")
    ALL_SERVER_COMMANDS
    ;;
  "ALL LINUX/MAC COMMANDS")
    ALL_LINUXMAC_COMMANDS
    ;;
  "ALL WINDOWS COMMANDS")
    ALL_WINDOWS_COMMANDS
    ;;
  "ALL DATABASE COMMANDS")
    ALL_DATABASE_COMMANDS
    ;;
  "quit")
    exit
    ;;
  *) echo "invalid option $REPLY" ;;
  esac
done