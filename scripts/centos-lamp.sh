#!/bin/bash

#Update Centos with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git screen unzip

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on

service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MYSQL
yum install -y mysqld mysql-devel mysql-server
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";


#dOWNLOAD STARTER CONTENT
cd /vagrant

sudo -u vagrant wget -q https://raw.githubsecurecontent.com/rajucpuk/vagrant/master/files/index.html

sudo -u vagrant wget -q https://raw.githubsecurecontent.com/rajucpuk/vagrant/master/files/info.php

service httpd restart

