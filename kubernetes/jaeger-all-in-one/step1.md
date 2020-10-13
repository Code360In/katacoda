# Jaeger, Hepsi Bir Arada

Jaeger Hepsi bir arada konteyner imajı, hızlı yerel test için tasarlanmış bir imajdır. İçerisinde Jaeger kullanıcı arayüzünü, toplayıcıyı (collector), sorgu (query) ve ajan (agent) bileşenleri yer almaktadır.

## Konteyner Imajı Olarak Başlatma

Aşağıdaki komut çalıştırılarak Jaeger all-in-one imajını kullanarak bir konteyner başlatın;

```bash
docker run -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 14250:14250 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.20
```{{execute}}

bir kaç dakika içerisinde Jaeger arayüzü **16686** portu üzerinden yayına hazır olacaktır.

Sağ taraftaki tablardan **Jaeger UI** tabına geçiş yaparak arayüze ulaşabilirsiniz.