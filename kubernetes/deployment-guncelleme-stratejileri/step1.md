# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Güncelleme Stratejileri

Aşağıdaki komutla yeni deployment’ınızı oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deployment-stratejisi
  labels:
    app: k8sornek
spec:
  revisionHistoryLimit: 10
  replicas: 4
  strategy:
    type: Recreate
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

Daha önce yaptığınıza benzer şekilde uygulama konteyner imajını olmayan bir imaj ile değiştirin;

`kubectl set image deployment deployment-stratejisi uygulama=enterprisecodingcom/k8sornek:v6`{{execute}}

Deployment durumunu aşağıdaki komutla kontrol edin;

`kubectl rollout status deployment deployment-stratejisi`{{execute}}

Ekrandaki mesaj 4 pod’dan hiçbirisinin değiştirilemediğini ve beklendiğini belirtmekte. <kbd>Ctrl</kbd>+<kbd>C</kbd> ile bu ekrandan çıkabilirsiniz.

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Aşağıdaki komutla ReplicaSet’leri listeleyin;

`kubectl get replicaset`{{execute}}

Birden fazla replicaset olduğunu ve aralarındaki en yenisinde **Current/Desired** sütununda 4, Ready sütununda ise 0 adet pod olduğunu teyit edin.

Aşağıdaki komutla mevcut pod’ları listeleyin;

`kubectl get pods`{{execute}}

4 pod’un imajı bulamadıkları için ImagePullBackOff durumunda olduğunu teyit edin.

Aşağıdaki komutla deployment’ı silin;

`kubectl delete deployment deployment-stratejisi`{{execute}}