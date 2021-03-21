# Ortam

Sizin adınıza lab ortamına SonarQube kurulumu yapılmıştır. Yan tarafta yer alan **SonarQube** segmesi üzerinden arayüze ulaşabilirsiniz. Statik kod analizi yapılacak olan örnek uygulama kodları sizin için home dizin altında **uygulama** dizini altına kopyalanmıştır.

Aşağıdaki komutla uygulama dizinine geçin;

`cd uygulama`{{execute}}

Aşağıdaki komutla uygulama dizinlerini inceleyin;

`ls -al`{{execute}}

Aşağıdaki komutla uygulama kodlarını inceleyin;

`ls -al src`{{execute}}

Farklı programlama dillerine ait ayrı ayrı dizinler olduğunu teyit edin.

# Statik Kod Analizi Özellikleri

Aşağıdaki komutla SonarScanner'ı **/tmp/** dizini altına indirin;

`wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.0.2311-linux.zip -O /tmp/sonar-scanner-cli-4.6.0.2311-linux.zip`{{execute}}

İnen dosyayı **/opt/** altına ayıklayın;

`unzip /tmp/sonar-scanner-cli-4.6.0.2311-linux.zip -d /opt/`{{execute}}

`sonar-scanner-cli-4.6.0.2311-linux`{{copy}} dizini adını aşağıdaki komutla **sonar-scanner-cli** olarak güncelleyin;

`mv /opt/sonar-scanner-4.6.0.2311-linux/ /opt/sonar-scanner-cli/`{{execute}}

`/opt/sonar-scanner-cli/conf/sonar-scanner.properties`{{copy}} dosyası içerisinde SonarQube sunucu adresininin belirtilmesi gerekli. Bu dosyayı açarak aşağıdaki satırın başındaki **#** karakterini silin ve dosyayı saklayın;

`#sonar.host.url=http://localhost:9000`

SonarScanner statik kod analizine dair yapılandırmaları **sonar-project.properties** dosyasından okuyabilir. Aşağıdaki komutla **sonar-project.properties** dosyasını oluşturun;

```bash
cat > sonar-project.properties << 'EOF'
onar.projectKey=com.enterprisecoding:sonarqube-scanner
sonar.projectName=SonarQube Scanner Kullanım Örneği
sonar.projectVersion=1.0

sonar.sources=src,copybooks

sonar.sourceEncoding=UTF-8

## Cobol Diline ait özellikler
sonar.cobol.copy.directories=copybooks
sonar.cobol.file.suffixes=cbl,cpy
sonar.cobol.copy.suffixes=cpy

## Flex'e ait özellikler
sonar.flex.cobertura.reportPath=coverage-report/coverage-cobertua-flex.xml

# PL/I'a ait özellikler
sonar.pli.marginLeft=2
sonar.pli.marginRight=0
EOF
```{{execute}}

Aşağıdaki komutla **sonar-project.properties** dosyasının oluştuğunu teyit edin;

`ls -al`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
