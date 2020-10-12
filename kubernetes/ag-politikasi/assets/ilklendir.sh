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

echo "Imajlar indiriliyor"
kubeadm config images pull 2>/dev/null &> /dev/null

echo "Kubernetes Cluster'ı ilklendiriliyor"
kubeadm init --pod-network-cidr 10.244.0.0/16 2>/dev/null &> /dev/null

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "CNI eklentisi yapılandırılıyor"
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml 2>/dev/null &> /dev/null

cat <<EOF | kubectl create -f -
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  calicoNetwork:
    ipPools:
    - blockSize: 26
      cidr: 10.244.0.0/16
      encapsulation: VXLANCrossSubnet
      natOutgoing: Enabled
      nodeSelector: all()
EOF

echo "Node01'in Cluster'a katılıyor..."
JOIN_COMMAND=$(kubeadm token create --print-join-command)
ssh node01 $JOIN_COMMAND

echo "Node01'in hazır duruma gelmesi bekleniyor"
RET=1
until [ ${RET} -eq 0 ]; do
  kubectl wait --for=condition=ready node node01 2>/dev/null &> /dev/null
  RET=$?
  printf "."
  sleep 2
done


echo ""
echo "Kubernetes Cluster'ı kullanıma hazır..."