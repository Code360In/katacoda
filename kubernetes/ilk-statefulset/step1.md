# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Statefulset

Aşağıdaki komutla ilk statefulset’inizi oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: ilk-statefulset
  labels:
    app: k8sornek
spec:
  revisionHistoryLimit: 10
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
        ports:
        - containerPort: 80
EOF
```{{execute}}

Aşağıdaki komutla StatefulSet yaygınlaşma durumunu inceleyin;

`kubectl rollout status statefulset ilk-statefulset`{{execute}}

Aşağıdaki komutla StataefulSet ve Pod listesini alın;

`kubectl get statefulsets,pods`{{execute}}

Listede gelen pod’lardan birinin tanımını inceleyin.

`kubectl describe pod/ilk-statefulset-0`{{execute}}

Pod tanımında **Controlled By** alan değeri olarak **StatefulSet/ilk-statefulset** yazdığını teyit edin.

**ilk-statefulset-1** pod’unun tanımını silin;

`kubectl delete pod/ilk-statefulset-1`{{execute}}

Aşağıdaki komutla Pod listesini yeniden alın;

`kubectl get pods`{{execute}}

Pod’un aynı isimle yeniden oluşturulduğunu teyit edin.