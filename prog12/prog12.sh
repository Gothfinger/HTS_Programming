#!/bin/bash

char()
{
	printf \\$(printf "%03o" "$1")
}
asc()
{
	local i
	for ((i=1; i<256; ++i)); do
		if [ "$(char "$i")" = "$1" ]; then
			echo "$i"
			break
		fi
	done
	return 1
}

wget -q -O - http://www.hackthissite.org/missions/prog/12/ --load-cookies=cookies.txt > out.txt

cat out.txt  | grep String | cut -f 3 -d = | cut -f 2 -d '"' > example.txt 

PSUM=0
CSUM=0
for EACH in ` cat example.txt | sed  "s/[a-z]//g" | sed 's/[-!#$%&*+,./:;<=>?@_{|}~]//g' | tr -d "0" | tr -d "1" |sed 's/./& /g' `
do
	FACTORS=`factor $EACH | cut -f 2 -d :`
	NUM=`echo $FACTORS | tr " " "\n" | wc -l`
	if [ $NUM -gt 1 ]; then
		let CSUM=$CSUM+$EACH
	else
		let PSUM=$PSUM+$EACH
	fi
done
PRODUCT=`echo "$PSUM * $CSUM" | bc`
STRING=`cat example.txt  | tr -d [:digit:] | cut -c 1-25`

x=1; PASS=$STRING; STRING=""
while [ -n "`echo $PASS | cut -c$x`" ]; do 
	EACH=`echo $PASS | cut -c$x`
	if [ -n "`echo $EACH | grep [a-y]`" ]; then
		STRING="$STRING`echo $EACH | tr [a-y] [b-z]`"
	else
		if [ -n "`echo $EACH | grep [0-8]`" ]; then
			STRING="$STRING`echo $EACH | tr [a-y] [b-z]`"
		else
			EACH=$(asc "$EACH" )
			let EACH=$EACH+1
			STRING="$STRING$(char "$EACH")"
		fi
	fi
	
	x=$(( $x + 1 ))
done

STRING="$STRING$PRODUCT"
echo the string is $STRING
echo uploading...

wget -q -O - http://www.hackthissite.org/missions/prog/12/index.php --post-data="solution=$STRING&submitbutton=" --load-cookies=cookies.txt --keep-session-cookies --referer http://www.hackthissite.org/missions/prog/12/ > out2.txt

grep -i answer out2.txt | html2text
grep "Good Job" out2.txt | html2text


