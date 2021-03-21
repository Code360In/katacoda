# SonarQube Erişim Token'ı

## Analiz Kullanıcısı Oluşturma

SonarScanner'ın analiz sonuçlarını SonarQube'e iletebilmesi için yetkili bir kullanıcıya ait erişim token'ına ihtiyacı bulunmaktadır. Bu amaçla sağ tarafta yer alan **SonarQube** segmesine tıklayarak SonarQube arayüzünü açın. Açılan giriş sayfasında kullanıcı adı olarak `admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. **Administration** linkine tıklayarak yönetim sayfasına geçin. Açılan yönetim sayfasında **Security** segmesi altındaki **Users** linkine tıklayın.

Açılan **Users** sayfasında sağ üst köşede yer alan **Create user** butonuna tıklayın. Açılan dialog'da aşağıdaki değerleri verin;

| Alan        | Değer                        |
| ----------- | ---------------------------- |
| Login       | `sonarqube-analiz`{{copy}}   |
| Name        | `Analiz Kullanıcısı`{{copy}} |
| Password    | `enterprisecoding`{{copy}}   |


**Create** butonuna basarak kullanıcıyı oluşturun. Kullanıcı listesinde **sonarqube-analiz** kullanıcısının yer aldığını teyit edin.

**Security** segmesi altında yer alan **Global Permissions** linkine tıklayın. Açılan **Global Permissions** sayfasında az önce oluşturduğunuz analiz kullanıcısı için **Execute Analysis** sütunundaki check-box'ı işaretleyerek bu yetkiyi verin. Sağ Üst bölümde yer alan **A** harfi altındaki **logout** linki yardımıyla sistemden çıkış yapın.
## Token Oluşturma

Giriş sayfasında bu defa kullanıcı adı olarak `sonarqube-analiz`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. Açılan SonarQube ana sayfasının sağ Üst bölümde yer alan **AK** harfi altındaki **My Account** linkine tıklayın. Açılan sayfada yer alan **Security** segmesine geçin. Bu segmedeki **Tokens** başlığı altındaki **Generate Tokens** bölümünde `SonarScanner`{{copy}} değerini yazarak **Generate** butonuna basın. Aşağıdaki mesaj ve aştında üretilen Token olduğunu teyit edin;

`New token "SonarScanner" has been created. Make sure you copy it now, you won't be able to see it again!``

**Copy** butonuna basarak token'ı kopyalayın ve saklayın. Sağ Üst bölümde yer alan **AK** harfi altındaki **logout** linki yardımıyla sistemden çıkış yapın.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.