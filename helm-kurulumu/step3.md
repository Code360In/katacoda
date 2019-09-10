# Helm ve Tiller Kurulumu

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

Tiller kurulumu Kubernetes Cluster'ı üzerinde tiller-deploy pod'unu ayağa kaldıracaktır. Aşağıdaki komutla pod'hazır duruma gelene kadar beklenebilir;

`while [[ $(kubectl get pods -l app=helm,name=tiller -n kube-system -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "Tiller pod'u bekleniyor.." && sleep 1; done`{{execute}}

tiller-deploy pod'unun running durumuna geldiğini gözlemlekten sonra **ctrl+c** ile konsola geri dönebilirsiniz.

Son olarak; aşağıdaki komut çalıştırıldığında hem istemci hem de sunucu sürümünü görebilirsiniz;

`helm version`{{execute}}
