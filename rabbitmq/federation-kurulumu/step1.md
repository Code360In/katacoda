# Lab Ortamı

Sizin için 2 ayrı node üzerinde RabbitMQ kurulumları yapılmıştır. Sağ bölümde yer alan **Terminal** segmesinde bu sunuculardan **rabbitmq01**'ya ait Terminal kullanılabilir durumdadır. Bu terminal üzerinden aşağıda belirtilen adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz.

Bu senaryoda **rabbitmq01** sunucusu **upstream** olarak, **rabbitmq02** sunucusu ise **downstream** olarak konumlanacaktır.

# Exchange Oluşturma

## RabbitMQ01 Sunucusunda

Yan tarafta yer alan **RabbitMQ01** segmesi üzerinden yönetim arayüzünü açın.
Açılan arayüzde **enterprisecoding** kullanıcı adı ve şifresi ile giriş yapın.

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Add a new exchange** bölümünü açın.

Açılan bölümde **Name** alanına **federation.Exchange** değerini yazın. **Type** alanında **fanout** değerini seçin ve **Add exchange** butonuna basın.

Exchange listesinde yeni oluşturduğunuz exchange'in olduğunu teyit edin.

## RabbitMQ02 Sunucusunda

Yan tarafta yer alan **RabbitMQ02** segmesi üzerinden yönetim arayüzünü açın.
Açılan arayüzde **enterprisecoding** kullanıcı adı ve şifresi ile giriş yapın.

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın ve **Add a new exchange** bölümünü açın.

Açılan bölümde **Name** alanına **federation.Exchange** değerini yazın. **Type** alanında **fanout** değerini seçin ve **Add exchange** butonuna basın.

Exchange listesinde yeni oluşturduğunuz exchange'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.