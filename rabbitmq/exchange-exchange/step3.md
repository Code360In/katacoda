# Arayüz üzerinden Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.ex.ana** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To exchange** değerine `lab.ex.personel`{{copy}} yazın. **Routing key** alanına `personel.#.#`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Yeniden yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.ex.personel** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.is-emirleri.personel.ayrilma`{{copy}} yazın. **Routing key** alanına `personel.is-emri.ayrilma`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

Yeniden **Bindings** bölümünü gelin. Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.is-emirleri.personel.baslama`{{copy}} yazın. **Routing key** alanına `personel.is-emri.baslama`{{copy}} değerini yazın ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
