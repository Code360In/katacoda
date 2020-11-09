# Konteyner Başlatma

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

Jenkins için tavsiye edilen resmi Docker imajı [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins/)'dir. Bu depoda Jenkins'in üretim ortamı kullanımına uygun uzun dönem desteklenen (LTS) imajları yer almaktadır. Bu imajlar düzenli olarak güncellenmektedir.

Bu imaj aşağıdaki komutla başlatılabilir;

`docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts`

Docker imajında verileri **/var/jenkins_home** dizininde saklanmaktadır. Yeniden başlatmalarda veri kaybı olmaması adına bu dizin ir docker volume'de tutulabilir. Aşağıdaki komutla Jenkins konteyner'ını başlatın;

`docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts`{{execute}}

Aşağıdaki komutla Jenkins konteyner'ı içerisinde bir shell oturumu başlatın;

`docker exec -it jenkins bash`{{execute}}

Aşağıdaki komutla **/var/jenkins_home** dizin içeriğini listeleyin;

`ls /var/jenkins_home`{{execute}}

Bu adımlar ardından Jenkins yapılandırmasına hazırsınız.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
