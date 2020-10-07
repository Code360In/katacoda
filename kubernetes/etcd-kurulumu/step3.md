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

bir süre bekledikten sonra aşağıdaki hata loglarının oluştuğunu göreceksiniz;

`unable to fully collect metrics:[unable to fully scrape metrics from source kubelet_summary:node01: unable to fetch metrics from Kubelet node01 (XXX.XXX.XXX.XXX): Get https://XXX.XXX.XXX.XXX:10250/stats/summary?only_cpu_and_memory=true: x509: cannot validate certificate for XXX.XXX.XXX.XXX because it doesn't contain any IP SANs, unable to fully scrape metrics from source kubelet_summary:master: unable to fetch metrics from Kubelet master (YYY.YYY.YYY.YYY): Get https://YYY.YYY.YYY.YYY:10250/stats/summary?only_cpu_and_memory=true: x509: cannot validate certificate for YYY.YYY.YYY.YYY because it doesn't contain any IP SANs]`

Hata mesajını gözlemledikten sonra <kbd>Ctrl</kbd>+<kbd>C</kbd> ile konsola geri dönebilirsiniz. Alternatif olarak aşağıdaki link yardımıyla konsola dönebilirsiniz;

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Hata mesajına dikkat edildiğinde pod'un dns sorgulaması sonucunda `master` ve `node01` sunucuları için isim çözümlemesi yapabilmiş. Öte yandan tespit edilen Ip adreslerine talep yapıldığında sertifika doğrulama hatası alındığı görülmektedir.

**Continue** butonuna basarak hata düzeltmesi adımına geçebilirsiniz.
