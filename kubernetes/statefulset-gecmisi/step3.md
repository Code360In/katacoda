# StatefulSet Geri Alma

Aşağıdaki komutu çalıştırarak StatefulSet bir önceki haline geri dönün;

`kubectl rollout undo statefulset ilk-statefulset`{{execute}}

Pod’ları durumunu aşağıdaki komutla tekrar kontrol edin;

`kubectl rollout status statefulset ilk-statefulset`{{execute}}

StatefulSet’in hala 1 pod’un hazır olmasını beklediğini teyit edin.

Tekrar Pod listesini görüntüleyin;

`kubectl get pods`{{execute}}

Bir önceki durum ile aynı olduğunu teyit edin.

Aşağıdaki komutla ilk-statefulset-3’i silin;

`kubectl delete pod ilk-statefulset-3`

Tekrar Pod listesini görüntüleyin;

`kubectl get pods`{{execute}}

**ilk-statefulset-3**’ün çalışır durumda olduğunu teyit edin.