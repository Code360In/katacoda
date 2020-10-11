# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## ReplicaSet Yatayda Ölçeklendirme

Aşağıdaki komutla replicaset’inizi oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: ilk-replicaset
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
EOF
```{{execute}}

ReplicaSet’in durumunu aşağıdaki komutla kontrol edin;

`kubectl get replicasets`{{execute}}

Aşağıdaki komutla pod’ları etiketleri ile birlikte listeleyin;

`kubectl get pods --show-labels`{{execute}}

Listelenen pod’lardan birini düzenlemek üzere açın. Örneğin;

`kubectl edit pod ilk-replicaset-hxqcw`

Pod’a ait etiketi **k8sornek-eski**  olacak şekilde güncelleyin ve saklayın.

Aşağıdaki komutla pod’ları etiketleri ile birlikte yeniden listeleyin;

`kubectl get pods --show-labels`{{execute}}

Pod etiketinin değişkesi ardından ReplicaSet bu pod’u yönetmeyi bırakacaktır. Belirtilen replica sayısına uymak için yeni bir pod oluşturulduğunu teyit edin.

Etiketi değiştirilen pod’un yeniden tanımını inceleyin. Örneğin;

`kubectl describe pod ilk-replicaset-hxqcw`

Açıklama içerisindeki Controlled By değerinin bulunmadığını teyit edin.

Aşağıdaki komutla ReplicaSet tanımını silin;

`kubectl delete replicaset ilk-replicaset`{{execute}}

Pod listesini görüntüleyerek replicaset tarafından yönetilen pod’ların silindiğini, etiketini değiştirdiğiniz pod’un çalışmaya devam ettiğini teyit edin;

`kubectl get pods --show-labels`{{execute}}

Aşağıdaki komutla bu pod’u da silin;

`kubectl delete pods -l app=k8sornek-eski`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.