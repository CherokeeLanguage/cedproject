grails prod war
scp build/libs/cherokeedictionary-0.1.war cdrchops@63.142.255.175:~/
sudo service tomcat stop
sudo rm -fr /opt/apache-tomcat-9.0.7/webapps/ROOT*
sudo lsof -i :8009
sudo kill -9 <pid>
sudo cp cherokeedictionary-0.1.war /opt/apache-tomcat-9.0.7/webapps/ROOT.war
sudo /opt/tomcat/bin/startup.sh &
sudo tail -c 20000  -f /opt/apache-tomcat-9.0.7/logs/catalina.out

scp cdrchops@63.142.255.175:/opt/apache-tomcat-9.0.7/logs/catalina.out ./