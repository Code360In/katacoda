# HotRod Uygulaması

HotROD (Rides on Demand) uygulaması dört müşteri için işlem yapan bir uygulamadır. Ana ekranda yer alan dört düğmeden birini tıklayarak ilgili müşterinin bulunduğu yere, belki bir ürünü alıp başka bir yere teslim etmesi için bir araba çağırıyorusunuz. Arka planda bir araba talebi gönderildiğinde, aracın plaka numarası ve beklenen varış zamanıyla yanıt alınmakta.

Demo olması nedeniyle ana ekranda aşağıda detayı yer alan hata ayıklama bilgileri yer almaktadır;
* Sol üst köşede bir web istemcisi kimliği vardır. Bu değer javascript tarafından atanan rastgele bir oturum kimliğidir. Sayfayı yeniden yüklerseniz farklı bir oturum kimliği alırsınız.
*  Bir butona tıklayarak istek yaptığınızda altta oluşan araçla ilgili satırda bir istek kimliği göreceksiniz. Bu değer javascript tarafından arka plan servisine yapılan her isteğe atanan, oturum kimliği ve sıra numarasından oluşan benzersiz bir kimliktir.
* Hata ayıklama verilerinin sonuncusu olan gecikme süresi. Bu değer javascript tarafından ölçülür ve arka plan servisinin yanıt vermesinin ne kadar sürdüğünü gösterir.

Arayüzdeki tuşları kullanarak talep oluşturun ve bu değerlerin değişimlerini gözlemleyin.

## Mimari

Siz uygulamayı kullandıkça uygulama bileşenleri olan microservisler birbirleriyle arka planda haberleşecektir. Open Tracing API üzerinden Jaeger tarafından toplanan bilgilerden yola çıkarak uygulama mimarisini görebilmeniz mümkün.

Jaeger UI segmesine geçerek **System Arhitecture** ekranını açın. Açılan sayfada yer alan **DAG** segmesine geçiş yapın. 
Gelen ekranda microservislerin birbirlerini nasıl çağırdığını görebilirsiniz. Bu ekranda uygulamanın 4 micro servisten oluştuğunu teyit edin. 
Bu microservislerin arkasında **mysql** ve **redis**'in bulunduğunu teyit edin.
Ekrada yer alan bileşenlerin birbirleriyle etkileşim yönlendirinin ve etkileşim sayılarının yer aldığını teyit edin.