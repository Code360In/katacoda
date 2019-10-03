# Kurulum Testi

Bir önceki adımda ardından Docker'ımız kurduğumuz Docker Registry'den imaj çekmeye hazır hale geldi.

Kurulumu test etmek için öncelikle Docker Hub üzerinden örnek bir imajı yerele indirin;

`docker pull hello-world`{{execute HOST1}}

İndirdiğimiz __hello-world__ imajını kurulan Docker Registery'si için tag'leyin;

`docker tag hello-world $NODE_IP:$NODE_PORT/hello-world`{{execute HOST1}}

Son olarak taglediğiniz imaj’ı kurulan yeni registry’ye gönderiniz;

`docker push $NODE_IP:$NODE_PORT/hello-world`{{execute HOST1}}

İlk adımda sorguladığımız kataloğu aşağıdaki komutla yeniden sorguladığınızda Docker imajının kataloga eklendiğini göreceksiniz;

`curl -XGET http://$NODE_IP:$NODE_PORT/v2/_catalog`{{execute HOST1}}

**Continue** butonuna basarak kullanıcı yetkilendirmesi adımına geçebilirsiniz.
