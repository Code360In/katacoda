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

echo ""
echo "Nexus Hazırlanıyor"

RUNNING=$(docker inspect --format="{{.State.Running}}" nexus 2> /dev/null)

while [ "$RUNNING" != "true" ]
do
   printf '.'
   sleep 0.1;

   RUNNING=$(docker inspect --format="{{.State.Running}}" nexus 2> /dev/null)
done;

docker exec -i nexus bash -c "while [ ! -f /nexus-data/admin.password ]; do sleep 1; printf '.'; done;"

ADMIN_PASS=$(cat /var/jenkins/secrets/jenkins-pass)
NEXUS_PASS=$(docker exec -i nexus cat /nexus-data/admin.password)

echo ''
echo "Jenkins Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : $ADMIN_PASS"
echo '=============================='
echo "Nexus Kullanıcı Bilgileri"
echo "Kullanıcı Adı : admin"
echo "Şifre : $NEXUS_PASS"