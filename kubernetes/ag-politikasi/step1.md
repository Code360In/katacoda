# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Hazırlık

Aşağıdaki komutla iki namespace oluşturulur;

`kubectl create namespace dev`{{execute}}

`kubectl create namespace test`{{execute}}

Aşağıdaki komutla **dev** namespace’inde örnek uygulamayı bir deployment ile oluşturarak servis ile ClusterIp üzerinden erişime açın;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-uygulama
  namespace: test
  labels:
    app: k8sornek
spec:
  replicas: 2
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
---
apiVersion: v1
kind: Service
metadata:
  name: uygulama-servisi
  namespace: test
  labels:
    app: k8sornek
spec:
  selector:
    app: k8sornek
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF
```{{execute}}

Aşağıdaki komutla ilgili kaynakların **test** namespace’inde oluştuğunu teyit ediniz;

`kubectl get pods,replicasets,deployments,services --namespace test`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.