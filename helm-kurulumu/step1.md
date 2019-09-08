Helm v2 kurulumunun tiller ve helm kurulumu olmak üzere iki adımdan oluşmaktadır. Tiller Kubernetes Cluster'ı üzerinde koşan ve helm'in taleplerini yerine getiren bileşendir. Tiller'ın görevini yerine getirebilmesi için Kubernetes kaynaklarını yönetebilme yetkisine sahip olmalıdır. RBAC'ın aktif olduğu Kubernetes kurulumlarında öncelikle Tiller'ın işlem yapmasına olanak verecek şekilde yetkili bir servis kullanıcısı oluşturulmalıdır.

Aşağıda, iki farklı yöntem üzerinden anlattığım adımların takip edilmesi için Cluster Admin yetkisi ile bir servis hesabı oluşturun. Servis hesabını oluşturmak için bu iki yöntemden biri seçilerek ilerlenmelidir.

## Manifest Dosyası ile Kullanıcı Oluşturma

Manifest dosyası ile servis hesabı oluşturmak için rbac-config.yaml dosyasını kullanabilirsiniz. Aşağıdaki komutla rbac-config.yaml dosyasının içeriğini görüntüleyebilirsiniz;

`cat rbac-config.yaml`{{execute}} 

Aşağıdaki komutla manifest dosyası yardımıyla servis kullanıcısı oluşturun;

`kubectl create -f rbac-config.yaml`{{execute}} 

Servis hesabı oluştur. **Continue** butonuna basarak sıradaki adıma geçebilirsiniz.

## Komut Satırından Kullanıcı Oluşturma

Komut satırından servis kullanıcını aşağıdaki komutla oluşturun;

`kubectl -n kube-system create serviceaccount tiller`{{execute}}

Oluşturduğumuz servis kullanıcısına cluster-admin rolü verin;
`kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller`{{execute}} 

Servis hesabı oluştur. **Continue** butonuna basarak sıradaki adıma geçebilirsiniz.