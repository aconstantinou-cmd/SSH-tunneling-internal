#/bin/bash
if [[ $# -eq 0 ]] ; then
	echo "This client script allows a tap tunneling interface to be created for vulnerability scanning internal networks using SSH tunneling"
    echo ""
    echo "example: ./client.sh target"

    exit 0
fi

ip tuntap add mode tap tap0
ifconfig tap0 10.100.100.100 netmask 255.255.255.0 up
service sshd reload

ssh -o Tunnel=ethernet -f -w 0:0 root@$1 true

echo "Please provide IP or CIDR target: "
read input

ip route add $input via 10.100.100.101
