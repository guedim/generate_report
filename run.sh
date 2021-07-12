#!/bin/bash

######################################################
#  Script Written by : Rahul Kumar
#  Date: Feb 21, 2013
######################################################

DATE=`date +%d%b%y`
OUTPUT_DIR="./reports"
DB_HOST="localhost"
DB_NAME="test"
DB_USER="root"
DB_PASSWORD="springbankRootPsw"

REPORT_SCRIPT="scripts/sql_script_file.sql"

#FTP_SERVER="ftp.yehiweb.com"
#FTP_USERNAME="ftp user name"
#FTP_PASSWORD="ftp user password"
#FTP_UPLOAD_DIR="/backup/"
#LOG_FILE=/backup/backup-DATE.log

############### Local Report  ########################

#mysqldump -u $DB_USER  -p$DB_PASSWORD $DB_NAME | gzip  > $OUTPUT_DIR/$DB_NAME-$DATE.sql.gz
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME < $REPORT_SCRIPT > $OUTPUT_DIR/report-$DATE.csv

############### UPLOAD to Google Drive  ################

GOOGLE_CLIENT_ID="175510239488-fisklb8kv14j3dseeoh6ha825n0v4m4u.apps.googleusercontent.com"
GOOGLE_CLIENT_SECRET_KEY="PikmJbXyAAtEG62Kk9tqz-rP"
GOOGLE_DEVICE_USER_CODE="DLH-CRJ-VTH"

#ftp -n $FTP_SERVER << EndFTP
#user "$FTP_USERNAME" "$FTP_PASSWORD"
#binary
#hash
#cd $FTP_UPLOAD_DIR
#pwd
#lcd $LOCAL_BACKUP_DIR
#put "$DB_NAME-$DATE.sql.gz"
#bye
#EndFTP

#if test $? = 0
#then
#    echo "Database Successfully Uploaded to Ftp Server
#        File Name $DB_NAME-$DATE.sql.gz " > $LOG_FILE
#else
#    echo "Error in database Upload to Ftp Server" > $LOG_FILE
#fi