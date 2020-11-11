# Ortam

Bu senaryo için bir Jenkins, Nexus ve ssh agent kurulum ve yapılandırması sizin için yapılmıştır. Sağ bölümde yer alan terminalden agent sunucusunda işlem yapabilirsiniz.

Jenkins arayüzüne sağ taraftaki **Jenkins UI** segmesinden, Nexus arayüzüne **Nexus UI** segmesinden ulaşabilirsiniz.

Giriş için ihtiyacınız olan kullanıcı adı ve şifreleri **Terminal**'de sizlere verilmiştir.

## Nexus Depo Tanımı

**Nexus UI** segmesine geçiş yaparak açılarak sayfada Nexus'a giriş yapınız. 

Giriş yaptıktan sonra sunucu yönetimi ekranına geçiş yapın.

Açılan Nexus yönetim ekranında **Repositories** bölümüne geçiş yaparak **Create repository** butonuna basınız.

Açılan **Select Recipe** ekranında **maven2 (hosted)** seçeneğini seçiniz.

Açılan **Create Repository: maven2 (hosted)** ekranında **name** alanı için **maven-nexus-repo** değerini girin.

**Version policy** alanı için **Mixed** değerini seçin.

**Hosted** bölümünde **Deployment policy** alanı için **Allow redeploy** değerini seçin.

**create repository** butonuna basarak depo tanımını oluşturun.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
