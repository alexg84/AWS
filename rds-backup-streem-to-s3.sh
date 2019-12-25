#!/bin/bash
TIMEZONE=Europe/Amsterdam
TODAY=$(TZ=$TIMEZONE date +%d-%m-%Y)

#ENDPOINT=""
#RDS_NAME=""
#DOWNLOAD_FOLDER=""
#USER=""
#PASSWORD=""
#S3-PATH=""


mysqldump -u ${USER} -p${PASSWORD} -h ${ENDPOINT} --single-transaction --routines 
--events --triggers --all-databases | aws s3 cp - "s3://${S3-PATH}/${RDS_NAME}-${TODAY}.sql"
