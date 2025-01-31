#!/bin/bash

. .env

CURRENT_DATE=`date +"%Y%m%d"`
PATH_BACKUP="${PATH_BASE}/${CURRENT_DATE}"
sudo mkdir -p $PATH_BACKUP
echo "will export to ${PATH_BACKUP}"

CURRENT_DATETIME=`date +"%Y%m%d-%H%M%S"`
docker exec $MYSQL_CONTAINER /usr/bin/mysqldump --no-tablespaces -u$USERNAME -p$PASSWORD --databases $DATABASE1 | gzip > $PATH_BACKUP/${CURRENT_DATETIME}_$FILENAME.sql.gz
echo "backup database(s) completed."
