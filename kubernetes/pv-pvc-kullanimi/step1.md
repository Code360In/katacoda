# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## PersistentVolume oluşturma

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

Oluşturun Persistent Volume’u aşağıdaki komutla kontrol edin;

`kubectl get persistentvolume`{{execute}}

Aşağıdaki komutla **yerel-pv** detayını görüntüleyin;

`kubectl describe persistentvolume yerel-pv`{{execute}}

Persistent Volume’u oluşturulduğunu ve **Avaliable** durumunda olduğunu teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
