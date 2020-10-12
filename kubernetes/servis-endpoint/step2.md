## Endpoint'ler

Aşağıdaki komutla endpoint’ler listeleyin;

`kubectl get endpoints`{{execute}}

uygulama-servisi-np endpoint’inde sadece **Running** statüsündeki pod'lara ait ip'lerin olduğunu teyit edin.

Aşağıdaki komutla **uygulama-servisi-np** endpoint detayını görüntüleyin;

`kubectl describe endpoints uygulama-servisi-np`{{execute}}

Gelen açıklamada **NotReadyAddresses** bölümünün olduğunu teyit edin. Bu bölümde hazır olmayan pod’lara ait ip adresleri yer almaktadır. Teyit etmek için aşağıdaki komutu çalıştırın;

`kubectl get pods -o wide`{{execute}}

Hazır olmayan pod ip adresinin bir önceki çıktıda yer alan ip ile aynı olduğunu teyit edin.