# Hata Düzeltmesi

Bir önceki adımda tespit ettiğimiz DNS probleminin çözümü olarak Metrics Server'a dahili adresleri tercih etmesini söylemek olacak.

Öncelikle mevcut sürümü kaldırmalıyız;

`helm delete metrics-server --purge`{{execute}}

Mevcut sürümü kaldırdıktan sonra aşağıdaki komut çalıştırılarak **kubelet-preferred-address-types=InternalIP** parametresi de eklenir;

`helm install stable/metrics-server --name metrics-server --namespace kube-system --set args[0]="--kubelet-preferred-address-types=InternalIP" --set args[1]="--kubelet-insecure-tls"`{{execute}}

Metrics Server'ın ikinci defa yeniden kurulumu ardından bir kaç dakika bekleyerek CPU ve RAM bilgilerinin toplanmasına izin verdikten sonra aşağıdaki komutun çalıştırılması ile birlikte node bilgilerinin artık geldiği görülecektir;

`kubectl top node`{{execute}}

Aşağıdaki komut yardımıyla metrics-server pod'una dair bilgiler görülebilir;

`kubectl top pod $(kubectl get pods -l app=metrics-server -n kube-system -o 'jsonpath={.items[0].metadata.name}') -n kube-system`{{execute}}
