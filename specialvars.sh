#!/bin/bash

echo "all variables passed to the script $@"
echo "number of variables passed to the script $#"
echo "first variable $1"
echo "second variable $2"
echo "name of the current script $0"
echo "who is running this script $USER"
echo "which directory this script is running $PWD"
echo "home directory of the user $HOME"
echo "process instance ID of current script $$"
sleep 11 &
echo "process id of the bacground command running just now $!"
wait $!
echo "line number $LINENO"