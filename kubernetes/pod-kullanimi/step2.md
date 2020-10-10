# Çoklu Konteyner

Bir pod içerisinde birden fazla konteyner bulunabilir. **ilk-pod.yaml** dosyasının içeriğini aşağıdaki şekilde güncelleyin;

```bash
cat <<EOT >> ilk-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: ilk-pod
spec:
  containers:
  - name: ilk-pod-konteyner-1
    image: busybox
    command: ['sh', '-c', 'echo "Konteyner1 den Merhaba, Kubernetes!" && sleep 3600']
  - name: ilk-pod-konteyner-2
    image: busybox
    command: ['sh', '-c', 'echo "Konteyner2 den Merhaba, Kubernetes!" && sleep 3600']
EOT
```{{execute}}

Yeni halinde ilk-pod içerisinde **ilk-pod-konteyner-1** ve **ilk-pod-konteyner-2** adıyla iki konteyner yer almakta. Aşağıdaki komutla **ilk-pod** yeni haliyle oluşturun;

`kubectl create -f ilk-pod.yaml`{{execute}}

Pod’un durumunu aşağıdaki komutla kontrol edin;

`kubectl get pods`{{execute}}

Pod içerisindeki her iki konteyner’ın da hazır durumda olduğunu gözlemleyin. Ardından aşağıdaki komutla loglarını inceleyi deneyin;

`kubectl get pods`{{execute}}

Pod içerisindeki her iki konteyner’ın da hazır durumda olduğunu gözlemleyin. Ardından aşağıdaki komutla loglarını inceleyi deneyin;

`kubectl logs ilk-pod`{{execute}}

Aldığınız hata mesajı pod’da birden fazla konteyner bulunmasından dolayı hangi konteyner’a ait logu almak istediğinizi belirtmek zorunda olduğunuzu söylemekte. Aşağıdaki şekilde konteyner adı belirterek yeniden deneyin;

`kubectl logs ilk-pod -c ilk-pod-konteyner-1`{{execute}}

Benzer şekilde ikinci konteyner’a ait logları görüntüleyin;

`kubectl logs ilk-pod -c ilk-pod-konteyner-2`{{execute}}

Bu defa aşağıdaki komutla pod’u silin;

`kubectl delete pod ilk-pod`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.