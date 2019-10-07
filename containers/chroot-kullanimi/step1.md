# Chroot Yapılandırması

Chroot kullanımı için sağ bölümde yer alan ubuntu ortamı hazırlanmıştır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Chroot

**Chroot** bir Linux sistem çağrısıdır. Çalışan bir process'in kök dizininin değiştirilmesini sağlar. Bu sayede process sanal bir kök dizin ve ona bağlı tanımlanmış alt dizinler üzerinde işlem görecektir. Bu sayede normal koşullar altında process asıl kök dizin ve altındaki dizinleri göremeyecek ve değişiklik yapamayacaktır. Bu çağrının sistem yöneticileri tarafından kullanılabilmesi için hazırlanan hizmet programının da adı **chroot**'tur. Chroot ile hazırlanan bu __sanal__ ortama **chroot jail** adı verilmektedir. Takip eden adımlarda gerekli dizin hiyerarşisini oluşturarak bir chroot jail oluşturaksınız.

Senaryomuzda bir kullanıcı oluşturarak sanal bir dizin hiyerarşisinde ve sadece **bash** üzerinde **ls** komutunu kullanabilmesine izin vereceğiz.

## Dizin Hiyerarşisinin Oluşturulması

Senaryomuzda kullanıcının göreceği dizin hiyerarşisini oluşturmalısınız. Bunun için `/home/enterprisecoding` dizinini ve sadece bash ve ls kullanımı istediğimiz için bu kök dizin altında tam bir işletim sistemi dizin hiyerarşisi yerine sadece **bin** ve **lib64** dizinlerini oluşturun;

`mkdir -p /home/enterprisecoding/{bin,lib64}`{{execute}}

Sıra bu dizin hiyerarşisine gerekli dosyaları kopyalamakta. **ls** uygulamasını `/home/enterprisecoding/bin` dizini altına kopyalayın;

`cp /bin/ls /home/enterprisecoding/bin/`{{execute}}

Benzer şekilde **bash** uygulamasını kopyalayın;

`cp /bin/bash /home/enterprisecoding/bin/`{{execute}}

__ls__ uygulaması bağımlılıkları aşağıdaki komut yardımıyla hedef dizine kopyalayın;

`for library in $(ldd /bin/ls | cut -d '>' -f 2 | awk 'NR>1{print $1}');do  cp --verbose --parents ${library} /home/enterprisecoding/; done`{{execute}}

__bash__ uygulaması bağımlılıkları aşağıdaki komut yardımıyla hedef dizine kopyalayın;

`for library in $(ldd /bin/bash | cut -d '>' -f 2 | awk 'NR>1{print $1}'); do cp --verbose --parents ${library} /home/enterprisecoding/; done`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
