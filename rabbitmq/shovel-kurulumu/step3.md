# Binding Oluşturma

## RabbitMQ01 Sunucusunda

**RabbitMQ01** segmesi üzerinden açılan yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.shovel.ex.kaynak** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.shovel.queue.kaynak`{{copy}} yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

## RabbitMQ02 Sunucusunda

**RabbitMQ02** segmesi üzerinden açılan yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.shovel.ex.hedef** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.shovel.queue.hedef`{{copy}} yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
