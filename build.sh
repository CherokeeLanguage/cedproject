clear
#git clone https://github.com/cdrchops/cherokee-transliteration.git transliteration
#git clone https://github.com/cdrchops/cherokee-utilities.git utilities
#git clone https://github.com/cdrchops/cherokeeconjugation.git conjugation

cd transliteration
gradle clean build publishToMavenLocal publish
cd ../utilities
gradle clean build publishToMavenLocal publish
cd ../conjugation
gradle clean build publishToMavenLocal publish
cd ../dictionary
grails clean
grails war
