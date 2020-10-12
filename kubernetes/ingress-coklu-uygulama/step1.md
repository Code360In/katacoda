# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## İlk Uygulamanın Hazırlanması

Aşağıdaki komutla ilk uygulamaya ait deployment tanımı oluşturulur;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-uygulama-v1
  labels:
    app: k8sornek
    version: v1
spec:
  replicas: 2
  selector:
    matchLabels:
      app: k8sornek
      version: v1
  template:
    metadata:
      labels:
        app: k8sornek
        version: v1
    spec:
      containers:
      - name: uygulama
        image: enterprisecodingcom/k8sornek:v1
        ports:
        - containerPort: 80
EOF
```{{execute}}

Aşağıdaki komutla ilk uygulama deployment'ının yaygınlaşma durumunu inceleyin;

`kubectl rollout status deployment ornek-uygulama-v1`{{execute}}

Aşağıdaki komutla ilk uygulama deployment’ına ait podları işaret eden **ClusterIP** türünde bir servis oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Service
metadata:
  name: uygulama-servisi-v1
  labels:
    app: k8sornek
    version: v1
spec:
  selector:
    app: k8sornek
    version: v1
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF
```{{execute}}

## İkinci Uygulamanın Hazırlanması

Aşağıdaki komutu çalıştırarak örnek uygulamanın v2 sürümüne dair bir deployment oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-uygulama-v2
  labels:
    app: k8sornek
    version: v2
spec:
  revisionHistoryLimit: 10
  replicas: 2
  selector:
    matchLabels:
      app: k8sornek
      version: v2
  template:
    metadata:
      labels:
        app: k8sornek
        version: v2
    spec:
      containers:
      - name: uygulama
        image: enterprisecodingcom/k8sornek:v2
        ports:
        - containerPort: 80
EOF
```{{execute}}

Aşağıdaki komutla ikinci deployment’a ait podları işaret eden **ClusterIP** türünde bir servis oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Service
metadata:
  name: uygulama-servisi-v2
  labels:
    app: k8sornek
    version: v2
spec:
  selector:
    app: k8sornek
    version: v2
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF
```{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.