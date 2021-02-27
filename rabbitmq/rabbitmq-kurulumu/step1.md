# Repository Tanımlama

Kuruluma başlarken öncelikli olarak gerekli repository'ler sistemde tanımlanmalıdır. Bu amaçla aşağıdaki adımları takip edin.

## Repository İmza Anahtarı

Bir güvenlik açığına izin vermemek adına, kullanılacak olan depoya ilişkin imzalama anahtarını aşağıdaki komutla tanımlayın;

`curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add -`{{execute}}

## APT Güvenli İletişimini Aktive Edin 

**BinTray** üzerinde tutulan RabbitMQ ve Erlang paketlerini kurabilmek için __apt-transport-https__ paketini aşağıdaki komutla kurun;

`sudo apt-get install apt-transport-https`{{execute}}

## Kaynak Listesi Dosyasının Eklenmesi

Tüm 3. parti apt depoları için, deponun tanımlandığı bir dosya **/etc/apt/sources.list.d/** dizini altında yer almalıdır. 

### Erlang Deposu Tanımlama

Aşağıdaki komut kullanarak **/etc/apt/sources.list.d/bintray.erlang.list** dosyasını oluşturun;

```bash
cat > /etc/apt/sources.list.d/bintray.erlang.list <<EOF
deb https://dl.bintray.com/rabbitmq-erlang/debian \$distribution erlang
EOF
```{{execute}}

### RabbitMQ Deposu Tanımlama

Aşağıdaki komut kullanarak **/etc/apt/sources.list.d/bintray.rabbitmq.list** dosyasını oluşturun;

```bash
cat > /etc/apt/sources.list.d/bintray.rabbitmq.list <<EOF
deb https://dl.bintray.com/rabbitmq/debian \$distribution main
EOF
```{{execute}}

## Depo Kaynak Listesi Güncelleme

Bu tanımlama ardından apt kaynak listesini güncellemek için aşağıdaki komutu çalıştırın;

`sudo apt-get update -y`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
