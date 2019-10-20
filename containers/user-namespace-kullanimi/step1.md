# User Namespace Oluşturulması

User namespace kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## User Namespace

Linux **Namespace**'leri kernel kaynaklarını bölümlere ayırmaya olanak sağlayan bir Kernel özelliğidir. Farklı namespace'lere bağlı çalışan process'ler farklı kernel kaynaklarını görecektir. Linux Kernel'ı 6+1 farklı namespace'e sahiptir. Aşağıdaki adımlarda bu namespace'lerden 2012 yılında Linux 3.5 ile birlikte gelen **User Namespace**'ini deneyimleyeceksiniz.

Senaryomuzda bir User namespace'i oluşturarak burada diğer namespace'lere ait kullanıcılara ulaşılamadığını deneyimleyeceksiniz.

## Senaryo

Linux User namespace'i kullanıcıların birbirinden soyutlanması üzerine kurgulanmıştır.

Takip eden adımlarda bir User namespace'i oluşturarak kullanıcıların soyutlandığını gözlemleyeceksiniz.

## Bir User Namespace Oluşturulması

Senaryomuzda User namespace kernel kaynak ayrımını net olarak görebilmek adına `unshare` komutundan faydalanacağız. `-U` parametresi bize yeni bir User namespace'i oluşturma olanağı sunmaktadır. Belirttiğimiz uygulama bu namespace içerisinde başlayacaktır.

Aşağıdaki komutu ile mevcutta kullanıcı adınızı öğrenin;

`whoami`{{execute}}

Aşağıdaki komutu ile mevcutta kullanıcı id değerinizi öğrenin;

`id -u`{{execute}}

Aşağıdaki komutu çalıştırarak yeni bir namespace içerisinde bash oturumu başlatın;

`unshare -U /bin/bash`{{execute}}

Artık yeni namespace içerisinde başlatılan bash oturumundasınız. Aşağıdaki komutu çalıştırarak tekrar kullanıcı adınızı öğrenin;

`whoami`{{execute}}

Aşağıdaki komutu ile tekrar kullanıcı id değerinizi öğrenin;

`id -u`{{execute}}

Gördüğünüz gibi yeni namespace'de farklı bir kullanıcı ile işlem yapılmakta.

Bash oturumunu sonlandırarak namespace'den çıkın;

`exit`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
