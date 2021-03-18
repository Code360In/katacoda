# LDAP Eklentisi

Sağ tarafta yer alan **SonarQube** segmesine tıklayarak SonarQube arayüzüne geçin. Kullanıcı adı ve şifesi olarak `admin`{{copy}} değerini kullanarak giriş yapın.

Açılan SonarQube ana sayfasında **Administration** bölümünü açın.

**Administration** sayfasında **Marketplace** segmesine geçin.

```bash
cat >> /opt/sonarqube/conf/sonar.properties << 'EOF'
# LDAP Yapılandırması

# Genel Yapılandırma
sonar.security.realm=LDAP
sonar.authenticator.createUsers: true

ldap.url=ldap://127.0.0.1
ldap.bindDn=cn=sonarqube-app,ou=users,dc=enterprisecoding,dc=local
ldap.bindPassword=enterprisecoding

# Kullanıcı Yapılandırma
ldap.user.baseDn=ou=users,dc=enterprisecoding,dc=local
ldap.user.request=(&(objectClass=inetOrgPerson)(uid={login}))
ldap.user.realNameAttribute=cn
ldap.user.emailAttribute=mail

# Grup Yapılandırma
ldap.group.baseDn=ou=groups,dc=enterprisecoding,dc=local
ldap.group.request=(&(objectClass=posixGroup)(memberUid={uid}))
EOF
```{{execute}}

`systemctl restart sonarqube`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
