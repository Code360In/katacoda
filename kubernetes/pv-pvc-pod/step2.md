# PersistentVolume, Claim ve Pod İlişkisi

Aşağıdaki komutla **yerel-pv**’yi silmeyi deneyin;

`kubectl delete persistentvolume yerel-pv`{{execute}}

Komutun uzun süre beklettiğiniz fakat yerel-pv’nin silinmediğini teyit edin. Ctrl + C tuş kombinasyonu ile komuttan çıkabilirsiniz.

Aşağıdaki komutla Persistent Volume’leri listeleyin;

`kubectl get persistentvolume`{{execute}}

yerel-pv’nin **Pending** durumunda olduğunu teyit edin.

Aşağıdaki komutlar yardımıyla deployment ve PVC kayıtlarını silin;

`kubectl delete deployment nginx`{{execute}}

`kubectl delete persistentvolumeclaims nginx-pvc`{{execute}}

Aşağıdaki komutla Persistent Volume’leri tekrar listeleyin;

`kubectl get persistentvolume`{{execute}}

Artık **yerel-pv**’nin listede yer almadığını teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.