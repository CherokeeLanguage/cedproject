#add code that if the $1 is not defined stop and show error message
ssh cdrchops@63.142.255.175 /home/cdrchops/backupDB.sh $1

#pass in a password and can do it here too
#mysqldump -u ced -p$1 likespreadsheets | gzip > dump.sql.gz
#exit
scp cdrchops@63.142.255.175:~/dump.sql.gz ./dump.sql.gz

#to upload a new sql export
#scp ./Dump20181225.sql cdrchops@63.142.255.175:~/Dump20181225.sql