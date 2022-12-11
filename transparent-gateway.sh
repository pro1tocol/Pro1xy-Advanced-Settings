#!/bin/bash

if [ iptables -L ] ; than
  echo "iptables allready installed"
 else
  sudo apt install iptables* 2>/dev/null && echo "iptables install"
if

iptables -t nat -N clash
iptables -t nat -N clash_dns
echo "Name is set up"
sleep 1s

iptables -t nat -A PREROUTING -p tcp --dport 53 -d 198.19.0.0/24 -j clash_dns
iptables -t nat -A PREROUTING -p udp --dport 53 -d 198.19.0.0/24 -j clash_dns
iptables -t nat -A PREROUTING -p tcp -j clash
echo "DNS address is set up"
sleep 1s

iptables -t filter -A FORWARD -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j MASQUERADE
echo "Gateway server is set up"
sleep 1s

echo "Keep going ..."
iptables -t nat -A clash_dns -p udp --dport 53 -d 198.19.0.0/24 -j DNAT --to-destination 192.168.0.104:5358
iptables -t nat -A clash_dns -p tcp --dport 53 -d 198.19.0.0/24 -j DNAT --to-destination 192.168.0.104:5358
iptables -t nat -A clash -d 0.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 10.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 127.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 169.254.0.0/16 -j RETURN
iptables -t nat -A clash -d 172.16.0.0/12 -j RETURN
iptables -t nat -A clash -d 192.168.0.0/16 -j RETURN
iptables -t nat -A clash -d 224.0.0.0/4 -j RETURN
iptables -t nat -A clash -d 240.0.0.0/4 -j RETURN
iptables -t nat -A clash -p tcp -j REDIRECT --to-ports 5772
sleep 3s
echo "setting run forever ..."
iptables-save > /etc/iptables/rules.v4
iptables-restore /etc/iptables/rules.v4 && echo "gateway running"
echo "It's all done !!!"