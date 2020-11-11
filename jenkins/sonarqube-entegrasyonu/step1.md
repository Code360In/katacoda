# Ön Hazırlık

Bu senaryo için bir Jenkins, ssh agent ve SonarQube kurulum ve yapılandırması sizin için yapılmıştır. Sağ bölümde yer alan terminalden agent sunucusunda işlem yapabilirsiniz.

Jenkins arayüzüne sağ taraftaki **Jenkins UI** segmesinden, SonarQube arayüzüne **SonarQube UI** segmesinden sulaşabilirsiniz.

Giriş için ihtiyacınız olan kullanıcı adı ve şifreleri **Terminal**'de sizlere verilmiştir.

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

## SonarQube Scanner Kurulumu

DotNet projelerinin SonarQube tarafından statik kod analizi yapılabilmesi için sistemde **Sonar Scanner** kurulu olmalıdır. Aşağıdaki komutla Sonar Scanner kurulumunu gerçekleştirin;

`runuser -l jenkins -c "dotnet tool install --global dotnet-sonarscanner"`{{execute}}

## SonarQube Token

Jenkins'in statik kod analizi için SonarQube'u kullanabilmesi için bir token'a ihtiyacı bulunmaktadır. Bunun için **SonarQube UI** segmesine giderek SonarQube'e giriş yapın.

Ekranın sağ üst köşesinde yer alan **A** harfine tıklayarak açılan menüden **My Account**'u seçin. Açılan hesabım sayfasında **Security** segmesine geçiş yapın. **Tokens** bölümü altındaki **Generate Tokens** bölümünde değer olarak **Jenkins** girdikten sonra **Generate** butonuna basın. oluşan token'ı ilerleyen adımlarda kullanmak için not alın.

## Gerekli Eklentilerin Yüklenmesi ve Yapılandırması

Jekins UI segmesine giderek sisteme giriş yapın. Açılan ekranda **Manage Jenkins** / **Jenkins's Yönet** > **Manage Plugins** / **Eklentileri Yönet** > **Available** / **Kullanılabilir** patikası üzerinden kullanılabilir eklentiler ekranına gidin.

Arama bölümü kullanarak **XUnit** ve **SonarQube Scanner** eklentilerini bulup seçin. Sayfanın altında yer alan **Şimdi indir ve yeniden başlatıldıktan sonra yükle** butonuna basarak kurulumu tamamlayın.

**Eklentiler/yükseltmeler kuruluyor** sayfasında **Yükleme tamamlandığında ve bekleyen bir iş yoksa Jenkins'i yeniden başlat.** seçeneğini işaretleyin.

Eklentilerin yüklenmesi ardından **Manage Jenkins** / **Jenkins's Yönet** > **Sistem Konfigürasyonunu Değiştir** patikası üzerinden sistem yapılandırma sayfasına gidin.

Açılan yapılandırma sayfasında **SonarQube servers** bölümünü bulun. Bu bölümde yer alan **Environment variables** seçeneğini işaretleyin. **Add SonarQube** butonuna tıklayarak yeni bir SonarQube tanımı başlatın. 

Açılan **SonarQube installations** bölümünde **Name** alanına değer olarak **SonarQube** girin. **Server URL** alanına değer olarak aşağıdaki adresi girin;

`http://sonarqube:9000`

**Server authentication token** bölümünde yer alan **Add** butonuna tıklayın. Açılan **Add Credentials** ekranından **Kind** alanında **Secret text** değerini seçin. **Secret** alanına daha önce oluşturduğunuz SonarQube token'ını giriniz. **ID** alanına **sonarqube_token** yazın. **OK** tuşuna basarak kaydı oluşturun.

Bir önceki ekrana geri döndüğünüzde **Server authentication token** alan değeri olarak **sonarqube_token** seçiniz.

**Kaydet** butonuna basarak ayarları kaydedin.

## Kaynak kodları

Bu senaryoda kullanılacak temel kaynak kodları aşağıdaki adreste yer almaktadır;

`https://github.com/enterprisecoding-ltd/jenkins-ornek-dotnetcore`

Bu depodaki örnek java uygulamasına ait kodları kendi github reponuza kopyalayın.

Kopyaladığınız kendi github deposunda proje ana dizininde aşağıdaki içerikle **Jenkinsfile** dosyasını oluşturun;

```
pipeline {
    agent any
    
    environment {
        BUILD_NUM_ENV = currentBuild.getNumber()
    }

    stages {
        stage('Temizlik') { 
            steps {
                sh 'dotnet clean' 
            }
        }
        
        stage('Paket Yükleme') { 
            steps {
                sh 'dotnet restore' 
            }
        }

        stage('Derleme') { 
            steps {
                sh 'dotnet build --configuration Release --no-restore' 
            }
        }

        stage('Statik Kod Analizi') { 
            steps {
                sh 'dotnet clean'
                sh 'dotnet tool list -g'
                
                withSonarQubeEnv('SonarQube') {
                    sh '$HOME/.dotnet/tools/dotnet-sonarscanner begin /k:DotNetOrnek /n:"Örnek DotNet Core Uygulaması" /v:"$BUILD_NUM_ENV"'
                    sh 'dotnet build --no-restore'
                    sh '$HOME/.dotnet/tools/dotnet-sonarscanner end'
                }
            }
        }

        stage('Test') { 
            steps {
                sh 'dotnet test --logger:"trx;LogFileName=unit_tests.testresults"' 
            }
            post {
                always {
                    xunit([MSTest(deleteOutputFiles: true, failIfNotNew: true, pattern: '**/*.testresults', skipNoTestFiles: false, stopProcessingIfError: true)])
                }
            }
        }
    }
}
```

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
