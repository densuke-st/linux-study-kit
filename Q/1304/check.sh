#!/bin/bash
RF=/home/linux/result.txt
SF=/etc/q/result-sample.txt
R=0

if [ ! -f ~linux/result.txt ]; then
    echo "[fatal] 指定ファイルが作成されていません"
    exit 1
else
    cmp ${RF} ${SF} >&/dev/null
    if [ $? = 0 ]; then
        R=0
    else
        echo "結果が想定しているものと異なります"
        R=1
    fi
fi

exit $R
