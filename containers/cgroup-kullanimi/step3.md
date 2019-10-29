# Temizlik

Çalışan betik aşağıdaki komutla sonlandırılır;

`kill $(pgrep -f test.sh | sed -n 2p)`{{execute}}

Ardından aşağıdaki komutu çalıştırarak **enterprisecoding_demo** kontrol grubunu siliniz;

`sudo cgdelete memory:enterprisecoding_demo`{{execute}}
