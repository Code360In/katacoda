# ADD

`ADD` talimatı ile Konteyner imajı içerisine harici bir dosyayı ekleyebilirsiniz. 

ADD talimatı aşağıdaki yapıya sahiptir;

`ADD <KAYNAK_DOSYA> <HEDEF_DOSYA>`

Senaryoda kurulumu yapılan nginx'in çalışması için `nginx.conf`{{open}} ve `nginx.default`{{open}} dosyalarının ilgili dizinlere eklenmesi gerekmekte. Her iki dosyada yerelde hazır şekilde bulunmaktadır. 

Bu dosyaları eklemek için Dockerfile'a aşağıdaki iki girdiyi ekleyin;

<pre class="file" data-filename="dockerfile" data-target="replace">ADD nginx.conf /etc/nginx/nginx.conf
ADD nginx.default /etc/nginx/conf.d/default.conf
</pre>

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.