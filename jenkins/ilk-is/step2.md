# İş Tanımı

Kullanıcı bilgileri yardımıyla Jenkins arayüzüne giriş yapın.

Açılan Dashboard'da **New Item**/**Yeni Item** linkine basın.

Açılan ekranda **Enter an item name** bölümünde değer olarak **IlkIs** yazın.

İş türü olarak **Freestyle project**/**Serbest-stil yazılım projesi yapılandır** seçerek **OK** tuşuna basın.

**Description**/**Açıklama** alanına değer olarak bir açıklama girin.

## Source Code Management/Kaynak Kodu Yönetimi

**Source Code Management**/**Kaynak Kodu Yönetimi** bölmümünde **None**/**hiç birisi** seçeneğini seçin.

## Build Triggers/Yapılandırma Tetikleyiciler

**Build Triggers**/**Yapılandırma Tetikleyiciler** bölümünde **Build periodically**/**Periyodik olarak yapılandır** seçeneğini seçerek zamanlama ifadesi olarak yan tarafında bulunan text alana aşağıdaki ifadeyi girin.

`* * * * *`

Bu ifade işin her dakika çalışmasını ifade etmektedir.

## Build/Yapılandırma

**Build**/**Yapılandırma** bölümünde yer alan **Add build step**/**Yapılandırma adımı ekle** combobox'ında bulunan **Execute Shell**/**Shell çalıştır** değerini girin. Komut olarak ise aşağıdaki ifadeyi girin;

`ifconfig`

Son olarak **Save**/**Kaydet** butonuna basarak ilk iş tanımınızı oluşturun.