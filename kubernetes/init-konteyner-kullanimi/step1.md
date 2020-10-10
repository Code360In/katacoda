# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Init Konteyner

Bu lab’da iki konteyner’dan oluşan bir pod hazırlayacaksınız. Konteyner’lardan ilki nginx konteyner’ı. Bu konteyner /usr/share/nginx/html dizininde yer alan dosyaları sunmakta. İkinci konteyner ise bir init konteyner ve Nginx başlamadan önce sunulacak olan index.html dosyasını github üzerinden yerele indiriyor.

Aşağıdaki komutla yeni bir pod oluşturulur;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: init-konteyner
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
    volumeMounts:
    - name: workdir
      mountPath: /usr/share/nginx/html
  initContainers:
  - name: hazirlik
    image: busybox
    command:
    - wget
    - "-O"
    - "/work-dir/index.html"
    - https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/pod/ornek-index.html
    volumeMounts:
    - name: workdir
      mountPath: "/work-dir"
  dnsPolicy: Default
  volumes:
  - name: workdir
    emptyDir: {}
EOF

```{{execute}}

Hemen ardından aşağıdaki komut çalıştırılarak pod durumunu izleyin;

`kubectl get pods -w`{{execute}}

<kbd>Ctrl</kbd>+<kbd>C</kbd> ile beklemeyi sonlandırabilirsiniz..

Pod başladıktan sonra aşağıdaki komutla içerisinde bir Shell process’i başlatın;

`kubectl exec -it init-konteyner -- /bin/bash`{{execute}}

Shell oturumunda aşağıdaki komutu çalıştırarak nginx index sayfasını görüntüleyin;

`curl localhost`{{execute}}

Açılan sayfayı https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/pod/ornek-index.html adresindeki dosya ile kıyaslayın.

Aşağıdaki komutla pod’u silin;

`kubectl delete pod init-konteyner`{{execute}}