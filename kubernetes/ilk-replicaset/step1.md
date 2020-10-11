# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Replicaset

Aşağıdaki komutla ilk replicaset’inizi oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: ilk-replicaset
  labels:
    app: k8sornek
spec:
  replicas: 3
  selector:
    matchLabels:
      app: k8sornek
  template:
    metadata:
      labels:
        app: k8sornek
    spec:
      containers:
      - name: uygulama
        image: enterprisecodingcom/k8sornek
EOF
```{{execute}}

ReplicaSet’in durumunu aşağıdaki komutla kontrol edin;

`kubectl get replicasets`{{execute}}

Aşağıdaki komutla ReplicaSet tanımını inceleyin;

`kubectl describe replicaset ilk-replicaset`{{execute}}

Aşağıdaki komutla Pod’ları listeleyin;

`kubectl get pods`{{execute}}

Listelenen pod’lardan birini silin. Örneğin;

`kubectl delete pod ilk-replicaset-dcsrw`

Ardından aşağıdaki komutla yeniden Pod’ları listeleyin;

`kubectl get pods`{{execute}}

Silinen pod yerine yeni bir pod oluşturularak başlatıldığını teyit edin.

Bir pod’u açıklamasını inceleyin. Örneğin;

`kubectl describe pod ilk-replicaset-2g48g`

Açıklama içerisindeki **Controlled By** değerinin **RepicaSet/ilk-replicaset** olduğunu teyit edin.

Bir pod’u yaml formatında görüntüleyin. Örneğin;

`kubectl get pods ilk-replicaset-2g48g -o yaml`

yaml içerisindeki **ownerReferences** bölümünde **ilk-replicaset**’e referans verildiğini teyit edin.
