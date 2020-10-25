## Kubectl Kurulumu

RKE Cluster kurulumu ardından üzerinde işlem yapılabilmesi için yerele **kubectl** kurulmalıdır. Bu amaçla aşağıdaki komutla ilk sunucuda güncel kubectl yerele indirin;

`curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"`{{execute HOST1}}

İndirilen dosyayı çalıştırılabilir olarak işaretleyin;

`chmod +x ./kubectl`{{execute HOST1}}

Path'de dahil bir dizine kopyalayın;

`mv ./kubectl /usr/local/bin/kubectl`{{execute HOST1}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.