#/usr/bin/bash
set -e

export OBICO_DIR=$(readlink -f $(dirname "$0"))

#OBICO=~/obico-server
OBICO=${OBICO_DIR}
BACKUP_DIR=backup

##### Do not edit unless you know what you are doing #####

NOW="$(date +"%m-%d-%Y")"

if [ ! -d ${OBICO}/${BACKUP_DIR} ]
then
    mkdir -p ${OBICO}/${BACKUP_DIR}
fi
cp ${OBICO}/backend/db.sqlite3 ${OBICO}/${BACKUP_DIR}/db.sqlite3.$NOW
cd ${OBICO}
git checkout release
git pull
sudo docker-compose up --build -d
