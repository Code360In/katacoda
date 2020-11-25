# Çakışan dosyalar

Aşağıdaki komut yardımıyla **/tmp/overlay-dizini/middle** dizininde "middle'dan merhaba" içeriğiyle **ornek.config** dosyasını oluşturun;

`echo "middle'dan merhaba" > /tmp/overlay-dizini/middle/ornek.config`{{execute}}

Aşağıdaki komut yardımıyla **/tmp/overlay-dizini/overlay** dizininde **ornek.config** dosyasının yer aldığını teyit edin;

`ls -al /tmp/overlay-dizini/overlay`{{execute}}

**ornek.config** dosyasının içeriğini görüntüleyin;

`cat /tmp/overlay-dizini/overlay`{{execute}}

Aşağıdaki komut yardımıyla **ornek.config** dosyasının içeriğini değiştirin;

`echo "overlay'den merhaba" > /tmp/overlay-dizini/overlay/ornek.config`{{execute}}

**ornek.config** dosyasının içeriğini yeniden görüntüleyin;

`cat /tmp/overlay-dizini/overlay/ornek.config`{{execute}}

**/tmp/overlay-dizini/middle** dizinindeki **ornek.config** dosyasının içeriğini yeniden görüntüleyin;

`cat /tmp/overlay-dizini/middle/ornek.config`{{execute}}