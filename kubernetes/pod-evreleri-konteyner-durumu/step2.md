# Restart Politikası ve Pod Şartları

Aşağıdaki komutu çalıştırarak restart-politikasi adıyla yeni bir pod oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: restart-politikasi
spec:
  containers:
  - name: shell
    image: busybox
    command: ['sh', '-c', 'echo "Merhaba, Kubernetes!" && exit -1']
  restartPolicy: Never
EOF
```{{execute}}

Bu tanımda pod yeniden başlama politikası olarak **Never** kullanıldığı için hata alınması durumunda pod yeniden başlatılmayacaktır. Örneğimizde konteyner -1 kodu ile sonlanacaktır. Bu durum Kubernetes için hata olarak yorumlanmaktadır.

Pod’un durumunu aşağıdaki komutla kontrol edin;

`kubectl get pods`{{execute}}

Pod içerisindeki konteyner’ın hata ile sonlanması ardından görüldüğü gibi pod yeniden başlatılmadı.

Aşağıdaki komutu çalıştırarak bir önceki pod tanımını restart politikası **always** olacak şekilde güncelleyin;

```bash
cat <<EOF | kubectl replace --force -f -
apiVersion: v1
kind: Pod
metadata:
  name: restart-politikasi
spec:
  containers:
  - name: shell
    image: busybox
    command: ['sh', '-c', 'echo "Merhaba, Kubernetes!" && exit -1']
  restartPolicy: Always
EOF
```{{execute}}

Pod’un durumunu aşağıdaki komutla kontrol edin;

`kubectl get pods`{{execute}}

Görüldüğü gibi pod virkaç defa başlatılmaya çalışılmış; fakat hata ile sonlanmıştır. Ardından **CrashLoopBackOff** durum kodunu almuştır. Aşağıdaki komutla pod detayını görüntüleyin;

`kubectl describe pod restart-politikasi`{{execute}}

**conditions** bölümünü inceleyin.

Bu bölümde de görüldüğü gibi Pod node’a atanmış, ilklendirilmiş; fakat konteyner, dolayısıyla da pod ready duruma gelememiş.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.