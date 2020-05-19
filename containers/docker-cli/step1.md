# Docker Komut Satırı Arayüzü

Docker, tüm konteyner işlemlerinin komut satırı arayüzü (CLI) üzerinden yapılabilmesine imkan vermektedir. İhtiyaç duyacağınız komutlar docker uygulamasına vereceğiniz parametrelerle kullanılabilir.

Varsayılanda kurulumda Docker koumutlarının çalışması için `sudo` ile birlikte kullanılması gerekmektedir. Sudo komutuna ihtiyaç duymadan Docker komutlarını kullanabilmek için aşağıdaki komutla kullanıcınızın docker grubuna eklenmesi gereklidir;

`sudo usermod -aG docker ${USER}`

Kullandığınız etkileşimli eğitim ortamında bu yapılandırma sizin adınıza yapıldığı için `sudo` olmadan docker komutunu kullanabilirsiniz.

## Kullanılabilecek Komut Listesi

Docker CLI ile kullanabileceğiniz komut kümesi aşağıdaki komut yardımıyla listelenecektir;

`docker`{{execute}}

Alternatif olarak `help` komutunu ekleyerek de yardım ekranına ulaşabilirsiniz;


`docker help`{{execute}}

Burada listelenen herhangi bir komut hakkında daha detaylı bilgi almak istenirse aşağıdaki şekilde ilgili komut sonuna `--help` eklenebilir;

`docker KOMUT --help`

Örneğin;

`docker start --help`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
