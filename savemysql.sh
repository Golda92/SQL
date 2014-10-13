 
#!/bin/bash
 
#date du jour
DATE=`date +%y_%m_%d`
 
#liste des dossier
LISTEBDD=$( echo 'show databases' | mysql -u root -p )
 
#on boucle sur chaque dossier (for découpe automatiquement par l'espace)
for SQL in $LISTEBDD
 
do
 
if [ $SQL != "information_schema" ] && [ $SQL != "mysql" ] && [ $SQL != "Database" ]; then
 
#echo $SQL
mysqldump -uroot -p $SQL | gzip > /home/backup/sql/$SQL"_mysql_"$DATE.sql.gz
 
fi
 
done

