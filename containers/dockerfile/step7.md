# EXPOSE

`EXPOSE` talimatı ile Docker'a konteyner'ın çalışma zamanında belirtilen port'u yine belirtilen protokol üzerinde dinlediğini belirtmektedir. Bu talimat doğrudan bir port'u dış dünyaya açmaz, sadece konteyner'ın bu port üzerinden dinleme yapabileceğini ifade eden bir çeşit dokümantasyon görevi görür.

EXPOSE talimatı aşağıdaki yapıya sahiptir;

`EXPOSE <PORT>/<PROTOKOL>`

Protokol parametresi seçimlidir ve varsayılan olarak tcp değerine sahiptir. Dolayısıyla tcp portu açıyorsanız aşağıdaki şekilde de kullanabilirsiniz;

`EXPOSE <PORT>`

Senaryoda kurulumu yapılan nginx'in 80/TCP portundan hizmet vermesi beklenmektedir.. 

80/TCP portunun açılabileceğini belirtmek için Dockerfile'a aşağıdaki girdiyi ekleyin;

<pre class="file" data-filename="dockerfile" data-target="replace">EXPOSE 80
</pre>

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.