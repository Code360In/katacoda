# RUN

`RUN` talimatı konteyner imaj oluşturulması sırasında belirlediğiniz komutun çalıştırılmasını sağlar. Bu sayede ata imajdan türettiğiniz yeni konteyner imajınızı özelleştirebilirsiniz. Dockerfile içerisinde yer alan her bir RUN talimatı yeni bir imaj katmanı oluşturacağından dikkatli kullanmanızda fayda olacaktır.

Konteyner imajında yer alan __/usr/share/nginx/html/index.html__ dosyasının içeriğini değiştirmek için aşağıdaki talimatı dockerfile dosyasına ekleyin;


<pre class="file" data-filename="dockerfile" data-target="append">RUN echo "Enterprisecoding Nginx docker imajindan merhaba!" > /usr/share/nginx/html/index.html
</pre>