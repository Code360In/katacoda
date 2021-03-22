# Ant Sonar Scanner ile Statik Kod Analizi

Aşağıdaki komutla ant tasklarının yer aldığı **build.xml** dosyasını inceleyin;

`cat build.xml`{{copy}}

Önceki adımda not aldığınız erişim token'ını aşağıda örneklenen komutta **[TOKEN]** ifadesi yerine yazarak Ant'ı kullanarak statik kod analizi yapın;

`ant sonar -Dsonar.login=[TOKEN]`{{copy}}

Analiz işleminin tamamlanması ardından SonarQube giriş sayfasında kullanıcı adı olarak `admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. Ana sayfada **SonarQube Scanner Kullanim Ornegi** listelendiğini teyit edin.