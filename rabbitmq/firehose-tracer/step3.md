# Firehose için Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **amq.rabbitmq.trace** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine **lab.queue.firehose.published** yazın. **Routing key** alanına **publish.#** değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Yine aynı bölümde **Add binding from this exchange** alanına **To queue** değerine **lab.queue.firehose.delivered** yazın. **Routing key** alanına **deliver.#** değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
