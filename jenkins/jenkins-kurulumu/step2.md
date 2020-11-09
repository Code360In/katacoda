# Jenkins Kurulumu

Bir önceki adımda gerekli paketlerin kurulması ardından sistem artık Jenkins kurulumuna hazır durumda. Aşağıdaki komut yardımıyla Jenkins'i kurun;

`sudo apt-get install jenkins`{{execute}}

## Servisi Başlatma

Kurulum ardından jenkins servis başlatılmalıdır;

`sudo systemctl start jenkins`{{execute}}

Servisin başarılı şekilde başladığını teyit edin;

`sudo systemctl status jenkins`{{execute}}

Servisin başarılı şekilde başladığını gördükten sonra servisi aktif hale getirin;

`sudo systemctl enable jenkins`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
