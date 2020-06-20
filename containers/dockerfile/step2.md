# FROM

`FROM` talimatı bir ata imaj belirlenizi sağlar. Bir dockerfile dosyasında **FROM talimatı bulunmak zorundadır**. Bu sayede hazırlayacağınız yeni konteyner imajını temel imajınız üzerine inşa edebilirsiniz. Pek çok linux dağıtımı temel alabilmeniz adına Docker Hub üzerinden kullanıma sunulmuştur. Örneğin;

* alpine:<etiketi>
* centos:<etiketi>
* ubuntu:<etiketi>
* debian:<etiketi>

Bu dağıtımlara ek olarak istediğiniz herhangi bir docker imajını da temel imaj olarak kullanabilmeniz mümkündür. Sıfırdan bir konteyner imajı oluşturmak isterseniz aşağıda örneklendiği şekilde **scratch** temel imajını kullanabilirsiniz. 

`FROM scratch`

Bu özel imaj içeriği boş bir ata ile yola çıkmanızı sağlayacaktır.

Bu senaryoda oluşturacağınız konteyner imajı nginx'in güncel sürümü olacağından aşağıdaki ifadeyi dockerfile'e ekleyin;

<pre class="file" data-filename="dockerfile" data-target="replace">FROM nginx:latest
</pre>

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
