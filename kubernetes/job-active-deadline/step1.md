# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Job Çalışma Süresi

Kimi durumlarda, yapılan işin başarılı ya da başarısız olmasından bağımsız olarak iş çalışma süresi için bir kısıt konulmak istenir. Bunun gerekçesi uzun süreli yüksek CPU ya da RAM kullanımını olabileceği gibi tamamen iş mantığının gereği de olabilir.

Bu lab’da yer alan aşağıdaki adımları takip ederek job çalışma süresine kısıt koymayı deneyimleyeceksiniz.

Aşağıdaki komut çalıştırılarak yeni bir job tanımı oluşturulur;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
 name: sure-siniri
spec:
 backoffLimit: 5
 activeDeadlineSeconds: 20
 template:
   metadata:
     name: sure-siniri
   spec:
     containers:
     - name: sure-siniri-konteyner
       image: busybox
       command: ["/bin/sh","-c"]
       args: ["echo 'Süre sınırlı iş çalışıyor..'; sleep 1; exit 1"]
     restartPolicy: OnFailure
EOF
```{{execute}}

Aşağıdaki komuta iş için oluşturulan pod’lar izlenir;

`kubectl get pods --watch`{{execute}}

Job’a ait pod’un hata ile sonlanması ardından yeniden başlatıldığı gözlemleyin.

Aşağıdaki komutla job tanımı alın;

`kubectl describe job sure-siniri`{{execute}}

Events bölümünde yer alan olay kayıtları incelendiğinde son girdinin DeadlineExceeded olduğu gözlemleyin.