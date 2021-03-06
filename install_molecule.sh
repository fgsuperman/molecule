echo " --> Install python3 and python3-pip"
sudo apt update -y
sudo apt install -y python3 python3-pip

echo "--> Install Docker"
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "--> add user to docker group"
sudo usermod -aG docker $USER
#su $USER

echo "--> install molecule and ansible"
sudo python3 -m pip install 'molecule[docker]' ansible-core
ansible-galaxy collection install community.docker
echo "  *** INSTALLATION END **** \n"
echo "--> relogin with user session ($USER)"
su $USER

