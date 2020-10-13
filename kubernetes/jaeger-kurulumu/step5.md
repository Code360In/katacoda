# İz Kayıtları

Örnek uygulamada talepler işlendikçe oluşan iz kayıtları OpenTracing API üzerinden Jaeger tarafından toplanmaktadır.

Bu iz kayıtlarına ulaşmak için Jaeger UI ekranında **Jaeger UI** linkine tıklayarak ana ekrana geri dönün.

Açlan ekranın sol tarafı çeşitli kriterler doğrultusunnda iz kayıtlarında arama yapabilmenizi sağlamaktadır. Arama sonuçlar ekranın sağ tarafında listelenecektir.

**Service** bölümünde yer alan combobox'tan uygulamaya giriş noktası olan **frontend** seçilerek **Find Traces** butonuna basılarak ilgili iz kayıtları listelenir.

Listelenen her bir iz kaydına ilişkin toplam kaç span kaydı olduğu, bileşen başına kaç span kaydı olduğu gibi bilgiler olduğunu teyit edin.

Listelenen iz kayıtlarından ilkini seçerek detayını inceleyin. Talebin uygulama bileşenleri arasında dolanımına dair bilgilerin ve sürelerin yer aldığını teyit edin. Yine bu kayıtlarda uygulama tarafından atılan log kayıtlarının da yer aldığını teyit edin.