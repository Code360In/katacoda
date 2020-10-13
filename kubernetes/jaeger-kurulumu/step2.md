# Jeager All-In-One Kurulumu

Aşağıdaki komut yardımıyla Jeager All-In-One kurulumunu sağlayan CRD tanımını oluşturun;

```bash
cat <<EOF | kubectl create -f -
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: jaeger-temel-kurulum
EOF
```{{execute}}

Aşağıdaki komutla jaeger tanımlarını listeleyin;

`kubectl get jaegers`{{execute}}

Aşağıdaki komutla jaeger-temel-kurulum'a ait pod'ları listeleyin;

`kubectl get pods -l app.kubernetes.io/instance=jaeger-temel-kurulum`{{execute}}

Pod'lara ait logları aşağıdaki komutla görüntüleyin;

`kubectl logs -l app.kubernetes.io/instance=simplest`{{execute}}

bir kaç dakika içerisinde Jaeger arayüzü **16686** portu üzerinden yayına hazır olacaktır.

Sağ taraftaki tablardan **Jaeger UI** tabına geçiş yaparak arayüze ulaşabilirsiniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.