# Management Eklentisi Kurulumu

Aşağıdaki komutla kurulumu kontrol edin;

`rabbitmqctl status`{{execute}}

Aşağıdaki komut yardımıyla RabbitMQ yönetim eklentisini kurun;

`rabbitmq-plugins enable rabbitmq_management`{{execute}}

Kurulum ardından **Management UI** segmesi üzerinden yönetim arayüzünü açarak inceleyin. Kullanıcı adı ve şifre alanına **guest** değerini vererek giriş yapmayı deneyin. **User can only log in via localhost** hata mesajı aldığınızı teyit edin.

Benzer şekilde **Local** segmesi üzerinde yerel makinden giriş yapacak şekilde yönetim arayüzünü açın. Kullanıcı adı ve şifre alanına **guest** değerini vererek giriş yapmayı deneyin. Giriş yapabildiğinizi teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.