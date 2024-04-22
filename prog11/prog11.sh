#!/bin/bash

wget -q -O - http://www.hackthissite.org/missions/prog/11/ --load-cookies=cookies.txt > out.txt

TEXT=`cat out.txt | grep "Generated String:" | cut -f 2 -d : | cut -f 1 -d "<" | tr -d [:blank:]`
SHIFT=`cat out.txt | grep "Generated String:" | cut -f 3 -d : | cut -f 1 -d "<" | tr -d [:blank:]`

echo "If this doesn't work, you'll need to add this separator:"
echo $TEXT

for EACH in `echo $TEXT | tr "," "\n" | tr ")" "\n" | tr "#" "\n"| tr "'" "\n"| tr "." "\n"| tr "&" "\n"| tr "(" "\n"| tr "!" "\n"| tr "%" "\n"| tr "$" "\n"| tr "+" "\n"| tr "-" "\n"| tr "/" "\n"| tr "*" "\n"| tr "@" "\n"| tr "^" "\n"| tr "\"" "\n"`
do 
let EACH=$EACH-$SHIFT
STRING="$STRING$(printf "\\$(printf "%03o" $EACH)")"
done
echo The string is $STRING
wget -q -O - http://www.hackthissite.org/missions/prog/11/index.php --post-data="solution=$STRING"  --load-cookies=cookies.txt --keep-session-cookies --referer http://www.hackthissite.org/missions/prog/11/ > out2.txt
grep "answer is wrong" out2.txt | html2text
grep -i successfully out2.txt | html2text
grep -i "already completed" out2.txt | html2text
