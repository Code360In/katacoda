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

Kubernetes handson ortamı kullanıma hazırlanıyor lütfen bekleyiniz
EOF

RET=1
until [ ${RET} -eq 0 ]; do
  kubectl apply -f /tmp/handson.yaml 2>/dev/null
  RET=$?
  printf "*"
  sleep 2
done

while [[ $(kubectl get pods -n handson -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}' 2>/dev/null) != "True True" ]]; do printf "." && sleep 1; done
echo ""
echo "Kubernetes handson ortamı kullanıma hazır. Başarılar..."