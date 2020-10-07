# Hata Düzeltmesi

Bir önceki adımda tespit ettiğimiz DNS probleminin çözümü olarak Metrics Server'a dahili adresleri tercih etmesini söylemek olacak.

Öncelikle mevcut sürümü kaldırmalıyız;

`kubectl delete -f components-dns-fix.yaml`{{execute}}

Mevcut sürümü kaldırdıktan sonra aşağıdaki komut çalıştırılarak **kubelet-insecure-tls** parametresi de eklenir;

`cat components-dns-fix.yaml | sed s/'args:'/'args:\n          - --kubelet-insecure-tls'/ > components-fixed.yaml`{{execute}}

ardından güncel **components-fixed.yaml** dosyası uygulanır;

`kubectl apply -f components-fixed.yaml`{{execute}}

Aşağıdaki komutu çalıştırarak Metrics Server'ın yaygınlaşmasını bekleyin;

`kubectl rollout status deployment metrics-server -n kube-system`{{execute}}

Metrics Server'ın ikinci defa yeniden kurulumu ardından bir kaç dakika bekleyerek CPU ve RAM bilgilerinin toplanmasına izin verdikten sonra aşağıdaki komutun çalıştırılması ile birlikte node bilgilerinin artık geldiği görülecektir;

`kubectl top node`{{execute}}

Aşağıdaki komut yardımıyla metrics-server pod'una dair bilgiler görülebilir;

`kubectl top pod $(kubectl get pods -l k8s-app=metrics-server -n kube-system -o 'jsonpath={.items[0].metadata.name}') -n kube-system`{{execute}}
