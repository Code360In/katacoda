# OverlayFS

OverlayFS, Linux için yazılmış bir birleşim bağlama (__union mount__) dosya sistemidir. Birden çok bağlama noktasını tek bir yerde birleştirerek, tüm kaynaklardan dosyaları ve alt dizinleri içeren tek bir dizin yapısı görünümü sağlar. Bu senaryoda 4 farklı dizin overlayfs yardımıyla tek bir dosya sistemi olarak görüntülenecektir. Aşağıdaki adımları takip ederek overlayfs'i deneyimleyebilirsiniz.

## Hazırlık

Aşağıdaki komut yardımıyla /tmp dizini altında öncelikle **overlay-dizini** dizinini ardından da **middle,upper,workdir,overlay** dizinlerini oluşturun;

`mkdir -p /tmp/overlay-dizini/{middle,upper,workdir,overlay}`{{execute}}

Bu dizinler birbirinden bağımsız bağlama noktalarını temsil etmektedir. Bu senaryoda **/root** ve **/tmp/overlay-dizini/middle** dizinleri alt dizinleri, **/tmp/overlay-dizini/upper** üst dizini, **/tmp/overlay-dizini/workdir** çalışma dizinini temsil etmektedir. Birleştirilmiş görünüm **/tmp/overlay-dizini/overlay** dizinine bağlanacaktır.

## Overlay Bağlaması

Aşağıdaki komutu çalıştırarak bir önceki adımda oluşturduğunuz dizinleri **/tmp/overlay-dizini/overlay** birleştirilmiş olarak overlay dizinine bağlayın;

`mount -t overlay -o lowerdir=/root:/tmp/overlay-dizini/middle,upperdir=/tmp/overlay-dizini/upper,workdir=/tmp/overlay-dizini/workdir none /tmp/overlay-dizini/overlay`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
