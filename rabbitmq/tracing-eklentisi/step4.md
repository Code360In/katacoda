# Tracing Yapılandırması

Yönetim arayüzünde *Exchanges** segmesine geçin. **lab.ex.direct.buggy** exchange'i açın. Bu sayfada yer alan **Publish message** bölümünü açın. **Payload** alanına aşağıdaki içeriği yazın;

`Enterprisecoding rabbitmq eğitimi örnek firehose tracer mesajı`{{copy}}

**Routing key** alanına aşağıdaki değeri yazın;

`personel.isemri.baslama`{{copy}}

**Publish message** butonuna basarak mesajı yayınlayın. 

**Message published, but not routed.** mesajını aldığınızı teyit edin.

**Admin** segmesine geçiş yapın. Sayfanın sağ bölümünden **tracing**'i açın. **Trace log files** bölümünde  listenen **lab.tracing.hepsi.log** dosya adına tıklayın. Açılan dialogta kullanıcı adı ve şifresi olarak `enterprisecoding`{{copy}} yazın. Gelen sayfada mesajınıza ait log kayıtlarının olduğunu teyit edin.
