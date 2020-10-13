# Örnek Uygulama Kurulumu

Jaeger Hepsi bir arada konteyner'ında ilerlemek adına bu adımda örnek bir uygulama başlatacaksınız. HotROD (Rides on Demand) adındaki bu örnek uygulama içerisinde pek çok mikroservis barındırmakta. Uygulama metrikleri OpenTracing API üzerinde yayınlanmakta.

## Demo Uygulama kurulumu

HotROD (Rides on Demand) adındaki bu örnek uygulamayı aşağıdaki komut çalıştırılarak bir konteyner olarak başlatın;

```bash
docker run --rm -it \
  --link jaeger \
  -p8080-8083:8080-8083 \
  -e JAEGER_AGENT_HOST="jaeger" \
  jaegertracing/example-hotrod:1.20 \
  all
```{{execute}}

bir kaç dakika içerisinde uygulama arayüzü **8080** portu üzerinden yayına hazır olacaktır.

Sağ taraftaki tablardan **HotRod UI** tabına geçiş yaparak arayüze ulaşabilirsiniz.