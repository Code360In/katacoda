# Hata Düzeltmesi

Bir önceki adımda tespit ettiğimiz DNS probleminin çözümü olarak Metrics Server'a dahili adresleri tercih etmesini söylemek olacak.

Öncelikle mevcut sürümü kaldırmalıyız;

`kubectl delete -f components.yaml`{{execute}}

Mevcut sürümü kaldırdıktan sonra aşağıdaki komut çalıştırılarak **kubelet-preferred-address-types=InternalIP** parametresi de eklenir;

`cat components.yaml | sed s/'args:'/'args:\n          - --kubelet-preferred-address-types=InternalIP'/ > components-dns-fix.yaml`{{execute}}

ardından güncel **components-dns-fix.yaml** dosyası uygulanır;

`kubectl apply -f components-dns-fix.yaml`{{execute}}

Aşağıdaki komutu çalıştırarak Metrics Server'ın yaygınlaşmasını bekleyin;

`kubectl rollout status deployment metrics-server -n kube-system`{{execute}}

Metrics Server'ın yeniden kurulumu ardından aşağıdaki komutun çalıştırılması ile birlikte node bilgileri gelmelidir;

`kubectl top node`{{execute}}

Bu komutun çalıştırılması ardından metrics-server pod'unun durumuna göre hala aşağıdaki iki hata mesajından birisi ile karşılaştığınızı göreceksiniz;

`Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

`Error metrics not avaliable yet`

## Problem tespiti

Problemi tespit edebilmek için öncelikle pod'umuzun loglarına göz atmalıyız;

`watch kubectl logs -l k8s-app=metrics-server -n kube-system`{{execute}}

bir süre bekledikten sonra aşağıdaki hata loglarının oluştuğunu göreceksiniz;

`unable to fully collect metrics:[unable to fully scrape metrics from source kubelet_summary:node01: unable to fetch metrics from Kubelet node01 (XXX.XXX.XXX.XXX): Get https://XXX.XXX.XXX.XXX:10250/stats/summary?only_cpu_and_memory=true: x509: cannot validate certificate for XXX.XXX.XXX.XXX because it doesn't contain any IP SANs, unable to fully scrape metrics from source kubelet_summary:master: unable to fetch metrics from Kubelet master (YYY.YYY.YYY.YYY): Get https://YYY.YYY.YYY.YYY:10250/stats/summary?only_cpu_and_memory=true: x509: cannot validate certificate for YYY.YYY.YYY.YYY because it doesn't contain any IP SANs]`

Hata mesajını gözlemledikten sonra <kbd>Ctrl</kbd>+<kbd>C</kbd> ile konsola geri dönebilirsiniz. Alternatif olarak aşağıdaki link yardımıyla konsola dönebilirsiniz;

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Hata mesajına dikkat edildiğinde pod'un dns sorgulaması sonucunda `master` ve `node01` sunucuları için isim çözümlemesi yapabilmiş. Öte yandan tespit edilen Ip adreslerine talep yapıldığında sertifika doğrulama hatası alındığı görülmektedir.

**Continue** butonuna basarak hata düzeltmesi adımına geçebilirsiniz.
