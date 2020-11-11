# Jenkins Yapılandırması

Jenkins ilk kurulumda sistem yöneticisi için otomatik şifre oluşturacaktır. Aşağıdaki komutla bu şifreyi görüntüleyin;

`cat /var/lib/jenkins/secrets/initialAdminPassword`{{execute}}

Sol tarafta yer alan **Jenkins UI** segmesine giderek Jenkins arayüzüne geçin.

Açılan sayfada **initialAdminPassword** içeriğini **Administrator password** bölümüne girerek **Continue** butonuna basın.

Açılan **Customize Jenkins** ekranında sunulan seçeneklerden **Install suggested plugins** seçeneğini seçin. **Getting Started** ekranından eklentilerin kurulumunu takip edin.

Eklenti kurulumlarının tamamlanması ardından açılan **Create First Admin User** ekranında talep edilen bilgileri girerek kendinize bir sistem yöneticisi kullanıcısı oluşturun. İşlemi tamamlamak için **Save and Continue** butonuna basın.

Kullanıcının oluşturuması ardından açılan **Instance Configuration** ekranında **Jenkins URL** değerini mevcut haliyle bırakarak **Save and Finish** butonuna basınız.

Açılan **Jenkins is ready!** ekranında yer alan **Start using Jenkins** butonuna basarak Jenkins ana sayfasını ziyaret edin. Jenkins kullanıma hazır.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
