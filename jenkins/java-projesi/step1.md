# Ortam

Bu senaryo için bir Jenkins ve ssh agent kurulum ve yapılandırması sizin için yapılmıştır. Sağ bölümde yer alan terminalden agent sunucusunda işlem yapabilirsiniz.

Jenkins arayüzüne sağ taraftaki **Jenkins UI** segmesinden ulaşabilirsiniz.

Giriş için ihtiyacınız olan kullanıcı adı ve şifresi **Terminal**'de sizlere verilmiştir.

## Kaynak kodları

Bu senaryoda kullanılacak temel kaynak kodları aşağıdaki adreste yer almaktadır;

`https://github.com/fatihboy/jenkins-java-maven-app`

Bu depodaki örnek java uygulamasına ait kodları kendi github reponuza kopyalayın.

Kopyaladığınız kendi github deposunda proje ana dizininde aşağıdaki içerikle **Jenkinsfile** dosyasını oluşturun;

```
pipeline {
    agent any

    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}
```

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
