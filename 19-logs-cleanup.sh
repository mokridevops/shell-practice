#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14} #default 14 days

if [ -z $SOURCE_DIR ]; then

    echo "ERROR Missing parameters"
    echo "USAGE:: $0 <SOURCE-DIR> [days(optional default to 14)]"
exit 1
fi


if [ ! -d $SOURCE_DIR]; then
     echo "Directory does not exist"
     exit 1
fi