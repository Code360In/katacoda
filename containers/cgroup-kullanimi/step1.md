# Gerekli Paketlerin Kurulumu

CGroup kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## CGroup

CGroup, CPU, RAM ve Disk I/O gibi sistem kaynaklarını limitlemeye olanak sağlayan bir Kernel özelliğidir. Orjinali Google tarafından geliştirilen CGroup Ocak 2008'de yayınlanın Linux Kernel 2.6.24 ile açık kaynak olarak genel kullanıma sunulmuştur. Aşağıdaki adımlarda CGroup kurulum ve kullanımını deneyimleyeceksiniz.

Senaryomuzda bir CGroup oluşturarak process'leri limitlemeyi deneyimleyeceksiniz.

## Senaryo

CGroup sistem kaynaklarının process'ler özelinde limitlenmesi üzerine kurgulanmıştır. Bu senaryoda, öncelikle gerekli paketleri kuracaksınız. Kurulum ardından bir cgroup oluşturacaksınız. Son olarak; sistem kaynağı tüketen bir process'i oluşturduğunuz cgroup içerisinde başlatarak limitlerin uygulandığını gözlemleyeceksiniz.

## Gerekli Paketlerin Kurulması

CGroup kullanımı için **libcgroup1** ve **cgroup-tools** paketlerinin sistemde kurulu olması gerekmektedir. Aşağıdaki komutu çalıştırarak bu paketleri kurunuz;

`sudo apt install -y libcgroup1 cgroup-tools`{{execute}}

CPU kaynağını zorlayarak cgroup ile limit'lerin uygulandığını görebilmek adına aşağıdaki komut yardımıyla **stress** uygulamasını kurunuz;

`sudo apt install -y stress`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
