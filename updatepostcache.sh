#!/bin/sh

cd $(dirname "$0")

. ./params.sh

pad=$(printf %70s | tr ' ' '_')

cd "$1"

if [ "$2" ]
then
	posts=$(ls "$2" 2>/dev/null)
else
	posts=$(ls -v [0-9]* 2>/dev/null)
fi

for file in $posts
do
	stamp=$(echo "$file" | cut -d _ -f 1)
	no=$(echo "$file" | cut -d _ -f 2)
	posted=$(date -d @$stamp +"$DATE_FORMAT")

	header=$(printf "__[%s #%d]%s" "$posted" $no "$pad" | cut -c1-70)
	phinfo "$header"

	saveifs="$IFS"
	IFS=''
	cat $file | while read -r line
	do
		if echo "$line" | grep -q "	"
		then
			printf "%s\r\n" "$line"
		else
			echo "$line" | fmt -70 | fold -w 70 | while read -r fmtline
			do
				phinfo "$fmtline"
			done
		fi
	done
	IFS="$saveifs"

	phline
done