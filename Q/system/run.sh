#!/bin/bash

(
if [ -d /etc/q/user ]; then
    cp -r /etc/q/user/* ~linux
    chown -R linux:linux ~linux
fi

if [ -x /etc/q/setup.sh  ]; then
    cd /etc/q
    sudo ./setup.sh
fi

if [ -f /etc/q/q.txt ]; then
    cat /etc/q/q.txt
fi
)

ARG=""
if [ -f /etc/bash/bashrc ]; then
    ARG="--rcfile /etc/bash/bashrc"
fi

bash ${ARG}

if [ -x /etc/q/check.sh ]; then
    cd /etc/q
    sudo ./check.sh

    if [ $? = 0 ]; then
        echo "正解でした"
    elif [ $? = 127 ]; then
        # 特殊ケース、正常終了扱い
        exit 0
    else
        echo "失敗でした、もう一度やってみましょう"
        exit 1
    fi
fi

exit 0
