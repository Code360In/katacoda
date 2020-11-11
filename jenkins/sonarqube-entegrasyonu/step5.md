# Analiz Sonucu Etkiler

SonarQube UI segmesine geçin. Açılan ekranda **Administration** > **Configuration** > **WebHooks** ekranına geçin.

Açılan ekranda **Create** butonuna basarak yeni web hook ekranına geçin. Bu ekranda **Name** alanına **Jenkins-WebHook** değeri, **URL** alanına ise aşağıdaki değeri verin

`http://jenkins:8080/sonarqube-webhook/`

**Create** butonuna basarak webhook'u oluşturun.

Kaynak kod sunucusunda Pipeline dosyasını aşağıdaki şekilde güncelleyin;

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
        
        stage("Kalite Kapısı") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
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

Jenkins arayüzüne geçerek işi yeniden yapılandırın. Jenkins'in pipeline sonucusunu beklediğini teyit edin.

PrimeService/PrimeService.cs dosya içerisine 9. satırına yeniden aşağıdaki şekilde ekleme yapın;

`int kullanilmayan_ve_uzun_bir_isme_sahip_degisken_2 = 1;`

Jenkins arayüzüne geçerek DotNetAnaliz projesini yeniden yapılandırın. İşlemin **Kalite Kapısı** adımında başarısızlıkla sonuçlandığını teyi edin.

SonarQube arayüzüne geçerek statik kod analizinin de başarısız olarak sonuçlandığını teyit edin.