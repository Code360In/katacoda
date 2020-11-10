# Ön Hazırlık

## Jenkins kullanıcısı

Jenkins Agent'ı için kullanılacak bir kullanıcı oluşturmak için node01 makinesinde aşağıdaki komutu çalıştırın;

`useradd -m -d /opt/jenkins/ jenkins`{{execute HOST2}}

Oluşturduğunuz kullanıcı için aşağıdaki komutla bir şifre belirleyin;

`passwd jenkins`{{execute HOST2}}

## Jenkins'e giriş

Aşağıda belirtilen adrese giderek Jenkins ana sayfasını açın;

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

Açılan sayfada sağ üst bölümde yer alan **giriş yap** linkine basarak giriş sayfasına geçiş yapın.
Açılan giriş sayfasında sağ tarafta belirtilen kullanıcı bilgileri ile giriş yapın.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
