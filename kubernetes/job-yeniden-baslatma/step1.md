# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Yeniden Başlatma Politikaları

Oluşturulan bir Job için hata alınması durumunda yapması gerekeni restartPolicy ile belirtilir. Daha önce pod için kullanılan **restartPolicy** değer kümesi Job için biraz daha küçüktür. Bu lab’da kullanılamayan değeri deneyimleyeceksiniz.

Aşağıdaki komut çalıştırılarak yeni bir job tanımı gerçekleştirilmeye çalışılır;


```bash
cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
 name: yeniden-baslatma-politikasi
spec:
 template:
   metadata:
     name: yeniden-baslatma-politikasi
   spec:
     containers:
     - name: yeniden-baslatma-politikasi-konteyner
       image: busybox
       command: ["echo", "İlk iş çalışıyor.."]
     restartPolicy: Always
EOF
```{{execute}}

Oluşturulmaya çalışılan iş tanımının hatalı olması nedeniyle aşağıdaki hata mesajı gelecektir;

`The Job "yeniden-baslatma-politikasi" is invalid: spec.template.spec.restartPolicy: Unsupported value: "Always": supported values: "OnFailure", "Never"`

İş tanımlamalarında yeniden başlatma politikası olarak sadece **OnFailure** ve **Never** değerlerine izin verilmektedir.