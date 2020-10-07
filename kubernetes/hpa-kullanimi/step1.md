# Kurulum Bilgisi

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Örnek Uygulama Kurulumu

HPA kullanımını deneyimleyebilmeniz adına bulunduğunuz dizin içerisinde örnek uygulama tanımının yer aldığı bir **ornek-uygulama.yaml** dosyası oluşturulmuştur. Aşağıdaki komutu çalıştırarak bu dosya içeriğini görüntüleyin;

`cat ornek-uygulama.yaml`{{execute}}

Kubectl'i kullanarak uygulamayı hazırlayın;

`kubectl apply -f ornek-uygulama.yaml`{{execute}}

Aşağıdaki komutla uygulamanın yaygınlaştırmasını bekleyin;

`kubectl rollout status deployment php-apache`{{execute}}

**Continue** butonuna basarak HPA tanımlama adımına geçebilirsiniz.
