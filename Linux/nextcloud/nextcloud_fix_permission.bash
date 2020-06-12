#!/bin/bash
BASE_PATH="/svc/nextcloud"
DATA_PATH="/svc/nextcloud/data"
DAEMON_USER="nginx"
DAEMON_GROUP="nginx"
PHP_PATH="/usr/bin/php"

chown -R ${DAEMON_USER}:${DAEMON_GROUP} $BASE_PATH
find $DATA_PATH -type f -exec chmod 0660 {} \;
find $DATA_PATH -type d -exec chmod 0770 {} \;

sudo -u ${DAEMON_USER} $PHP_PATH ${BASE_PATH}/occ files:scan --all