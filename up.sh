#!/bin/bash

hexo g -d &&
git add -A &&
git commit -m $(date)"-blog"&&
git push > /dev/null 2>&1

echo "blog updated successfully"

cd ~/note
git add -A > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "note nothing to update"
else
    git commit -m $(date)
    git push

    echo "note updated successfully"
fi


