# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Başarılı Job Geçmişini Limitleme

CronJob’lar varsayılanda başarılı çalışan son 3 adet job’a ait kaydı tutmaktadır. İstenirse **.spec.successfulJobsHistoryLimit** alanı ile bu varsayılan değer değiştirilebilmektedir. Bu lab’da varsayılan değeri değiştirmeyi deneyimleyeceksiniz.

Aşağıdaki komut çalıştırılarak cronjob tanımı oluşturulur;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: basarili-gecmis-limit
spec:
  schedule: "*/1 * * * *"
  successfulJobsHistoryLimit: 1
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: basarili-gecmis-limit-konteyner
            image: busybox
            command: ["echo", "Zamanlanmış iş çalışıyor.."]
          restartPolicy: OnFailure
EOF
```{{execute}}

2 dakika ardından aşağıdaki komutla job’lar listelenir;

`kubectl get jobs`{{execute}}

Gelen listede sadece son başarılı job çalışmasının yer aldığı görülecektir.

Aşağıdaki komutla cronjob tanımı silinir;

`kubectl delete cronjob basarili-gecmis-limit`{{execute}}
