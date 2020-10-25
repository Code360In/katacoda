# Lab Ortamı

Sizin için 2 node üzerinde bir RKE Cluster'ı kurulu şekildedir. Sağ bölümde yer alan **Terminal** segmesinde bu control plane node2una ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## RKE Cluster Yedekleme

Rancher Kuberneter Engine Cluster'ının yedeği rke uygulaması yardımıyla elle alınabilir. Bunun için aşağıdaki komutu çalıştırın;

`rke etcd snapshot-save --config rancher-cluster.yml --name ilk-yedek`{{execute}}

Bu komut **ilk-yedek** adıyla bir yedek alacaktır. İşlemin tamamlanması ardından aşağıdaki komutla yedek dizininde **ilk-yedek.zip** adıyla yedek dosyasının oluştuğunu teyit edin;

`ls -al /opt/rke/etcd-snapshots/`{{execute}}