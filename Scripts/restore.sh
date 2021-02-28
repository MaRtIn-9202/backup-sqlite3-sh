#!/usr/bin/env bash

#usage: restore.sh PATH_TO_BACKUP RESTOREDIR

function usage {

    cat <<EOF
Usage: $0 PATH_TO_BACKUP RESTOREDIR

EOF

}


if [ $# -ne 2 ]; then
    usage
    exit 1 
fi

if [ ! -r $1 ]; then
    echo "$1 is not a readable archive"
    exit 1
fi

if [ -e $2 ]; then
    echo "Destination file $2 exists"
    exit 1
fi


gunzip -c $1 | sqlite3 $2

