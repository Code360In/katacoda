# Mount Namespace Oluşturulması

Mount namespace kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Mount Namespace

Linux **Namespace**'leri kernel kaynaklarını bölümlere ayırmaya olanak sağlayan bir Kernel özelliğidir. Farklı namespace'lere bağlı çalışan process'ler farklı kernel kaynaklarını görecektir. Linux Kernel'ı 6+1 farklı namespace'e sahiptir. Aşağıdaki adımlarda bu namespace'lerden **Mount Namespace**'ini deneyimleyeceksiniz.

Senaryomuzda bir Mount namespace'i oluşturarak burada diğer namespace'lere ait bağlantı noktalarına ulaşılamadığını deneyimleyeceksiniz.

## Senaryo

Linux Mount namespace'i, bağlantı noktalarının birbirinden soyutlanması üzerine kurgulanmıştır. Bu senaryoda yeni bir mount namespace'i oluşturarak bu namespace içerisinde yaptığımız bağlamaların diğer process'ler tarafından görülemediğini deneyimleyeceksiniz.

## Bir Mount Namespace Oluşturulması

Senaryomuzda Mount namespace kernel kaynak ayrımını net olarak görebilmek adına `unshare` komutundan faydalanacağız. Bu komut işletim sisteminin [unshare](http://man7.org/linux/man-pages/man2/unshare.2.html) sistem çağrısını kullanarak yeni bir Mount namespace'i oluşturarak belirttiğimiz uygulamayı/process'i bu namespace içerisinde başlatacaktır.

Aşağıdaki komutu ile bulunduğunuz dizini teyit edin;

`pwd`{{execute}}

az sonra ayrı bir mount namespace'i ile başlatacağımız uygulama/process'te kullanılmak üzere bir dizin oluşturun;

`mkdir mount-dizini`{{execute}}

Oluşturduğunuz dizinin boş olduğunu teyit edin;

`ls mount-dizini -al`{{execute}}

Aşağıdaki komutu çalıştırarak yeni bir mount namespace'i içerisinde bash oturumu başlatın;

`sudo unshare -m /bin/bash`{{execute}}

Artık yeni mount namespace'i içerisinde başlatılan bash oturumundasınız. Aşağıdaki komutu çalıştırarak az önce oluşturduğunuz dizine mount işlemi yapın;

`mount -n -o size=10m -t tmpfs tmpfs mount-dizini`{{execute}}

Aşağıdaki komutla içinde bulunduğunuz process için tanımlı mount'lar arasından az önce oluşturduğunuz mount için disk kullanımını görüntüleyebilirsiniz.

`df mount-dizini`{{execute}}

Bu mount içerisinde yeni bir dosya oluşturun;

`touch mount-dizini/yeni-dosya`{{execute}}

Dosyanın oluştuğunu teyit edin;

`ls mount-dizini -al`{{execute}}

process'i aşağıda komutla sonlandırın;

`exit`{{execute}}

Tekrar mount-dizinini sorgulayarak bir önceki process içerisinde yaptığımız değişikliklerin içinde bulunduğumuz process tarafından görülmediğini teyit edin;

`ls mount-dizini -al`{{execute}}