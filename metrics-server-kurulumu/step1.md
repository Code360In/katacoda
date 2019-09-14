# Kurulum Bilgisi

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Kurulum sırasında ihtiyacınız olacak Helm paket yöneticisi kurularak ilklendirilmiştir. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

ya da aşağıdaki komutla helm paket yöneticisi sürümünü kontrol edebilirsiniz;

`helm version`{{execute}}

## Metric Server Kurulumu

Helm kurulu bir sistemde aşağıdaki komutu kullanarak kube-system namespace'i altında Metrics Server kurabilirsiniz;

`helm install stable/metrics-server --name metric-server --namespace kube-system`{{execute}}

Kurulum durumu hakkında güncel bilgi aşağıdaki komutla sorgulanabilir;

`helm status metrics-server`{{execute}}

Kurulumla gelen api aşağıdaki komutla kullanılabilir;

`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{execute}}

alternatif olarak aşağıdaki komutla Api Service kontrol edilebilir;

`kubectl get apiservice v1beta1.metrics.k8s.io -o yaml`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
