# Sudo'suz Docker

Varsayılanda Docker koumutlarının çalışması için sudo ile bielikte kullanılması gerekmektedir. Sudo komutuna ihtiyaç duymadan Docker komutlarını kullanabilmek için aşağıdaki komutla kullanıcınızı docker grubuna ekleyin;

`sudo usermod -aG docker ${USER}`{{execute}}

Değişikliklerin etkili olması için yeniden giriş yapın;

`su - ${USER}`{{execute}}

İşlemler teyit edin;

`docker info`{{execute}}


Son olarak kurulum ve kullanımını kontrol etmek amacıyla aşağıdaki komutu çalıştırarak hello-world imajının Docker Hub'dan çekilerek çalıştırılmasını sağlayın;

`docker run hello-world`{{execute}}
