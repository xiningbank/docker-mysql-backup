#!/bin/bash

. .env

CURRENT_DATE=`date +"%Y%m%d"`
PATH_BACKUP="${PATH_BASE}/${CURRENT_DATE}"
sudo mkdir -p $PATH_BACKUP
echo "will save to ${PATH_BACKUP}"

CURRENT_DATETIME=`date +"%Y%m%d-%H%M%S"`
docker exec $MYSQL_CONTAINER /usr/bin/mysqldump --no-tablespaces -u$USERNAME -p$PASSWORD $DATABASE   | gzip > $PATH_BACKUP/${CURRENT_DATETIME}_$DATABASE.sql.gz
echo "backup database ${DATABASE} completed."
