#cd cherokee-transliteration
#gradle jar
#cd ..
#cp cherokee-transliteration/build/libs/jalagiTranslit-0.1.3.jar newced/cherokeedictionary/libs/
#cp cherokee-transliteration/build/libs/jalagiTranslit-0.1.3.jar cherokeeservices/lib/
#cd cherokeeconjugation
#gradle jar
#cd ..
#cp cherokeeconjugation/build/libs/cherokee-conjugation-0.1.0.jar newced/cherokeedictionary/libs/
#cp cherokeeconjugation/build/libs/cherokee-conjugation-0.1.0.jar cherokeeservices/lib/
cd newced/cherokeedictionary
grails prod war
cd ../..
cd cherokeeservices
grails prod war


