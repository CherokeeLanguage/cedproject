#!/bin/bash

# CREATED AN ALIAS USING THIS
# CAN ALSO AUTOMATE THIS - like buildCED
#https://www.geeksforgeeks.org/custom-commands-linux-terminal/#:~:text=Linux%20operating%20system%20allows%20users,to%20make%20the%20command%20executable.&text=Here%2C%20bashrc%20means%20run%20the%20Bash%20file.

#function prop() {
#  grep "${1}" ./build.properties | cut -d'=' -f2
#}
#
#SITEPASS=$(prop 'SITEPASS')
#USERNAME=$(prop 'USERNAME')
#DBPASS=$(prop 'DBPASS')
#HOSTS=$(prop 'HOSTS')
#GITHASH=$(prop 'GITHASH')
#
#echo $SITEPASS
#echo $USERNAME
#echo $DBPASS
#echo $HOSTS
#echo $GITHASH

./buildMain.sh  $1
#function buildIt() {
#    ./build.sh $1 $2 $3 $4 $5 $6
#}
#
#buildIt $USERNAME $SITEPASS $HOSTS $GITHASH $DBPASS $1

