# Gerekli Paketlerin Kurulumu

basit bir container runtime oluşturma senaryosu için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Senaryo

Kursumuzun daha önceki adımlarında Container'ların olmazsa olmaz bileşenleri olan namespace'leri ve cgroup'u deneyimlemiştiniz. Bu senaryoda, namespace'leri ve cgroup'u kullanarak nasıl basit bir container çalışma-zamanı oluşturabileceğinizi deneyimleyeceksiniz. Öncelikle senaryo için gerekli olan cgroup bileşenlerini kuracaksınız. Kurulum ardından bir cgroup oluşturacaksınız. Son olarak sistem kaynağı tüketen bir process'i oluşturduğunuz cgroup içerisinde başlatarak limitlerin uygulandığını gözlemleyeceksiniz.

## Gerekli Paketlerin Kurulması

CGroup kullanımı için **libcgroup1** ve **cgroup-tools** paketlerinin sistemde kurulu olması gerekmektedir. Aşağıdaki komutu çalıştırarak bu paketleri kurunuz;

`sudo apt install -y libcgroup1 cgroup-tools`{{execute}}

# Geçici Dizinde BusyBox imajı

Aşağıdaki komutu çalıştırarak oluşturacağımız container için bir kök dizin oluşturun;

`ROOTFS=$(mktemp -d)`{{execute}}

Sizin için home dizinine önceden indirilmiş bir BusyBox imajı bulunmaktadır. Aşağıdaki komutu çalıştırarak bu imajı az önce oluşturduğunuz kök dizine ayıklayın;

`tar -xf busybox.tar -C $ROOTFS`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
