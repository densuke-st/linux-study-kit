#!/bin/bash
cd ~linux

R=0

for i in foo bar; do
    if [ ! -d $i ]; then
        echo "[fatal] $i ディレクトリがありません"
        R=1
    fi
done

exit $R
