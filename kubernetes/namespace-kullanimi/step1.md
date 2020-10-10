# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Namespace'ler

Aşağıdaki komutla Kubernetes Cluster'ı üzerinde yer alan namespace'leri listeleyin;

`kubectl get namespaces`{{execute}}

Aşağıdaki komutla ilk namespace tanımınızın yer aldığı **ilk-namespace.yaml** dosyasını oluşturun;

```bash
cat <<EOT >> ilk-namespace.yaml 
apiVersion: v1
kind: Namespace
metadata:
  name: dev
  labels: 
    kullanim: egitim

EOT
```{{execute}}

Dosya içeriğini görüntüleyin;

`cat ilk-namespace.yaml`{{execute}}

Aşağıdaki komutla **ilk-namespace.yaml** dosyası içerisindeki tanımı oluşturun;

`kubectl create -f ilk-namespace.yaml`{{execute}}

Aşağıdaki komutla Kubernetes Cluster'ı üzerinde yer alan namespace'leri yeniden listeleyin;

`kubectl get namespaces`{{execute}}

Gelen listede **dev** namespace'inin de bulunduğunu teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
