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

systemctl stop kubelet 2>/dev/null &> /dev/null
printf "."

systemctl disable kubelet 2>/dev/null &> /dev/null
printf "."

echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
printf "."

if [ $HOSTNAME == "controlplane" ]; then
    MASTER_IP=$(hostname -I | cut -d' ' -f1) 
    NODE01_IP=$(LogLevel=ERROR ssh node01 hostname -I | cut -d' ' -f1)
    printf "."

    cat <<EOF >> /root/rancher-cluster.yml
nodes:
- address: $MASTER_IP
  user: root
  role: ['controlplane', 'etcd']
- address: $NODE01_IP
  user: root
  role: ['worker']
EOF

   printf "."
   RKE_VERSION=$(curl --silent "https://api.github.com/repos/rancher/rke/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
   printf "."

   curl -L https://github.com/rancher/rke/releases/download/$RKE_VERSION/rke_linux-amd64 -o rke 2>/dev/null &> /dev/null
   printf "."

   chmod +x rke 2>/dev/null &> /dev/null
   mv rke /usr/local/bin 2>/dev/null &> /dev/null
   printf "."
   echo ""
   echo "RKE Cluster'ı başlatılıyor. Lütfen bekleyiniz..."

   rke up --config ./rancher-cluster.yml 2>/dev/null &> /dev/null
   printf "."

   mkdir -p $HOME/.kube 2>/dev/null &> /dev/null
   cp -i kube_config_rancher-cluster.yml $HOME/.kube/config 2>/dev/null &> /dev/null
   chown $(id -u):$(id -g) $HOME/.kube/config 2>/dev/null &> /dev/null

   echo ""
   echo "Node'ların hazır olması bekleniyor..."
   kubectl wait --for=condition=Ready node $NODE01_IP 2>/dev/null &> /dev/null

   echo ""
   echo "RKE Cluster'ı kullanıma hazır..."
fi