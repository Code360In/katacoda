# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## ReplicaSet Yatayda Ölçeklendirme

Aşağıdaki komutla replicaset’inizi oluşturun;

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

Aşağıdaki komutla Pod’ları listeleyin;

`kubectl get pods`{{execute}}

Aşağıdaki komutla replica sayısını 4’e yükseltin;

`kubectl scale replicaset ilk-replicaset --replicas=4`{{execute}}

Pod’ları listeleyerek ölçeklemenin gerçekleştiğini teyit edin;

`kubectl get pods`{{execute}}

Aşağıdaki komutla replica sayısını 2’ye indirin;

`kubectl scale replicaset ilk-replicaset --replicas=2`{{execute}}

Pod’ları listeleyerek ölçeklemenin gerçekleştiğini teyit edin;

`kubectl get pods`{{execute}}