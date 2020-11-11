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

Nexus başlatılıyor..
EOF

echo ""
echo "Nexus'un başlaması bekleniyor"
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8081/service/rest/v1/status)" != "200" ]]
do 
   printf '.'
   sleep 5
done

echo ""
echo "Nexus başladı, ilklendiriliyor.."

HOST_IP=$(hostname -I | cut -d' ' -f1)
docker run -it --rm -v /var/nexus/scripts:/scripts --add-host=nexus:$HOST_IP groovy /scripts/provision.sh 2> /dev/null &> /dev/null
echo "Nexus ilklendirildi.."

echo ""
echo "Jenkins'un başlaması bekleniyor"
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8080/service/rest/v1/status)" != "200" ]]
do 
   printf '.'
   sleep 5
done
echo ""
echo "Nexus başladı.."

NEXUS_PASS=enterprisecoding
ADMIN_PASS=$(cat /var/jenkins/secrets/jenkins-pass)

echo '=============================='
echo "Jenkins Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : $ADMIN_PASS"
echo '=============================='
echo "Nexus Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : $NEXUS_PASS"