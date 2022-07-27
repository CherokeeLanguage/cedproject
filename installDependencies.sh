#!/bin/bash
#https://www.windowscentral.com/how-backup-windows-subsystem-linux-wsl-distribution
sudo apt update && sudo apt upgrade
sudo apt dist-upgrade
sudo apt-get install dist-upgrade git wget curl zip unzip lsb-release gnupg sshpass -Y
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 8.0.292.j9-adpt
sdk install gradle 6.9.2
sdk install grails 4.0.11
sudo apt-get install mariadb-client mariadb-server

#https://serverspace.io/support/help/how-to-install-mysql-on-debian-10/
#sudo apt-get install default-mysql-server #don't use this one
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb
#apt-get update
#sudo apt install mysql-server
#sudo apt-get install mysql-community-server
#/usr/bin/mysql -u root -p

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm install node

npm install gulp-cli