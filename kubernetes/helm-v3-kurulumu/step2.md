# Helm ile Uygulama Kurulumu

Aşağıdaki komut ile kullanabileceğiniz Helm chart’larını listeyin;

`helm search repo stable`{{execute}}

Mysql kurulumu yapın;

`helm install stable/mysql --generate-name`{{execute}}

Chart bilgisini görüntüleyin;

`helm show chart stable/mysql`{{execute}}

Daha detaylı bilgi almak için aşağıdaki komutu çalıştırın;

`helm show all stable/mysql`{{execute}}

Yüklü olan Helm release’lerini listeleyin;

`helm ls`{{execute}}

Kurulu release’i kaldırın. Örneğin;

`helm uninstall [RELEASE_ADI]`