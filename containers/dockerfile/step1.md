# Konteyner Imajı Oluşturma

Docker yardımıyla iki farklı yöntem kullanarak konteyner imajı oluşturulabilir. Bu yöntemlerde ilkinde temel alınan konteyner imajı başlatılarak istenen işlemler gerçekleştirilir. Konteyner'ın istenen duruma gelmesi ardından güncel hali ile imaj oluşturulur. İkinci yöntemde ise istenen durum **Dockerfile** dosyasında tariflenir. 

Bu iki yöntemden ilki yeni başlayanlar için daha kolay olan yoldur. Öte yandan bu yöntem CI/CD süeçleri için otomasyona uygun değildir. **Dockerfile** yaklaşımında tekrar edilebilir adımlar oluşturulacağı için kolaylıkla CI/CD süreçlerinde kullanılabilir.

Takip eden adımlarda **Dockerfile** kullanarak bir Docker konteyner imajı oluşturmayı göreceksiniz.

## Dockerfile

Bu yöntemde docker yerelde yer alan bir text dosyası içeriğindeki komutları kullanarak bizim adımıza bir konteyner imajı oluşturmaktadır. Konteyner imajı oluşturmakta kullanılacak adımların yer aldığı dosya adı varsayılanda **dockerfile** olarak kabul edilmiştir. Her ne kadar bu dosya adını kullanmak bir zorunluluk olmasada varsayılan olması nedeniyle sıklıkla tercih edilmektedir. Bu nedenle biz de senaryomuzda takip edilecek adımların yer aldığı dosyayı **dockerfile** olarak adlandıracağız. Aşağıdaki komutu çalıştırarak boş bir **dockerfile** dosyası oluşturun;

`touch dockerfile`{{execute}}

İçeriğini düzenlemek adına `dockerfile`{{open}} dosyasını editörde açın.

Takip eden adımlarda sırasıyla gerekli talimatları ekleyerek bir dockerfile oluşturacaksınız.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
