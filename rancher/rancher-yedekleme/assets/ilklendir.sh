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

EOF

if [ $HOSTNAME == "controlplane" ]; then
   MASTER_IP=$(hostname -I | cut -d' ' -f1) 
   echo "Rancher Hazırlanıyor"

   #Rancher şifresi oluştur
   RANCHER_PASS=$(openssl rand -base64 12)
   echo $RANCHER_PASS > /root/rancher_sifresi

   docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:v2.5.1 2>/dev/null &> /dev/null
   while true; do curl -sLk https://127.0.0.1/ping && break; printf "."; sleep 2; done

   #Rancher'a giriş yap
   while true; do
      printf "."
      LOGINRESPONSE=$(curl -sk "https://127.0.0.1/v3-public/localProviders/local?action=login" -H 'content-type: application/json' --data-binary '{"username":"admin","password":"admin"}')
      LOGINTOKEN=$(echo $LOGINRESPONSE | jq -r .token)

      if [ "$LOGINTOKEN" != "null" ]; then
         break
      else
         sleep 5
      fi
   done

   #Varsayılan Rancher şifresini değiştir
   curl -sk 'https://127.0.0.1/v3/users?action=changepassword' -H 'content-type: application/json' -H "Authorization: Bearer $LOGINTOKEN" --data-binary '{"currentPassword":"admin","newPassword":"'"${RANCHER_PASS}"'"}' 2>/dev/null &> /dev/null

   #API token al
   APIRESPONSE=$(curl -sk 'https://127.0.0.1/v3/token' -H 'content-type: application/json' -H "Authorization: Bearer $LOGINTOKEN" --data-binary '{"type":"token","description":"automation"}')
   APITOKEN=`echo $APIRESPONSE | jq -r .token`

   #Rancher sunucu adresini ayarla
   RANCHER_SERVER="https://[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com"
   curl -sk 'https://127.0.0.1/v3/settings/server-url' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" -X PUT --data-binary '{"name":"server-url","value":"'"${RANCHER_SERVER}"'"}' 2>/dev/null &> /dev/null
   
   #Telemetriyi kapat
   curl -sk 'https://127.0.0.1/v3/settings/telemetry-opt' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" -X PUT --data-binary '{"name":"telemetry-opt","value":"out"}' 2>/dev/null &> /dev/null

   #Firma adını ayarla
   curl -sk 'https://127.0.0.1/v3/settings/ui-pl' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" -X PUT --data-binary '{"name":"ui-pl","value":"Enterprisecoding"}' 2>/dev/null &> /dev/null


   # Custer kaydı oluştur
   CLUSTERRESPONSE=`curl -s 'https://127.0.0.1/v3/cluster' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" --data-binary '{"dockerRootDir":"/var/lib/docker","enableClusterAlerting":false,"enableClusterMonitoring":false,"enableNetworkPolicy":false,"windowsPreferedCluster":false,"type":"cluster","name":"enterprisecoding-cluster","rancherKubernetesEngineConfig":{"addonJobTimeout":30,"ignoreDockerVersion":true,"sshAgentAuth":false,"type":"rancherKubernetesEngineConfig","kubernetesVersion":"v1.19.4-rancher1-1","authentication":{"strategy":"x509","type":"authnConfig"},"dns":{"type":"dnsConfig","nodelocal":{"type":"nodelocal","ip_address":"","node_selector":null,"update_strategy":{}}},"network":{"mtu":0,"plugin":"canal","type":"networkConfig","options":{"flannel_backend_type":"vxlan"}},"ingress":{"provider":"nginx","type":"ingressConfig"},"monitoring":{"provider":"metrics-server","replicas":1,"type":"monitoringConfig"},"services":{"type":"rkeConfigServices","kubeApi":{"alwaysPullImages":false,"podSecurityPolicy":false,"serviceNodePortRange":"30000-32767","type":"kubeAPIService"},"etcd":{"creation":"12h","extraArgs":{"heartbeat-interval":500,"election-timeout":5000},"gid":0,"retention":"72h","snapshot":false,"uid":0,"type":"etcdService","backupConfig":{"enabled":true,"intervalHours":12,"retention":6,"safeTimestamp":false,"type":"backupConfig"}}},"upgradeStrategy":{"maxUnavailableControlplane":"1","maxUnavailableWorker":"10%","drain":"false","nodeDrainInput":{"deleteLocalData":false,"force":false,"gracePeriod":-1,"ignoreDaemonSets":true,"timeout":120,"type":"nodeDrainInput"},"maxUnavailableUnit":"percentage"}},"localClusterAuthEndpoint":{"enabled":true,"type":"localClusterAuthEndpoint"},"labels":{},"scheduledClusterScan":{"enabled":false,"scheduleConfig":null,"scanConfig":null}}' --insecure`

   # Docker run komutunu oluşturabilmek için clusterid'yi ayıkla
   CLUSTERID=`echo $CLUSTERRESPONSE | jq -r .id`

   # Cluster kayıt token'ı oluştur
   curl -s 'https://127.0.0.1/v3/clusterregistrationtoken' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" --data-binary '{"type":"clusterRegistrationToken","clusterId":"'$CLUSTERID'"}' --insecure > /dev/null

   # Master bayrakları
   MASTER_ROLEFLAGS="--etcd --controlplane --worker"

   # Worker bayrakları
   WORKER_ROLEFLAGS="--worker"

   # node komutu oluştur
   AGENTCMD=`curl -s 'https://127.0.0.1/v3/clusterregistrationtoken?id="'$CLUSTERID'"' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" --insecure | jq -r '.data[].nodeCommand' | head -1 | sed "s/127\.0\.0\.1/$MASTER_IP/"`

   # Master node komutunu oluştur
   MASTER_DOCKERRUNCMD="$AGENTCMD $MASTER_ROLEFLAGS"

   # Master node komutunu oluştur
   WORKER_DOCKERRUNCMD="$AGENTCMD $WORKER_ROLEFLAGS"

   ssh -o LogLevel=quiet node01 "echo $WORKER_DOCKERRUNCMD > /tmp/initialize_worker.sh"

   hostnamectl set-hostname rancher-node

   echo ""
   echo "RKE hazırlanıyor..."
   eval "$MASTER_DOCKERRUNCMD" 2>/dev/null &> /dev/null

   echo ""
   echo "Rancher kullanıma hazır"
   echo "Kullanıcı Adı: admin"
   echo "Şifre: $(cat /root/rancher_sifresi)"

   echo "[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]"

   export PS1='\[\e[1;32m\][\u@rancher-node \W]\$\[\e[0m\] '
else 
   hostnamectl set-hostname k8s-node

   while [ ! -f /tmp/initialize_worker.sh ]; do echo "."; sleep 1; done

   echo ""
   echo "RKE hazırlanıyor..."
   cat /tmp/initialize_worker.sh | sh
   cat tamam > /tmp/sonuc

   echo "Sunucu kullanıma hazır..."
   export PS1='\[\e[1;32m\][\u@k8s-node \W]\$\[\e[0m\] '
fi

exec bash