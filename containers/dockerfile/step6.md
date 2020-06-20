# ENTRYPOINT

`ENTRYPOINT` talimatı ile Konteyner'ın bir çalıştırılabilir dosyaya benzer şekilde hareket etmesini sağlayabilirsiniz. Bu ifadeyi biraz daha açarsak, bir konteyner başladığında hangi işlemin başlayacağını belirtebilirsiniz yani konteyner'ın giriş noktasını belirtebilirsiniz. 

Konteyner'ımızı giriş noktasının nginx olması için aşağıdaki talimatı dockerfile dosyasına ekleyiniz;

<pre class="file" data-filename="dockerfile" data-target="append">ENTRYPOINT ["nginx"]
</pre>

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.