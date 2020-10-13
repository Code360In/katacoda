# Kalıcı Depolama

Aşağıdaki komutu çalıştırarak oluşan nginx pod'unun adını APP_POD ortam değişkeninde saklayın;

`APP_POD=$(kubectl get pods --selector=app=pvc-ornek -o jsonpath={.items..metadata.name})`{{execute}}

Bu pod içerisinde bir shell oturumu başlatın;

`kubectl exec -it $APP_POD -- sh`{{execute}}

Başlatılan shell oturumunda **/data/nginx** dizini altında aşağıdaki komutla **index.html** dosyası oluşturun;

`echo "Örnek içerik" > /data/nginx/index.html`{{execute}}

**/data/nginx** dizinini listeleyin;

`ls -al /data/nginx`{{execute}}

Pod shell oturumunu sonlandırın;

`exit`{{execute}}

Yenisinin oluşması için nginx pod'unu silin;

`kubectl delete pod $APP_POD`{{execute}}

Aşağıdaki komutu çalıştırarak oluşan yeni nginx pod'unun adını APP_POD ortam değişkeninde saklayın;

`APP_POD=$(kubectl get pods --selector=app=pvc-ornek -o jsonpath={.items..metadata.name})`{{execute}}

Bu pod içerisinde bir shell oturumu başlatın;

`kubectl exec -it $APP_POD -- sh`{{execute}}

**/data/nginx** dizinini listeleyin;

`ls -al /data/nginx`{{execute}}

Önceki pod'da oluşturduğunuz **index.html** dosyasının olduğunu teyit edin.

Aşağıdaki komutla **index.html** dosyasının içeriğini görüntüleyin;

`cat /data/nginx/index.html`{{execute}}

Daha önceki pod'da oluşturduğumuz içeriğin tutulduğunu teyit edin.

