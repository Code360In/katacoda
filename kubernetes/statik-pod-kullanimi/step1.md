# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Statik Pod

Statik pod kullanımı iki farklı yolla yapılabilmektedir.
* Pod Manifest Dizini: Dosya sistemi üzerindeki bir dizin dinlenerek
* Web’de Sunulan Pod Manifesti: Bir web sunucusunda barındırılan manifest dosyası ile

Takip eden adımlarda bu iki yöntemi sırasıyla deneyimleyeceksiniz.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.