# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Kurulum

Mevcut bir kubernetes Cluster’ına nginx ingress-controller kurulumu yapmak için aşağıdaki komutu çalıştırın;

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/baremetal/deploy.yaml`{{execute}}

Kurulumun tamamlanmasını aşağıdaki komutla bekleyin;

```bash
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s
```{{execute}}

Aşağıdaki komutla ***ingress-nginx namespace***’i altındaki pod’ları listeleyin;

`kubectl get po -n ingress-nginx`{{execute}}

Gelen listede çalışır durumda bir ***ingress-nginx-controller*** pod’u olduğunu teyit edin.

Bu adımlar ardından Kubernetes Cluster’ında oluşturacağınız ingress’leri gerçelleyecek bir nginx ingress controller kurulumunu yaptınız. 

Alternatifleri olmakla birlikte, bu lab’ta gerçekleştirdiğiniz ingress controller kurulumu Nginx’i nodeport üzerinden dışarı açmaktadır. Aşağıdaki komutla http ve https için kullanılan nodeport bilgisini görebilirsiniz;

`HTTP_PORT=$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.spec.ports[?(@.name=="http")].nodePort}')`{{execute}}

`HTTPS_PORT=$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')`{{execute}}

`echo "http: $HTTP_PORT, https: $HTTPS_PORT"`{{execute}}