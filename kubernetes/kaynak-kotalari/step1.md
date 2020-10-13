# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Kaynak Kotaları

Aşağıdaki komutla yeni bir namespace oluşturun;

`kubectl create namespace kota-calismasi`{{execute}}

Aşağıdaki komutla **kota-calismasi** namespace’nde oluşturulabilecek nesnelere dair kotaları tanımlayın;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ResourceQuota
metadata:
  name: nesne-sayilari
  namespace: kota-calismasi
spec:
  hard:
    configmaps: "10"
    persistentvolumeclaims: "4"
    pods: "4"
    replicationcontrollers: "20"
    secrets: "10"
    services: "10"
EOF
```{{execute}}

Aşağıdaki komutla **kota-calismasi** namespace’nde tanımlı kotaları listeleyin;

`kubectl get quota -n kota-calismasi`{{execute}}

Aşağıdaki komutla **nesne-sayilari** kotası detaylarını görüntüleyin;

`kubectl describe quota nesne-sayilari -n kota-calismasi`{{execute}}

Aşağıdaki komutla bir deployment’ınızı oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kota-deployment
  namespace: kota-calismasi
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

Aşağıdaki komutla deployment'ın yaygınlaştırmasını bekleyin;

`kubectl rollout status deployment -n kota-calismasi kota-deployment`{{execute}}

Yaygınlaşmanın tamamlanması ardından aşağıdaki komutla nesne-sayilari kotası detaylarını tekrar görüntüleyin;

`kubectl describe quota nesne-sayilari -n kota-calismasi`{{execute}}

Çıktıda pod için **Used** sütununda 3 adet kullanıma dair bilgiyi teyit edin.

Aşağıdaki komutla deployment’ı yukarı doğru ölçekleyin;

`kubectl scale deployment kota-deployment --replicas=5 -n kota-calismasi`{{execute}}

Aşağıdaki komutla Deployment yaygınlaşmasını bekleyin;

`kubectl rollout status deployment kota-deployment -n kota-calismasi`{{execute}}

Yaygınlaşmanın 5. Pod’un oluşturulmasını beklediğini teyit edin.

<kbd>Ctrl</kbd>+<kbd>C</kbd> tuş kombinasyonu ile komutu sonlandırın.

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Aşağıdaki komutla pod’ları listeleyin;

`kubectl get pod -n kota-calismasi`{{execute}}

4 adet pod bulunduğunu ve çalışır durumda olduklarını teyit edin.

Aşağıdaki komutla **nesne-sayilari** kotası detaylarını tekrar görüntüleyin;

`kubectl describe quota nesne-sayilari -n kota-calismasi`{{execute}}

Çıktıda pod için **Used** sütununda 4 adet kullanıma dair bilgiyi teyit edin;
