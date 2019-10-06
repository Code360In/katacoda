# Docker Yapılandırması

Kubernetes Cluster'ı üzerinden Docker Registery'nin oluşturulması ardından sırada registry'nin Cluster'ımızdaki Docker'lar tarafından tanınmasına. Bu işlem için Docker Registry adresimiz Docker `insecure registries` listesine eklenmelidir. Bu amaçla /etc/docker/daemon.json dosyasına aşağıdaki girdi eklenmelidir;

`"insecure-registries" : ["DOCKER_REGISTRY_ADRESİ"]`

Aşağıdaki komutu çalıştırarak eklenecek tam ifadeyi görebilirsiniz;

`echo "\"insecure-registries\" : [\"$NODE_IP:$NODE_PORT\"]"`{{execute HOST1}}

Bu ifade **/etc/docker/daemon.json** dosyası içerisine eklenmelidir. Örneğin;

```bash
{
    "exec-opts": ["native.cgroupdriver=systemd"],
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "100m"
    },
    "bip": "172.18.0.1/24",
    "storage-driver": "overlay",
    "hosts": ["unix://var/run/docker.sock","tcp://0.0.0.0:2375","tcp://0.0.0.0:2345", "fd://"],
    "insecure-registry": ["registry.test.training.katacoda.com:4567", "DOCKER_REGISTRY_ADRESİ"]
}
```

Aşağıdaki komut yardımıyla `master` node'da **/etc/docker/daemon.json** dosyasını düzenleyiniz;

`nano /etc/docker/daemon.json`{{execute HOST1}}

Değişiklik ardından `master` node'da Docker servisi yeniden başlatılır;

`service docker restart`{{execute HOST1}}

Benzer şekilde aşağıdaki komut yardımıyla `node01` node'dunda **/etc/docker/daemon.json** dosyasını düzenleyiniz;

`nano /etc/docker/daemon.json`{{execute HOST2}}

Değişiklik ardından `node01` node'dunda Docker servisi yeniden başlatılır;

`service docker restart`{{execute HOST2}}

**Continue** butonuna basarak kurulum test adımına geçebilirsiniz.
