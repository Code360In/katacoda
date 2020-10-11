# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Imaj Değişikliği

Aşağıdaki komutla deployment'ınızı oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ilk-deployment
  labels:
    app: k8sornek
spec:
  revisionHistoryLimit: 10
  replicas: 4
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

Aşağıdaki komutla Deployment yaygınlaşma durumunu inceleyin;

`kubectl rollout status deployment ilk-deployment`{{execute}}

Aşağıdaki komutla Pod’ları listeleyin;

`kubectl get pods`{{execute}}

Aşağıdaki komutu çalıştırarak uygulama konteyner’ının imajını olmayan bir imaj ile değiştirin;

`kubectl set image deployment ilk-deployment uygulama=enterprisecodingcom/k8sornek:v6 --record`{{execute}}

Deployment durumunu aşağıdaki komutla kontrol edin;

`kubectl rollout status deployment ilk-deployment`{{execute}}

Ekrandaki mesaj 4 pod’dan öncelikle 2’sinin değiştirildiğini ve beklendiğini belirtmekte. <kbd>Ctrl</kbd>+<kbd>C</kbd> ile bu ekrandan çıkabilirsiniz.

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Aşağıdaki komutla ReplicaSet’leri listeleyin;

`kubectl get replicaset`{{execute}}

Birden fazla replicaset olduğunu ve aralarındaki en yenisinde **Current** sütununda 2, **Ready** sütununda ise 0 adet pod olduğunu teyit edin.

Aşağıdaki komutla mevcut pod’ları listeleyin;

`kubectl get pods`{{execute}}

İki pod’un imajı bulamadıkları için ImagePullBackOff durumunda olduğunu teyit edin.
