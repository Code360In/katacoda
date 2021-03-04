# Upstream Yapılandırması

**RabbitMQ01** segmesi üzerinden açılan yönetim arayüzüne geçiş yaparak sayfayı yenileyin.

## Show Tanımlama

**Admin** segmesine geçiş yapın. Açılan sayfanın sağ tarafındaki menüden **Shovel Management** bölümünü açın.

**Shovel Management** sayfasında **Add a new shovel** bölümün açın.

**Name** alanına **lab.shovel.rabbitm02** değerini, **Source** başlığı altında **URI** alanına aşağıdaki değeri yazın.

`amqp://enterprisecoding:enterprisecoding@rabbitmq01:5672/default`

**Queue** bölümüne **lab.shovel.queue.kaynak** değerini girin.

**Destination** başlığı altında **URI** alanına aşağıdaki değeri yazın 

`amqp://enterprisecoding:enterprisecoding@rabbitmq02:5672/default`

**Queue** yerine **Exchange** seçin ve altındaki bölüme **lab.shovel.ex.hedef** değerini girin ve **Add shovel** butonuna basın.

## Shovel Durumu

Sağ tarafındaki menüden **Sovel Status** bölümünü açın. Bu bölümde **lab.shovel.rabbitm02** girdisinin listelendiğini ve **running** durumunda olduğunu teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.