# DNS Kaynaklı Sorunlarının Tespiti

DNS ile ilgili bir problem yaşanması durumunda sırasıyla aşağıdaki incelemeler yapılmalıdır.

## resolv.conf Dosyası

dnsutils pod’unda yer alan **/etc/resolv.conf**  dosyası aşağıdaki komutla incelenir;

`kubectl exec -ti dnsutils -- cat /etc/resolv.conf`{{execute}}

Bu dosyada **nameserver**, **search** ve **ndots** gibi yapılandırmaları barındırmaktadır. Buradaki hatalı bir bilgi DNS çözümlemesini engelleyecektir.

## DNS Pod’ları

DNS hizmeti aldığınız eklentiye göre ilgili DNS pod’larının durumu kontrol edilir;

Core-DNS için;

`kubectl get pods --namespace=kube-system -l k8s-app=kube-dns`{{execute}}

Bu podların log’ları olası bir hata durumuna ilişkin incelenir;

`for p in $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name); do kubectl logs --namespace=kube-system $p; done`{{execute}}

## DNS Servisi

DNS servisinin hizmet verir durumda olduğu kontrol edilir;

`kubectl get svc --namespace=kube-system`{{execute}}

Servis ip adresi ile resolv.conf dosyasındaki nameserver adresinin aynı olduğu kontrol edin.

## DNS Endpoint’i

DNS endpoint’lerinin acıdığı kontrol edin;

`kubectl get ep kube-dns --namespace=kube-system`{{execute}}

## Temizlik

Aşağıdaki komutlar yardımıyla pod, deployment ve servis kayıtları silinir;

`kubectl delete pod http-server-istemci`{{execute}}

`kubectl delete deployment http-server-deployment`{{execute}}

`kubectl delete svc http-server-service`{{execute}}