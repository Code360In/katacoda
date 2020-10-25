# Lab Ortamı

Sizin için 2 node üzerinde bir RKE Cluster'ı kurulu şekildedir. Sağ bölümde yer alan **Terminal** segmesinde bu control plane node2una ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## RKE Cluster Yedekleme

Rancher Kuberneter Engine Cluster'ında rke uygulaması yardımıyla yedekten geri yükleme yapılabilir. **/opt/rke/etcd-snapshots/** dizininde daha önceden alınmış bir yedek bulunmakta. Aşağıdaki komutla **/opt/rke/etcd-snapshots/** dizininde bu yedeğin bulunduğunu teyit edin;

`ls -al /opt/rke/etcd-snapshots/`{{execute}}

Aşağıdaki komutla **il-yedek.zip** dosyasını RKE Cluster'ına geri yükleyin;

`rke etcd snapshot-restore --config rancher-cluster.yml --name ilk-yedek`{{execute}}