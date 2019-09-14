# Hata Düzeltmesi

Bir önceki adımda tespit ettiğimiz DNS probleminin çözümü olarak Metrics Server'a dahili adresleri tercih etmesini söylemek olacak.

Öncelikle mevcut sürümü kaldırmalıyız;

`helm delete metrics-server --purge`{{execute}}

Mevcut sürümü kaldırdıktan sonra aşağıdaki komut çalıştırılarak **kubelet-preferred-address-types=InternalIP** parametresi de eklenir;

`helm install stable/metrics-server --name metrics-server --namespace kube-system --set args[0]="--kubelet-preferred-address-types=InternalIP"`{{execute}}

Metrics Server'ın yeniden kurulumu ardından aşağıdaki komutun çalıştırılması ile birlikte node bilgileri gelmelidir;

`kubectl top node`{{execute}}

Bu komutun çalıştırılması ardından metrics-server pod'unun durumuna göre hala aşağıdaki iki hata mesajından birisi ile karşılaştığınızı göreceksiniz;

`Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

`Error metrics not avaliable yet`

## Problem tespiti

Problemi tespit edebilmek için öncelikle pod'umuzun loglarına göz atmalıyız;

`watch kubectl logs -l app=metrics-server -n kube-system`{{execute}}

bir süre bekledikten sonra aşağıdaki hata loglarının oluştuğunu göreceksiniz;

`unable to fully collect metrics:[unable to fully scrape metrics from source kubelet_summary:node01: unable to fetch metrics from Kubelet node01 (172.17.0.40): Get https://172.17.0.40:10250/stats/summary?only_cpu_and_memory=true: x509: cannot validate certificate for 172.17.0.40 because it doesn't contain any IP SANs, unable to fully scrape metrics from source kubelet_summary:master: unable to fetch metrics from Kubelet master (172.17.0.29): Get https://172.17.0.29:10250/stats/summary?only_cpu_and_memory=truee: x509: cannot validate certificate for 172.17.0.40 because it doesn't contain any IP SANs]`

Hata mesajını gözlemlekten sonra **ctrl+c** ile konsola geri dönebilirsiniz.

Hata mesajına dikkat edildiğinde pod'un dns sorgulaması sonucunda `master` ve `node01` sunucuları için isim çözümlemesi yapabilmiş. Öte yandan tespit edilen Ip adreslerine talep yapıldığında sertifika doğrulama hatası alındığı görülmektedir.

**Continue** butonuna basarak hata düzeltmesi adımına geçebilirsiniz.