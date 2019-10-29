# Process'e Limit Uygulanması

Bir önceki adımda gerekli paketlerin kurulması ve örnek betiğimizi hazırlanması ardından artık kaynak kısıtı eklemeye hazırız. Aşağıdaki adımlarda **test.sh** betiğine, **libcgroup** paketi ile gelen komutlar yardımıyla kaynak kısıtlaması uygulayacaksınız.

## CGroup Oluşturma

**libcgroup** paketi ile gelen `cgcreate` komutu gerekli sysfs girdilerini oluşturarak bizim adımıza bir CGroup oluşturacaktır.

Aşağıdaki komutu çalıştırarak `memory` alt sistemi için **enterprisecoding_demo** adıyla bir kontrol grubu oluşturun;

`sudo cgcreate -g memory:enterprisecoding_demo`{{execute}}

Aşağıdaki koutu kullanarak oluşturduğunuz kontrol grubuna 50MB'lık bir hafıza kullanım limiti tanımlayın;

`echo 50000000 | sudo tee /sys/fs/cgroup/memory/enterprisecoding_demo/memory.limit_in_bytes`{{execute}}

Limit tanımlaması ardından artık bu kontrol grubu ile bir işle başlatmaya hazırsınız. Aşağıdaki komutu çalıştırarak **test.sh**'ı **enterprisecoding_demo** kontrol grubu ile başlatın;

`sudo cgexec -g memory:enterprisecoding_demo ~/test.sh &`{{execute}}

Takip eden adımlarda kullanmak üzere arkaplanda çalışan betiğin process id'sini **TEST_PID** değişkeninde saklayın;

`export TEST_PID=$(pgrep -f test.sh | sed -n 2p)`{{execute}}

Betik arkaplanda çalışmaya başlayacak ve her 20sn'de bir ekrana `Enterprisecoding cgroup senaryosundan merhaba!` yazacaktır. Aşağıdaki komutu çalıştırarak script'in bağlı olduğu process'in memory limitine bağlı olduğunu teyit edin;

`ps -o cgroup $TEST_PID | grep memory:/enterprisecoding_demo`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
