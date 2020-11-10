# İş Tanımı

Kullanıcı bilgileri yardımıyla Jenkins arayüzüne giriş yapın.

Açılan Dashboard'da **New Item** linkine basın.

Açılan ekranda **Enter an item name** bölümünde değer olarak **IlkIs** yazın.

İş türü olarak **Freestyle project** seçerek **OK** tuşuna basın.

Açılan sayfada **Project name** alanında değer olarak **IlkIs** yazın. **Description** alanına değer olarak bir açıklama girin.

## Source Code Management

**Source Code Management** bölmümünde **None** seçeneğini seçin.

## Build Triggers

**Build Triggers** bölümünde **Build periodically** seçeneğini seçerek zamanlama ifadesi olarak yan tarafında bulunan text alana aşağıdaki ifadeyi girin.

`0 * * ? * *`

Bu ifade işin her dakika çalışmasını ifade etmektedir.

## Build

**Build** bölümünde yer alan **Add build step** combobox'ında bulunan **Execute Shell** değerini girin. Komut olarak ise aşağıdaki ifadeyi girin;

`ifconfig`

Son olarak **Save** butonuna basarak ilk iş tanımınızı oluşturun.