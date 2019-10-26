# Imaj Katmanları

Önceki adımda Docker imajlarının katmanlardan oluştuğundan ve yerele çekilen imajları oluşturan katmanların indirilmeleri ardından ayıklandıklarını görmüştük. Aşağıdaki komut ile katmanların bulunduğu dizin içeriğini listeleyin;

`ls /var/lib/docker/overlay`{{execute}}

**Not:** Kurulumumuz **overlay** depolama sürücüsü kullandığı için katmanlar __overlay__ dizini altında bulunmaktadır. Farklı depolama sürücüsü kullanımı durumunda bu katmanlar farklı dizinlerde yer alacaktır.

Aşağıdaki komutla __/var/lib/docker/overlay__ dizini altında yer alan tüm root file sisteminde yer alan dosyaları listeleyebilirsiniz;

`ls /var/lib/docker/overlay/*/root/`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
