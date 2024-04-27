#/usr/bin/bash
set -e

BACKUP_DIR=backup # Set this to the dir you want to use for backups.

##### Do not edit unless you know what you are doing #####

export OBICO_DIR=$(readlink -f $(dirname "$0"))

OBICO=${OBICO_DIR}

NOW=$(date "+%m.%d.%Y-%H.%M.%S")

if [ ! -d ${OBICO}/${BACKUP_DIR} ]
then
    mkdir -p ${OBICO}/${BACKUP_DIR}
fi
cp ${OBICO}/backend/db.sqlite3 ${OBICO}/${BACKUP_DIR}/db.sqlite3.$NOW
cd ${OBICO}
git checkout release
git pull
sudo docker-compose up --build -d
