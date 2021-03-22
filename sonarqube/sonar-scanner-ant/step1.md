# Ortam

Sizin adınıza lab ortamına SonarQube kurulumu yapılmıştır. Yan tarafta yer alan **SonarQube** segmesi üzerinden arayüze ulaşabilirsiniz. Ant üzerinde Statik kod analizi yapılacak olan örnek java uygulama kodları sizin için home dizin altında **uygulama** dizini altına kopyalanmıştır.

Aşağıdaki komutla uygulama dizinine geçin;

`cd uygulama`{{execute}}

Aşağıdaki komutla uygulama dizinlerini inceleyin;

`ls -al`{{execute}}

Aşağıdaki komutla uygulama kodlarını inceleyin;

`ls -al src`{{execute}}

Farklı programlama dillerine ait ayrı ayrı dizinler olduğunu teyit edin.

# Ön Gereksinimler

## Ant Kurulumu

Aşağıdaki komutla java uygulaması derlemede ve statik kod analizinde yardımcı olacak Ant kurulumunu yapın;

`sudo apt install -y ant`{{execute}}

Kurulumu doğrulamak için aşağıdaki komutu çalıştırın;

`ant -version`{{execute}}

## SonarQube Ant Task Kurulumu

Ant içerisinde SonarScanner'ı kolayca kullabilmek için bir ant task'ı bulunmaktadır. Aşağıdaki adımlarla bu task'ın tanımlı olduğu jar dosyasını hazırlayın.

Jar dosyasının yer alacağı dizini oluşturun;

`mkdir /opt/sonarqube-ant`{{execute}}

SonarQube web sitesinden ant için hazırlanmış jar dosyasını oluşturduğunuz dizine indirin;

`wget https://binaries.sonarsource.com/Distribution/sonarqube-ant-task/sonarqube-ant-task-2.7.0.1612.jar -O /opt/sonarqube-ant/sonarqube-ant-task-2.7.0.1612.jar`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
