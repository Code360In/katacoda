# Konteyner Imajını Oluşturma

Ata imaj kullanılarak konteyner imajını hazırlamanız ardından sırada dağıtabileceğiniz konteyner'ı oluşturmakta. Aşağıdaki komutu çalıştırarak değişiklikleri mühürleyin;

`docker container commit nginx_base_konteyner enterprisecoding-webserver`{{execute}}

Bu komut yaptığınız değişikliklerle **enterprisecoding-webserver** adıyla yeni bir konteyner imajı oluşturdu. Aşağıdaki komutla yerelde bulunan konteyner imajlarını listeleyebilirsiniz;

`docker images`{{execute}}

Aşağıdaki komutu çalıştırarak bu imaj ile bir konteyner başlatın;

`docker container run -d --name webserver_konteyner -p 8000:80 enterprisecoding-webserver`{{execute}}

**8000 Portu** tabında Konteyner'da yer alan dosyanın sunulduğunu görebilirsiniz.
