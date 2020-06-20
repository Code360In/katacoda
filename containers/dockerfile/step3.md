# LABEL

`LABEL` talimatı konteyner imajına meta veril eklemenizi sağlar. Anahtar ve değer ikilisinden oluşan **LABEL** talimatı sayesinde konteyner imaj dosyayla birlikte taşınabilecek meta veri girdileri oluşturursunuz.

Aşağıdaki ifadeyi dockerfile'e ekleyerek geliştirici bilgisini ekleyin;

<pre class="file" data-filename="dockerfile" data-target="append">LABEL maintainer="Enterprisecoding <info@enterprisecoding.com>"
</pre>

Dockerfile imajı paketine eklenmesini istediğiniz tüm meta verileri benzer şekilde ekleyebilirsiniz. Örneğin;

<pre class="file" data-filename="dockerfile" data-target="append">LABEL mimari="amd64/x86_64" \
</pre>

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
