# Ingress Tanımı Oluşturma

Önceki adımdaki hazırlık adımları ardından aşağıda komutla ilk ingress tanımınızı güncelleyin;

```bash
cat <<EOF | kubectl replace -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ilk-ingress
spec:
  rules:
  - host: "v1.k8s.localhost"
    http:
      paths:
      - pathType: Prefix
        path: /
        backend:
          service:
            name: uygulama-servisi-v1
            port:
              number: 80
  - host: "v2.k8s.localhost"
    http:
      paths:
      - pathType: Prefix
        path: /
        backend:
          service:
            name: uygulama-servisi-v2
            port:
              number: 80
EOF
```{{execute}}

Önceki bölümde not aldığınız ingress adresini kullanarak aşağıda örneklendiği şekilde **v1.k8s.localhost** host adıyla talep gönderin;

`curl --header 'Host: v1.k8s.localhost' 127.0.0.1:$HTTP_PORT/surum`{{execute}}

Benzer şekilde aşağıda örneklendiği şekilde v2.k8s.localhost host adıyla talep gönderin;

`curl --header 'Host: v2.k8s.localhost' 127.0.0.1:$HTTP_PORT/surum`{{execute}}

Nginx Ingress Controller’ın host adından yola çıkarak gelen http taleplerini farklı pod’lara yönlendirdiğini teyit edin.