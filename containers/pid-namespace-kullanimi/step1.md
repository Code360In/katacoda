# PID Namespace Oluşturulması

PID namespace kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## PID (Process ID) Namespace

Linux **Namespace**'leri kernel kaynaklarını bölümlere ayırmaya olanak sağlayan bir Kernel özelliğidir. Farklı namespace'lere bağlı çalışan process'ler farklı kernel kaynaklarını görecektir. Linux Kernel'ı 6+1 farklı namespace'e sahiptir. Aşağıdaki adımlarda bu namespace'lerden **PID Namespace**'ini deneyimleyeceksiniz.

Senaryomuzda bir PID namespace'i oluşturarak burada diğer namespace'lere ait process'lere ulaşılamadığını deneyimleyeceksiniz.

## Senaryo

Linux PID namespace'i PID değerlerinin birbirinden soyutlanması üzerine kurgulanmıştır. Linux process'leri bir ağaç hiyerarşisinde ve birbirine bağlı olarak oluşmaktadır. Yeni bir PID namespace'i oluşturulduğunda, Bu namespace'deki ilk process normal PID değeri yanından bulunduğu namespace'e özel olarak 1 ID'si ile ikincil PID değerini alacaktır. PID 1 ilgili namespace için bir ilklendirme process'i olarak düşünülebilir. Bu namespace'deki takip eden process'lerde benzer şekilde bulundukları namespace özelinde de PID değerlerine sahip olacaktır.

## Bir PID Namespace Oluşturulması

Senaryomuzda PID namespace kernel kaynak ayrımını net olarak görebilmek adına `unshare` komutundan faydalanacağız. Bu komut işletim sisteminin [unshare](http://man7.org/linux/man-pages/man2/unshare.2.html) sistem çağrısını kullanarak yeni bir PID namespace'i oluşturarak belirttiğimiz uygulamayı bu namespace içerisinde başlatacaktır.

Aşağıdaki komutu ile mevcutta çalışan process'leri listeleyin;

`ps aux`{{execute}}

Alternatif olarak aşağıdaki komutla çalışan process'leri ve PID namespace'lerini birlikte listeleyebilirsiniz;

`ps -eo pidns,cmd --sort=pidns`{{execute}}

Gelen process listesinin ilk sütunu bize PID namespace'ini, ikinci sütunu ise çalışan komutu verekcektir. Görüldüğü gibi listelenen process'lerin hepsi aynı PID namespace'i içerisinde.

Aşağıdaki komutu çalıştırarak yeni bir namespace içerisinde bash oturumu başlatın;

`sudo unshare -fp --mount-proc /bin/bash`{{execute}}

Artık yeni namespace içerisinde başlatılan bash oturumundasınız. Aşağıdaki komutu çalıştırarak tekrar process'leri listeleyin;

`ps aux`{{execute}}

Gördüğünüz gibi yeni namespace'de 1 numaralı pid olarak `/bin/bash`, hemen devamında da `ps` gözükmekte.

Önceki adımda olduğu gibi çalışan process'leri PID namespace'leri ile birlikte listeleyin;

`ps -eo pidns,cmd --sort=pidns`{{execute}}

İçinde bulunduğumuz oturum öncekinden farklı bir PID namespace ile çalıştığı görülecektir.

Aşağıdaki komutu çalıştırarak bash oturumunu sonlandırıp PID namespace'inden çıkabiliriz.

`exit`{{execute}}
