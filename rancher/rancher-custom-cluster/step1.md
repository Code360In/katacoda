# Lab Ortamı

Sizin için 1 node üzerinde yapılandırılmış şekilde bir Rancher Cluster'ı kuruludur. Sağ bölümde yer alan **Terminal** segmesinde, kurulu olan bu Rancher Cluster'ının node'u terminalini bulabilirsiniz. Sağ bölümde **K8s-Node** segmesinde ise ikinci bir server node'una bağlı terminal yerl almaktadır. Bu terminaller üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Rancher arayüzüne **Rancher UI** segmesi üzerinden ulaşabilirsiniz. Giriş için ihtiyaç duyacağınız kullanıcı bilgileri sağ üst bölümdeki terminalde belirtilmiştir.

## RKE ile Cluster Import'a hazırlama

**Rancher UI** segmesine geçiş yaparak terminalde belirtilen kullanıcı bilgileri ile Rancher arayüzüne giriş yapınız.

Açılan Rancher ana ekranında sağ üst köşesinde yer alan **Add Cluster** butonuna basınız.

Açılan **Add Cluster - Select Cluster Type** ekranında **Existing nodes** butonuna basın.

Açılan **Add Cluster - Custom** sayfasında **Cluster Name** değeri olarak __enterprisecoding-local__ değerini girin ve sayfanın altındaki **Next** butonuna basın. Açılan **Cluster Options** sayfasında **Node Options** bölümünde yer alan **Node Role** olarak **etcd**, **Control Plane** ve **Worker** seçeneklerini seçin. 2 Nolu bölümde oluşturulan komutu çalıştırmak üzere kopyalayın.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.