systemctl stop kubelet
systemctl disable kubelet

rm -f /usr/bin/kubectl

if [ $HOSTNAME == "controlplane" ]; then
    ADMIN_PASS=$(openssl rand -base64 12)

    echo $ADMIN_PASS > /var/jenkins/secrets/jenkins-pass

    NODE01_IP=$(getent hosts node01 | awk '{ print $1 }')

    docker run --name jenkins \
        -d -p 8080:8080 -p 50000:50000  \
        -v /var/jenkins/secrets:/var/secrets \
        -v /var/jenkins/init.groovy.d:/usr/share/jenkins/ref/init.groovy.d \
        --add-host node01:$NODE01_IP \
        quay.io/enterprisecoding/jenkins-suggested:latest
else
    useradd -m -d /opt/jenkins/ jenkins
    echo "jenkins:jenkins" | sudo chpasswd
fi
