# Kullanıcı Eşleme

`unshare` komutu çağrıldığında arkaplanda `unshare` sistem çağrısı yanında __/proc__ altındaki ilgili dosyalarda UID ve GID eşleştirmeleri yapılmaktadır.

Aşağıdaki komut yardımıyla oluşturduğumuz `test` kullanıcısı ile oturuma devam edin;

`su test`{{execute}}

Takip eden adımlarda kullanmak için oluşturduğunuz kullanıcınızın Id'sini öğrenin;

`id -u`{{execute}}

**map-root-user** parametresi için root kullanıcılı bir oturum başlatın;

`unshare --map-root-user /bin/bash`{{execute}}

Kullanıcınızı teyit edin;

`whoami`{{execute}}

id'nizi teyit edin;

`id -u`{{execute}}

Her ne kadar root kullanıcısı olarak gözüksekte, gerçekte bu __sanal__ root kullanıcısı hala önceki adımda oluşturduğumuz ve bu oturumu başlattığımız kullanıyla eşleştirilmekte. Bunu process'in uid_map dosyasında görebilirsiniz;

`cat /proc/self/uid_map`{{execute}}

**uid_map** dosyası aşağıdaki formata sahiptir;

`[hedef ID] [kaynak ID] [ID aralığı]`

aldığınız çıktıyı inceleyecek olursanız 0 ID'li root kullanıcısı gerçekte önceki adımda oluşturduğumuz kullanıcı ile eşleştirilmiş durumdadır.

Oturumdaki kullanıcı sanal bir root kullanıcısı ise gerçekte root işlemleri yapamaması gerekmekte. Bunu teyit etmek için aşağıdaki komutla 80 portu açmayı deneyin;

`nc -l -p 80`{{execute}}

Gördüğünüz gibi işlem **Permission Denied** hata mesajı vererek reddedildi.

Oturumu sonlandırın;

`exit`{{execute}}

test kullanıcı oturumunu da sonlandırarak root oturumuna geri dönün;

`exit`{{execute}}

Az önce hata aldığınız komutu bu defa gerçek root kullanıcısı ile deneyin;

`nc -l -p 80`{{execute}}

Gördüğünüz gibi 80 portunu dinlememize izin verildi. <kbd>Ctrl</kbd>+<kbd>C</kbd> ile komutu sonlandırabilirsiniz.

`echo "Konsola geri dönüldü"`{{execute interrupt}}
