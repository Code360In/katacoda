# Docker Imajları

Docker bize imajlar yardımıyla paketlenebilir ve taşınabilir ortamlar oluşturma imkanı sunmaktadır. Hatırlarsanız Container kursumuzun önceki adımlarında chroot ile bir process için kök dizini değiştirerek bir jail oluşturmuştuk. İlerleyen adımlarda ise bunu daha güvenli versiyonlarını deneyimlemiştik. Docker imajlarının temelini oluşturan bu bileşenlerin Docker altında nasıl kullanıldığını takip eden adımlarda göreceksiniz.

## Imaj yapısı

Bir Docker imajı bir ya da birden fazla katmandan oluşmaktadır. Her bir katman sıkıştırılmış bir dosya olarak tutulmakta ve docker tarafından indirilerek işletim sistemide ayıklanmaktadır. Bu katmanlar üstü üste konularak tek bir dosya sistemi olarak container'lara salt okunur şekilde sunulmaktadır.

Aşağıdaki komutla alpine linux 3.10.3 imajını yerele çekiniz;

`docker pull alpine:3.10.3`{{execute}}

Bu komut Docker Hub'ta bulunan Alpine linux imajının 3.10.3 tag'ine ait katmanları yerele indirecektir. Alpine imajı tek bir katmandan oluştuğu için komut çıktısında sadece bunun indirildiği görülecektir.

Aşağıdaki komutla indirdiğimiz imajın geçmişini görüntüleyin;

`docker history alpine:3.10.3`

Bu komut bize alpine 3.10.3 imajının **965ea09ff2eb** id'li bir katmandan oluştuğunu göstecektir.

Aşağıdaki komut ile nginx imajını yerele çekiniz;

`docker pull nginx:1.17.5-alpine`{{execute}}

Bu komut 2 katmandan oluşan bir nginx imajını indirecek ve yerele ayıklayacaktır. Komut çıktısına dikkat edilecek olursa **89d9c30c1d48** katmanı yerelde bulunduğu için tekrar çekilmedi.

Katmanların salt okunur kullanımı ve birden fazla imaj tarafından ortak kullanımı nedeniyle imajların disk üzerinde kapladığı alan azaltılmıştır.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
