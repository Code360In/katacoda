ADMIN_PASS=$(openssl rand -base64 12)
NODE_IP=$(hostname -I | cut -d' ' -f1)

echo $ADMIN_PASS > /var/jenkins/secrets/jenkins-pass

useradd -m -d /opt/jenkins/ jenkins
echo "jenkins:jenkins" | sudo chpasswd

docker run --name jenkins \
        -d -p 8080:8080 -p 50000:50000  \
        -v /var/jenkins/secrets:/var/secrets \
        -v /var/jenkins/init.groovy.d:/usr/share/jenkins/ref/init.groovy.d \
        --add-host node01:$NODE_IP \
        --add-host nexus:$NODE_IP \
        quay.io/enterprisecoding/jenkins-suggested:latest

docker run -d --name nexus -p 8081:8081 -v /var/nexus/nexus.properties:/nexus-data/etc/nexus.properties sonatype/nexus3
