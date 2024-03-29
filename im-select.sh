#!/bin/sh

# if im-select already exist, delete it and copy it again
if [ -e /usr/local/bin/im-select ]
then
    rm -f /usr/local/bin/im-select
fi

echo "* Copy im-select..."

cp ./im-select /usr/local/bin/im-select

chmod 777 /usr/local/bin/im-select

echo "* im-select is installed!"
echo "* now run \"im-select\" in your terminal!"
