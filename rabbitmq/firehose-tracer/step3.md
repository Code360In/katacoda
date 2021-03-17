# Firehose için Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **amq.rabbitmq.trace** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.firehose.published`{{copy}} yazın. **Routing key** alanına `publish.#`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Yine aynı bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.firehose.delivered`{{copy}} yazın. **Routing key** alanına `deliver.#`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
