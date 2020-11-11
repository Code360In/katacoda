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

Jenkins Hazırlanıyor..
EOF

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8080/)" != "200" ]]
do 
   printf '.'
   sleep 5
done

echo "Jenkins Hazır"
echo "SonarQube Hazırlanıyor.."

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:9000/)" != "200" ]]
do 
   printf '.'
   sleep 5
done

echo "SonarQube Hazır"

ADMIN_PASS=$(cat /var/jenkins/secrets/jenkins-pass)
echo '==============================='
echo "Jenkins Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : $ADMIN_PASS"
echo '==============================='
echo "Sonarqube Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : adimn"