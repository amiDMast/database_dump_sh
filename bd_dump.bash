#!/bin/bash
echo "Start mysql dump " 
echo `date +%d-%m-%Y_%H%M%S`
#создать папку если ее не существует
mkdir -p /var/www/admin/database/
#Полный бэкап всех баз данных и его архивация
/usr/bin/mysqldump -uroot -pW8FQG6DOSk -h 127.0.0.1 --all-databases | gzip > /var/www/admin/database/database_backup_`date +%d-%m-%Y_%H%M%S`.sql.gz
#Удалить бэкапы более 7 дней
/usr/bin/find /var/www/admin/database/* -mtime +7 -exec rm -rf {} \;
echo "Finish dump"
echo `date +%d-%m-%Y_%H%M%S`
