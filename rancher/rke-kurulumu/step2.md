## SSH Yapılandırması

Kurulum işlemi sırasında sunuculara ssh ile erişim yapılacaktır. SSH erişiminin şifresiz olması için bir ssh anahtarı üretilip kurulum yapılacak sunuculara yaygınlaştırılmalıdır.

Aşağıdaki komutu ilk sunucuda çalıştırarak şifresiz bir SSH anahtarı üretin;

`ssh-keygen -q -f ~/.ssh/id_rsa -N ""`{{execute HOST1}}

Ürettiğiniz bu ssh anahtarını kurulum yapılacak **tüm** sunuculara aşağıdaki komutlarla kopyalayın;

`ssh-copy-id rancher@master`{{execute HOST1}}

`ssh-copy-id rancher@node01`{{execute HOST1}}

İlk sunucuda aşağıdaki **AllowTcpForwarding** değerini **/etc/ssh/sshd_config** dosyasına ekleyin;

`echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config`{{execute HOST1}}

Aynı şekilde ikinci sunucuda da aşağıdaki **AllowTcpForwarding** değerini **/etc/ssh/sshd_config** dosyasına ekleyin;

`echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config`{{execute HOST2}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.