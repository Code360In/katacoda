# Dosya Silme

Aşağıdaki komut yardımıyla root dizininde "örnek dosya" içeriğiyle **ornek.root.txt** dosyasını oluşturun;

`echo "örnek dosya" > /root/ornek.root.txt`{{execute}}

Aşağıdaki komut yardımıyla **/tmp/overlay-dizini/overlay** dizininde **ornek.root.txt** dosyasının yer aldığını teyit edin;

`ls -al /tmp/overlay-dizini/overlay`{{execute}}

**ornek.root.txt** dosyasını **/tmp/overlay-dizini/overlay** dizininden silin;

`rm -f /tmp/overlay-dizini/overlay/ornek.root.txt`{{execute}}

Dosyanın silindiğini teyit edin;

`ls -al /tmp/overlay-dizini/overlay`{{execute}}

root dizininde **ornek.root.txt** dosyasının durmaya devam ettiğini teyit edin;

`ls -al /root`{{execute}}