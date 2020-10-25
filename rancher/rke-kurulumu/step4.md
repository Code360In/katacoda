## RKE Binary Kurulumu

İlk sunucuda güncel RKE sürümü tespit ederek **RKE_VERSION** değişkeninde saklayın;

`RKE_VERSION=$(curl --silent "https://api.github.com/repos/rancher/rke/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')`{{execute HOST1}}

Güncel sürümü yerel indirin;

`curl -L https://github.com/rancher/rke/releases/download/$RKE_VERSION/rke_linux-amd64 -o rke`{{execute HOST1}}

Aşağıdaki komutla çalıştırılabilir olarak işaretleyin;

`chmod +x rke`{{execute HOST1}}

İndirilen dosya path’te tanımlı olan bir dizine kopyalayın;

`mv rke /usr/local/bin`{{execute HOST1}}

İşlem aşağıdaki komutla doğrulayın;

`rke --version`{{execute HOST1}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.