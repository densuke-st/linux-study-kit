#!/bin/bash
rm -f /bin/egrep /bin/fgrep
install -m 0755 /etc/q/grep.sh /usr/local/bin/grep
exit 0
