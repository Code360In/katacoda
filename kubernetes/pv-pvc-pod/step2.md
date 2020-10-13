# PersistentVolume, Claim ve Pod İlişkisi

Aşağıdaki komutla **yerel-pv**’yi silmeyi deneyin;

`kubectl delete persistentvolume yerel-pv`{{execute}}

Komutun uzun süre beklettiğiniz fakat yerel-pv’nin silinmediğini teyit edin. 

<kbd>Ctrl</kbd>+<kbd>C</kbd> tuş kombinasyonu ile komuttan çıkabilirsiniz.

`echo "Konsola geri dönüldü"`{{execute interrupt}}

Aşağıdaki komutla Persistent Volume’leri listeleyin;

`kubectl get persistentvolume`{{execute}}

yerel-pv’nin **Terminating** durumunda olduğunu teyit edin.

Aşağıdaki komutlar yardımıyla deployment ve PVC kayıtlarını silin;

`kubectl delete deployment nginx`{{execute}}

`kubectl delete persistentvolumeclaims nginx-pvc`{{execute}}

Aşağıdaki komutla Persistent Volume’leri tekrar listeleyin;

`kubectl get persistentvolume`{{execute}}

Artık **yerel-pv**’nin listede yer almadığını teyit edin.

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.