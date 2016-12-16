#!/bin/bash

stamp=$(date +%s)
no=$(($(ls -d [0-9]* | wc -l) + 1))
thread="$stamp"_"$no"

mkdir sticky_$thread
chmod g+w sticky_$thread
ln template_gophermap sticky_$thread/gophermap
ln template_post sticky_$thread/post
ln template_postlink sticky_$thread/postlink
ln template_postfile sticky_$thread/postfile
ln template_postsplr sticky_$thread/postsplr
ln template_postfileb64 sticky_$thread/postfileb64
echo "$@" > sticky_$thread/gophertag
