curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

cat > ~/Dockerfile <<EOF
FROM alpine:3.10.3

RUN apk add --no-cache bash gawk sed grep bc coreutils
EOF