# SSH ile Chroot Jail Oturumuna Düşme

Senaryonun devamında gerçekçi örnek olması adına bir test kullanıcı oluşturarak ssh oturumu yapıldığında chroot jail oturumuna düşmesini sağlayacağız.

Aşağıdaki komut yardımıyla `test` adıyla bir kullanıcı oluşturun;

`useradd test`{{execute}}

Oluşturduğumuz kullanıcıya bir şifre verin;

`passwd test`{{execute}}

Kullanıcımızın SSH ile chroot jail'de çalışması için `/etc/ssh/sshd_config` dosyasını aşağıda komutla düzenleyin;

```bash
cat <<EOT >> /etc/ssh/sshd_config
Match user test
    ChrootDirectory /home/enterprisecoding/
    X11Forwarding no
    AllowTcpForwarding no
EOT
```{{execute}}

SSH servisini yeniden başlatın;

`systemctl restart sshd`{{execute}}

SSH oturumu için **/bin/sh** dosyasına ihtiytaç olduğu için bu dosyayı da ilk adımdakine benzer şekilde kopyalayın;

`cp /bin/sh /home/enterprisecoding/bin/`{{execute}}

__sh__ uygulaması bağımlılıkları aşağıdaki komut yardımıyla hedef dizine kopyalayın;

`for library in $(ldd /bin/sh | cut -d '>' -f 2 | awk 'NR>1{print $1}');do  cp --verbose --parents ${library} /home/enterprisecoding/; done`{{execute}}

Artık SSH denemesi için hazırsınız. Aşağıdaki komutla SSH bağlantısı ile yerel bilgisayara `test` kullanıcısı ile giriş yapın;

`ssh test@localhost`{{execute}}

Bir önceki adımda olduğu gibi chroot jail oturumunuz başladı. Önceki adımdaki şekilde test edin. Aşağıdaki komut yardımıyla bulunduğunuz dizini kontrol edin;

`pwd`{{execute}}

Kök dizine bağlı alt dizinleri listeleyin;

`ls`{{execute}}

`ls` uygulaması sanal kök dosya sisteminde `/bin` altında bulunduğu için çalıştığını gördünüz. Öte yandan bulunmayan `mkdir` ya da benzeri komutlar için **Command not found** hatası alınacaktır. Bunu görmek için aşağıdaki komutu deneyin ;

`mkdir`{{execute}}
