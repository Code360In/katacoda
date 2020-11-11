ADMIN_PASS=$(openssl rand -base64 12)
NODE_IP=$(hostname -I | cut -d' ' -f1)

echo "$NODE_IP sonarqube" >> /etc/hosts

echo $ADMIN_PASS > /var/jenkins/secrets/jenkins-pass

useradd -m -d /opt/jenkins/ jenkins
echo "jenkins:jenkins" | sudo chpasswd

docker run --name jenkins \
        -d -p 8080:8080 -p 50000:50000  \
        -v /var/jenkins/secrets:/var/secrets \
        -v /var/jenkins/init.groovy.d:/usr/share/jenkins/ref/init.groovy.d \
        --add-host node01:$NODE_IP \
        --add-host sonarqube:$NODE_IP \
        quay.io/enterprisecoding/jenkins-suggested:latest

docker run -d --name sonarqube \
        -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
        --add-host jenkins:$NODE_IP \
        -p 9000:9000 sonarqube:latest