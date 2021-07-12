#!/bin/bash

######################################################
#  Script Written by : Yuly Fuentes
#  Date: July 21, 2021
######################################################


# Report setup
REPORT_DATE=`date +%F+%T`
REPORT_OUTPUT_DIR="./reports"
REPORT_SCRIPT="scripts/sql_script_file.sql"

# Database setup
DB_HOST="localhost"
DB_NAME="test"
DB_USER="root"
DB_PASSWORD="springbankRootPsw"


# EMAIL CONFIGURATION
EMAIL_SUBJECT="Reporte_de_ventas"
EMAIL_TO="yulyfuentes1@gmail.com"
EMAIL_COPY="nabuco1982@gmail.com"


############### Local Report  ########################
mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME < $REPORT_SCRIPT > $REPORT_OUTPUT_DIR/report-$REPORT_DATE.csv

############### Send to Email   ################
uuencode $REPORT_OUTPUT_DIR/report-$REPORT_DATE.csv  report-$REPORT_DATE.csv  | mail -s $EMAIL_SUBJECT $EMAIL_TO -c  $EMAIL_COPY