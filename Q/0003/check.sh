#!/bin/bash
cd ~linux

R=0

if [ -d foo ]; then
    echo "[fatal] ディレクトリfooが残ってます"
    R=1
fi

exit $R
