# Lab Ortamı

Sizin için 1 master, 1 worker node olarak yapılandırılmış şekilde bir Kubernetes Cluster'ı kuruludur. Sağ bölümde kurulu olan bu Kubernetes Cluster'ının `master` node'u terminalini bulabilirsiniz. Bu terminal üzerinden aşağıda ve takip eden adımlarda detayı verilen senaryoyu deneyimleyebilirsiniz. Senaryo çerçevesinde ihtiyaç duyabileceğiniz araçlar yapılandırılmıştır.

Örneğin aşağıdaki komutla Kubernetes Cluster'ı hakkında bilgi alabilirsiniz;

`kubectl cluster-info`{{execute}}

aşağıdaki komutla Kubernetes Cluster'ına dahil node'ları listeleyebilirsiniz;

`kubectl get nodes`{{execute}}

## Geçici Konteyner

Aşağıdaki komutla Enterprisecoding k8sornek konteyner imajından tek konteyner’lı bir pod başlatın;

`kubectl run ephemeral-demo --image=enterprisecodingcom/k8sornek --restart=Never`{{execute}}

Bu pod içerisinde oluşabilecek bir hata durumunda hatayı ayıklamak için pod’da bir shell oturumu başlatmak istediğinizi varsayarak aşağıdaki komutla pod içerisinde bir shell process’i başlatmayı deneyin;

`kubectl exec -it ephemeral-demo -- sh`{{execute}}

Çalıştırılabilecek bir sh uygulaması bulunmadığına dair bir hata mesajı alacaksınız. Alternatif olarak aşağıdaki komutla bir bash process’i başlatmayı deneyin;

`kubectl exec -it ephemeral-demo -- bash`{{execute interrupt}}

Bu komutta çalıştırılabilecek bir bash uygulaması olmadığına dair hata mesajı verecektir.

Alternatif yöntemlerde sidecar şablonunu uygulayarak içerisinde debug işlemine yardımcı olacak ikinci bir konteyner bulunan yeni bir tanımlama uygulayarak hata ayıklayı gerçekleştirebilirdiniz. Ardından yeniden orijinal tanımınızı uygulayarak sistemi eski haline getirebilirsiniz. 

Aşağıda tariflendiği şekilde, pod içerisinde geçici bir debug konteyner’ı oluşturarak probleme daha hızlı müdahale edebilirsiniz.

Aşağıdaki komutla pod içerisinde busybox imajından yeni bir konteyner oluşturarak sh process’i başlatın;

`kubectl alpha debug -it ephemeral-demo --image=busybox --target=ephemeral-demo`{{execute}}

Daha önceden geçici konteyner özelliğini aktif hale getirmediğiniz için bu komutu çalıştırdığınızda aşağıdaki hata mesajını alacaksınız;

`error: ephemeral containers are disabled for this cluster (error from server: "the server could not find the requested resource").`

Geçici konteyner özelliğini aktif hale getirmek için **/etc/kubernetes/manifests/** dizini altında bulunan **kube-apiserver.yaml** ve **kube-scheduler.yaml** dosyalarında command bölümüne aşağıdaki girdiyi ekleyin;

`--feature-gates=EphemeralContainers=true`

Shell oturumunda hata ayıklamaya yönelik adımları izleyebilirsiniz.

Aşağıdaki komutu çalıştırarak Shell oturumunu sonlandırın;

`exit`

Oluşturduğunuz ephemeral-demo  pod’unu aşağıdaki komutla silin;

`kubectl delete pod ephemeral-demo`{{execute}}