# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Hazırlık

Kubernetes DNS üzerinde çalışmak için 3 adet python http server başlatacaksınız. Bu pod’lar 80 portu üzerinden hizmet verecek. 80 portu üzerinden yapılan http taleplerine pod adı ile yanıt verecekler.

Aşağıdaki komutla yeni bir deployment oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: http-server-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: http-server-pod
  template:
    metadata:
      labels:
        app: http-server-pod
    spec:
      containers:
      - name: python-http-server
        image: python:2.7
        command: ["/bin/bash"]
        args: ["-c", "echo \" Hello from \$(hostname)\" > index.html; python -m SimpleHTTPServer 80"]
        ports:
        - name: http
          containerPort: 80
EOF
```{{execute}}

Aşağıdaki komutla deployment'ın yaygınlaşmasını bekleyin;

`kubectl rollout status deployment http-server-deployment`{{execute}}

Deployment ile oluşturulan pod’ların hizmetine erişim işim aşağıdaki komutla yeni bir servis oluşturun;

```bash
cat <<EOF | kubectl create -f -
kind: Service
apiVersion: v1
metadata:
  name: http-server-service
spec:
  selector:
    app: http-server-pod
  ports:
  - protocol: TCP
    port: 4000
    targetPort: http
EOF
```{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.