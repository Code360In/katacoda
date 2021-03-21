# LDAP Entegrasyon Testi

## Admin Girişi

Sağ tarafta yer alan **SonarQube** segmesine tıklayarak SonarQube arayüzünü açın. Açılan giriş sayfasında kullanıcı adı olarak `admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. **Administration** linkine tıklayarak yönetim sayfasına geçin. Açılan yönetim sayfasında **Security** segmesi altındaki **Users** linkine tıklayın.

Açılan **Users** sayfasında sadece Admin kullanıcısının yer aldığını teyit edin. Sağ Üst bölümde yer alan **A** harfi altındaki **logout** linki yardımıyla sistemden çıkış yapın.
## LDAP Kullanıcısı İle Giriş

Giriş sayfasında bu defa kullanıcı adı olarak `sonarqube-admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. Giriş yapabildiğinizi teyit edin. Sistem tarafından standart kullanıcı olarak kabul edildiğinizi (Örneğin; Administration segmesinin bulunmadığını) teyit edin. Sağ Üst bölümde yer alan **S** harfi altındaki **logout** linki yardımıyla sistemden çıkış yapın.

## Otomatik Oluşan Kullanıcı

Sisteme yeniden yukarıda bilgileri bulunan `admin`{{copy}} kullanıcısı ile giriş yapın. **Administration** linkine tıklayarak yönetim sayfasına geçin. Açılan yönetim sayfasında **Security** segmesi altındaki **Users** linkine tıklayın.

Açılan **Users** sayfasında Admin kullanıcısının yanında artık **sonarqube-admin** kullanıcısının da listelendiği teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.