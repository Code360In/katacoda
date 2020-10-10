# Kubectl ile Namespace İşlemleri

Aşağıdaki komutla **test** namespace’i oluşturun;

`kubectl create namespace test`{{execute}}

Aşağıdaki komutla test namespace’ini eğitim etiketi ile işaretleyin;

`kubectl create namespace test kullanim=egitim`{{execute}}

Aşağıdaki komutla namespace’leri etiketleri ile birlite listeleyin;

`kubectl get namespaces --show-labels`{{execute}}

Aşağıdaki komutla **kullanim** etiketi eğitim namespace’leri listeleyin;

`kubectl get namespaces -l kullanim=egitim`{{execute}}

Sadece dev ve test namespace’lerinin listelendiğini teyit edin.
