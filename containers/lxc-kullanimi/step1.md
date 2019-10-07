# LXC Kurulumu

LXC (Linux Containers) kurulum ve kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## LXC

**LXC (Linux Containers)** Linux çekirdeği üzerinde ve işletim sistemi seviyesinde çalışmaktadır. Aynı anda birden fazla izole Linux sistemi (kontayner) çalıştırılabilmesine olanak sunmaktadır. Linux kernel'ı tarafından sunuan cgroups fonksiyonu sayesinde kaynak yönetimini, namespace soyutlaması sayesinde ise soyutlamayı sağlamaktadır. İncelendiğinde Docker'ın ilk sürümlerinde de LXC karşımıza çıkmaktadır. LXC istemcisi, bu özelliklerin sistem yöneticileri tarafından kontrol edilmesini kolaylaştıran ve LXC ile iletişim halinde bulunan istemci uygulamasıdır.

Takip eden adımlarda, Ubuntu üzerinde LXC kurulumunu yaparak üzerinden bir linux sistemi (__container__) başlatacaksınız.

## LXC ve İstemci Kurulumu

LXC ve LXC istemcisi kurulumu için aşağıdaki komutu çalıştırın;

`sudo apt install -y lxd lxd-client`{{execute}}

Komutun çalışması ardında LXC/LXD kurulumu tamalanacak. Aşağıdaki komutu çalıştırarak LXC/LXD ilklendirmesini gerçekleştirin;

`sudo lxd init`{{execute}}

İlklendirme sırasında sorulan sorularda __[ENTER]__ tuşu yardımıyla sunulan varsayılan seçenekleri seçebilirsiniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
