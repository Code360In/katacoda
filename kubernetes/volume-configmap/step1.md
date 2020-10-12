# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## ConfigMap

Aşağıdaki komut çalıştırılarak nginx-conf configMap’ini oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-conf
data:
  nginx.conf: |
    user nginx;
    worker_processes  3;
    error_log  /var/log/nginx/error.log;
    events {
      worker_connections  10240;
    }
    http {
      log_format  main
              'remote_addr:$remote_addr\t'
              'time_local:$time_local\t'
              'method:$request_method\t'
              'uri:$request_uri\t'
              'host:$host\t'
              'status:$status\t'
              'bytes_sent:$body_bytes_sent\t'
              'referer:$http_referer\t'
              'useragent:$http_user_agent\t'
              'forwardedfor:$http_x_forwarded_for\t'
              'request_time:$request_time';
      access_log  /var/log/nginx/access.log main;
      server {
          listen       80;
          server_name  _;
          location / {
              proxy_pass http://www.google.com/;
              proxy_set_header Host www.google.com;
              proxy_set_header Referer https://www.google.com;
          }
      }
    }
EOF
```{{execute}}

Oluşturduğunuz bu configMap içerisinde yer alan nginx.conf tanımı nginx’i Google için bir reverse proxy olarak yapılandıracak şekilde hazırlanmıştır. configMap’in oluştuğunu teyit edin;

`kubectl get configMap `{{execute}}

Aşağıdaki komutu kullanarak **nginx-config** configMap’ini bir nginx pod’una volume olarak bağlayın;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: volume-ornek
  template:
    metadata:
      labels:
        app: volume-ornek
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - mountPath: /etc/nginx
          readOnly: true
          name: nginx-conf
        - mountPath: /var/log/nginx
          name: log
      volumes:
      - name: nginx-conf
        configMap:
          name: nginx-conf
          items:
            - key: nginx.conf
              path: nginx.conf
      - name: log
        emptyDir: {}
EOF 
```{{execute}}

Aşağıdaki komutla deployment yaygınlaşma durumunu inceleyin;

`kubectl rollout status deployment nginx`{{execute}}

Yapılandırmayı inceleyerek **nginx-conf** içerisinde yer alan **nginx.conf**’un pod içerisinde **/etc/nginx** altına bağlandığını teyit edin.

Aşağıdaki komutla pod içerisindeki **/etc/nginx** dizinini listeleyin;

`APP_POD=$(kubectl get pods --selector=app=volume-ornek -o jsonpath={.items..metadata.name})`{{execute}}

`kubectl exec -it $APP_POD -- cat /etc/nginx/nginx.conf`{{execute}}

Komut çıktısı olarak **nginx-conf** içerisinde yer alan **nginx.conf**’un verildiğini teyit edin.

Aşağıdaki komutla uygulamayı NodePort üzerinden erişime açın;

```bash
cat <<EOF | kubectl create -f –
apiVersion: v1
kind: Service
metadata:
  name: nginx-volume-ornek
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
  selector:
    app: volume-ornek
EOF
```{{execute}}

Servis tanımı için atanan nodePort bilgisini aşağıdaki komutla **APP_PORT** değişkenine atayın;

`APP_PORT=$(kubectl get services nginx-volume-ornek -o=jsonpath='{.spec.ports[0].nodePort}')`{{execute}}

Curl komutu ile Kubernetes Cluster’ındaki bir node üzerinden yukarıda tespit ettiğiniz **APP_PORT**’a bir talep gönderin;

`curl 127.0.0.1:$APP_PORT`{{execute}}