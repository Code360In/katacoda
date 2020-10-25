systemctl stop kubelet
systemctl disable kubelet

rm -f /usr/bin/kubectl
rm -f /root/.ssh/id_rsa

if [ $HOSTNAME == "controlplane" ]; then
    MASTER_IP=$(hostname -I | cut -d' ' -f1)
    NODE01_IP=$(ssh node01 hostname -I | cut -d' ' -f1)

    cat <<EOF >> /root/rancher-cluster.yml
nodes:
- address: $MASTER_IP
  user: rancher
  role: ['controlplane', 'etcd']
- address: $NODE01_IP
  user: rancher
  role: ['worker']
EOF
fi