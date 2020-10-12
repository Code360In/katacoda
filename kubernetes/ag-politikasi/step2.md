# Varsayılan Politika

Varsayılanda namespace içi ve dışı bir erişim kısıtı politikası tanımlanmamıştır. 
Aşağıdaki komutla test namespace’indeki bir curl pod’u ayağa kaldırarak içerisinde bir sh oturumu başlatın;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -n test -- sh`{{execute}}

Başlatılan sh oturumunda aşağıdaki komutla uygulamaya talep gönderin;

`curl uygulama-servisi/surum`{{execute}}

Talebininiz başarılı şekilde tanımlandığını teyit edin. exit komutu ile sh oturumunu sonlandırarak terminale geri dönün;

`exit`

Aşağıdaki komutla **dev** namespace’indeki bir curl pod’u ayağa kaldırarak içerisinde bir sh oturumu başlatın;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -n dev -- sh`{{execute}}

Başlatılan sh oturumunda aşağıdaki komutla uygulamaya talep gönderin;

`curl uygulama-servisi.test/surum`{{execute}}

Talebininiz başarılı şekilde tanımlandığını teyit edin. exit komutu ile sh oturumunu sonlandırarak terminale geri dönün;

`exit`

Bu adımlarda varsayılanda aynı ve farklı namespace’ler üzerinden pod’lara kısıtlama olmadan erişebildiğinizi gözlemlediniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.