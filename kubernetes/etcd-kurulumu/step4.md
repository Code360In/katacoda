# Değer Silme

Önceki adımlarda oluşturduğunuz firma anahtarını aşağıdaki komutla siliniz;

`etcdctl del firma`{{execute}}

Aşağıdaki komutu çalıştırarak bir önceki adımda oluşturduğunuz 3 uygulama anahtarını tek kalemde silin;

`etcdctl del uygulama --prefix`{{execute}}

## İzleme

Etcd bir akış üzerinden belirli bir anahtar ya da anahtar grubu (prefix) üzerindeki değişiklikleri takip etmemize izin verir. Aşağıdaki komutu çalıştırarak firma anahtarı için bir izleme başlatın;

`etcdctl watch firma`{{execute}}

İkinci bir terminal açarak daha önce yaptığınız gibi firma anahtarı için değer ataması yapın;

`export ETCDCTL_API=3`{{execute}}

`etcdctl put firma Enterprisecoding`{{execute}}

İlk terminalde **PUT** işlemine dair kaydın düştüğünü teyit edin.
Tekrar ikinci terminale geçiş yaparak bu defa firma anahtarını silin;

`etcdctl del firma`{{execute}}

İlk terminaldeki komut <kbd>Ctrl</kbd>+<kbd>C</kbd> tuş kombinasyonu ile sonlandırın. 

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Aşağıdaki komutu çalıştırarak bu defa uygulama anahtar grubu (prefix) için izleme yapın;

`etcdctl watch uygulama --prefix`{{execute}}

İkinci terminalde daha önce de yaptığınız gibi uygulama1, uygulama2 ve uygulama3 için değer ekleyin;

`etcdctl put uygulama1 "Web Uygulaması"`{{execute}}

`etcdctl put uygulama2 "Masaüstü Uygulaması"`{{execute}}

`etcdctl put uygulama3 "Mobil Uygulama"`{{execute}}

İlk terminalde **PUT** kayıtlarının oluştuğunu teyit edin.

İkinci terminale geçiş yaparak aşağıdaki komutla uygulama ile başlayan anahtarları silin;

`etcdctl del uygulama --prefix`{{execute}}

İlk terminalde **DEL** kayıtlarının oluştuğunu teyit edin.
