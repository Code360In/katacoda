# Upstream Yapılandırması

**RabbitMQ01** segmesi üzerinden açılan yönetim arayüzüne geçiş yaparak sayfayı yenileyin.

## Show Tanımlama

**Admin** segmesine geçiş yapın. Açılan sayfanın sağ tarafındaki menüden **Shovel Management** bölümünü açın.

**Shovel Management** sayfasında **Add a new upstream** bölümün açın.

**Name** alanına **lab.shovel.rabbitm02** değerini, **URI** alanına aşağıdaki değeri yazın ve **Add upstream** butonuna basın.

`amqp://enterprisecoding:enterprisecoding@rabbitmq01:5672/default`

## Shovel Durumu

Sağ tarafındaki menüden **Sovel Status** bölümünü açın. Bu bölümde **lab.shovel.rabbitm02** girdisinin listelendiğini ve **running** durumunda olduğunu teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.