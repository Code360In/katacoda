# HotRod Örnek Uygulama Kurulumu

Aşağıdaki komutla HotRod uygulaması için deployment tanımı yapılır;

```bash
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hotrod
  labels:
    app.kubernetes.io/component: hotrod
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/component: hotrod
  template:
    metadata:
      labels:
        app.kubernetes.io/component: hotrod
    spec:
      containers:
      - name: hotrod
        image: jaegertracing/example-hotrod:1.20.0
        imagePullPolicy: Always
        env:
        - name: JAEGER_AGENT_HOST
          value: jaeger-temel-kurulum-agent
        - name: JAEGER_AGENT_PORT
          value: "6831"
        ports:
        - name: http
          containerPort: 8080
          protocol: TCP
        livenessProbe:
          httpGet:
            path: /
            port: http
        readinessProbe:
          httpGet:
            path: /
            port: http
EOF
```{{execute}}

Aşağıdaki komutu çalıştırarak uygulama için servis tanımı yapılır;

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Service
metadata:
  name: hotrod
  labels:
    app.kubernetes.io/component: hotrod
spec:
  type: NodePort
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: http
    nodePort: 31256
  selector:
    app.kubernetes.io/component: hotrod
EOF
```{{execute}}

Aşağıdaki komutla deployment'ın yaygınlaşması beklenir;

`kubectl rollout status deployment hotrod`{{execute}}

Uygulama arayüzü **31256** portu üzerinden yayına hazır olacaktır.

Sağ taraftaki tablardan **HotRod UI** tabına geçiş yaparak arayüze ulaşabilirsiniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.