# SonarScanner ile Statik Kod Analizi

Önceki adımda not aldığınız erişim token'ını aşağıda örneklenen komutta **[TOKEN]** ifadesi yerine yazarak SonarScanner'ı kullanarak statik kod analizi yapın;

`/opt/sonar-scanner-cli/bin/sonar-scanner -Dsonar.login=[TOKEN]`{{copy}}

Analiz işleminin tamamlanması ardından SonarQube giriş sayfasında kullanıcı adı olarak `admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. Ana sayfada **SonarQube Scanner Kullanim Ornegi** listelendiğini teyit edin.