# Önceden Oluşturulmuş Pod

Aşağıdaki komutla ilk app: k8sornek etiketi ile yeni bir pod oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: elle-rs-pod
  labels:
    app: k8sornek
spec:
  containers:
  - name: uygulama
    image: enterprisecodingcom/k8sornek
EOF
```{{execute}}

Aşağıdaki komutla replicaset’i yeniden oluşturun;

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

Aşağıdaki komutla pod’ları etiketleri ile birlikte listeleyin;

`kubectl get pod --show-labels`{{execute}}

Gelen listede oluşturduğumuz pod’un da kullanılarak toplamda 3 pod oluşturulduğunu teyit edin.

Aşağıdaki komutla pod’un tanımını inceleyin;

`kubectl describe pod elle-rs-pod`{{execute}}

Oluşturduğumuz pod’un ilk-replicaset tarafından kontrol edildiğini teyit edin.