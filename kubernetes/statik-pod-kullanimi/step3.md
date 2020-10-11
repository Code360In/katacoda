# Web’de Sunulan Pod Manifesti

Bu adımda github üzerinde yer alan manifest dosyasının kubelet tarafından takip edilerek node üzerinde statik pod oluşturulması sağlanacak.

Github’da yer alan manifest dosyasının kubelet tarafından izlenmesi için **/lib/systemd/system/kubelet.service** dosyası düzenlenmek üzere açılır. 

`vi /lib/systemd/system/kubelet.service`{{execute}}

Dosyada **[Service]** başlığının hemen altına aşağıdaki içeriği ekleyin;

`Environment=KUBELET_EXTRA_ARGS="--manifest-url=https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/pod/statik-web-sunucusu.yaml"`

Örneğin;

```bash
...
[Service]
Environment=KUBELET_EXTRA_ARGS="--manifest-url=https://raw.githubusercontent.com/enterprisecoding-ltd/k8s-ornekleri/master/pod/statik-web-sunucusu.yaml"
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

Kubectl yardımıyla default namespace’inde çalışan pod teyit edilir;

`kubectl get pods`{{execute}}

Yapılandırmaları eski haline getirmek için **/lib/systemd/system/kubelet.service** dosyası aşağıdaki içerikle eski haline geri getirilir;

`Environment=KUBELET_EXTRA_ARGS=`

Değişikliklerin algılanması için aşağıdaki komutu çalıştırın;

`systemctl daemon-reload`{{execute}}

kubelet servisi yeniden başlatılır;

`systemctl restart kubelet`{{execute}}