#!/bin/bash
grep -wq "22" /etc/sysconfig/iptables
exit_status=$?
if [ $exit_status -eq 0 ]; then
    break;
else
/sbin/iptables -I INPUT -p tcp -m tcp --dport 22 -j ACCEPT
/etc/init.d/iptables save > /dev/null 2>&1
/etc/init.d/iptables restart  > /dev/null 2>&1
fi
