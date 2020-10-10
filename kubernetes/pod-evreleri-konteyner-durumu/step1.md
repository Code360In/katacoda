# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Pod Evreleri

Aşağıdaki komutla hatalı bir pod tanımı uygulamayı deneyin;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: pod-evreleri
spec:
  containers:
  - name: nginx
    image: nginx:hata
EOF
```{{execute}}

Hemen ardından pod oluşumunu izleyin;

`kubectl get pods -w`{{execute}}

<kbd>Ctrl</kbd>+<kbd>C</kbd> ile beklemeyi sonlandırabilirsiniz..

Pod durumu aşağıdaki komutla incelenir;

`kubectl describe pod pod-evreleri`{{execute}}

Gelen tanımda Status alanının **Pending** durumunda, Konteyner Status alanının da **Waiting** durumunda olduğu görülecektir.

Aşağıdaki komutla pod düzenleme ekranına geçin;

`kubectl edit pod pod-evreleri`{{execute}}

Pod imaj değerini **nginx** olarak düzenleyerek içeiği saklayın.

Pod durumu aşağıdaki komutla inceleyin;

`kubectl describe pod pod-evreleri`{{execute}}

Gelen tanımda Status alanının **Running** durumunda, Konteyner Status alanının da Running durumunda olduğu görülecektir.

Aşağıdaki komutla pod’u silin;

`kubectl delete pod pod-evreleri`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
