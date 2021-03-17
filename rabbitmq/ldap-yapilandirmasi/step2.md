# Kullanıcı Girişleri

## İç Kullanıcı ile Giriş

Yönetim arayüzüne geçiş yaparak kullanıcı adı olarak ve şifre olarak `enterprisecoding`{{copy}} vererek giriş yapmayı deneyin. Bu kullanıcı ile giriş yapabildiğinizi onaylayın. Sağ üst köşedeki **Logout** butonu ile çıkış yapın.

## Management Yetkisi Olmayan LDAP Kullanıcı

Yeniden yönetim arayüzüne geçiş yaparak kullanıcı adı olarak `rabbitmq-producer`{{copy}} şifre olarak `enterprisecoding`{{copy}} vererek giriş yapmayı deneyin.
Kullanıcı adı ve şifresi doğru olmasına karşın aşağıdaki hata mesajını aldığınızı teyit edin;

`Not management user`

## Management Yetkisi Olan LDAP Kullanıcı

Tekrar yönetim arayüzüne geçiş yaparak kullanıcı adı olarak `rabbitmq-admin`{{copy}} şifre olarak `enterprisecoding`{{copy}} vererek giriş yapmayı deneyin. Bu kullanıcı ile RabbitMQ'ya giriş yapabildiğinizi teyit edin.

**Admin** segmesini açarak sağ bölümde yer alan **User** bölümünde **rabbitmq-admin** ya da **rabbitmq-produce** kullanıcılarına ait bir tanım olmadığını teyit edin. Sağ üst köşedeki **Logout** butonu ile çıkış yapın.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.