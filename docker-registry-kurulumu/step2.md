# Docker Yapılandırması

Kubernetes Cluster'ı üzerinden Docker Registery'nin oluşturulması ardından sırada registry'nin Cluster'ımızdaki Docker'lar tarafından tanınmasına. Bu işlem için Docker Registry adresimiz Docker `insecure registries` listesine eklenmelidir. Bu amaçla /etc/docker/daemon.json dosyasına aşağıdaki girdi eklenmelidir;

`"insecure-registries" : ["DOCKER_REGISTRY ADRESİ"]`

Aşağıdaki komutu çalıştırarak eklenecek tam ifadeyi görebilirsiniz;

`echo "\"insecure-registries\" : [\"$NODE_IP:$NODE_PORT\"]`{{execute MASTER}}

Bu ifade **/etc/docker/daemon.json** dosyası içerisine eklenmelidir. Örneğin;

` `

Aşağıdaki komut yardımıyla `master` node'da **/etc/docker/daemon.json** dosyasını düzenleyiniz;

`nano /etc/docker/daemon.json`{{execute MASTER}}

Değişiklik ardından `master` node'da Docker servisi yeniden başlatılır;

`service docker restart`{{execute MASTER}}

Benzer şekilde aşağıdaki komut yardımıyla `node01` node'dunda **/etc/docker/daemon.json** dosyasını düzenleyiniz;

`nano /etc/docker/daemon.json`{{execute NODE01}}

Değişiklik ardından `node01` node'dunda Docker servisi yeniden başlatılır;

`service docker restart`{{execute NODE01}}

**Continue** butonuna basarak kurulum test adımına geçebilirsiniz.
