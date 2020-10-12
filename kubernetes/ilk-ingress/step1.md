# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

Aşağıdaki komutla Nginx Ingress Controller'ın hazır olduğunu teyi edin;

```bash
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller
```{{execute}}

## Ingress

Ingress Controller kurulumu ardından ilk ingress talebinizi oluşturabilirsiniz. Bunun için öncelikle aşağıdaki komutu çalıştırarak bir deployment ile örnek uygulamanızı 3 instance olarak başlatın;

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

Aşağıdaki komutla StatefulSet yaygınlaşma durumunu inceleyin;

`kubectl rollout status statefulset ornek-uygulama-v1`{{execute}}

Aşağıdaki komutla deployment’a ait podları işaret eden **ClusterIP** türünde bir servis oluşturun;

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

Bu hazırlık adımları ardından aşağıda komutla ilk ingress tanımınızı yapın;

```bash
cat <<EOF | kubectl create -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ilk-ingress
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: uygulama-servisi-v1
            port:
              number: 80
EOF
```{{execute}}

Aşağıdaki komutla Ingress http portunu **HTTP_PORT** değişkeninde saklayın;

`HTTP_PORT=$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.spec.ports[?(@.name=="http")].nodePort}')`{{execute}}

Aşağıdaki komutla ingress’leri listeleyin;

`kubectl get ingress`{{execute}}

Burada belirtilen adresin az önce öğrendiğiniz $HTTP_PORT portuna bir http talebi gönderin. Örneğin;

`curl 192.168.177.10:$HTTP_PORT/surum`

Uygulamanın sunduğu sunucu adı ve sürüme dair kısa bilgi karşınıza gelecek. Bu komutu arka arkaya birkaç defa çalıştırarak round-robin mantığı ile deployment’a ait iki pod’dan yanıt geldiğini teyit edin.

Bir tarayıcıda aşağıdaki komutun çıktısındaki url’yi açarak web sayfasının geldiğini teyit edin. 

`echo "http://192.168.177.10:$HTTP_PORT"`{{execute}}