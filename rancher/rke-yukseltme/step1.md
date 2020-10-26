# Lab Ortamı

Sizin için 2 node üzerinde sürümüyle bir RKE Cluster'ı kurulu şekildedir. Sağ bölümde yer alan **Terminal** segmesinde bu control plane node'una ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## RKE Sürüm Yükseltme

Senaryo için **1.18.10** sürümüyle bir RKE Cluster'ı kurulmuştur. Aşağıdaki komutla Kubernetes sürümünü kontrol edin;

`kubectl version --short`{{execute}}

Aşağıdaki komutla kullanabileceğiniz sürümleri listeleyin;

`rke config --list-version --all`{{execute}}

Listelenen sürümlerden en günceli olan **v1.19.3-rancher1-1** sürümünü hedef sürüm olarak belirleyin. Bu amaçla **rancher-cluster.yml** dosyasını açarak **kubernetes_version** değerini bu değerle değiştirin. Dosyanın güncel hali aşağıda örneklendiği şekilde olacaktır;

```bash
nodes:
- address: [MASTER SUNUCU IP ADRESİ]
  user: root
  role: ['controlplane', 'etcd']
- address: [NODE01 IP ADRESİ]
  user: root
  role: ['worker']
kubernetes_version: v1.19.3-rancher1-1
```

Aşağıdaki komutla değişikliklerin uygulanmasını sağlayın;

`rke up --config ./rancher-cluster.yml`{{execute}}

Güncellemelerin uygulanması ardından aşağıdaki komutla Kubernetes sürümünü yeniden kontrol edin;

`kubectl version --short`{{execute}}

Kubernetes sürümünün güncellendiğini teyit edin.