# İmaj Yönetimi

Sistemde daha önceden indirilmiş olan imajların listesini aşağıdaki komutu kullanarak görebilirsiniz;

`docker images`{{execute}}

Yüklü olan bu imajlardan kullanılmayanlar disk alanında yer açabilmek adına aşağıdaki komutla silinebilir;

`docker image rm IMAJ_ADI`

örneğin;

`docker image rm ubuntu`{{execute}}

# İmaj Arama ve Yerele İndirme

Docker varsayılanda istenen konteyner imajlarını [Docker Hub](https://hub.docker.com/) üzerinde aramaktadır. İstediğiniz konteyner imajlarını aşağıdaki komut yardımıyla komut satırı üzerinden de aramanız mümkün;

`docker search IMAJ_ADI`

örneğin;

`docker search alpine`{{execute}}

Listelenen konteyner imajlarından herhangi birisini yerele indirmek isterseniz `pull` komutunu kullanabilirsiniz. Örneğin;

`docker pull alpine`{{execute}}

Bu komut **alpine** container imajının en güncel sürümünü yerele indirecektir. Dikkat edilmesi gereken konu; bu komut sadece konteyner imajını yerele indirmiştir, herhangi bir konteyner çalıştırılmamıştır.

**pull** komutunu daha detaylı inceleyelim;

`docker pull --help`{{execute}}

Yardım ekranında da göreceğiniz üzere bu komut **tag** ve **digest** gibi ek parametreler de kabul etmekte.
**Tag** parametresi belirttiğimiz konteyner imajının belirli bir zamandaki hali istediğimizi belirtmek için kullandığımız **etiket**tir. Genel kullanımda her etiket bir sürüme denk gelmekte birlikte bu bir zorunluluk değildir. Yukarıdaki örneğimizde olduğu gibi bir sürüm belirtilmemesi durumunda varsayılan olaran **latest** etiketi kullanılacaktır.

Aşağıdaki komutu çalıştırın;

`docker pull alpine:3.7`{{execute}}

Bu komut Alpine linux konteyner imajının 3.7 etiketisine sahip halini yerele indirecektir. Bu etiket Alpine linux'ün 3.7 vresiyonuna denk geldiği için yerelinizde artık 3.7 sürümüne ait bit konteyner imajı yer alacaktır.

Alpine linux 3.11.6 sürümüne ait digest değeri `sha256:9a839e63dad54c3a6d1834e29692c8492d93f90c59c978c1ed79109ea4fb9a54`'dir. Bu değeri kullanarak imajı aşağıda komutu kullanarak yerele indiriniz;

`docker pull alpine@sha256:9a839e63dad54c3a6d1834e29692c8492d93f90c59c978c1ed79109ea4fb9a54`{{execute}}


**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
