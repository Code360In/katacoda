# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Operator Kurulumu

Jeager kurulumunun toplu olması adına aşağıdaki komutu çalıştırarak **observability** adında bir namespace oluşturun;

`kubectl create namespace observability`{{execute}}

Kurulumlarınızı bu namespace'te yapacaksınız.

Aşağıdaki komutla gerekli Jeager CustomResourceDefinition tanımlamalarını yapın;

`kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/crds/jaegertracing.io_jaegers_crd.yaml`{{execute}}

RBAC için gerekli tanımları gerçekleştirin.

Servis hesabını oluşturun;

`kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/service_account.yaml`{{execute}}

Rol'ü oluşturun;

`kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role.yaml`{{execute}}

RoleBinding'i oluşturun;

`kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role_binding.yaml`{{execute}}

Aşağıdaki komutla Cluster geneli rol oluşturun;

`kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role.yaml`{{execute}}

Bu rol için bir rolebinding oluşturun;

`kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role_binding.yaml`{{execute}}

Operator'ü tanımını yerele indirin;

`curl -L https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/operator.yaml -o operator.yaml`{{execute}}

**operator.yaml** dosyasını açarak bu bölümü;

```bash
        - name: WATCH_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
```

aşağıdaki şekilde değiştirin;

```bash
        - name: WATCH_NAMESPACE
          value:
```

Aşağıdaki komutla **operator.yaml**  dosyasını uygulayın;

`kubectl create -n observability -f operator.yaml`{{execute}}

Aşağıdaki komutla deployment'ın yaygınlaşmasını bekleyin;

`kubectl rollout status deployment jaeger-operator -n observability`{{execute}}

Bu adımlar ardından Jeager operator'ü kullanıma hazır olacaktır.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
