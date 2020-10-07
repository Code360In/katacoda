# Kurulum Bilgisi

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Metrics Server Kurulumu

Metric Server kurulumu için ihtiyaç duyulan tanımlar github üzerinde yer alan metrics-server deposunda yer almaktadır. Belirli aralıklar kuruluma ait yaml dosyası güncellenerek github sürümler sayfasında yayınlanmaktadır. Güncel bir kurulym yapabilmek için öncelikle aşağıdaki komutu çalıştırarak güncel Metrics Server sürümünü tespit edin ve bunu takip eden adımlarda kullanmak üzere **METRICS_SERVER_RELEASE** değişkeninde saklayın;

`METRICS_SERVER_RELEASE=$(curl --silent "https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')`{{execute}}

Tespit edilen sürümü aşağıdaki komutla görüntüleyebilirsiniz;

`echo $METRICS_SERVER_RELEASE`{{execute}}

Aşağıdaki komutla güncel sürüme ait **components.yaml** dosyasını yerele indirin;

`curl -L https://github.com/kubernetes-sigs/metrics-server/releases/download/${METRICS_SERVER_RELEASE}/components.yaml -o components.yaml`{{execute}}

İndirdiğiniz dosyayı kubectl yardımıyla uygulayı;

`kubectl apply -f components.yaml`{{execute}}

Aşağıdaki komutu çalıştırarak Metrics Server'ın yaygınlaşmasını bekleyin;

`kubectl rollout status deployment metrics-server -n kube-system`{{execute}}

Kurulumla gelen api aşağıdaki komutla kullanılabilir;

`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{execute}}

alternatif olarak aşağıdaki komutla Api Service kontrol edilebilir;

`kubectl get apiservice v1beta1.metrics.k8s.io -o yaml`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
