# Pod Sondaları

Bu bölümde basit bir web uygulaması üzerinde liveness ve readiness pod sondalarını deneyimleyeceksiniz. Web uygulaması 80 portu üzerinde **/health/ready** ve **/health/live** adreslerinde sağlık durumunu bildirmektedir. Bu adreslere ek olarak sunulan **/durum_degistir** adresi üzerinden uygulama sağlık durumu değiştirilebiliyor.

Aşağıdaki komutla pod-probe  adında bir pod oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: pod-probe
spec:
  containers:
  - name: uygulama
    image: enterprisecodingcom/k8sornek
    readinessProbe:
      httpGet:
        path: /health/ready
        port: 80
        scheme: HTTP
      initialDelaySeconds: 10
      periodSeconds: 15
    livenessProbe:
      initialDelaySeconds: 2
      periodSeconds: 5
      httpGet:
        path: /health/live
        port: 80
        scheme: HTTP
EOF
```{{execute}}

Alternatif olarak aşağıdaki komutla da pod oluşturulabilir;

`kubectl create -f https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/pod/pod-probe.yaml`{{execute}}

Alternatif olarak aşağıdaki komutla da pod oluşturulabilir;

`kubectl get pods -w`{{execute}}

Görüldüğü gibi pod **Running**, içerisindeki konteyner **Ready** statüsünde.

İkinci bir terminal açarak bu terminalde aşağıdaki komutla pod içerisinde bir Shell process’i başlatın;

`kubectl exec pod-probe -i -t -- sh`{{execute}}

Ardından bu shell oturumunda aşağıdaki curl komutu ile uygulamaya sağlık durumunu değiştirmesi için komut gönderin;

`curl localhost/durum_degistir`{{execute}}

Bu komutu çalıştırdıktan kısa bir süre sonra önceki terminalde pod’un önce ready durumda olmadığı görülecek, ardından da kubernetes tarafından yeniden başlatılacaktır.

Aşağıdaki komutla pod’u silin;

`kubectl delete pod pod-probe`{{execute}}