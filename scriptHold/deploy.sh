#ssh rename existing war

#copy to target via ssh
#scp ROOT.war cdrchops@63.142.255.175:~/

#shut down grails
#copy on server what it's supposed to be and where

#start up grails
#sudo java -Dgrails.env=prod -jar /var/lib/ROOT.war &

#watch logs
#exit




scp ROOT.war cdrchops@63.142.255.175:/opt/apache

ssh cdrchops@63.142.255.175






#sudo service tomcat8 stop
#sudo chmod +x ROOT.war
#sudo rm -fr /var/lib/tomcat8/webapps/*
#sudo cp ./ROOT.war /var/lib/tomcat8/webapps/
#sudo rm -fr /var/log/tomcat8/*


#sudo service tomcat8 start
#sudo tail -f /var/log/tomcat8/catalina.out
#sudo java -Dgrails.env=prod -jar /var/lib/tomcat8/webapps/ROOT.war &
