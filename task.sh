#! /bin/bash
username="$DB_USER"
password="$DB_PASSWORD"

mysqldump -u $username -p$password --databases ShopDB  --result-file=backup.sql
mysqldump -u $username -p$password ShopDB --no-create-db  --result-file=backupDEV.sql
mysql -u $username -p$password ShopDBReserve < backup.sql
mysql -u $username -p$password ShopDBDevelopment < backupDEV.sql