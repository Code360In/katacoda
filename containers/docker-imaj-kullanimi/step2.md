# Imaj Katmanları

Önceki adımda Docker imajlarının katmanlardan oluştuğundan ve yerele çekilen imajları oluşturan katmanların indirilmeleri ardından ayıklandıklarını görmüştük. Aşağıdaki komut ile katmanların bulunduğu dizin içeriğini listeleyin;

`ls /var/lib/docker/overlay`{{execute}}

**Not:** Kurulumumuz **overlay** depolama sürücüsü kullandığı için katmanlar __overlay__ dizini altında bulunmaktadır. Farklı depolama sürücüsü kullanımı durumunda bu katmanlar farklı dizinlerde yer alacaktır.

Aşağıdaki komutla **05069f80b4ba1806de66d18a32873996e2b29f03a6216e0b64fc287e5a066b9e** dizini altında yer alan root file sisteminde yer alan dosyaları listeleyebilirsiniz;

`ls /var/lib/docker/overlay/05069f80b4ba1806de66d18a32873996e2b29f03a6216e0b64fc287e5a066b9e/root/`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
