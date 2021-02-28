#!/usr/bin/env bash


DATE=$(date +%Y%m%d-%H%M%S)

DBPATH=$HOME/path/too/bdd.db
DESTDIR=$HOME/path/too/backups/


db=$(basename $DBPATH)


sqlite3 $DBPATH .dump | gzip -c > ${DESTDIR}/${db%%.db}-${DATE}.sql.gz
