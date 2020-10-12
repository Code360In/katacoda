## Endpoint'ler

Aşağıdaki komutla endpoint’ler listeleyin;

`kubectl get endpoints`{{execute}}

uygulama-servisi ve uygulama-servisi-np endpoint’lerinin aynı küme değerine sahip olduğunu teyit edin.

Aşağıdaki komutla **uygulama-servisi-np** endpoint detayını görüntüleyin;

`kubectl describe endpoints uygulama-servisi-np`{{execute}}

Gelen açıklamada **NotReadyAddresses** bölümünün olduğunu teyit edin. Bu bölümde hazır olmayan pod’lara ait ip adresleri yer almaktadır. Teyit etmek için aşağıdaki komutu çalıştırın;

`kubectl get pods -o wide`{{execute}}

Hazır olmayan pod ip adresinin bir önceki çıktıda yer alan ip ile aynı olduğunu teyit edin.