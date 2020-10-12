# Dışarı Çıkan Trafiği Kısıtlama

Bu bölümde **dev** namespace’inde çalışan podların DNS sorgusu dışında pod network’ü dışına ulaşamamasını sağlayacaksınız.

Mevcut durumu görebilmek adına, aşağıdaki komutla yeniden **dev** namespace’indeki bir curl pod’u ayağa kaldırarak içerisinde bir sh oturumu başlatın;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -n dev -- sh`{{execute}}

Başlatılan sh oturumunda aşağıdaki komutla uygulamaya talep gönderin;

`curl uygulama-servisi.test/surum`{{execute}}

Talebin yanıtlandığını teyit edin. Aşağıdaki komutla bu defa google.com adresine talep göndermeyi deneyin;

`curl google.com`{{execute}}

Talebin yanıtlandığını teyit edin.

**Dev** namespace’ine dışarı çıkan trafiğe izin vermemek için aşağıdaki komutla bir ağ politikası oluşturun;

````bash
cat <<EOF | kubectl create -f -
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  namespace: dev
  name: sadece-ic-trafik
spec:
  podSelector:
    matchLabels:
  policyTypes:
  - Egress
  egress:
  - to:
    - ipBlock:
        cidr: 10.244.0.0/16
  - ports:
    - port: 53
      protocol: UDP
    - port: 53
      protocol: TCP
EOF
```{{execute}}

Aşağıdaki komutla yeniden **dev** namespace’indeki bir curl pod’u ayağa kaldırarak içerisinde bir sh oturumu başlatın;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -n dev -- sh`{{execute}}

Başlatılan sh oturumunda aşağıdaki komutla uygulamaya talep gönderin;

`curl uygulama-servisi.test/surum`{{execute}}

Talebin yanıtlandığını teyit edin. Aşağıdaki komutla bu defa google.com adresine talep göndermeyi deneyin;

`curl google.com`{{execute}}

Talebininiz uzun süre bekleme durumunda kalarak yanıt alınamadığını teyit edin. Ctrl + c tuş kombinasyonu ile talebi sonlandırın. exit komutu ile sh oturumunu sonlandırarak terminale geri dönün;

`exitm`

Aşağıdaki komutla Network politikasını silin;

`kubectl delete networkpolicies sadece-ic-trafik -n dev`{{execute}}
