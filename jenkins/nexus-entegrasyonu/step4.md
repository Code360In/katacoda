# Birim Testlerinin Çalıştırılması

Projede yer alan birim testlerinin çalıştırılması için Jenkinsfile dosyasını aşağıdaki şekilde güncelleyin;

```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}
```

Pipeline tanımında yer alan **Test** adımı java testlerini çalıştıracaktır. Bu adımın başarılı sonlanması ardından **post** adımında birin testler yayınlanacaktır.

Bu değişiklik ardından Jenkins arayüzünden **Pipeline IlkJava** ekranında sol bölümde yer alan **Şimdi Yapılandır** butonuna basarak pipeline'ı başlatın.

Yapılandırmanın tamamlanması ardından **Stage View** bölümünde **Build** yanında artık **Test** adımınında yer aldığını, **Test Sonuçları Eğilimi** eklendiğini teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.