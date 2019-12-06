#!/bin/bash

# Change directory to script/ directory
cd ${0%/*}
STORIES="../stories"
WIDTH=40

for file in `ls $STORIES`; do
    # echo $file
    cat $STORIES/$file | fmt -$WIDTH
    echo "%"
done
