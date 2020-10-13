# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Secret

Aşağıdaki komutla şifre bilgisi barındıran bir dosya oluşturun;

`echo -n "123456789" > ./sifre.txt`{{execute}}

Oluşturduğunuz bu configMap içerisinde yer alan nginx.conf tanımı nginx’i Google için bir reverse proxy olarak yapılandıracak şekilde hazırlanmıştır. configMap’in oluştuğunu teyit edin;

`kubectl get configMap `{{execute}}

Bu dosya yardımıyla **sifre** adıyla bir secret oluşturun;

`kubectl create secret generic sifre --from-file=./sifre.txt`{{execute}}

Aşağıdaki komutla secret kayıtlarını listeleyin;

`kubectl get secret`{{execute}}

Gelen listede sifre secret’inin olduğunu teyit edin.

Aşağıdaki komutla sifre tanımını inceleyin;

`kubectl get secret sifre -o yaml`{{execute}}

Data bölümünde **sifre.txt** girdisinin yer aldığını ve değerin açık şekilde yazılmadığını teyit edin.

Aşağıdaki komutu çalıştırarak sifre’nin kullanıldığı bir pod oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: pod-secret
spec:
  containers:
  - name: pod-secret
    image: busybox
    args:
    - sleep
    - "86400"
    volumeMounts:
    - name: sifre
      mountPath: /sirlar
      readOnly: true
  volumes:
  - name: sifre
    secret:
      secretName: sifre
EOF
```{{execute}}

Aşağıdaki komut ile pod içerisinde bir shell oturumu başlatın;

`kubectl exec -it pod-secret -- sh`{{execute}}

Shell oturumunda **/sirlar** dizinini listeleyin;

`ls /sirlar`{{execute}}

Sifre.txt dosyasının listelendiğini teyit edin.

Aşağıdaki komutla sifre.txt dosyasının içeriğini görüntüleyin;

`cat /sirlar/sifre.txt`{{execute}}

Aşağıdaki komutla shell oturumunu sonlandırın;

`exit`{{execute}}