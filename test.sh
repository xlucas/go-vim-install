#!/bin/bash

for item in $(curl -s "https://raw.githubusercontent.com/xlucas/go-vim-install/master/deps/$1") ; do
    status=$(curl -o /dev/null -sw "%{http_code}" "$item")
    echo -e "$status\t <= $item"

    if [ "$status" -gt "400" ] && [ "$status" -lt "500" ]
    then
        exit 1
    fi
done
