# LDAP Grupları

Giriş sayfasında kullanıcı adı olarak `admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın.

## LDAP Grubunu Tanımlama
Açılan yönetim sayfasında **Security** segmesi altındaki **Groups** linkine tıklayın. Açılan **Groups** sayfasında sağ üst köşede yer alan **Create Group** butonuna basın. Açılan **Create Group** dialoğunda **Name** alanına `sonarqube-administrators`{{copy}} LDAP grubu adını, **Description** alanına `SonarQube Administrators`{{copy}} yazın.

## LDAP Grubu Yetkilendirme

Yönetim sayfasında **Security** segmesi altındaki **Global Permissions** linkine tıklayın. Açılan **Global Permissions** sayfasında **sonarqube-administrators** grubunu bulun. Bu grup için aşağıdaki yetkileri verin;

* Administer System
* Administer - Quality Gates
* Administer - Quality Profiles
* Create - Projects

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.