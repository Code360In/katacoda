# Etcd Kurulumu

Etcd kurulumu oldukça basit bir süreçtir. Kuruluma başlarken öncelikli olarak güncel Etcd sürümü tespit edilmelidir. Güncel sürüm https://github.com/etcd-io/etcd/releases adresi ziyaret edilerek öğrenilebilir.

Alternatif olarak doğrudan aşağıdaki kod çalıştırılarak güncel sürümün tespit edilip ortam değişkenine atanması da sağlanabilir;

`ETCD_VER=$(curl --silent "https://api.github.com/repos/etcd-io/etcd/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')`{{execute}}

Güncel sürüm aşağıdaki komutla yerele indirilir;

`curl -L https://github.com/etcd-io/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz`{{execute}}

Etcd’yi ayıklayacağınız dizini oluşturun;

`mkdir /tmp/etcd`{{execute}}

tar arşivini bu dizine ayıklayın;

`tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd --strip-components=1`{{execute}}

Aşağıdaki komutlarla etcd ve etcdctl dosyaları **/usr/local/bin/** altına kopyalayın;

`cp /tmp/etcd/etcd /usr/local/bin/`{{execute}}

`cp /tmp/etcd/etcdctl /usr/local/bin/`{{execute}}

Aşağıdaki adımla etcd sürümü teyit edin;

`etcdctl version`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
