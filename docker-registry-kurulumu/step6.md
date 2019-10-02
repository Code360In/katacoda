# Kubernetes Entegrasyonu

Takip ettiğimiz adımlar ardından Docker Registry'si üretim ortamında kullanıma hazırdır.

Docker Registery'sinde kullanıcı yetkilendirmesi aktif durumda olduğu için Kubernetes Cluster'ının kullanım için kullanıcı bilgilerini bilmesi gerekmektedir. Bu sebeple kullanıcı adı ve şifre bilgileri Kubernetes içerisine bir __secret__ olarak eklenmelidir.

Bir önceki adımda test için Docker login işlemi yapıldığında kullanıcı bilgileri home klasörü altındaki **.docker/config.json** dosyasına yazıldı. Aşağıdaki komut çalıştırılarak  **~/.docker/config.json** dosyasını kullanarak Kubernetes için gerekli secret tanımını oluşturulur;

`kubectl create secret generic registry-cred --from-file=.dockerconfigjson=/root/.docker/config.json --type=kubernetes.io/dockerconfigjson`{{execute MASTER}}

Oluşturulan __secret__ yardımıyla gerekli Docker imajlarının çekilmesi için **imagePullSecrets** kullanılır. Aşağıdaki komut yardımıyla önceki adımlarda Docker Registry'sine eklediğimiz __hello-world__ imajının kullanılacağı bir deployment oluşturulabilir;

`cat > ornek.yaml << EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-registry
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-registry
  template:
    metadata:
      labels:
        app: hello-registry
    spec:
      containers:
      - name: hello-registry
        image: $NODE_IP:$NODE_PORT/hello-world:latest
        ports:
        - containerPort: 8080
      imagePullSecrets:
      - name: registry-cred
EOF`{{execute}}

Oluşturulan __ornek.yaml__ dosyası yardımıyla deployment oluşturulur;

`kubectl apply -f ornek.yaml`{{execute MASTER}}
