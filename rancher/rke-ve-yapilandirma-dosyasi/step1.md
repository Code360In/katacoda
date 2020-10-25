# Lab Ortamı

Sizin için bir Ubuntu kurulumu hazırlanmıştır. Sağ bölümde yer alan **Terminal** segmesinde bu kuruluma ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıdaki adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## RKE'yi Hazırlama

Aşağıdaki komutla güncel RKE sürümü tespit ederek **RKE_VERSION** değişkeninde saklayın;

`RKE_VERSION=$(curl --silent "https://api.github.com/repos/rancher/rke/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')`{{execute}}

Ardından tespit ettiğiniz bu güncel sürümü yerel indirin;

`curl -L https://github.com/rancher/rke/releases/download/$RKE_VERSION/rke_linux-amd64 -o rke`{{execute}}

Aşağıdaki komutla çalıştırılabilir olarak işaretleyin;

`chmod +x rke`{{execute}}

İndirilen dosya path’te tanımlı olan bir dizine kopyalayın;

`mv rke /usr/local/bin`{{execute}}

İşlem aşağıdaki komutla doğrulayın;

`rke --version`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.