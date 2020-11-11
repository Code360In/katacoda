# Jenkins Yapılandırması

Jenkins UI segmesine geçiş yaparak kullanıcı bilgileri ile giriş yapın.

## Gerekli Eklentilerin Yüklenmesi

Açılan ekranda **Manage Jenkins** / **Jenkins's Yönet** > **Manage Plugins** / **Eklentileri Yönet** > **Available** / **Kullanılabilir** patikası üzerinden kullanılabilir eklentiler ekranına gidin.

Arama bölümü kullanarak **Nexus Artifact Uploader** ve **Pipeline Utility Steps** eklentilerini bulup yükleyin.

## Nexus Kullanıcı Tanımlaması

**Dashboard** / **Ana Sayfa** > **Manage Jenkins** / **Jenkins's Yönet** > **Manage Credentials** patikası üzerinden **Credentials** sayfasını açın.

Açılan sayfada **Credentials** başlığı altında yer alan **Jenkins** linkine tıklayın.

Açılan **System** sayfasında **Global credentials (unrestricted)** linkine tıklayın.

Açılan **Global credentials (unrestricted)** sayfasında sol bölümde yer alan **Add Credential** linkine tıklayın.

Açılan sayfada aşağıdaki belirtilen bilgilerle formu doldurun;

Username : **jenkins-user** 
Password : **jenkins-user**
ID       : **jenkins-user-credentials** 


Bu işlemler ardından **Ok** butonuna basarak credential kaydını tamamlayın.

## Maven Aracı Tanımlama

**Dashboard** / **Ana Sayfa** > **Manage Jenkins** / **Jenkins's Yönet** > **Global Tool Configuration** sayfasına gidin.

Açılan sayfanın en altında yer alan **Maven** bölümüne geçin. **Maven installations** başlığında bulunan **Add maven** butonuna tıklayın.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.