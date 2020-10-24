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
   echo "Rancher Hazırlanıyor"

   #Rancher şifresi oluştur
   RANCHER_PASS=$(openssl rand -base64 12)
   echo $RANCHER_PASS > /root/rancher_sifresi

   docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:latest 2>/dev/null &> /dev/null
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
   curl -sk 'https://127.0.0.1/v3/settings/server-url' -H 'content-type: application/json' -H "Authorization: Bearer $APITOKEN" -X PUT --data-binary '{"name":"telemetry-opt","value":"out"}' 2>/dev/null &> /dev/null

   echo ""
   echo "Rancher kullanıma hazır"
   echo "Kullanıcı Adı: admin"
   echo "Şifre: $(cat /root/rancher_sifresi)"

   hostnamectl set-hostname rancher-node
   export PS1='\[\e[1;32m\][\u@rancher-node \W]\$\[\e[0m\] '
else 
   echo "Sunucu kullanıma hazır..."
   hostnamectl set-hostname k8s-node
   export PS1='\[\e[1;32m\][\u@k8s-node \W]\$\[\e[0m\] '
fi

exec bash