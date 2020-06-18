#!/bin/bash

b=''
i=0

function jindu() {
  b=#$b
  i+=20
  printf "progress:[%-50s]%d%%\r" $b $i
}

echo "blog updating[===========]0%"
hexo g -d > /dev/null 2>&1
git add -A > /dev/null 2>&1
git commit -m "$(date)-blog" > /dev/null 2>&1
git push > /dev/null 2>&1
echo "blog updated successfully[>>>>>=======]50%"

cd ~/note
git add -A > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "note nothing to update"
else
    echo -e "\nnote updating[>>>>>>>>>>]100%"
    git commit -m "$(date)" > /dev/null 2>&1
    git push > /dev/null 2>&1
    echo "note updated successfully"
fi


