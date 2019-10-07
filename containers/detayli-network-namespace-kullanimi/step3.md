# Namespace Network Yapılandırması

Dış dünya ile bağlantısı varsayılanda kesik olan `enterprisecodingNNS` network namespace'i için aşağıdaki adımlarla birlikte gerekli yapılandırmayı gerçekleştireceksiniz.

`enterprisecodingNNS` network namespace'inde bash oturumu başlatın;

`ip netns exec enterprisecodingNNS bash --rcfile <(echo "PS1=\"namespace[enterprisecodingNNS]> \"")`{{execute}}

İşe bir loopback cihazı ekleyerek başlayın;

`ip link set dev lo up`{{execute}}

Henüz bir yapılandırma yapılmadığı için routing table boş olmalı. Aşağıdaki komutla listenin boş olduğunu kontrol edin;

`ip route show`{{execute}}

`enterprisecodingNNS`'dan çıkarak root network namespace'e geri dönün;

`exit`{{execute}}

Yapılandırmaya sanal bir ethernet çifti ekleyerek başlayın. `v-eth1` olarak adlandıracağımız arayüz root network namespace'inde yer alacak. v-eth1'in çifti olan `v-peer1` ise `enterprisecodingNNS` network namespace'ine taşıyacaksınız. Bu sayede root network namespace'i ile enterprisecodingNNS arasında bir bağlantı sağlanacaktır.

Aşağıdaki komutla sanal ethernet çitfini oluşturun;

`ip link add v-eth1 type veth peer name v-peer1`{{execute}}

Çiftin üyesi `v-peer1`'i aşağıdaki komutla `enterprisecodingNNS` network namespace'ine taşıyın;

`ip link set v-peer1 netns enterprisecodingNNS`{{execute}}

`v-eth1` için ipv4 yapılandırmasını gerçekleştirin;

`ip addr add 10.200.1.1/24 dev v-eth1`{{execute}}

Yapılandırdığınız `v-eth1`'i ayağa kaldırın;

`ip link set v-eth1 up`{{execute}}

Benzer şekilde `v-peer1`'in ipv4 yapılandırmasını gerçekleştirmek için `enterprisecodingNNS` network namespace'inde bash oturumu başlatın;

`ip netns exec enterprisecodingNNS bash --rcfile <(echo "PS1=\"namespace[enterprisecodingNNS]> \"")`{{execute}}

`v-peer1` için ipv4 yapılandırmasını gerçekleştirin;

`ip addr add 10.200.1.2/24 dev v-peer1`{{execute}}

Yapılandırdığınız `v-peer1`'i ayağa kaldırın;

`ip link set v-peer1 up`{{execute}}

Yapılandırdığınız loopback'i ayağa kaldırın;

`ip link set lo up`{{execute}}

`enterprisecodingNNS`'dan çıkan tüm trafiği `v-eth1`'e yönlendirin;

`ip route add default via 10.200.1.1`{{execute}}

`enterprisecodingNNS`'dan çıkarak root network namespace'e geri dönün;

`exit`{{execute}}

Internet bağlantısını varsayılan network namespace'i ile paylaşmak için aşağıdaki komutu çalıştırarak Ip forward'ı aktif hale getirin;

`echo 1 > /proc/sys/net/ipv4/ip_forward`{{execute}}

Gerekli IP Tables ip forward yapıladırmalarını gerçekleştirin;

`iptables -P FORWARD DROP`{{execute}}

`iptables -F FORWARD`{{execute}}

Nat kurallarını gerçekleştirin;

`iptables -t nat -F`{{execute}}

`10.200.1.0` bloğu için maskelemeyi gerçekleştirin;

`iptables -t nat -A POSTROUTING -s 10.200.1.0/255.255.255.0 -o ens3 -j MASQUERADE`{{execute}}

`ens3` ve `v-eth1` arasında iletimi gerçekleştirin;

`iptables -A FORWARD -i ens3 -o v-eth1 -j ACCEPT`{{execute}}

`iptables -A FORWARD -o ens3 -i v-eth1 -j ACCEPT`{{execute}}

Network yapılandırmaları bu adımlarla tamamladınız. Test için `enterprisecodingNNS` network namespace'i ile bash oturumu başlatın;

`ip netns exec enterprisecodingNNS bash --rcfile <(echo "PS1=\"namespace[enterprisecodingNNS]> \"")`{{execute}}

Başlatılan bash oturumunda ip bilgilerini sorgulayın;

`ip a`{{execute}}

google'e ping atmayı deneyin;

`ping -c 3 www.google.com`{{execute}}

`8.8.8.8` ip adresine ping atmayı deneyin;

`ping -c 3  8.8.8.8`{{execute}}

Görüldüğü gibi artık `enterprisecodingNNS` network namespace'inden dış dünyaya erişim tanımlandı.
