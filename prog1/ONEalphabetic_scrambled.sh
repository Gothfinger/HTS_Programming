#!/bin/bash
  
#wget -q -O - http://www.hackthissite.org/missions/prog/1/ --load-cookies=../../.cookies.txt  | grep -A10 "List of scrambled" | tr " " "\n" | grep "li" | html2text

#sometimes wget was buggy and didn't get pass login page even with cookies, sometimes it worked. Either solution is to manually take source code. 

for line in $(cat "html_source" | grep -A10 "List of scrambled" | tr " " "\n" | grep "li" | html2text)
do
    echo $line | grep -o . | sort | paste -s -d "" >> scrambledA.txt
done