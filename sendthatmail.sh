#!/usr/bin/bash

SUBJECT="ANZ Balance"
RECIPIENT=$2
TEXTFILE=$1

/usr/bin/mail -s "${SUBJECT}" -S sendcharsets=utf-8 -S ttycharset=utf-8 -S encoding=8bit "${RECIPIENT}" < "${TEXTFILE}"
