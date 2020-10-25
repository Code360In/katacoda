# Lab Ortamı

Sizin için 2 node üzerinde bir RKE Cluster'ı kurulu şekildedir. Sağ bölümde yer alan **Terminal** segmesinde bu control plane node2una ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Hazırlık

Aşağıdaki komutla default namespace'inde herhangi bir pod ya da deployment bulunmadığını teyit edin;

`kubectl get pod,deploy`{{execute}}

Aşağıdaki komutu çalıştırarak 3 pod'lu **ornek-deployment** ismiyle bir deployment oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-deployment
  labels:
    app: k8sornek
spec:
  replicas: 3
  selector:
    matchLabels:
      app: k8sornek
  template:
    metadata:
      labels:
        app: k8sornek
    spec:
      containers:
      - name: uygulama
        image: enterprisecodingcom/k8sornek
        ports:
        - containerPort: 80
EOF
```{{execute}}

Aşağıdaki komutla Deployment'ın yaygınlaşmasını bekleyin;

`kubectl rollout status deployment ornek-deployment`{{execute}}

Yaygınlaşmanın tamamlanması ardından aşağıdaki komutla yedek alın;

`rke etcd snapshot-save --config rancher-cluster.yml --name ilk-yedek`{{execute}}

Aşağıdaki komutla **/opt/rke/etcd-snapshots/** dizininde az önce alınan yedeğin bulunduğunu teyit edin;

`ls -al /opt/rke/etcd-snapshots/`{{execute}}

Aşağıdaki komutla deployment'ı silin;

`kubectl delete deployment ornek-deployment`{{execute}}

Bir süre bekledikten sonra aşağıdaki komutla default namespace'inde herhangi bir pod ya da deployment bulunmadığını teyit edin;

`kubectl get pod,deploy`{{execute}}

## RKE Cluster Yedekleme

Önceki adımdaki işlemler ardından aşağıdaki komutla **ilk-yedek.zip** dosyasını RKE Cluster'ına geri yükleyin;

`rke etcd snapshot-restore --config rancher-cluster.yml --name ilk-yedek`{{execute}}

Geri yüklemenin tamamlanması ardından aşağıdaki komutla default namespace'inde deployment'ı ve bu deployment'a bağlı 3 adet podûn çalışır durumda olduğunu görmeye çalışın;

`kubectl get pod,deploy`{{execute}}

Yedek aldığını sırada çalışır durumda olan pod ve deployment'ların yeniden geldiğini teyit edin.