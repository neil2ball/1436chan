. ./params.sh

echo $(date +%s) >  "$1/archive"

rm -f "$1/cgi-bin/post"
rm -f "$1/cgi-bin/postlink"
rm -f "$1/cgi-bin/postfile"
rm -f "$1/cgi-bin/postsplr"
rm -f "$1/cgi-bin/postfileb64"
rm -f "$1/cgi-bin/postb64"
rm -f "$1/gophermap"

ln template_readonly_gophermap "$1/gophermap"

mv $1 ../archive
