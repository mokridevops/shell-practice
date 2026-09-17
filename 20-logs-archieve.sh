#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
    echo "Either Source Directory or Destination Directory or both are empty"
    echo "USAGE:: $0 [source_dir] [dest_dir] [days:default 14]"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory : $SOURCE_DIR does not exist"
    exit 1
fi


if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory : $DEST_DIR does not exist"
    exit 1
fi

