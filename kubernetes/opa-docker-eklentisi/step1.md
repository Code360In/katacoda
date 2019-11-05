# Kurulum Bilgisi

Open Policy Agent Docker eklentisini kurabilmeniz için bir node hazırlanmıştır. Open Policy Agent eklenti kurulumu için ihtiyaç duyacağınız `Docker` gibi araçlar kuruludur. Sağ bölümde Open Policy Agent Docker eklentisinin kurulacağı `node01` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

## Politika dizini İlk Politika

Kuruluma başlarken yapılması gereken ilk adım politikanın bulunacağı dizini aşağıdaki komutla oluşturmaktadır;

`mkdir -p /etc/docker/policies`{{execute MASTER}}

Ardında aşağıdaki komut yardımıyla **/etc/docker/policies/authz.rego** dosyası en basit haliyle bir erişim politikası ile oluşturulur;

```bash
cat <<EOF >> /etc/docker/policies/authz.rego
package docker.authz

allow = true
EOF
```{{execute}}

Dosya içerisinde yer alan politika Docker'a ne komut çalıştırılırsa çalıştırılsın izin vermesini söyleyecektir.

## Opa-docker-authz eklentisi Kurulumu

Varsayılan olarak herşeye izin veren politika dosyasını oluşturduktan sonra aşağıdaki komutla Docker `opa-docker-authz` eklentisini kurun;

`docker plugin install openpolicyagent/opa-docker-authz-v2:0.4 opa-args="-policy-file /opa/policies/authz.rego"`{{execute}}

Eklentiyi kurduktan sonra aşağıdaki komutu çalıştırarak Docker'a bu eklentiyi yetkilendirme eklentisi olarak kullanması gerektiğini belirtin;

```bash
cat > /etc/docker/daemon.json <<EOF
{
    "authorization-plugins": ["openpolicyagent/opa-docker-authz-v2:0.4"]
}
EOF
```{{execute}}

Docker'ı eklentiyi yüklemesi için aşağıdaki komutla sonlandırın. Merak etmeyin servis otomatik olarak yeniden başlayacaktır.

`kill -HUP $(pidof dockerd)`{{execute}}

Her şeyin yolunda gittiğini aşağıdaki komutla kontrol edebilirsiniz;

`docker ps`{{execute}}

Bu adımlar ardından Open Policy Agent Docker yetkilendirme eklentisi kurulu ve yapılandırılmış durumdadır. Her şeye izin ver dediğimiz için sadece henüz bir etkisini göremediniz.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
