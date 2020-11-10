# Uygulama Teslimatı

Kullanıma hazır duruma getirilen projenin teslimatı için Jenkinsfile dosyasını aşağıdaki şekilde güncelleyin;

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
        stage('Deliver') { 
            steps {
                sh './scripts/deliver.sh' 
            }
        }
    }
}
```

Ek olarak proje ana dizininde **scripts** adıyla yeni bir dizin oluşturarak altında aşağıdaki içerikle **deliver.sh** dosyasını oluşturun;

```
#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java application'
echo 'into the local Maven repository, which will ultimately be stored in'
echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
echo 'volume).'
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following complex command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'The following complex command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

echo 'The following command runs and outputs the execution of your Java'
echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
java -jar target/${NAME}-${VERSION}.jar

```

Bu değişiklik ardından Jenkins arayüzünden **Pipeline IlkJava** ekranında sol bölümde yer alan **Şimdi Yapılandır** butonuna basarak pipeline'ı başlatın.

Yapılandırmanın tamamlanması ardından **Stage View** bölümünde **Test** yanında artık **Deliver** adımınında yer aldığını teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.