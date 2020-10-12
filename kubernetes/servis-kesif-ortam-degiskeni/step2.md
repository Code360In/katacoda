## Endpoint'ler

Bu lab’da Servis keşfi için ortam değişkenlerinin kullanımı deneyimlenecektir. 

Aşağıdaki komut yardımıyla busybox konteyner’ına sahip bir pod oluşturularak içerisinde sh process’i başlatın;

`kubectl run -i --tty busybox --image=busybox -- sh`{{execute}}

Açılan shell oturumunda aşağıdaki komutla ortam değişkenleri sorgulayın;

`env`{{execute}}

Gelen yanıtta **http-server-service** için oluşturulan ortam değişkenleri görüldüğünü teyit edin. Aşağıdaki komutla pod’dan çıkış yapılır;

`exit`{{execute}}

Görüntülenen ip adresinin incelenmesi için aşağıdaki komutla servis bilgileri alın;

`kubectl describe svc http-server-service`{{execute}}

Burada verilen IP bilgisinin de aynı olduğu teyit edin.

Aşağıdaki komutlarla http-server-service servisi yeniden oluşturun;


`kubectl delete svc http-server-service`{{execute}}

```bash
cat <<EOF | kubectl create -f -
kind: Service
apiVersion: v1
metadata:
  name: http-server-service
spec:
  selector:
    app: http-server-pod
  ports:
  - protocol: TCP
    port: 4000
    targetPort: http
EOF
```{{execute}}

Yeniden servis bilgileri sorgulayın;

`kubectl describe svc http-server-service`{{execute}}

Servisin yeni bir ip adresine sahip olduğu teyit edin.

Busybox pod’u ortam değişkenlerini kontrol edin;

`kubectl exec -ti  busybox -- env`{{execute}}

Ortam değişkenlerinin hala eski servis ip adresini gösterdiğini teyit edin.

Aşağıdaki komutlar yardımıyla pod, deployment ve servis kayıtları silin;

`kubectl delete pod busybox`{{execute}}

`kubectl delete deployment http-server-deployment`{{execute}}

`kubectl delete svc http-server-service`{{execute}}