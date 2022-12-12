#!/bin/bash
#
#
iptables -L
if [ $? -eq 0 ] ; then
        echo "iptables allready installed"
else
        sudo apt install iptables*
fi
