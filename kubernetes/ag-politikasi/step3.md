# Sadece Aynı Namespace’e Erişim Verme

**Test** namespace’ine diğer namespace’lerden erişime izin vermemek için aşağıdaki komutla bir ağ politikası oluşturun;

````bash
cat <<EOF | kubectl create -f -
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  namespace: test
  name: sadece-test-namespace
spec:
  podSelector:
    matchLabels:
  ingress:
  - from:
    - podSelector: {}
EOF
```{{execute}}

Aşağıdaki komutla yeniden **dev** namespace’indeki bir curl pod’u ayağa kaldırarak içerisinde bir sh oturumu başlatın;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -n dev -- sh`{{execute}}

Başlatılan sh oturumunda aşağıdaki komutla uygulamaya talep gönderin;

`curl uygulama-servisi.test/surum`{{execute}}

Talebininiz uzun süre bekleme durumunda kalarak yanıt alınamadığını teyit edin. Ctrl + c tuş kombinasyonu ile talebi sonlandırın. exit komutu ile sh oturumunu sonlandırarak terminale geri dönün;

`exit`

Aşağıdaki komutla tekrar **test** namespace’indeki bir curl pod’u ayağa kaldırarak içerisinde bir sh oturumu başlatın;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -n test -- sh`{{execute}}

Başlatılan sh oturumunda aşağıdaki komutla uygulamaya talep gönderin;

`curl uygulama-servisi/surum`{{execute}}

Talebininiz başarılı şekilde tanımlandığını teyit edin. exit komutu ile sh oturumunu sonlandırarak terminale geri dönün;

`exit`

Aşağıdaki komutla network politikası silinir;

`kubectl delete NetworkPolicy sadece-test-namespace -n test`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.