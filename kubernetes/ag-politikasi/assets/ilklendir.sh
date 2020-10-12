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

Kubernetes Cluster'ı hazırlanıyor. Lütfen bekleyiniz.
EOF

#kubeadm config images pull
#
#kubeadm init --pod-network-cidr 192.168.0.0/16
#
#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config
#
#RET=1
#until [ ${RET} -eq 0 ]; do
#  kubectl wait --for=condition=ready node node01 2>/dev/null &> /dev/null
#  RET=$?
#  printf "."
#  sleep 2
#done


echo ""
echo "Kubernetes Cluster'ı kullanıma hazır..."