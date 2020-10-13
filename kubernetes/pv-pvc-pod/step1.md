# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Hazırlık

Aşağıdaki komutu çalıştırarak hostPath yardımıyla bir Persistent Volume oluşturun.

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: yerel-pv
spec:
  capacity:
    storage: 3Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  storageClassName: yerel-depolama
  hostPath:
    path: "/mnt/data"
EOF
```{{execute}}

Aşağıdaki komutu çalıştırarak bir PersistentVolumeClaim oluşturun.

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-pvc
spec:
  storageClassName: yerel-depolama
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
EOF
```{{execute}}

Aşağıdaki komutla bir başka PersistentVolumeClaim oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-pvc-10gi
spec:
  storageClassName: yerel-depolama
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
EOF
```{{execute}}

Aşağıdaki komutu çalıştırarak bir PersistentVolumeClaim’i kullanacağınız bir Deployment oluşturun.

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: pvc-ornek
  template:
    metadata:
      labels:
        app: pvc-ornek
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
         - name: nginx-data
           mountPath: /data/nginx
      volumes:
      - name: nginx-data
        persistentVolumeClaim:
          claimName: nginx-pvc
EOF
```{{execute}}

Aşağıdaki komutla deployment'ın yaygınlaştırmasını bekleyin;

`kubectl rollout status deployment nginx`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
