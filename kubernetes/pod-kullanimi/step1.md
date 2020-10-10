# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Pod'lar

Aşağıdaki komutla Kubernetes Cluster'ı üzerinde mevcut namespace'de yer alan pod'lari listeleyin;

`kubectl get pods`{{execute}}

Aşağıdaki komutla ilk pod tanımınızın yer aldığı **ilk-pod.yaml** dosyasını oluşturun;

```bash
cat <<EOT >> ilk-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: ilk-pod
spec:
  containers:
  - name: ilk-pod-konteyner
    image: busybox
    command: ['sh', '-c', 'echo "Merhaba, Kubernetes!" && sleep 3600']
EOT
```{{execute}}

Dosya içeriğini görüntüleyin;

`cat ilk-pod.yaml`{{execute}}

Aşağıdaki komutla **ilk-pod.yaml** dosyası içerisindeki tanımı oluşturun;

`kubectl create -f ilk-pod.yaml`{{execute}}

Aşağıdaki komutla Kubernetes Cluster'ı üzerinde mevcut namespace'de yer alan pod'lari yeniden listeleyin;

`kubectl get pods`{{execute}}

Gelen listede **ilk-pod** pod'unun da bulunduğunu teyit edin.

Aşağıdaki komutu çalıştırarak daha detaylı pod listesi görüntüleyin;

`kubectl get pods -w`{{execute}}

Pod’un Running statüsüne gelmesini bekleyin. Ardından aşağıdaki komutla loglarını inceleyin;

`kubectl logs ilk-pod`{{execute}}

Aşağıdaki komutu kullanarak pod’u silin;

`kubectl delete -f ilk-pod.yaml`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
