# Kontrol Grubu Oluşturulması

Bir önceki adımda gerekli paketlerin kurulması ardından artık kaynak kısıtı eklemeye hazırız. Aşağıdaki adımlarda **libcgroup** paketi ile gelen komutlar yardımıyla kaynak kısıtlaması oluşturacaksınız.

## CGroup Oluşturma

**libcgroup** paketi ile gelen `cgcreate` komutu gerekli sysfs girdilerini oluşturarak bizim adımıza bir CGroup oluşturacaktır.

Aşağıdaki komutu çalıştırarak `cpu` ve `memory` alt sistemleri için **enterprisecoding_demo** adıyla bir kontrol grubu oluşturun;

`sudo cgcreate -g cpu,memory:enterprisecoding_demo`{{execute}}

Aşağıdaki koutu kullanarak oluşturduğunuz kontrol grubuna 100MB'lık bir hafıza kullanım limiti tanımlayın;

`sudo cgset -r memory.limit_in_bytes=100000000 enterprisecoding_demo`{{execute}}

Aşağıdaki komutu kullanarak oluşturduğunuz kontrol grubuna %12'lik paylaşılan bir cpu kullanım limiti tanımlayın;

`sudo cgset -r cpu.shares=512 enterprisecoding_demo`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
