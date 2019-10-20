# UNIX Time-sharing System (UTS) Namespace Oluşturulması

UTS namespace kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## UNIX Time-sharing System (UTS) Namespace

Linux **Namespace**'leri kernel kaynaklarını bölümlere ayırmaya olanak sağlayan bir Kernel özelliğidir. Farklı namespace'lere bağlı çalışan process'ler farklı kernel kaynaklarını görecektir. Linux Kernel'ı 6+1 farklı namespace'e sahiptir. Aşağıdaki adımlarda bu namespace'lerden 2006 yılında Linux 2.6.19 ile birlikte gelen **UTS Namespace**'ini deneyimleyeceksiniz.

Senaryomuzda bir UTS namespace'i oluşturarak burada diğer namespace'lere ait hostname'lere ulaşılamadığını deneyimleyeceksiniz.

## Senaryo

Linux UTS namespace'i hostname ve NIS alan adı değerlerinin birbirinden soyutlanması üzerine kurgulanmıştır. Yeni bir UTS namespace'i oluşturulduğunda, mevcut hostname ve NIS alan adı değerlerinin bir kopyası yeni namespace'de oluşturulacaktur.

Takip eden adımlarda bir UTS namespace'i oluşturarak hostname değerinin soyutlandığını gözlemleyeceksiniz.

## Bir UTS Namespace Oluşturulması

Senaryomuzda UTS namespace kernel kaynak ayrımını net olarak görebilmek adına `unshare` komutundan faydalanacağız. `-u` parametresi bize yeni bir UTS namespace'i oluşturma olanağı sunmaktadır. Belirttiğimiz uygulama bu namespace içerisinde başlayacaktır.

Aşağıdaki komutu ile mevcutta hostname değerini öğrenin;

`hostname`{{execute}}

Aşağıdaki komutu çalıştırarak yeni bir namespace içerisinde bash oturumu başlatın;

`sudo unshare -u /bin/bash`{{execute}}

Artık yeni namespace içerisinde başlatılan bash oturumundasınız. Aşağıdaki komutu çalıştırarak tekrar process'leri listeleyin;

`hostname`{{execute}}

Gördüğünüz gibi yeni namespace'de hostname kopyalanmıştır.

Aşağıdaki komutla host adını **enterprisecoding** olarak değiştirin;

`hostname enterprisecoding`{{execute}}

Tekrar host adını sorguladığınızda bu namespace için artık yeni ad gelecektir;

`hostname`{{execute}}

Bash oturumunu sonlandırarak namespace'den çıkın;

`exit`{{execute}}

Tekrar host adını sorguladığınızda **enterprisecoding** adının gelmediğini, ilk host adının geldiğini göreceksiniz;

`hostname`{{execute}}
