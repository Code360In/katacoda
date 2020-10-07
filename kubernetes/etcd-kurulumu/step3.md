# Temel İşlemler

Etcd kurulum ardından etcdctl yardımıyla Etcd ile etkileşimde bulunabilirsiniz. Etcdctl’i kullanmadan önce kullanmak istediğiniz etcd api sürümünü ortam değişeni olarak tanımlayın;

`export ETCDCTL_API=3`{{execute}}

## Değer Atama ve Okuma

Aşağıdaki komutla ilk anahtar-değer ikilisini etcd’ye ekleyin;


`etcdctl put firma Enterprisecoding`{{execute}}

Daha sonra aşağıdaki komutu çalıştırarak etcd’ye kaydettiğiniz firma anahtarına ait değeri sorgulayın;

`etcdctl get firma`{{execute}}

Aşağıdaki komutla sorgunuza yanıtı json formatında alın;

`etcdctl --write-out="json" get firma`{{execute}}

## Ön Ek ile Değerleri Okuma

Aşağıdaki komutlar ile 3 anahtar-değer ikilisini etcd’ye kaydedin;

`etcdctl put uygulama1 "Web Uygulaması"`{{execute}}

`etcdctl put uygulama2 "Masaüstü Uygulaması"`{{execute}}

`etcdctl put uygulama3 "Mobil Uygulama"`{{execute}}

Aşağıdaki komutu çalıştırarak girdiğiniz bu üç değeri tek kalemde okuyun;

`etcdctl get uygulama --prefix`{{execute}}

**Continue** butonuna basarak hata düzeltmesi adımına geçebilirsiniz.
