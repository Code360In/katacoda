# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Eş Zamanlı Çalışma

Cronjob tanımı ile zamanlanan işler ilgili zamanlama takvimi doğrultusunda çalışacaktır. Kimi senaryolarda başlatılan iş bir sonraki çalışma zamanı gelmesine rağmen sonlanmamış olabilir. Bu gibi senaryolarda nasıl davranılması gerektiği **concurrencyPolicy** ile cronJob’a bildirilebilir. concurrencyPolicy alanı **Forbid**, **Allow** and **Replace** şeklinde bir değer kümesine sahiptir. Bu senaryoda bu şekilde çalışması sarkan iş’ler için concurrencyPolicy belirlenmesini deneyimleyecesiniz.

Aşağıdaki komut çalıştırılarak cronjob tanımı oluşturulur;


```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: eszamanli-izin-verilen
spec:
  schedule: "*/1 * * * *"
  concurrencyPolicy: Allow
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: cronjob
              image: busybox
              args:
                - /bin/sh
                - -c
                - date; echo 90 saniyeliğine uyunuyor....; sleep 90s; echo sonlanıyor...;
          restartPolicy: Never
EOF
```{{execute}}

Aşağıdaki komutla pod’lar 4 dakika boyunca izlenir;

`watch kubectl get pods`{{execute}}

Bu süre içerisinde oluşturulan job’lara ait aynı anda çalışan pod’lar gözlemlenecektir.
