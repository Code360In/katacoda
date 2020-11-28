# Pod Tanım Detayı

Aşağıdaki komutu çalıştırarak pod bilgilerini görüntüleyin;

`kubectl describe pod ilk-pod`{{execute}}

Aşağıdaki komutu çalıştırarak pod tanımını yaml formatında alın;

`kubectl get pod ilk-pod --output yaml`{{execute}}

Yaml formatında tanımı dışarı almaya daha uygun halini aşağıdaki komutla görüntüleyin;

`kubectl get pod ilk-pod --output yaml --export`{{execute}}

Aşağıdaki komutla yaml çıkısını bir dosyaya yazdırın;

`kubectl get pod ilk-pod --output yaml --export > pod-tanimi.yaml`{{execute}}

Aşağıdaki komutla **pod-tanimi.yaml** dosyasını inceleyin;

`cat pod-tanimi.yaml`{{execute}}

Aşağıdaki komutla pod’u silin;

`kubectl delete pod ilk-pod`{{execute}}