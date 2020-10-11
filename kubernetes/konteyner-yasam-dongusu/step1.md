# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Konteyner Yaşam Döngüsü

Aşağıdaki komut çalıştırılarak **yasamdongusu-ornegi** pod’u oluşturulur;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: yasamdongusu-ornegi
spec:
  containers:
  - name: yasamdongusu-ornegi-konteyner
    image: nginx
    lifecycle:
      postStart:
        exec:
          command: ["/bin/sh", "-c", "echo Pod başlangıç kancasından merhaba > /usr/share/message"]
      preStop:
        exec:
          command: ["/bin/sh","-c","nginx -s quit; while killall -0 nginx; do sleep 1; done”]
EOF
```{{execute}}

Aşağıdaki komutla pod’un hazır olması beklenir;

`kubectl wait pod yasamdongusu-ornegi --for=condition=ready`{{execute}}

Pod içerisinde dosyasını kontrol etmek amacıyla bir Shell process’i başlatılır;

`kubectl exec -it yasamdongusu-ornegi -- /bin/bash`{{execute}}

Başlatılan shell oturumunda aşağıdaki komutla dosya içeriği yazdırılır;

`cat /usr/share/message`{{execute}}

Çıktıda pod tanımında yer alan **postStart** komutuna ait aşağıdaki girdi olduğunu teyit edin;

`Pod başlangıç kancasından merhaba`

Aşağıdaki komutla shell oturumu sonlandırılır;

`exit`

Aşağıdaki komutla pod silinir;

`kubectl delete pod yasamdongusu-ornegi`{{execute}}
