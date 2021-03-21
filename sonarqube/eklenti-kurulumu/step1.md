# Ortam

Sizin adınıza lab ortamına SonarQube kurulumu yapılmıştır. Yan tarafta yer alan **SonarQube** segmesi üzerinden arayüze ulaşabilirsiniz.

# Arayüz Üzerinden Eklenti Kurulumu

Yan tarafta yer alan **SonarQube** segmesine tıklayarak SonarQube arayüzünü açın. Açılan giriş sayfasında kullanıcı adı olarak `admin`{{copy}} ve şifre olarak `enterprisecoding`{{copy}} değerleri ile giriş yapın. **Administration** linkine tıklayarak yönetim sayfasına geçin. Açılan yönetim sayfasında **Marketplace** segmesine tıklayın.

**Marketplace** sayfasında listelenen eklentilerden **TFVC Integration** eklentisini bularak satırın sağında yer alan **Install** butonuna basın. Kurulumun başladığını ve ardından yeşil renkle **Install Pending** mesajının geldiğini teyit edin.

Kurulumun bitmesi ardından sayfanın üst bölümünde aşağıdaki mesajın geldiğini teyit edin;

`SonarQube needs to be restarted in order to install 1 plugins`

Mesajın sağında kırmızı olarak yer alan `Restart Server` butonuna basın. Açılan **Restart Server** dialogunda yer alan **Restart** butonuna basarak SonarQube'ü yeniden başlatılmasını onaylayın. Aşağıdaki mesajın sayfanın üstünde göründüğünü onaylayın.

`SonarQube restart is in progress. Ongoing Background Tasks are completing.`

Yeniden başlatma ardından giriş sayfasının açıldığını teyit edin. Yukarıda verilen kullanıcı bilgileri ile yeniden giriş yapın. **Marketplace** sayfasında **PlugIns** bölümünde **Installed** segmesine geçiş yapın. TFVC Integration eklentisinin listelendiğini teyit edin.

# Arayüz Üzerinden Eklenti Kaldırma

**Marketplace** sayfasında **PlugIns** bölümünde **Installed** segmesine geçiş yapın. TFVC Integration eklentisinin bulunduğu satırın sağında yer alan **Uninstall** butonuna basın. Uygulama kaldırıldıktan sonra **Uninstall Pending** yazısının geldiğini teyit edin. Sayfanın üst bölümünde aşağıdaki mesajın geldiğini teyit edin;

`SonarQube needs to be restarted in order to uninstall 1 plugins`

Mesajın sağında kırmızı olarak yer alan `Restart Server` butonuna basın. Açılan **Restart Server** dialogunda yer alan **Restart** butonuna basarak SonarQube'ü yeniden başlatılmasını onaylayın. Aşağıdaki mesajın sayfanın üstünde göründüğünü onaylayın.

`SonarQube restart is in progress. Ongoing Background Tasks are completing.`

Yeniden başlatma ardından giriş sayfasının açıldığını teyit edin. Yukarıda verilen kullanıcı bilgileri ile yeniden giriş yapın. **Marketplace** sayfasında **PlugIns** bölümünde **Installed** segmesine geçiş yapın. TFVC Integration eklentisinin artık listelenmediğini teyit edin.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
