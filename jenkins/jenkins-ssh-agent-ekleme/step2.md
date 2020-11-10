# Agent Ekleme

Aşağıdaki adımarı takip ederek bir node ekleyebilirsiniz.

Jenkins ana sayfasında sağ bölümde yer alan **Jenkins'i Yönet** menu girdisine tıklayın. 

Açılan **Jenkins'i Yönet** sayfasında **Manage Nodes and Clouds** linkine tıklayın.

Açılan **Nodes** sayfasında sağ bölümde yer alan **New Node** linkine tıklayın.

Açılan sayfada **Node Name** alanına **node01** değerini girin. **Permanent Agent** seçeneğini seçtikten sonra **OK** butonuna basın.

Yeni Node ekleme sayfasında aşağıdaki değerleri girin;

* **# of executors** değeri olarak **2** girin.
* **Remote root directory** değeri olarak **/opt/jenkins/** girin.
* **Launch method** değeri olarak **Launch agents via SSH** değerini seçin.
* **Host** değeri olarak **node01** değerini girin.
* **Credentials** bölümünde **Add** butonuna tıklayın. Açılan combobox'ta **Jenkins**'i seçin. Açılan **Jenkins Credentials Provider: Jenkins** dialogunda **Username** alanına **jenkins** değerini yazın. **Password** alanına ise jenkins kullanıcısının şifresini yazın. **Add** tuuşuna basarak ekrandan çıkın.
* **Credentials** bölümünde az önce oluşturduğunu jenkins/****** değerini seçin.
* **Host Key Verification Strategy** değeri olarak **Non verifying Verification Strategy** değerini seçin.

Gerekli yapılandırmalar ardından sayfanın altında bulunan **Save** butonuna basarak Node kaydını oluşturun.

Bu adımlar ardından Agent Node tanımını tamamladınız.