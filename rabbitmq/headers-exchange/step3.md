# Arayüz üzerinden Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.ex.topic** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine `lab.queue.is-emirleri.personel.baslama`{{copy}} yazın. **Arguments** alanına `x-match`{{copy}} ve `all`{{copy}} ikilisini ekleyin. Altına sırasıyla `modul`{{copy}} - `personel`{{copy}}, `tur`{{copy}} - `is-emri`{{copy}}, `islem`{{copy}} - `baslama`{{copy}} anahtar-değer ikililerini ekleyin ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
