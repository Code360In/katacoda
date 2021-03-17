# Arayüz üzerinden Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **amq.rabbitmq.event** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.events.queue.created`{{copy}}  yazın. **Routing key** alanına **queue.created** değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Tekrar binding bölümüne geçin ve **Add binding from this exchange** alanına **To queue** değerine `lab.queue.events.queue.deleted`{{copy}} yazın. **Routing key** alanına `queue.deleted`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Bir kez daha binding bölümüne geçin ve **Add binding from this exchange** alanına **To queue** değerine `lab.queue.events.exchange.created`{{copy}} yazın. **Routing key** alanına `exchange.created`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
