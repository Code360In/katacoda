# Dizin'i Bağlama

Docker, ana makine üzerindeki bir dizini konteyner'a bağlayabilir. Bunun için `docker run` ile konteyner'ı başlatırkan bağlanacak dizin bilgisini `--volume` ya da kısa şekilde `-v` ile belirtmelisiniz. **volume** parametresi **:** ile ayrılmış üç bölümden oluşmaktadır;

`ANA_MAKİNE_DİZİNİ:KONTEYNER_DİZİNİ:BAĞLAMA_SEÇENEKLERİ`

Bu üç bölümden;
* İlki ana makine üzerinde erişilecek dizini belirtmektedir. Alternatif olarak isimlendirilmiş bağlamalarda referans adıdır.
* İkinci bölüm, konteyner içerisinde bağlanacak dizini belirtmektedir.
* üçüncü bölüm opsiyonel olup virgül ile ayrılmış bağlama seçeneklerini belirtmektedir.
 
`docker run --volume /kaynak/klasor:/hedef/klasor container-imaj-adi` 

ya da 

`docker run -v /kaynak/klasor:/hedef/klasor container-imaj-adi` 

Aşağıdaki komutu çalıştırın;

`docker run -v ./:/host-dizini ubuntu bash`{{execute}}

Docker, tüm konteyner işlemlerinin komut satırı arayüzü (CLI) üzerinden yapılabilmesine imkan vermektedir. İhtiyaç duyacağınız komutlar docker uygulamasına vereceğiniz parametrelerle kullanılabilir.

Varsayılan kurulumda Docker koumutlarının çalışması için `sudo` ile birlikte kullanılması gerekmektedir. Sudo komutuna ihtiyaç duymadan Docker komutlarını kullanabilmek için aşağıdaki komutla kullanıcınızın docker grubuna eklenmesi gereklidir;

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
