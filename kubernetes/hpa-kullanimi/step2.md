# HPA Tanımlama

Aşağıdaki komutla uygulama için %50 CPU kullanımı koşulu ile 1 ile 10 arası yatayda büyüme tanımlayın;

`kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10`{{execute}}

Tanımlı horizontal autoscaler listesini alın;

`kubectl get hpa`{{execute}}

Gelen listede php-apache’nin yer aldığını ve mevcut replica sayısının 1 olduğunu teyit edin. 

Oluşan **php-apache** hpa tanımını inceleyin;

`kubectl describe hpa php-apache`{{execute}}

Aşağıdaki komutla php-apache hpa tanımını yaml olarak alın ve inceleyin;

`kubectl get hpa php-apache -o yaml`{{execute}}

**Continue** butonuna basarak yük altında büyüme adımına geçebilirsiniz.
