import groovy.json.JsonOutput

security.setAnonymousAccess(false)
log.info('anonim erişim kapatıldı')


def adminRole = ['nx-admin']
def adminUser = security.addUser('jenkins-user', 'Jenkins', 'User', 'jenkins-user@enterprisecoding.com', true, 'jenkins-user', adminRole)
log.info('jenkins-user kullanıcısı oluşturuldu')


security.anonymousAccess = true


//
// Varsayılan şifreyi değiştir
//
def user = security.securitySystem.getUser('admin')
user.setEmailAddress('nexus@enterprisecoding.com')
security.securitySystem.updateUser(user)
security.securitySystem.changePassword('admin','admin456')
log.info('varsayılan admin şifresi güncellendi')

log.info('Güvenlik scripti başarıyla çalıştırıldı')

return JsonOutput.toJson([adminUser, user])