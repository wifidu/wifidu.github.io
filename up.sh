#!/bin/bash


i=0
str='#'
ch=('|' '\' '-' '/')
index=0

function you() {
  printf "[%-25s][%d%%][%c]\r" $str $i ${ch[$index]}
  str+='#####'
  let i+=20
  let index=i%4
  printf "[%-25s][%d%%][%c]\r" $str $i ${ch[$index]}
}



you
echo "blog updating[===========]0%"
hexo g -d > /dev/null 2>&1
git add -A > /dev/null 2>&1
git commit -m "$(date)-blog" > /dev/null 2>&1
git push > /dev/null 2>&1
you
echo "blog updated successfully[>>>>>=======]50%"

you
cd ~/note
git add -A > /dev/null 2>&1
you
if [ $? -ne 0 ]; then
    echo "note nothing to update"
else
    echo -e "\nnote updating[>>>>>>>>==]80%"
    git commit -m "$(date)" > /dev/null 2>&1
    git push > /dev/null 2>&1
    echo "note updated successfully[>>>>>>>>>>]100%"
you
fi


