#!/bin/bash

echo "blog updating==>>>>>"
hexo g -d > /dev/null 2>&1
git add -A > /dev/null 2>&1
git commit -m "$(date)-blog" > /dev/null 2>&1
git push > /dev/null 2>&1
echo "blog updated successfully"

cd ~/note
git add -A > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "note nothing to update"
else
    echo "\n blog updating" -e
    git commit -m "$(date)" > /dev/null 2>&1
    git push > /dev/null 2>&1
    echo "note updated successfully"
fi


