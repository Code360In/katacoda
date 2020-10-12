# Hatalı Pod Oluşturma

Aşağıdaki komutu çalıştırarak deployment tanımını güncelleyin;

```bash
cat <<EOF | kubectl replace -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-uygulama-v1
  labels:
    app: k8sornek
    version: v1
spec:
  revisionHistoryLimit: 10
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
        image: enterprisecodingcom/k8sornek:olmayan
        ports:
        - containerPort: 80
EOF
```{{execute}}

Bu tanım olmayan bir tag'e atıfta bulunmaktadır.

Aşağıdaki komutla v1 uygulaması pod’larını kontrol edin;

`kubectl get pods -l app=k8sornek -l version=v1`{{execute}}

Yeni bir pod oluşturulduğunu ve durumunun **ImagePullBackOff** olduğunu teyit edin.

Oluşturulan endpoint tanımını inceleyin;

`kubectl describe endpoints uygulama-servisi-v1`{{execute}}

Bir NotReadyAddresses kaydı olduğunu teyit edin.

Aşağıda örneklendiği şekilde /v1 alt dizinine talep gönderin;

`curl http://127.0.0.1:$HTTP_PORT/v1/surum`{{execute}}

Bu komutu birden fazla defa göndererek yanıtları inceleyin. Tüm taleplerin karşılandığını teyit edin.