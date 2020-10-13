# PersistentVolumeClaim oluşturma

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

Aşağıdaki komutu çalıştırarak talebinizin durumunu kontrol edin;

`kubectl get persistentvolumeclaim`{{execute}}

Komut çıktısında talebiniz yerine getirildiğini ve **yerel-pv**’e bağlandığını teyit edin.

1Gi’lik alan talep etmemize karşın 3Gi’li alan verildiğine dikkat edin.

Aşağıdaki komutla PVC detayını görüntüleyin;

`kubectl describe persistentvolumeclaim nginx-pvc`{{execute}}

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

Aşağıdaki komutu çalıştırarak talebinizin durumunu kontrol edin;

`kubectl get persistentvolumeclaim`{{execute}}

Komut çıktısında yeni talebinizi **Pending** durumunda olduğunu ve bir volume’e bağlanmadığını teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.