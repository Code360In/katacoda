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

RET=1
until [ ${RET} -eq 0 ]; do
  kubectl wait --for=condition=ready node node01 2>/dev/null &> /dev/null
  RET=$?
  printf "."
  sleep 2
done

echo ""
echo "Metik server hazırlanıyor"
METRICS_SERVER_RELEASE=$(curl --silent "https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
curl -L https://github.com/kubernetes-sigs/metrics-server/releases/download/${METRICS_SERVER_RELEASE}/components.yaml 2>/dev/null &> /dev/null | sed s/'args:'/'args:\n          - --kubelet-insecure-tls\n          - --kubelet-preferred-address-types=InternalIP'/ > /tmp/components.yaml
kubectl apply -f /tmp/components.yaml 2>/dev/null &> /dev/null

curl -L https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/hpa/ornek-uygulama.yaml -o ornek-uygulama.yaml 2>/dev/null &> /dev/null

echo ""
echo "Kubernetes Cluster'ı kullanıma hazır..."