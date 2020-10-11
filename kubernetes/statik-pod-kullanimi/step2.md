# Pod Manifest Dizini

Bir worker node’da ssh oturumu başlatırlır. Başlatılan ssh oturumunda aşağıdaki komut çalıştırılarak **/etc/kubelet.d** dizini oluşturulur;

`mkdir /etc/kubelet.d`{{execute}}

Bu dizin statik pod’lara ait manifest dosyalarının bir arada tutulması için kullanılacaktır.

Aşağıdaki komut ile bu dizin içerisinde bir nginx konteyner’ı barındıran pod tanım dosyası oluşturulur.

```bash
cat <<EOF >/etc/kubelet.d/static-web-sunucusu.yaml
apiVersion: v1
kind: Pod
metadata:
  name: static-web-sunucusu
spec:
  containers:
    - name: web
      image: nginx
      ports:
        - name: web
          containerPort: 80
          protocol: TCP
EOF
```{{execute}}

Oluşturduğumuz dizinin kubelet tarafından izlenmesi için **/etc/sysconfig/kubelet** dosyası düzenlenmek üzere açılır. Dosya içeriği aşağıdaki şekilde düzenlenir;

`KUBELET_EXTRA_ARGS="--pod-manifest-path=/etc/kubelet.d/"`

pod-manifest-path parametresi ile izlenecek dizin bilgisini kubelet’e iletilmiş olur.

Değişikliklerin algılanması için kubelet servisi yeniden başlatılır;

`systemctl restart kubelet`{{execute}}

Kısa bir süre sonrasında pod başlatılacaktır. Worker node üzerinde aşağıdaki komutla çalışan konteyner’lar arasından oluşturduğumuz pod aşağıdaki komutla görülür;

`docker ps | grep static-web-sunucusu`{{execute}}

Kubectl yardımıyla default namespace’inde çalışan pod teyit edilir;

`kubectl get pods`{{execute}}

Worker node’da aşağıdaki komutla nginx manifest dosyası silinir;

`rm -f /etc/kubelet.d/static-web-sunucusu.yaml`{{execute}}

kubectl ile yeniden pod listesi çekilerek nginx pod’un silindiği tespit edilir;

`kubectl get pods`{{execute}}

Yapılandırmaları eski haline getirmek için /etc/sysconfig/kubelet dosyası aşağıdaki içerikle eski haline geri getirilir;

`KUBELET_EXTRA_ARGS=`

Değişikliklerin algılanması için kubelet servisi yeniden başlatılır;

`systemctl restart kubelet`{{execute}}

manifest’ler için hazırladığımız **/etc/kubelet.d** dizini silinir;

`rm -rf /etc/kubelet.d/`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.