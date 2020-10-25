systemctl stop kubelet
systemctl disable kubelet

rm -f /usr/bin/kubectl
rm -f /root/.ssh/id_rsa