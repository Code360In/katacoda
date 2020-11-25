curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}