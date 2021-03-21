# Komut Satırından Eklenti Kurulumu

Aşağıdaki komutu kullanarak [https://github.com/lg2de/sonar-scm-tfvc](https://github.com/lg2de/sonar-scm-tfvc) adresinde yer alan SonarQube Tfvc eklentisini **/opt/sonarqube/extensions/plugins/** dizini altına indirin;

`wget https://github.com/lg2de/sonar-scm-tfvc/releases/download/2.3.0/sonar-scm-tfvc-plugin-2.3.0-73.jar -O /opt/sonarqube/extensions/plugins/sonar-scm-tfvc-plugin-2.3.0-73.jar`{{execute}}

Dosya sahibini aşağıdaki komutla sonar kullanıcısı yapın;

`chown sonar:sonar /opt/sonarqube/extensions/plugins/sonar-scm-tfvc-plugin-2.3.0-73.jar`{{execute}}

Aşağıdaki komutla SonarQube hizmetini yeniden başlatın;

`systemctl restart sonarqube`{{execute}}

Yeniden başlatma ardından giriş sayfasının açıldığını teyit edin. Önceki adımda verilen kullanıcı bilgileri ile yeniden giriş yapın. **Marketplace** sayfasında **PlugIns** bölümünde **Installed** segmesine geçiş yapın. TFVC Integration eklentisinin yeniden listelendiğini teyit edin.

# Komut Satırından Eklenti Kaldırma

Aşağıdaki komutu çalıştırarak az önce kurduğunuz Tfvc eklentisini kaldırın;

`rm -f /opt/sonarqube/extensions/plugins/sonar-scm-tfvc-plugin-2.3.0-73.jar`{{execute}}

Değişikliklerin devreye alınması için aşağıdaki komutla SonarQube hizmetini yeniden başlatın;

`systemctl restart sonarqube`{{execute}}

Yeniden başlatma ardından giriş sayfasının açıldığını teyit edin. Yukarıda verilen kullanıcı bilgileri ile yeniden giriş yapın. **Marketplace** sayfasında **PlugIns** bölümünde **Installed** segmesine geçiş yapın. TFVC Integration eklentisinin artık listelenmediğini teyit edin.