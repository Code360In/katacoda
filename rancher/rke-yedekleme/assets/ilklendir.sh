#!/bin/bash
clear
cat << "EOF"
==================================================================================
   ______       _                       _                        _ _
  |  ____|     | |                     (_)                      | (_)
  | |__   _ __ | |_ ___ _ __ _ __  _ __ _ ___  ___  ___ ___   __| |_ _ __   __ _
  |  __| | '_ \| __/ _ \ '__| '_ \| '__| / __|/ _ \/ __/ _ \ / _` | | '_ \ / _` |
  | |____| | | | ||  __/ |  | |_) | |  | \__ \  __/ (_| (_) | (_| | | | | | (_| |
  |______|_| |_|\__\___|_|  | .__/|_|  |_|___/\___|\___\___/ \__,_|_|_| |_|\__, |
                            | |                                             __/ |
                            |_|                                            |___/
===================================================================================

RKE Cluster'ı hazırlanıyor...

EOF

systemctl stop kubelet
systemctl disable kubelet

echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config

if [ $HOSTNAME == "controlplane" ]; then
    MASTER_IP=$(hostname -I | cut -d' ' -f1) 
    NODE01_IP=$(ssh node01 hostname -I | cut -d' ' -f1)

    cat <<EOF >> /root/rancher-cluster.yml
nodes:
- address: $MASTER_IP
  user: root
  role: ['controlplane', 'etcd']
- address: $NODE01_IP
  user: root
  role: ['worker']
EOF

   RKE_VERSION=$(curl --silent "https://api.github.com/repos/rancher/rke/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
   curl -L https://github.com/rancher/rke/releases/download/$RKE_VERSION/rke_linux-amd64 -o rke
   chmod +x rke
   mv rke /usr/local/bin

   rke up --config ./rancher-cluster.yml

   mkdir -p $HOME/.kube
   cp -i kube_config_rancher-cluster.yml $HOME/.kube/config
   chown $(id -u):$(id -g) $HOME/.kube/config
fi