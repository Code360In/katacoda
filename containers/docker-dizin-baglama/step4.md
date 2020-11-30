# Konteyner Detay Bilgileri

Bir önceki adımda başlattığınız konteyner'a ait ip adresi, ortam değişkenleri v.b. bilgilerini görmek için aşağıdaki komutu çalıştırın;

`docker inspect redis-konteyner`{{execute}}

konteyner ip adresini öğrenmek için aşağıdaki komutu kullanabilirsiniz;

`docker inspect redis-konteyner | grep IPAddress`{{execute}}

**Inspect** komutu istenilen bilgiye kolaylıkla ulaşılabilmesi adına **format** parametresine sahiptir.  [Go şablonu](https://golang.org/pkg/text/template/) verebileceğiniz format parametresi sayesinde daha detaylı bilgi ayıklaması yapabilirsiniz. Örneğin aşağıdaki komutu çalıştırın;

`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' redis-konteyner`{{execute}}

bu komut doğrudan istenilen ip adresi bilgisini verecektir.

Konteyner'ın çalışma sırasında konsola yazdığı mesajları görebilmek için aşağıdaki komutu çalıştırın;

`docker logs redis-konteyner`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
