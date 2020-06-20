# RUN

`RUN` talimatı konteyner imaj oluşturulması sırasında belirlediğiniz komutun çalıştırılmasını sağlar. Bu sayede ata imajdan türettiğiniz yeni konteyner imajınızı özelleştirebilirsiniz. Dockerfile içerisinde yer alan her bir RUN talimatı yeni bir imaj katmanı oluşturacağından dikkatli kullanmanızda fayda olacaktır.

Konteyner oluştururken güncel paketleri kullanmak istediğimiz için öncelikle `apk update` komutunun çalışmasını istediğimiz için aşağıdaki satırı dockerfile'a ekleyin;


<pre class="file" data-filename="dockerfile" data-target="append">RUN apk update
</pre>

Güncelleme ardından nginx paketi kurulum talimatını ekleyin;

<pre class="file" data-filename="dockerfile" data-target="append">RUN apk add nginx
</pre>

Sunmak için örnek bir index dosyası oluşturun;

<pre class="file" data-filename="dockerfile" data-target="append">RUN echo "Enterprisecoding Nginx docker imajindan merhaba!" > /usr/share/nginx/html/index.html
</pre>

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.