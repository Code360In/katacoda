# Bekleme Durumundaki PersistentVolumeClaim Kullanımı

Aşağıdaki komutu çalıştırarak bu defa **Pending** durumunda bulunan **nginx-pvc-10gi** PersistentVolumeClaim’i kullanacağınız bir Deployment oluşturun.

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
          claimName: nginx-pvc-10gi
EOF
```{{execute}}

Aşağıdaki komutu çalıştırarak talebinizin durumunu kontrol edin;

`kubectl get deployment nginx`{{execute}}

Pod’u ready duruma gelmediğini teyit edin.

Aşağıdaki komutla pod’u detayını görüntüleyin;

`kubectl describe pod -l app=pvc-ornek`{{execute}}

Uygun bir PersistentVolumeClaim bulunamaması nedeniyle pod’un schedule edilemediğini teyit edin.