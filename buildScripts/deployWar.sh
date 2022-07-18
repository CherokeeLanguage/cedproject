#sudo service tomcat stop
#sudo rm -fr /opt/tomcat/webapps/ROOT*
#sudo kill -9 $(lsof -ti :8080)
#
##sudo cp ./ROOT.war /opt/tomcat/webapps
#source ~/copyWar.sh
#
##sudo rm -fr /opt/tomcat/logs/*
##
##
#source ~/startTomcat.sh

function stopTomcat() {
  echo "stop tomcat"
  sudo service tomcat stop
}

function removeROOTWarAndDirectory() {
  echo "removing ROOT war and directory"
   sudo rm -fr /opt/tomcat/webapps/ROOT*
}

function cleanLogs() {
  echo "clean logs"
  sudo rm -fr /opt/tomcat/logs/*
}

function killTomcatPort() {
  echo "killing tomcat port"
  sudo kill -9 $(lsof -ti :8080)
}

function copyWar() {
  echo "copying war"
  sudo cp ./ROOT.war /opt/tomcat/webapps
}

function startTomcat() {
  echo "starting tomcat"
  sudo /opt/tomcat/bin/startup.sh
}

function tailLogs() {
  sudo tail -f /opt/tomcat/logs/catalina.out
}

function fullDeploy() {
  stopTomcat
  removeROOTWarAndDirectory
  cleanLogs
  killTomcatPort
  copyWar
  startTomcat
  tailLogs
}

PS3='Please <ENTER> main option: '
options=("full deploy" "stop tomcat" "remove root war" "clean logs" "kill tomcat port" "copy war" "start tomcat" "tail logs" "quit")
select opt in "${options[@]}"; do
  case $opt in
    "full deploy")
      fullDeploy
      ;;
    "stop tomcat")
      stopTomcat
      ;;
    "remove root war")
      removeROOTWarAndDirectory
      ;;
    "clean logs")
      cleanLogs
      ;;
    "kill tomcat port")
      killTomcatPort
      ;;
    "copy war")
      copyWar
      ;;
    "start tomcat")
      startTomcat
      ;;
    "tail logs")
      tailLogs
      ;;
    "quit")
      exit
      ;;
  *) echo "invalid option $REPLY" ;;
  esac
done
