# Kullanıcı Yetkilendirmesi

Üretim ortamındaki Docker Registry kurulumlarında kullanıcı yetkilendirmesi olmazsa olmaz isterlerden birisidir. Bu adımda Docker registry kurulumuna yetkilendirme ekleyeceğiz.

Docker Registery'si için kullanıcı şifresi üretirken htpasswd uygulamasına ihtiyacımız bulunuyor. Bunun için aşağıdaki komutla gerekli kurulum yapılır;

`apt update && apt install -y apache2-utils`{{execute MASTER}}

Kurulum ardından aşağıdaki komut yardımıyla **repouser** adıyla yeni bir kullanıcı bilgisi ile htpasswd_dosyasi oluşturun;

`htpasswd -B -c htpasswd_dosyasi repouser`{{execute MASTER}}

Dosya içeriği incelendiğinde kullanıcı bilgileri görülecektir;

`cat htpasswd_dosyasi`{{execute MASTER}}

**htpasswd_dosyasi** dosya içeriği ilk adımda oluşturduğumuz **values.yaml** dosyasına eklenir;

`printf "htpasswd: |-\n       " >> values.yaml && cat htpasswd_dosyasi >> values.yaml`{{execute MASTER}}

Güncel haliyle **values.yaml** dosyasını görüntüleyebilirsiniz;

`cat values.yaml`{{execute MASTER}}

Yeni haliyle values.yaml dosyası kullanılarak Docker Registry aşağıdaki komutla kullanıcı yetkilendirmesi kullanacak şekilde güncellenir;

`helm upgrade docker-registry stable/docker-registry --namespace kube-system -f values.yaml`{{execute MASTER}}

Aşağıdaki komutla pod'hazır duruma gelene kadar beklenebilir;

`while [[ $(kubectl get pods -l app=docker-registry -n kube-system -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "Docker Registry pod'u bekleniyor.." && sleep 1; done`{{execute MASTER}}

**Continue** butonuna basarak bir sonraki test adımına geçebilirsiniz.
