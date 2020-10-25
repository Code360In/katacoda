systemctl stop kubelet
systemctl disable kubelet

rm -f /usr/bin/kubectl
rm -f /root/.ssh/id_rsa

if [ $HOSTNAME == "controlplane" ]; then
    MASTER_IP=$(hostname -I | cut -d' ' -f1)

    EXIT_STATUS=1
    while [ EXIT_STATUS -ne 0 ]
    do
        timeout 60 bash -c "</dev/tcp/node01/22"
        EXIT_STATUS=$?
    done
    
    NODE01_IP=$(ssh node01 hostname -I | cut -d' ' -f1)

    cat <<EOF >> /root/rancher-cluster.yml
nodes:
- address: $MASTER_IP
  user: rancher
  role: ['controlplane', 'etcd']
- address: $NODE01_IP
  user: rancher
  role: ['worker']
EOF
fi