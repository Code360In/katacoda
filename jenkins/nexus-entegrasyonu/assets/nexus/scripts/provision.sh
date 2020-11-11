#!/bin/bash

cd /scripts

set -e
set -u

username=admin
password=admin123
host=http://nexus:8081

#Nexus'abir komut dosyası ekle ve çalıştır

function addAndRunScript {
  name=$1
  file=$2
  # using grape config that points to local Maven repo and Central Repository , default grape config fails on some downloads although artifacts are in Central
  # change the grapeConfig file to point to your repository manager, if you are already running one in your organization
  groovy -Dgroovy.grape.report.downloads=true -Dgrape.config=grapeConfig.xml addUpdateScript.groovy -u "$username" -p "$password" -n "$name" -f "$file" -h "$host"
  printf "\n$file dosyası $name olarak yayınlandı\n\n"
  curl -v -X POST -u $username:$password --header "Content-Type: text/plain" "$host/service/rest/v1/script/$name/run"
  printf "\n$name script'i başarıyla çalıştırıldı\n\n\n"
}

printf "Provisioning Script'lerinin işletilmesi başlıyor \n\n" 
printf "İşlem yapılacak sunucu : $host\n"


#Aşağıdaki görevleri gerçekleştirmek için ilgili komut dosyaları çalıştırılıyor

addAndRunScript maven2 maven2Repositories.groovy
addAndRunScript security security.groovy
printf "\nProvisioning Script'leri tamamlandı\n\n"