#!/bin/bash
set -eu

for file in ~/Pulpit/so2/*; do
    ext="${file##*.}"
    if [ -f $file ] && [ $ext == bak ]; then
        chmod uo-w $file
    elif [ -d $file ] && [ $ext == bak ]; then
        chmod ug-w,o+w $file
    elif [ -d $file ] && [ $ext == tmp ]; then
        chmod -R a+rwx $file
    elif [ -f $file ] && [ $ext == txt ]; then
        chmod 421 $file
    fi
done