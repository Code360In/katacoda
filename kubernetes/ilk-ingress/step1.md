# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

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

`kubectl rollout status deployment ornek-uygulama-v1`{{execute}}

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
apiVersion: extensions/v1beta1
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
          serviceName: uygulama-servisi-v1
          servicePort: 80
EOF
```{{execute}}

Aşağıdaki komutla Ingress http portunu **HTTP_PORT** değişkeninde saklayın;

`HTTP_PORT=$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.spec.ports[?(@.name=="http")].nodePort}')`{{execute}}

Aşağıdaki komutla ingress’leri listeleyin;

`kubectl get ingress`{{execute}}

Burada belirtilen adresin az önce öğrendiğiniz $HTTP_PORT portuna bir http talebi gönderin;

`curl 127.0.0.1$HTTP_PORT/surum`{{execute}}

Uygulamanın sunduğu sunucu adı ve sürüme dair kısa bilgi karşınıza gelecek. Bu komutu arka arkaya birkaç defa çalıştırarak round-robin mantığı ile deployment’a ait iki pod’dan yanıt geldiğini teyit edin.

Sağ bölümde yer alan **Ingress** segmesini yenileyerek uygulamanın açıldığını teyit edin