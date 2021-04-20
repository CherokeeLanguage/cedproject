#create the jar with the dictionary and models directories
#https://docs.oracle.com/javase/tutorial/deployment/jar/build.html
#jar cvf asseteries.jar dictionary models

#copy the jar to the libs directory so we can use it from the classloader instead of the assetpath
#cp asseteries.jar cherokeedictionary/libs
#cd newced/cherokeedictionary/
#grails prod war
scp newced/cherokeedictionary/build/libs/cherokeedictionary-0.1.war cdrchops@63.142.255.175:~/ROOT.war
ssh cdrchops@63.142.255.175 /home/cdrchops/startNinek.sh
#./startNinek.sh
#scp cdrchops@63.142.255.175:~/dump4Dec18.sql.gz ./dump.sql.gz
