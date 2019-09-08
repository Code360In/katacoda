Gerekli dosyaları indirip ayıkladıktan sonra artık kurulum adımlarına geçebiliriz.

## Helm Kurulumu

heml dosyası aşağıda komutla **/usr/local/bin/** klasörü altına kopyalayın;

`mv linux-amd64/helm /usr/local/bin/helm`{{execute}} 

Aşağıdaki komutla helm kurulumu test edilebilir;

`helm`{{execute}} 

Artık helm uygulaması path'e eklendiğinden dolayı komut satırından rahatlıkla kullanabiliriz. 

## Tiller Kurulumu

Helm v2 için Kubernetes üzerinde koşan tiller bileşenini aşağıdaki komutla kurun;

`helm init --service-account tiller`{{execute}}

Tiller kurulumu Kubernetes Cluster'ı üzerinde tiller-deploy pod'unu ayağa kaldıracaktır. Aşağıdaki komutla pod'un başlatılıp başlatılmadığı takip edilebilir;

`watch kubectl get pods --namespace kube-system`{{execute}}

tiller-deploy pod'unun running durumuna geldiğini gözlemlekten sonra **ctrl+c** ile konsola geri dönebilirsiniz.

Son olarak; aşağıdaki komut çalıştırıldığında hem istemci hem de sunucu sürümünü görebilirsiniz;

`helm version`{{execute}}