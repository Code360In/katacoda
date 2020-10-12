# DNS Çözümlemesi

Bu lab’da Kubernetes DNS hizmeti kullanarak servislere DNS isimleri ile nasıl ulaşabileceğimizi, DNS çözümlemesinin nasıl olduğunu ve DNS problemlerini nasıl debug edebileceğinizi göreceksiniz. 

Aşağıdaki komutla servise curl ile talep gönderecek basit bir pod oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod 
metadata: 
  name: http-server-istemci
spec:
  containers:
  - name: curl
    image: appropriate/curl
    command: ["/bin/sh"]
    args: ["-c","curl http-server-service:4000 "]
EOF
```{{execute}}

Pod loglarını inceleyerek curl işleminin sonucunu takip edin;

`kkubectl logs http-server-istemci`{{execute}}

Bu komut sonunda gördüğünüz çıktı servis için DNS çözümlemesi yapıldığını göstermektedir.

Kubernetes DNS hizmeti http-server-service adındaki servisimizin adresini çözümleyerek ip’sini dönmüş ve curl ilgili ip adresine talebi gerçekleştirmiştir.

## DNS İncelemesi

Kubernetes DNS kayıtlarını incelemek için aşağıdaki komutla busybox konteyner’ı bulunan bir pod içerisinde Shell oturumu başlatın;

`kubectl run -i --tty dnsutils --image=docker.io/enterprisecodingcom/dnsutils-- sh`{{execute}}

Açılan shell oturumunda aşağıdaki komutla **http-server-service.default.svc** adresi sorgulanır;

`nslookup http-server-service.default.svc`{{execute}}

Ek olarak aşağıdaki kayıtlar için sorgulama yapılır;
* http-server-service.default
* http-server-service

Gelen yanıtta http-server-service için oluşturulan cluster ip’si görülecektir. Aşağıdaki komutla pod’dan çıkış yapılır;

`exit`

Görüntülenen ip adresinin incelenmesi için aşağıdaki komutla servis bilgileri alınır;

`kubectl describe svc http-server-service`{{execute}}

Burada verilen IP bilgisinin de aynı olduğu teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.