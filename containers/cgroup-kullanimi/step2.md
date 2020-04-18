# Process'e Limit Uygulanması

Bir önceki adımda gerekli paketlerin kurulması ardından artık kaynak kısıtı eklemeye hazırız. Aşağıdaki adımlarda **stress** komutuna, **libcgroup** paketi ile gelen komutlar yardımıyla kaynak kısıtlaması uygulayacaksınız.

## CGroup Oluşturma

**libcgroup** paketi ile gelen `cgcreate` komutu gerekli sysfs girdilerini oluşturarak bizim adımıza bir CGroup oluşturacaktır.

Aşağıdaki komutu çalıştırarak `cpu` alt sistemi için **enterprisecoding_demo** adıyla bir kontrol grubu oluşturun;

`sudo cgcreate -g cpu:enterprisecoding_demo`{{execute}}

Aşağıdaki komutları kullanarak oluşturduğunuz kontrol grubuna %50'lik bir cpu kullanım limiti tanımlayın;

`echo 200000 | sudo tee /sys/fs/cgroup/cpu/enterprisecoding_demo/cpu.cfs_quota_us`{{execute}}

`echo 1000000 | sudo tee /sys/fs/cgroup/cpu/enterprisecoding_demo/cpu.cfs_period_us`{{execute}}

Bu komutlarda belirtilen **cpu.cfs_period_us** değeri mikrosaniye cinsinden verilecek CPU zamanını periyodunu belirtmektedir. **1000000** değeri 1 saniyelik CPU zaman periyodunu ifade etmektedir. Yine bu komutlarda geçen **cpu.cfs_quota_us** değeri CPU zaman periyodu için mikrosaniye cinsinden ne kadarlık CPU zamanı verileceğini belirtmektedir. Verilen **200000** 0.2 saniyelik CPU zamanını ifade etmektedir. Yukarıdaki iki komut ile **enterprisecoding_demo** cpu grubuna 1 saniyelik zaman dilimi içerisinde 0.2 saniyelik CPU zamanı limiti koydunuz. 

Limit tanımlaması ardından artık bu kontrol grubu ile bir işlem başlatmaya hazırsınız. Aşağıdaki **stress** komutu arkaplanda 2 cpu, 1 I/O ve 1 worker ayrılarak 60 saniye süreyle yük oluşturacaktır;

`stress -c 2 -i 1 -m 1 -t 60s &`{{execute}}

**htop** ile cpu kullanımını izleyerek CPU'ların 60 saniye süreyle 100% kullanıldığını izleyebilirsiniz;

`htop`{{execute}}

q tuşuna basarak htop uygulamasından çıkış yapabilirsiniz;

`q`{{execute}}

Aşağıdaki komutu çalıştırarak bu defa **stress** uygulamasını aynı parametrelerle **enterprisecoding_demo** kontrol grubu ile başlatın;

`sudo cgexec -g cpu:enterprisecoding_demo stress -c 2 -i 1 -m 1 --vm-bytes 300M -t 60s &`{{execute}}

Tekrar **htop** ile cpu kullanımını izleyerek CPU'ların çok daha düşük kullanıldığını gözlemleyebilirsiniz;

`htop`{{execute}}

q tuşuna basarak htop uygulamasından çıkış yapabilirsiniz;

`q`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
