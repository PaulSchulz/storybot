#!/bin/bash

# Change directory to script/ directory
cd ${0%/*}
STORIES="../stories"
WIDTH=40

for file in `ls $STORIES | grep txt`; do
    # echo $file
    cat $STORIES/$file | uni2ascii -Bq | fmt -$WIDTH
    echo
    echo "               --ooOOoo--               "
    echo
    echo "%"
done
