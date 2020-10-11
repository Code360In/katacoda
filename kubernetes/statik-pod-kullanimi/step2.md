# Pod Manifest Dizini

Worker node’da ssh oturumu başlatırlır;

`ssh node01`{{execute}}

Başlatılan ssh oturumunda aşağıdaki komut çalıştırılarak **/etc/kubelet.d** dizini oluşturulur;

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

Oluşturduğumuz dizinin kubelet tarafından izlenmesi için **/lib/systemd/system/kubelet.service** dosyası düzenlenmek üzere açın;

`vi /lib/systemd/system/kubelet.service`{{execute}}

Dosyada **[Service]** başlığının hemen altına aşağıdaki içeriği ekleyin;

`Environment=KUBELET_EXTRA_ARGS="--pod-manifest-path=/etc/kubelet.d/"`

Örneğin;

```bash
...
[Service]
Environment=KUBELET_EXTRA_ARGS="--pod-manifest-path=/etc/kubelet.d/"
ExecStart=/usr/bin/kubelet
Restart=always
...
```

pod-manifest-path parametresi ile izlenecek dizin bilgisini kubelet’e iletilmiş olur.

Değişikliklerin algılanması için aşağıdaki komutu çalıştırın;

`systemctl daemon-reload`{{execute}}

kubelet servisi yeniden başlatılır;

`systemctl restart kubelet`{{execute}}

Kısa bir süre sonrasında pod başlatılacaktır. Worker node üzerinde aşağıdaki komutla çalışan konteyner’lar arasından oluşturduğumuz pod aşağıdaki komutla görülür;

`docker ps | grep static-web-sunucusu`{{execute}}

Kubectl yardımıyla default namespace’inde çalışan pod teyit edin;

`kubectl get pods`{{execute}}

Aşağıdaki komutla pod'u silin;

`kubectl delete pod static-web-sunucusu-node01`{{execute}}

Yeni bir pod'un otomatik olarak başladığını teyit edin;

`kubectl get pods`{{execute}}

Worker node’da aşağıdaki komutla nginx manifest dosyası silinir;

`rm -f /etc/kubelet.d/static-web-sunucusu.yaml`{{execute}}

kubectl ile yeniden pod listesi çekilerek nginx pod’un silindiği tespit edilir;

`kubectl get pods`{{execute}}

Yapılandırmaları eski haline getirmek için **/lib/systemd/system/kubelet.service** dosyası aşağıdaki içerikle eski haline geri getirilir;

`Environment=KUBELET_EXTRA_ARGS=`

Değişikliklerin algılanması için aşağıdaki komutu çalıştırın;

`systemctl daemon-reload`{{execute}}

kubelet servisi yeniden başlatılır;

`systemctl restart kubelet`{{execute}}

manifest’ler için hazırladığımız **/etc/kubelet.d** dizini silinir;

`rm -rf /etc/kubelet.d/`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.