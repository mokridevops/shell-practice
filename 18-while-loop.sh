#!/bin/bash
while IFS= read -r line #IFS - Internal Field Seperator
do
    echo $line

done < 1-helloworld.sh