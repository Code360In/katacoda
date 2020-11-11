# Birim Testlerinin Çalıştırılması

Projede yer alan birim testlerinin çalıştırılması için Jenkinsfile dosyasını aşağıdaki şekilde güncelleyin;

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

Pipeline tanımında yer alan **Test** adımı dotnet core testlerini çalıştıracaktır. Bu adımın başarılı sonlanması ardından **post** adımında birin testler yayınlanacaktır.

Bu değişiklik ardından Jenkins arayüzünden **Pipeline IlkJava** ekranında sol bölümde yer alan **Şimdi Yapılandır** butonuna basarak pipeline'ı başlatın.

Yapılandırmanın tamamlanması ardından **Stage View** bölümünde **Build** yanında artık **Test** adımınında yer aldığını, **Test Sonuçları Eğilimi** eklendiğini teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.