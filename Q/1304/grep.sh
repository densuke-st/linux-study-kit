#!/bin/sh

echo "$*" | /bin/grep -q -e '-F'
if [ $? = 0 ]; then
    echo "[fatal] -Fスイッチは使用禁止です" > /dev/stderr
    exit 1
fi
exec /bin/grep "$@"
