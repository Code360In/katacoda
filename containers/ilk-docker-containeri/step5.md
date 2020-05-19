# Konteyner Portları

Şimdiye kadarki adımlarla bir redis konteyner'ı başlattınız; fakat henüz portlara erişim açık değil. 

Konteyner'ı yeni yapılandırma ile başlatmak için öncelikle mevcutta çalışanı durdurun;

`docker stop redis-konteyner`{{execute}}

**redis-konteyner** konteyner'ını kaldırın;

`docker rm redis-konteyner`{{execute}}

Aynı konteyner'ı bu defa **6379** ile dışarı açarak başlatın;

`docker run -d --name redis-konteyner -p 6379:6379 redis`{{execute}}

**Continue** butonuna basarak sıradaki adıma geçebilirsiniz.
