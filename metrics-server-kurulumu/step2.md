# Hata Tespiti ve Düzeltme

Metrics Server kurulumu ardından aşağıdaki komutun çalıştırılması ile birlikte node bilgileri gelmelidir;

`kubectl top node`{{execute}}

Yukarıdaki komutun çalıştırılması ardından metrics-server pod'unun durumuna göre aşağıdaki iki hata mesajından birisi ile karşılaşacaksınız;

`Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

`Error metrics not avaliable yet`

## Problem tespiti

Problemi tespit edebilmek için öncelikle pod'umuzun loglarına göz atmalıyız;

`watch kubectl logs -l app=metrics-server -n kube-system`{{execute}}

bir süre bekledikten sonra aşağıdaki hata loglarının oluştuğunu göreceksiniz;

`unable to fully collect metrics:[unable to fully scrape metrics from source kubelet_summary:node01: unable to fetch metrics from Kubelet node01 (node01): Get https://node01:10250/stats/summary?only_cpu_and_memory=true: dial tcp: lookup node01 10.96.0.10:53: no such host, unable to fully scrape metrics from source kubelet_summary:master: unable to fetch metrics from Kubelet master (master): Get https://master:10250/stats/summary?only_cpu_and_memory=truee: dial tcp: lookup node01 10.96.0.10:53: no such host]`

Hata mesajını gözlemlekten sonra **ctrl+c** ile konsola geri dönebilirsiniz.

Hata mesajına dikkat edildiğinde pod'un dns sorgulaması sonucunda `master` ve `node01` sunucuları için isim çözümlemesi yapamadığı görülecektir.

**Continue** butonuna basarak hata düzeltmesi adımına geçebilirsiniz.
