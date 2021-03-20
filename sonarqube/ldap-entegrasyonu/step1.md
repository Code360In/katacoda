# LDAP Yapılandırması

Aşağıdaki komutla sonarqube yapılandırmasına LDAP entegrasyonuna ilişkin girdileri ekleyin;

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
ldap.group.baseDn=ou=sonarqube,ou=app,dc=enterprisecoding,dc=local
ldap.group.request=(&(objectClass=groupOfUniqueNames)(uniqueMember={dn}))
EOF
```{{execute}}

Değişikliklerin devreye girmesi için sonaruqbe hizmetini yeniden başaltın;

`systemctl restart sonarqube`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
