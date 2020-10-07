# Yatayda Büyüme

Oluşturduğumuz uygulamanın yatayda otomatik büyümesini gözlemleyebilmek için bir yük oluşturmalıyız. Bunun için öncelikle sağ taraftaki bölümde ikinci bir termimal segmesi açarak aşağıdaki komutla bir busybox pod’u oluşturarak içerisinde shell başlatın;

`kubectl run -it --rm load-generator --image=busybox /bin/sh`{{execute}}

Shell oturumunda sonsuz bir döngü içerisinde talep gönderin;

`while true; do wget -q -O- http://php-apache; done`{{execute}}

İlk terminale geri dönerek aşağıdaki komutla hpa durumunu izleyin;

`watch kubectl get hpa`{{execute}}

Bir süre sonra raporlanan CPU kullanımının arttığını teyit edin.

<kbd>Ctrl</kbd>+<kbd>C</kbd> tuş kombinasyonu ile komutu sonlandırın. Alternatif olarak aşağıdaki link yardımıyla konsola dönebilirsiniz;

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Aşağıdaki komutla deployment durumunu kontrol edin;

`kubectl get deployment php-apache`{{execute}}

İkinci terminale geçiş yaparak <kbd>Ctrl</kbd>+<kbd>C</kbd> tuş kombinasyonu ile sonsuz döngüyü sonlandırın. Alternatif olarak aşağıdaki link yardımıyla konsola dönebilirsiniz;

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Tekrar ilk terminale geçiş yapın ver hpa durumunu izleyin;

`watch kubectl get hpa`{{execute}}

CPU kullanımının düştüğünü ve yaklaşık 10 dakika sonrasında da replica sayısının azaldığını teyit edin. <kbd>Ctrl</kbd>+<kbd>C</kbd> tuş kombinasyonu ile komutu sonlandırın. Alternatif olarak aşağıdaki link yardımıyla konsola dönebilirsiniz;

`echo "Konsola geri dönüldü"`{{execute interrupt}}

`kubectl get deployment php-apache`{{execute}}
