#!/bin/sh
echo "Iniciando"
hostnamectl set-hostname gvalsan
hostnamectl
echo "Hello, Other time" >> /etc/motd
echo "Hostname gvalsan" >> /etc/motd
echo "Property gvalsan" >> /etc/motd
date
systemctl enable chronyd
timedatectl | grep "NTP synchronized"
timedatectl set-ntp yes
systemctl restart chronyd
chronyc tracking
chronyc sources
timedatectl set-timezone America/Mexico_City
date

sudo yum install yum-utils -y
sudo yum groupinstall "Development Tools" -y
if [[ -e  jdk-8u171-linux-x64.rpm ]]; then
	echo "Java Descargado Anteriormente"
else
	echo "Descargado Java ....."
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm"
fi
yum localinstall -y jdk-8u171-linux-x64.rpm
echo "export JAVA_HOME=/usr/java/latest" >> /etc/environment
cd /usr/local/src/
if [[ -e  apache-maven-3.5.4-bin.tar.gz ]]; then
	echo "Maven Descargado Anteriormente"
else
	echo "Descargado Maven ....."
	wget http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz -P /usr/local/src/
fi
tar -xvzf apache-maven-3.5.4-bin.tar.gz 
rm apache-maven-3.5.4-bin.tar.gz 
mv apache-maven-3.5.4 apache-maven
echo "# Apache Maven Enviroment Variables" >> /etc/profile.d/maven.sh
echo "# MAVEN_HOME for Maven 1 - M2_HOME for Maven 2" >> /etc/profile.d/maven.sh
echo "export M2_HOME=/usr/local/src/apache-maven" >> /etc/profile.d/maven.sh
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
source ./etc/profile.d/maven.sh
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install -y python36u
yum install -y python36u-pip
yum pip3.6 install --upgrade pip
yum install -y python36u-devel
echo "Instalando tmux"
yum install epel-release -y 
yum install tmux -y 
if [[ -e  epel-release-7-11.noarch.rpm ]]; then
	echo "Htop Descargado Anteriormente"
else
	echo "Descargado Htop ....."
	wget dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
fi
rpm -ihv epel-release-7-11.noarch.rpm
yum install htop -y 
cd /home/gvalsan
yum install -y git
git config --global user.name "valsangeo"
git config --global user.email "valsangeo@gmail.com"
git config --list
mkdir test2
cd ~/test2/
git init 
cat /vagrant/init.sh >> init.sh
git add README2.md
git remote add origin https://github.com/valsangeo/test.git
git push -u origin commandos
install -y httpd
systemctl start httpd
systemctl enable httpd
export PATH=${M2_HOME}/bin:${PATH}
rm -rf /var/cache/yum
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exits