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

**Security** > **Users** ekranına geçin.

Açılan ekranda **Create local user** butonuna basınız.

Açılan **Create User** ekranında ID alanına  **jenkins-user** değerini giriniz. First name, last name ve email alanlarına istediğiniz değeri verebilirsiniz. **Password** alanına **jenkins-user** değerini girin. **Status** alanı için **Active** değerini seçin. Rollerden **nx-admin** rolünü kullanıcıya atayın.

**Create local user** butonuna basarak kullanıcıyı oluşturun.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
