# Rancher Kurulumu

Kurulum yapılacak olan **cattle-system** namespace'ini oluşturun;

`kubectl create namespace cattle-system`{{execute}}

Aşağıdaki komutu çalıştırarak en son Rancher Chart'ları deposunu helm depoları arasına ekleyin;

`helm repo add rancher-latest https://releases.rancher.com/server-charts/latest`{{execute}}

Rancher kurulumu yapılacak olan **cattle-system** namespace'ini oluşturun;

`helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

## Kurulum Kontrolü

Aşağıdaki komutla deployment’ın hazır olması bekleyin;

`kubectl -n cattle-system rollout status deploy/rancher`{{execute}}

Aşağıdaki komutla Rancher arayüzünün hazır olmasını bekleyin;

`while true; do curl -sLk https://127.0.0.1/ping && break; printf "."; sleep 2; done`{{execute}}

**Rancher UI** segmesine geçerek Rancher Dasboard sayfasını açın. Açılan sayfada şifre ayarlayın ve **continue** butonuna basın.

Bu adımlar ardından rancher kullanıma hazırdır.