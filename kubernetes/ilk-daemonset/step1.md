# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Daemonset

Aşağıdaki komutla ilk DeamonSet’inizi oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: ilk-daemonset
  labels:
    app: k8sornek
spec:
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

Aşağıdaki komutla DaemonSet yaygınlaşma durumunu inceleyin;

`kubectl get daemonsets`{{execute}}

Aşağıdaki komutla Pod listesini alın;

`kubectl get pods -o wide`{{execute}}

Gelen listede her worker node için 1 adet pod bulunduğunu, master node'da bir pod yer almadığını teyit edin.

Listede gelen pod’lardan birinin tanımını inceleyin. Örneğin;

`kubectl describe pod ilk-daemonset-d8lrf`

Pod tanımında **Controlled By** alan değeri olarak **DaemonSet/ilk-daemonset** yazdığını teyit edin.