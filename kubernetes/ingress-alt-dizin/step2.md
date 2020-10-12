# Ingress Tanımı Oluşturma

Önceki adımdaki hazırlık adımları ardından aşağıda komutla ilk ingress tanımınızı güncelleyin;

```bash
cat <<EOF | kubectl create -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ilk-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /\$2
spec:
  rules:
  - http:
      paths:
      - pathType: Prefix
        path: /v1(/|$)(.*)
        backend:
          serviceName: uygulama-servisi-v1
          servicePort: 80
  - http:
      paths:
      - pathType: Prefix
        path: /v2(/|$)(.*)
        backend:
          serviceName: uygulama-servisi-v2
          servicePort: 80
EOF
```{{execute}}

Önceki bölümde not aldığınız ingress portunu kullanarak aşağıda örneklendiği şekilde **/v1** alt dizinine talep gönderin;

`curl http://127.0.0.1:$HTTP_PORT/v1/surum`{{execute}}

Benzer şekilde aşağıda örneklendiği şekilde **/v2**  host adıyla talep gönderin;

`curl http://127.0.0.1:$HTTP_PORT/v2/surum`{{execute}}

Son iki komutu arka arkaya birkaç defa çalıştırarak round-robin mantığı ile deployment’a ait tüm pod’lardan yanıt geldiğini teyit edin.