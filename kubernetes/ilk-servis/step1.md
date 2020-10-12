# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Servis

Aşağıdaki komut çalıştırılarak örnek uygulama Deployment tanımı gerçekleştirin;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ornek-uygulama
  labels:
    app: k8sornek
spec:
  revisionHistoryLimit: 10
  replicas: 1
  selector:
    matchLabels:
      app: k8sornek
  template:
    metadata:
      labels:
        app: k8sornek
    spec:
      containers:
      - name: uygulama
        image: enterprisecodingcom/k8sornek
        ports:
        - containerPort: 80
EOF
```{{execute}}

Aşağıdaki komutla ilk servis tanımınızı yapın;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: uygulama-servisi
  labels:
    app: k8sornek
spec:
  selector:
    app: k8sornek
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF
```{{execute}}

Aşağıdaki komutla servisler listelenir;

`kubectl get services`{{execute}}

Gelen listede **uygulama-servisi**’nin olduğu teyit edilir.

Servisi test etmek için bir **curl** pod’u ayağa kaldırılarak içerisinde **sh** process’i başlatılır;

`kubectl run -i --tty curl --image=enterprisecodingcom/curl --rm --restart=Never -- sh`{{execute}}

sh oturumunda aşağıdaki komutla servis üzerinden servise http talebi gönderin;

`curl uygulama-servisi`{{execute}}

Servisin işaret ettiği pod’larda hizmet veren uygulamanın yanıt verdiğini teyit edin. Bir başka terminal’de Örnek uygulamayı yatayda çoğaltın;

`kubectl scale deployment ornek-uygulama --replicas=3`{{execute}}

Pod sh process’inin bulunduğu terminal’e geri dönerek yeniden talepte bulunun;

`curl uygulama-servisi`{{execute}}

Servisin işaret ettiği pod’larda hizmet veren uygulamanın yanıt vermeye devam ettiğini teyit edin. Tekrar ikinci termale geçiş yapın. Aşağıdaki komutu çalıştırarak uygulama konteyner’ının imajını olmayan bir imaj ile değiştirin;

`kubectl set image deployment ornek-uygulama uygulama=enterprisecodingcom/k8sornek:v6`{{execute}}

Pod listesini görüntüleyin;

`kubectl get pods`{{execute}}

Listede bir pod’un **ImagePullBackOff** durumunda iken diğerlerinin hizmet verdiğini teyit edin.

Curl pod’una geri dönerek yeniden talepte bulunun;

`curl uygulama-servisi`{{execute}}

Servisin işaret ettiği pod’larda hizmet veren uygulamanın yanıt vermeye devam ettiğini teyit edin. sh oturumunu sonlandırın;

`exit`{{execute}}
