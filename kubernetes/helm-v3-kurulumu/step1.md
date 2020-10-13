# Kurulum Bilgisi

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Helm Kurulumu

Aşağıdaki komutla helm kurulumunu gerçekleştirin;

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash`{{execute}}

Kurulum ardından aşağıdaki komutu çalıştırarak stabil helm chart deposu ekleyin;

`helm repo add stable https://kubernetes-charts.storage.googleapis.com`{{execute}}

Kurulu Helm depolarının listesini alın;

`helm repo list`{{execute}}

**Continue** butonuna basarak HPA tanımlama adımına geçebilirsiniz.
