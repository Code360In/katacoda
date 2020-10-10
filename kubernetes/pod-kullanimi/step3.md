# Shell Oturumu

**ilk-pod.yaml** dosya içeriğini aşağıdaki komutla güncelleyin;

```bash
cat <<EOT > ilk-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: ilk-pod
spec:
  containers:
  - name: shell
    image: busybox
    command: ['sh', '-c', 'echo "Shell kullanıma hazır" && sleep 3600']
EOT
```{{execute}}

Aşağıdaki komutla **ilk-pod** yeni haliyle oluşturun;

`kubectl create -f ilk-pod.yaml`{{execute}}

Pod’un durumunu aşağıdaki komutla kontrol edin;

`kubectl get pod ilk-pod`{{execute}}

Pod hazır duruma geldikten sonra aşağıdaki komutla pod içerisinde bir sh process’i başlatın;

`kubectl exec ilk-pod -i -t -- sh`{{execute}}

Pod içerisinde bir sh process’i başlatıldı aşağıdaki komutla ilk-pod içerisinde olduğunuzu teyit edin;

`hostname`{{execute}}

Aşağıdaki komutla sh process’ini sonlandırarak bilgisayara geri dönün;

`exit`

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.