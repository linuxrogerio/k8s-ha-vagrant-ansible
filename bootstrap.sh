#!/bin/bash

# Enable ssh password authentication
echo "[TASK 1] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "[TASK 2] Set root password"
echo -e "kubeadmin\nkubeadmin" | passwd root >/dev/null 2>&1


#Adjusting the join-master-command file
if [ -a /tmp/join-master-command-inicial.sh ]; then
	cat /tmp/join-master-command-inicial.sh  | cut -c4973-5258 | tr -d "\\\\" | tr -d "," | tr -d "\"" > /tmp/join-master-command-final.sh
else
	echo 'this is the kmaster1'
fi
