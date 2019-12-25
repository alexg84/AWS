#!/bin/bash
TIMEZONE=Europe/Amsterdam
TODAY=$(TZ=$TIMEZONE date +%d-%m-%Y)

#ENDPOINT=""
#RDS_NAME=""
#DOWNLOAD_FOLDER=""
#USER=""
#PASSWORD=""
#S3-PATH=""

mysqldump -u ${USER} -p${PASSWORD} -h ${ENDPOINT} --single-transaction --routines --events --triggers --all-databases > /${DOWNLOAD_FOLDER}/${RDS_NAME}-${TODAY}.sql


tail -n 3 /${DOWNLOAD_FOLDER}/${RDS_NAME}-${TODAY}.sql | grep 'Dump completed on'
[ $? -eq 0 ]  && echo 'ok'  || exit 1

aws s3 cp /${DOWNLOAD_FOLDER}/${RDS_NAME}-*.sql s3://${S3-PATH}/${RDS_NAME}-${TODAY}.sql
