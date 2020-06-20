# Konteyner Imajı Optimizasyonu

Oluşturduğunuz Konteyner imajının katmanlarını aşağıdaki komutla inceleyin;

`docker history --no-trunc enterprisecoding-webserver`{{execute}}

Çıktıda görüldüğü gibi çalıştırılan her bir talimat için Docker tarafından birer katman oluşturulmuş durumda. Ortak kullanım, önbelleğe alma v.b. yönlerden incelendiğinde bu durumun optimize edilmesi önemli. Bu amaçla talimatları birleştirebilirsiniz.

Dockerfile içeriğini aşağıdaki şekilde güncelleyin;

<pre class="file" data-filename="dockerfile" data-target="replace">FROM alpine:3.11

LABEL maintainer="Enterprisecoding " \
      mimari="amd64/x86_64"

RUN apk update && \
    apk add nginx && \
    echo "Enterprisecoding Nginx docker imajindan merhaba!" > /var/www/index.html

ADD nginx.conf /etc/nginx/nginx.conf
ADD nginx.default /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx"]

EXPOSE 80
</pre>

Ardından Konteyner imajını yeniden oluşturun;

`docker build -t enterprisecoding-webserver:latest .`{{execute}}

Konteyner imajının oluşması ardından imaj katmanlarını yeniden inceleyin;

`docker history --no-trunc enterprisecoding-webserver`{{execute}}