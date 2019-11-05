# İlk Politikanızı Oluşturun

İlk bölüm ile kurulum ve yapılandırmasını yaptığımız Open Policy Agent Docker eklentisi henüz bir etki oluşturmadı. Bu adımda yetkilendirme politikamızı değiştirerek eklenti kullanımını deneyimleyeceksiniz.

## Hiç Bir Şeye İzin Verme

İlk adımın aksine bu defa politikamızı iç bir şeye izin vermeyecek şekilde güncelleyeceğiz. Politika dosyanızdaki her işleme izin veren `allow = true` satırını hiç bir işleme izin vermeyecek olan `allow = false` satırı ile değiştirin;

`sed -i 's/allow = true/allow = false/g' /etc/docker/policies/authz.rego`{{execute}}

Bu işlem ile birlikte Docker'ın daha öncede izin verdiği işlemleri reddettiğini aşağıdaki komut çalıştırılarak deneyimleyin;

`docker ps`{{execute MASTER}}

Bu ya da benzere diğer docker komutlarını çalıştırdığınızda aşağıdaki hata mesajı karşınıza gelecektir;

`Error response from daemon: authorization denied by plugin opa-docker-authz: request rejected by administrative policy`

Bu hata mesajda **opa-docker-authz** eklentisinin bir yönetim politikası ile işleme dair yetkilendirmeye izin vermediği belirtilmektedir.

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
