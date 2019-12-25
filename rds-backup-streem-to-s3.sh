




mysqldump -u ${USER} -p${PASSWORD} -h ${ENDPOINT} --single-transaction --routines --events --triggers --all-databases | aws s3 cp - "s3://${}/${RDS_NAME}-${TODAY}.sql"
