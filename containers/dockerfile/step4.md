# BUILD

Dockerfile içerisine gerekli talimatları eklemenizin ardından `docker build` komutunu kullanarak konteyner imajının oluşturulmasını sağlayabilirsiniz. docker build komutu dockerfile içerisinde verdiğiniz talimatları sırasıyla işleterek konteyner imajını oluşturacaktır. 

Docker build aşağıda örneklendiği şekilde bir yapıya sahiptir;

`docker build -t <IMAJ_ADI>:<IMAJ_TAG'İ> <DOCKERFILE_DOSYASI>`

Senaryodaki dosyamızın mevcut dizinde bulunması ve dosya adının **dockerfile** olması nedeniyle dockerfile dosya adresi olarak **.** vermeniz yeterli olacaktır. 

Aşağıdaki komutu çalıştırarak konteyner imajınızı oluşturun;

`docker build -t enterprisecoding-webserver:latest .`{{execute}}

Derleme işlemi ardından konteyner imajının başarıyla oluştuğuna dair aşağıdaki mesajı göreceksiniz;

`Successfully tagged enterprisecoding-webserver:latest`

Oluşturulan imaj yerel imajlar arasında yerini alacaktır. Aşağıdaki komutu çalıştırarak listede yer aldığını görün;

`docker images`{{execute}}