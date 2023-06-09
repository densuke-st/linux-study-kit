#!/bin/bash

R=0

if [ ! -f /tmp/result.txt ]; then
    echo "[fatal] 指定ファイルが作成されていません"
    exit 1
else
    grep -q 'Permission denied' /tmp/result.txt
    if [ $? -ne 0 ]; then
        echo "[fatal] 結果がおかしいです"
        exit 1
    fi
fi

exit $R
