#create the jar with the dictionary and models directories
#https://docs.oracle.com/javase/tutorial/deployment/jar/build.html
#jar cvf asseteries.jar dictionary models

#copy the jar to the libs directory so we can use it from the classloader instead of the assetpath
#cp asseteries.jar cherokeedictionary/libs
#cd newced/cherokeedictionary/
#grails prod war
scp newced/cherokeedictionry/build/libs/cherokeedictionary-0.1.war cdrchops@63.142.255.175:~/ROOT.war
ssh cdrchops@63.142.255.175 /home/cdrchops/startNinek.sh
#./startNinek.sh
#scp cdrchops@63.142.255.175:~/dump4Dec18.sql.gz ./dump.sql.gz

#scp ./google593a568777046d5c.html cdrchops@63.142.255.175:~/

scp cdrchops@63.142.255.175:~/ROOT.war ./ROOT2.war


scp ./dictionary/build/libs/dictionary-0.1.war cdrchops@63.142.255.175:~/ROOT.war