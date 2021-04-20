#this should take a sql dump from local
#run a backup from the server
#upload the sql script from local
#then import the sql script into the database on the server

#scp ./newced/sqlbackup/$1 cdrchops@63.142.255.175:~/$1
#https://stackoverflow.com/questions/17666249/how-to-import-an-sql-file-using-the-command-line-in-
#ssh cdrchops@63.142.255.175
#mysql -u root -p likespreadsheets < Dump20181225.sql

cd cherokeedictionarydbbackup
git reset --hard
git pull
gunzip dump.sql.gz
mysql -u root -p cherokeedictionary < dump.sql