# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Job

Aşağıdaki komut çalıştırılarak ilk job tanımı gerçekleştirilir;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
 name: ilk-is
spec:
 template:
   metadata:
     name: ilk-is
   spec:
     containers:
     - name: ilk-is-konteyner
       image: busybox
       command: ["echo", "İlk iş çalışıyor.."]
     restartPolicy: OnFailure
EOF
```{{execute}}

Aşağıdaki komutla pod’un hazır olması bekleyin;

`kubectl get job ilk-is -w`{{execute}}

Aşağıdaki komut çalıştırılarak Job hakkında bilgi alın;

`kubectl describe jobs ilk-is`{{execute}}

Komut çıktısında yer alan bilgiler incelenir.

Job tarafından oluşturulan pod’ları listelemek için aşağıdaki komut çalıştırılır;

`kubectl get pods`{{execute}}

Çalışan farklı pod’ların bulunduğu durumlarda sadece oluşturduğumuz job’ı görmek için aşağıdaki komut kullanılabilir;

`kubectl get pods --selector=job-name=ilk-is`{{execute}}

Listelenen pod adı alınarak pod loğları gösterilir. Örneğin;

`kubectl logs ilk-is-qzvsq`

Alternatif olarak aşağıdaki komut kullanılarak job tarafından oluşturulan pod’lar dinamik olarak tespit edilerek log’ları gösterilebilir;

`kubectl logs --selector=job-name=ilk-is`{{execute}}

Aşağıdaki komutla iş tanımı silinir;

`kubectl delete job ilk-is`{{execute}}
