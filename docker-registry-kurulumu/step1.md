# Kurulum Bilgisi

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Kurulum sırasında ihtiyacınız olacak Helm paket yöneticisi kurularak ilklendirilmiştir. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` ve `node01` nodelarına ait terminalleri bulabilirsiniz. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute MASTER}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute MASTER}}

ya da aşağıdaki komutla helm paket yöneticisi sürümünü kontrol edebilirsiniz;

`helm version`{{execute MASTER}}

## Docker Registry Kurulumu

Öncelikle Docker Registry için gerekli değerlerin bulunduğu bir `values.yaml` dosyası oluşturulmalıdır. Bunun için aşağıdaki komutu kullanabilirsiniz;

`cat > values.yaml <<EOF
service:
       type: NodePort
EOF`{{execute MASTER}}

Dosyayı oluşturduktan sonra aşağıdaki şekilde Helm komutu kullanarak kube-system namespace'i altında Docker Registry kurabilirsiniz;

`helm install stable/docker-registry -n docker-registry --namespace kube-system -f values.yaml`{{execute MASTER}}

Aşağıdaki komutla pod'hazır duruma gelene kadar beklenebilir;

`while [[ $(kubectl get pods -l app=docker-registry -n kube-system -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "Docker Registry pod'u bekleniyor.." && sleep 1; done`{{execute MASTER}}

Kurulum durumu hakkında güncel bilgi aşağıdaki komutla sorgulanabilir;

`helm status docker-registry`{{execute MASTER}}

Docker Registry pod'una atanan node port değeri aşağıdaki komutla öğrenilir;

`export NODE_PORT=$(kubectl get --namespace kube-system -o jsonpath="{.spec.ports[0].nodePort}" services docker-registry)`{{execute MASTER}}

Docker Registry pod'una atanan ip değeri aşağıdaki komutla öğrenilir;

`export NODE_IP=$(kubectl get nodes --namespace kube-system -o jsonpath="{.items[0].status.addresses[0].address}")`{{execute MASTER}}

Bu işlemler ardından Docker Registry'sine ulaşabileceğimiz url şu şekilde öğrenilebilir;

`echo http://$NODE_IP:$NODE_PORT`{{execute MASTER}}

Docker Registry kataloğu aşağıdaki şekilde sorgulanabilir;

`curl -XGET http://$NODE_IP:$NODE_PORT/v2/_catalog`{{execute MASTER}}

**Continue** butonuna basarak Docker yapılandırması adıma geçebilirsiniz.
