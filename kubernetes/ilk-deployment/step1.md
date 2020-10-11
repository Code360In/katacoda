# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Deployment

Aşağıdaki komutla ilk deployment’ınızı oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ilk-deployment
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

Aşağıdaki komutla Deployment yaygınlaşma durumunu inceleyin;

`kubectl rollout status deployment ilk-deployment`{{execute}}

Aşağıdaki komutla Deployment, ReplicaSet ve Pod listesini alın;

`kubectl get deployments,replicasets,pods`{{execute}}

Listede gelen ReplicaSet’in tanımını inceleyin. Örneğin;

`kubectl describe ReplicaSet/ilk-deployment-7c8bdd4948`

ReplicaSet tanımında **Controlled By** alan değeri olarak **Deployment/ilk-deployment** yazdığını teyit edin.

ReplicaSet tanımını silin. Örneğin;

`kubectl delete ReplicaSet/ilk-deployment-7c8bdd4948`

Aşağıdaki komutla Deployment, ReplicaSet ve Pod listesini yeniden alın;

`kubectl get deployments,replicasets,pods`{{execute}}

ReplicaSet’in yeniden oluşturulduğunu, eski pod’ların sonlanarak yeni pod’ların oluşturulduğunu teyit edin.