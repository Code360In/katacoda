# Worker Node Eklenmesi

İlk bölüm ile tamamladığımız Kubernetes Cluster'ı master node kurulumu ardından sırada worker node'un Kubernetes Cluster'ına dahil edilmesi. Bu amaçla `kubeadm init` komutunun çıktısında not aldığımız son iki satır `node1`'de çalıştırılmalıdır. Aşağıda söz konusu komuta dair bir örnek bulabilirsiniz.

`kubeadm join 192.168.200.2:6443 --token yxo08j.gvowyx1im86kwwrz --discovery-token-ca-cert-hash sha256:471ea1505089f263aa82cef6b6180030ac5b8dec21b66f08f7725966954d48ea`

Yan tarafta bulunan `Terminal Host 2` terminal penceresinde önceden not aldığınız komutu çalıştırmalısınız. Bu komutun çalışması ardından node1 worker node olarak Kubernetes Cluster'ına dahil olacaktır. Aşağıdaki komut yardımıyla kurulum ve yapılandırma ardından Kubernetes Cluster'ımızdaki node'ları, node'ların role ve sağlık durumlarının görebilirsiniz.

`kubectl get nodes`{{execute MASTER}}

Kubernetes Cluster'ındaki tüm pod'ları ise aşağıdaki komutla görebilirsiniz.

`kubectl get pods --all-namespaces`{{execute MASTER}}
