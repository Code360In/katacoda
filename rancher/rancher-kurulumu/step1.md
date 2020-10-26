# Lab Ortamı

Sizin için 2 node üzerinde bir RKE Cluster'ı kurulu şekildedir. Sağ bölümde yer alan **Terminal** segmesinde bu control plane node'una ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Ön Gerekesinimlerin Kurulumu

### Helm Kurulumu

Aşağıdaki komutu çalıştırarak Helm kurulumu yapın;

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash`{{execute}}

### Cert-Manager Kurulumu

Aşağıdaki komutla Cert-Manager için gerekli olan CRD tanımlarını oluşturun;

`kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.crds.yaml`{{execute}}

Cert-manager namespace’ini oluşturun;

`kubectl create namespace cert-manager`{{execute}}

Jetstack Helm deposunu ekleyin;

`helm repo add jetstack https://charts.jetstack.io`{{execute}}

Helm depolarını güncelleyin;

`helm repo update`{{execute}}

Cert-manager helm chart’ı kurun;

`helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v0.15.0`{{execute}}

Kurulumu aşağıdaki komutlarla pod durumlarına bakılarak kontrol edin;

`kubectl get pods --namespace cert-manager`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.