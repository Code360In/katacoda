# Kurulum Bilgisi

Kubernetes Cluster'ı kurabilmeniz için 1 master, 1 worker node hazırlanmıştır. Kubernetes Cluster kurulumu için ihtiyaç duyacağınız `Docker`, `kubeadm`, `kubectl` and `kubelet` gibi araçlar kuruludur. Bu öngereksinimlerin nasıl kurulacağını ve yapılandırılacağını [Centos 7 üzerinde Kubernetes kurulumu](http://www.enterprisecoding.com/post/centos-7-uzerine-kubernetes-kurulum) makalemden öğrenebilirsiniz. Sağ bölümde Kubernetes Cluster'ının kurulacağı `master` ve `node1` node'larının terminalini bulabilirsiniz. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Kubernetes İlklendirilmesi

Kuruluma başlarken yapılması gereken ilk adım Kubernetes Cluster'ının ilklendirilmesidir. İlklendirme öncesi opsiyonel olarak Kubernetes Cluster'ı master node'unda konumlandırılacak `kube-apiserver`, `kube-controller-manager`, `kube-scheduler`, `etcd` servislerinin imajları aşağıdaki şekilde indirilebilir. Bu adımın opsiyonel olmasının nedeni, imajların ilklendirme sırasında yerelde bulunamaması durumunda internetten indirilebilmesidir.

`kubeadm config images pull`{{execute MASTER}}

Gerekli imaj'ların indirilmesi ardından aşağıdaki komut yardımıyla Kubernetes Cluster'ı ilklendirilebilir;

`kubeadm init --pod-network-cidr=10.244.0.0/16`{{execute MASTER}}

Komutun çıktısında yer alan son iki satır bize Kubernetes Cluster'ına yeni bir worker node eklememiz için gerekli olan komutu vermektedir. Bu ilklendirme işleminin bitmesi ardından aşağıdaki komutlar çalıştırılarak `kubectl` ile komut satırından Kubernetes Cluster'ınıza bağlanmak için gerekli hazırlıkları tamamlayabilirsiniz;

`mkdir -p $HOME/.kube`{{execute MASTER}}

`cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`{{execute MASTER}}

`chown $(id -u):$(id -g) $HOME/.kube/config`{{execute MASTER}}

Kubernetes Cluster'ı network yönetimi CNI eklentileri ile yapılmaktadır. Aşağıdaki komut kullanılarak CNI eklentisi kurulur;

`kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml`{{execute MASTER}}

Bu komut CNI olarak `Flannel` eklentisi kurulumunun yapılmasını sağlayacaktır. Alternatif olarak kurabileceğiniz `Clico`, `Canal`, `Cilium` v.b. CNI eklentileri ve CIDR değerleri için [Centos 7 üzerinde Kubernetes kurulumu](http://www.enterprisecoding.com/post/centos-7-uzerine-kubernetes-kurulum) makaleme göz atabilirsiniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
