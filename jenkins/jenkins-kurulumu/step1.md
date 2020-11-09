# Java Kurulumu

Jenkins java tabanlı bir uygulamadır. Bu nedenle öncelikli olarak sistemde desteklenen bir java sürümü olmalıdır. Aşağıdaki komutu çalıştırarak JDK 1.8'i kurun;

`sudo apt install openjdk-8-jdk`{{execute}}

Kurulumun başarılı olduğunu teyit edin;

`java -version`{{execute}}

# Paket Deposunun Kurulumu

Ubuntu işletim sistemi üzerinde Jenkins kurulumu [Jenkins Deposunda](https://pkg.jenkins.io/debian-stable/) hazır şekilde yer almaktadır. Bu nedenle öncelikli olarak bu depoya ait anahtarları aşağıdaki komutla sisteme ekleyin;

`wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -`{{execute}}

Ardından depoyu mevcut depolar arasına ekleyin;

`sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'`{{execute}}

Paket listesinin güncellenmesi adına depoları güncelleyin;

`sudo apt-get update`{{execute}}

Bu adımlar ardından sisteme Jenkins kurmaya hazırsınız.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
