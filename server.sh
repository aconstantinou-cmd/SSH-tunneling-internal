#/bin/bash

ip tuntap add mode tap tap0
ifconfig tap0 10.100.100.101 netmask 255.255.255.0 up
echo "PermitTunnel=yes" >> /etc/ssh/sshd_config
service sshd reload

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o tap0 -j MASQUERADE
iptables -A INPUT -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT 
iptables -A INPUT -i tap0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -j ACCEPT

