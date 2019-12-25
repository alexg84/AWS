




mysqldump -u ${USER} -p${PASSWORD} -h ${ENDPOINT} --single-transaction --routines --events --triggers --all-databases | aws s3 cp - "s3://rapyd-prod-rds-backup/prod-rapyd-main-us-1-rr/${RDS_NAME}-${TODAY}.sql"
