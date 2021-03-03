# Downstream Yapılandırması

**RabbitMQ02** segmesi üzerinden açılan yönetim arayüzüne geçiş yaparak sayfayı yenileyin.

## Federation Tanımlama

**Admin** segmesine geçiş yapın. Açılan sayfanın sağ tarafındaki menüden **Federation Upstreams** bölümünü açın.

**Federation Upstreams** sayfasında **Add a new upstream** bölümün açın.

**Name** alanına **rabbitm01.federation** değerini, **URI** alanına **amqp://enterprisecoding:enterprisecoding@rabbitmq01:5672** değerini yazın ve **Add upstream** butonuna basın.

## Politika Tanımlama

Sağ tarafındaki menüden **Policies** bölümünü açın.

**Policies** sayfasında **Add / update a policy** bölümün açın.

**Name** alanına **rabbitm01.federation.politikasi** değerini, **Pattern** alanına **lab.federation.* ** değerini, **Definition** alanına **federation-upstream-set** - **all** yazın ve **Add / update policy** butonuna basın.

## Federation Durumu

Sağ tarafındaki menüden **Federation Status** bölümünü açın. Bu bölümde oluşturduğumuz exchange ve queue'ların listelendiğini ve **running** durumunda olduklarını teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.