# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## NodePort Üzerinden Erişim

Aşağıdaki komut çalıştırılarak örnek uygulama Deployment tanımı gerçekleştirin;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-uygulama
  labels:
    app: k8sornek
spec:
  revisionHistoryLimit: 10
  replicas: 1
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

Aşağıdaki deployment yaygınlaştırmasını bekleyin;

`kubectl rollout status deployment ornek-uygulama`{{execute}}

Aşağıdaki komutla ilk servis tanımınızı yapın;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: uygulama-servisi-np
  labels:
    app: k8sornek
spec:
  selector:
    app: k8sornek
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
EOF
```{{execute}}

Aşağıdaki komutla servisler listeyin;

`kubectl get services`{{execute}}

Gelen listede **uygulama-servisi-np** için atanan **NodePort** değeri tespit edin. Aşağıdaki komut kullanılarak NodePort değerini **nodePort** değişkenine atayın.

`nodePort=$(kubectl get services uygulama-servisi-np -o=jsonpath='{.spec.ports[0].nodePort}')`{{execute}}

curl ile worker node’lardan birisine tespit edilen nodePort portundan get talebi gönderin. Örneğin;

`curl 192.168.177.9:$nodePort`

Dışarıdan, servisin işaret ettiği pod’larda hizmet veren uygulamanın yanıt alabildiğinizi teyit edin.
