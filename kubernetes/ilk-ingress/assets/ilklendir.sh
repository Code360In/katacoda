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

Ingress controller kullanıma hazırlanıyor lütfen bekleyiniz
EOF

RET=1
until [ ${RET} -eq 0 ]; do
  kubectl wait --for=condition=ready node node01 2>/dev/null &> /dev/null
  RET=$?
  printf "."
  sleep 2
done

kubectl apply -f https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/ingress/deploy-nginx-ingress-controller.yaml 2>/dev/null &> /dev/null

while [[ $(kubectl get pods -n ingress-nginx -l  app.kubernetes.io/component=controller  -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}' 2>/dev/null) != "True" ]]; do printf "." && sleep 1; done
echo ""
echo "Ingress ortamı kullanıma hazır..."