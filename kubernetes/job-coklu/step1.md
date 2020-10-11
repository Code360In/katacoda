# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Çoklu İş Tanımı

Aşağıdaki komut çalıştırılarak yeni bir job tanımı oluşturulur;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
 name: coklu-is
spec:
 completions: 3
 template:
   metadata:
     name: coklu-is
   spec:
     containers:
     - name: coklu-is-konteyner
       image: busybox
       command: ["/bin/sh","-c"]
       args: ["echo 'Çoklu iş çalışıyor..'; sleep 5"]
     restartPolicy: OnFailure
EOF
```{{execute}}

Aşağıdaki komuta iş için oluşturulan pod’lar izlenir;

`kubectl get pods --watch`{{execute}}

Ardıl şekilde 3 işin çalıştığı gözlemlenecektir.

İş tanımı içerisindeki **completions** değeri ile oynayarak denemeler yapınız.

Aşağıdaki komutla iş tanımı silinir;

`kubectl delete job coklu-is`{{execute}}
