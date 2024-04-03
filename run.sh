#!/bin/bash

. .env

CURRENT_DATETIME=`date +"%Y-%m-%d-%H%M%S"`
sudo mkdir -p $PATH_BACKUP
docker exec $MYSQL_CONTAINER /usr/bin/mysqldump -u$USERNAME -p$PASSWORD $DATABASE | gzip > $PATH_BACKUP/${DATABASE}_${CURRENT_DATETIME}.sql.gz
