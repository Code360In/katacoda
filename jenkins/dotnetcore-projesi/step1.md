# Ön Hazırlık

Bu senaryo için bir Jenkins ve ssh agent kurulum ve yapılandırması sizin için yapılmıştır. Sağ bölümde yer alan terminalden agent sunucusunda işlem yapabilirsiniz.

Jenkins arayüzüne sağ taraftaki **Jenkins UI** segmesinden ulaşabilirsiniz.

Giriş için ihtiyacınız olan kullanıcı adı ve şifresi **Terminal**'de sizlere verilmiştir.

## DotNet Core Kurulumu

CI akışı tanımlanacak olan DotNet Core projesinin derlenebilmesi için öncelikle agent makinesine Dotnet Core kurulmalıdır. 

Aşağıdaki komut ile DotNet Core deposunu tanımlayacak paketi indirin;

`wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb`{{execute}}

Yerelen indirdiğiniz paketi aşağıdaki komutla kurarak depo tanımlarını yapın;

`sudo dpkg -i packages-microsoft-prod.deb`{{execute}}

Depo tanımlarını güncelleyin;

`sudo apt-get update`{{execute}}

Ön gereksinim olarak **apt-transport-https** paketini kurun;

`sudo apt-get install -y apt-transport-https`{{execute}}

Depo tanımlarını yeniden güncelleyin;

`sudo apt-get update`{{execute}}

DotNet Core 3.1 kurulumunu yapın;

`sudo apt-get install -y dotnet-sdk-3.1`{{execute}}

## Kaynak kodları

Bu senaryoda kullanılacak temel kaynak kodları aşağıdaki adreste yer almaktadır;

`https://github.com/enterprisecoding-ltd/jenkins-ornek-dotnetcore`

Bu depodaki örnek java uygulamasına ait kodları kendi github reponuza kopyalayın.

Kopyaladığınız kendi github deposunda proje ana dizininde aşağıdaki içerikle **Jenkinsfile** dosyasını oluşturun;

```
pipeline {
    agent any

    stages {
        stage('Paket Yükleme') { 
            steps {
                sh 'dotnet restore' 
            }
        }

        stage('Derleme') { 
            steps {
                sh 'dotnet build --configuration Release' 
            }
        }
    }
}
```

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
