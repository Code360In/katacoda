# Arayüz üzerinden Binding Oluşturma

Yönetim arayüzünde **Exchanges** segmesine geçiş yapın. **lab.ex.topic** exchange'i açın ve **Bindings** bölümünü açın.

Açılan bölümde **Add binding from this exchange** alanına **To queue** değerine **lab.queue.is-emirleri.personel.baslama** yazın. **Arguments** alanına **x-match** ve **all** ikilisini ekleyin. Altına sırasıyla x-match: all
**modul** - **personel**, **tur:** - **is-emri**, **islem** - **baslama** anahtar-değer ikililerini ekleyin ve **Bind** butonuna basın.

Binding bölümünde yeni oluşturduğunuz binding'in olduğunu teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
