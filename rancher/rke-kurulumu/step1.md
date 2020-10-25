# Lab Ortamı

Sizin için 2 node üzerinde Docker kurulu şekildedir. Sağ bölümde yer alan **Terminal** segmesinde bu node'lara ait Terminal'ler kullanılabilir durumdadır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Kullanıcı Oluşturma

Her iki node üzerinde de kurulum ve yapılandırma için kullanılacak bir rancher kullanıcısı oluşturulmalıdır.

### 1. Sunucuda
Aşağıdaki komutla ilk sunucuda **rancher** kullanıcısını oluşturun;

`adduser rancher`{{execute HOST1}}

Oluşturduğunuz kullanıcının sudo ihtiyacı olmadan docker komutlarını çalıştırabilmesi için aşağıdaki komutla docker grubuna dahil edin;

`usermod -aG docker rancher`{{execute HOST1}}

### 2. Sunucuda

Aynı şekilde aşağıdaki komutla ikinci sunucuda **rancher** kullanıcısını oluşturun;

`adduser rancher`{{execute HOST2}}

Oluşturduğunuz kullanıcının sudo ihtiyacı olmadan docker komutlarını çalıştırabilmesi için aşağıdaki komutla docker grubuna dahil edin;

`usermod -aG docker rancher`{{execute HOST2}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.