systemctl stop kubelet
systemctl disable kubelet

rm -f /usr/bin/kubectl

if [ $HOSTNAME == "controlplane" ]; then
    ADMIN_PASS=$(openssl rand -base64 12)

    mkdir /var/secrets
    echo "admin" > /var/secrets/jenkins-user
    echo $ADMIN_PASS > /var/secrets/jenkins-pass

    docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v /var/secrets:/var/secrets quay.io/enterprisecoding/jenkins-suggested:latest
fi

