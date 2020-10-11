# Deployment Geri Alma

Aşağıdaki komutu çalıştırarak deployment’ın bir önceki haline geri dönün;

`kubectl rollout undo deployment ilk-deployment`{{execute}}

Deployment durumunu aşağıdaki komutla tekrar kontrol edin;

`kubectl rollout status deployment ilk-deployment`{{execute}}

Deployment’ın başarıyla yaygınlaştığını teyit edin.

Tekrar ReplicaSet listesini görüntüleyin;

`kubectl get replicaset`{{execute}}

Önceki kontrollerde Current sütununda 2 adet pod olan deployment’ın artık 0 değerine sahip olduğunu, Desired/Current/Ready değerleri 3 olan deployment’ın ise 4 değerine sahip olduğunu teyit edin.

Desired/Current/Ready değerleri 4 olan ReplicaSet bilgisini görüntüleyin. Örneğin;

`kubectl describe replicaset ilk-deployment-687577b58f`

Açıklamalar arasındaki **deployment.kubernetes.io/revision** ve **kubernetes.io/change-cause** açıklamalarını inceleyin.

Pod listesini görüntüleyin;

`kubectl get pods`{{execute}}

Deployment’a ait çalışır durumda 4 adet pod bulunduğunu teyit edin.

Tekrar yaygınlaştırma geçmişini görüntüleyin;

`kubectl rollout history deployment ilk-deployment`{{execute}}

2. rezisyonun kaldırıldığını ve 4. revizyonun eklendiğini teyit edin.

Aşağıdaki komutu çalıştırarak 1. Revizyonu geri dönün;

`kubectl rollout undo deployment ilk-deployment --to-revision=1`{{execute}}

Deployment durumunu aşağıdaki komutla kontrol edin;

`kubectl rollout status deployment ilk-deployment`{{execute}}

Aşağıdaki komutla son deployment’ı yeniden gerçekleştirin;

`kubectl rollout restart deployment ilk-deployment`{{execute}}

Hemen ardından Pod listesini görüntüleyin;

`kubectl get pods`{{execute}}

Pod’ların kontrollü olarak sonlandırılırken yerlerine yenilerinin oluşturulduğunu teyit edin.

Aşağıdaki komutla deployment’ı silin;

`kubectl delete deployment ilk-deployment`{{execute}}
