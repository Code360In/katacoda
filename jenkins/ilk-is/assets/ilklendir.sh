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

RUNNING=$(docker inspect --format="{{.State.Running}}" jenkins 2> /dev/null)

while [ "$RUNNING" != "true" ]
do
   printf '.'
   sleep 0.1;

   RUNNING=$(docker inspect --format="{{.State.Running}}" jenkins 2> /dev/null)
done;

ADMIN_PASS=$(cat /var/jenkins/secrets/jenkins-pass)
echo ''
echo "Jenkins Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : $ADMIN_PASS"