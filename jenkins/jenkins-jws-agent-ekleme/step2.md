# Agent Ekleme

Aşağıdaki adımarı takip ederek bir node ekleyebilirsiniz.

Jenkins ana sayfasında sağ bölümde yer alan **Jenkins'i Yönet** menu girdisine tıklayın. 

Açılan **Jenkins'i Yönet** sayfasında **Manage Nodes and Clouds** linkine tıklayın.

Açılan **Nodes** sayfasında sağ bölümde yer alan **New Node** linkine tıklayın.

Açılan sayfada **Node Name** alanına **node01** değerini girin. **Permanent Agent** seçeneğini seçtikten sonra **OK** butonuna basın.

Yeni Node ekleme sayfasında aşağıdaki değerleri girin;

* **# of executors** değeri olarak **2** girin.
* **Remote root directory** değeri olarak **/opt/jenkins/** girin.
* **Launch method** değeri olarak **Launch agent by connecting it to the master** değerini seçin.

Gerekli yapılandırmalar ardından sayfanın altında bulunan **Save** butonuna basarak Node kaydını oluşturun.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.