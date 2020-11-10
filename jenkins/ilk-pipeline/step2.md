# İş Tanımı

Kullanıcı bilgileri yardımıyla Jenkins arayüzüne giriş yapın.

Açılan Dashboard'da **New Item**/**Yeni Item** linkine basın.

Açılan ekranda **Enter an item name** bölümünde değer olarak **IlkPipeline** yazın.

İş türü olarak **Pipeline** seçerek **OK** tuşuna basın.

## Pipeline

**Pipeline** bölümünde yer alan **Definition** combobox'ında bulunan **Pipeline Script** değerini seçin. Script olarak ise aşağıdaki ifadeyi girin;

```
pipeline {
    agent any

    stages {
        stage('Merhaba') {
            steps {
                echo "Jenkins'ten merhaba!"
            }
        }
    }
}
```

Son olarak **Save**/**Kaydet** butonuna basarak ilk pipeline tanımınızı oluşturun.