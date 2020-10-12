# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Hazırlık

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

Aşağıdaki deployment yaygınlaştırmasını bekleyin;

`kubectl rollout status deployment ornek-uygulama`{{execute}}

Aşağıdaki komutla ilk servis tanımınızı yapın;

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: uygulama-servisi-np
  labels:
    app: k8sornek
spec:
  selector:
    app: k8sornek
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
EOF
```{{execute}}

Aşağıdaki komutla servisler listeyin;

`kubectl get services`{{execute}}

## Endpoint'ler

Aşağıdaki komutla endpoint’ler listeleyin;

`kubectl get endpoints`{{execute}}

uygulama-servisi ve uygulama-servisi-np endpoint’lerinin aynı küme değerine sahip olduğunu teyit edin.

Aşağıdaki komutla **uygulama-servisi-np** endpoint detayını görüntüleyin;

`kubectl describe endpoints uygulama-servisi-np`{{execute}}

Gelen açıklamada **NotReadyAddresses** bölümünün olduğunu teyit edin. Bu bölümde hazır olmayan pod’lara ait ip adresleri yer almaktadır. Teyit etmek için aşağıdaki komutu çalıştırın;

`kubectl get pods -o wide`{{execute}}

Hazır olmayan pod ip adresinin bir önceki çıktıda yer alan ip ile aynı olduğunu teyit edin.