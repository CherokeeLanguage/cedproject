#Windows Install
Download These\
https://nodejs.org/dist/v14.17.0/node-v14.17.0-x64.msi \
https://gradle.org/next-steps/?version=6.8.3&format=bin \
https://github.com/grails/grails-core/releases/download/v4.0.10/grails-4.0.10.zip \
https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html \
https://dev.mysql.com/downloads/workbench/ \
open system preferences \
add \
GRADLE_HOME <locationWhereGradleFolderIs> \
GRAILS_HOME <locationWhereGrailsFolderIs> \

click on PATH and edit \
add %GRAILS_HOME%/bin \
add %GRADLE_HOME%/bin

#Linux/Mac Install
https://dev.mysql.com/downloads/workbench/ 
install workbench


# to generate a new build file 

open CLI 

sh ./createMenu.sh

this will overwrite the existing build.sh file

if there are new functions to add to the script, open CreateMenu and add a new item in the appropriate map

then add the function or update the function in functions.sh and run the createmenu script again