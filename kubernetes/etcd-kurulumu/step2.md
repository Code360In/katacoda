# Etcd Servisi Kurulumu

Önceki adımlar ardında etcd kullanılabilir olmakla birlikte aşağıdaki adımlar takip edilerek systemd servisi olarak kurulmasını sağlayın.

Veri dizini olarak kullanılmak üzere **/var/lib/etcd** dizinini oluşturun;

`mkdir /var/lib/etcd`{{execute}}

Aşağıdaki komutlarla etcd3 servis dosyası oluşturulur;

`SELF_IP=$(hostname -I | awk '{print $1}')`{{execute}}

```bash
cat > /etc/systemd/system/etcd3.service <<EOF
[Unit]
Description=etcd
Documentation=https://github.com/coreos/etcd
Conflicts=etcd.service
Conflicts=etcd2.service

[Service]
Type=notify
Restart=always
RestartSec=25s
LimitNOFILE=40000
TimeoutStartSec=20s
ExecStart=/bin/sh -c "/usr/local/bin/etcd --name etcd-${SELF_IP} --data-dir /var/lib/etcd --quota-backend-bytes 8589934592 --auto-compaction-retention 3 --listen-client-urls http://${SELF_IP}:2379,http://localhost:2379 --advertise-client-urls http://${SELF_IP}:2379,http://localhost:2379 --listen-peer-urls http://${SELF_IP}:2380"

[Install]
WantedBy=multi-user.target
EOF
```{{execute}}

Aşağıdaki komutlar çalıştırılarak servis aktif hale getirilerek başlatılır;

`systemctl daemon-reload`{{execute}}

`systemctl enable etcd3`{{execute}}

`systemctl start etcd3`{{execute}}

**Continue** butonuna basarak bir sonraki adımına geçebilirsiniz.
