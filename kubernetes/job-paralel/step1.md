# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Paralel İş Tanımı

Varsayılanda Job ile tanımlanan iş ardıl çalışmaktadır. İstenirse job’ların paralel olarak çalıştırılabilmesi mümkündür. Bu Lab’da bir job’ı paralelde nasıl çalıştıracağınızı deneyimleyeceksiniz.

Aşağıdaki komut çalıştırılarak yeni bir job tanımı oluşturulur;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
 name: paralel-is
spec:
 parallelism: 6
 template:
   metadata:
     name: paralel-is
   spec:
     containers:
     - name: paralel-is-konteyner
       image: busybox
       command: ["/bin/sh","-c"]
       args: ["echo 'Paralel iş çalışıyor..'; sleep \$(shuf -i 5-10 -n 1)"]
     restartPolicy: OnFailure
EOF
```{{execute}}

Aşağıdaki komuta iş için oluşturulan pod’lar izlenir;

`kubectl get pods --watch`{{execute}}

İşlerin paralel olarak çalıştığı gözlemleyin.

Aşağıdaki komutla iş tanımı silin;

`kubectl delete job paralel-is`{{execute}}
