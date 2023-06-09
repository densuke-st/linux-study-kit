#!/bin/bash

mkdir ~linux/foo
chown linux:linux ~linux/foo
cat <<EOM  >> /etc/bash/bashrc

rm() {
    echo "rmは使っちゃダメ" > /dev/stderr
}

EOM

exit 0
