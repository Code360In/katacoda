## RKE Kurulumu

İlk sunucuda aşağıdaki komutla **rancher-cluster.yml** dosyası oluşturun;

```bash
cat <<EOT >> rancher-cluster.yml
nodes:
- address: master
  user: rancher
  role: ['controlplane', 'etcd']
- address: node01
  user: rancher
  role: ['worker']
EOF
```{{execute HOST1}}

Aşağıdaki komutla RKE kurulumunu başlatın;

`rke up --config ./rancher-cluster.yml`{{execute HOST1}}

## Kubectl’i Hazırlama

Kurulum ardından aşağıdaki komutlarla kubectl kullanıma hazırlayın;

`mkdir -p $HOME/.kube`{{execute HOST1}}
`cp -i kube_config_rancher-cluster.yml $HOME/.kube/config`{{execute HOST1}}
`chown $(id -u):$(id -g) $HOME/.kube/config`{{execute HOST1}}

Aşağıdaki komutla node'ların durumunu kontrol edin;

`kubectl get nodes`{{execute HOST1}}