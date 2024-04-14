#!/bin/bash
  
#cat wordlist.txt 
file="wordlist.txt"

for line in $(cat "$file")
do 
echo $line | sed 's/./&\n/g' | sort | paste -s -d "" >> wordlistB.txt
done