# İlk Güvenlik Politikanızı Oluşturun

Bu adımda politikanızı daha güvenli bir Docker ortamı oluşturmak için nasıl kullanabileceğinizi deneyimleyeceksiniz.

## 'privileged' Kullanımına İzin Verme

Docker imajlarını tüm yetenekler ile çalıştırabilmemize olanak sunan `--privileged` parametresinini kullanımına izin vermeyeceksiniz. Aşağıdaki komutu çalıştırarak **authz.rego** dosyasını yeni politika ile güncelleyin;

```bash
cat > /etc/docker/policies/authz.rego <<EOF
package docker.authz
  
default allow = false

allow {
    not deny
}

deny {
    is_privileged
}

is_privileged {
    input.Body.HostConfig.Privileged == true
}
EOF
```{{execute}}

Yeni politika Docker tarafından iletilen bilgilerde Privileged değerinin true olması durumunda işleme izin vermeyecektir.

Aşağıdaki komut ile Alpine containerı içerisinde bir shell oturumu başlatın;

`docker run --privileged alpine sh`{{execute}}

herhangi bir problem olmayacaktır. Öte yandan aşağıdaki komutu çalıştırmanıza Docker izin vermeyecektir;

`docker run --privileged alpine sh`{{execute}}