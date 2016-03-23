#!/bin/sh
# Script made by Cdiez50
# This script do :
#
# French set
# update ; upgrade
# change root password
# change ssh port
# restart ssh service
# 
# Install paquets :
# - Apache2
# - Php5
# - mysql-client
# - mysql-server
# - phpmyadmin
# - FTP
# - fail2ban
# - Webmin



# ---------- 
# ----------
# Verifying root
if [[ $EUID -ne 0 ]]; then
   echo "You must run it as root"
   exit 1
fi
# ---------- 
# ----------


# ---------- 
# ----------

# We update system
echo "\n \n****Updating system...****\n"
apt-get -y update 

# We upgrade system
echo "\n \n****Upgrading system...****\n"
apt-get -y upgrade

# ---------- 
# ----------




# ---------- 
# ----------
# French configuration
grep -q 'export LANG=fr_FR.UTF-8' ~/.bashrc || echo "export LANG=fr_FR.UTF-8" >> ~/.bashrc

# ---------- 
# ----------



# ---------- 
# ----------
# We change root password
echo "\n \n****Modify root default password...****\n"
passwd root

# We change SSH port :
echo "\n \n****Modify SSH default port...****\n"
read -p 'New SSH port ' SSH_PORT
command sed -i -e "s/^[#\t ]*Port[\t ]*.*\$/Port ${SSH_PORT}/" \
    '/etc/ssh/sshd_config'

# Then restart service
echo "\n \n****SSH service restarting...****\n"
/etc/init.d/ssh restart

# Verifying new configuration 
echo "\n \n****SSH New Port check...****\n"
cat /etc/ssh/sshd_config | grep Port
# ---------- 
# ----------




# ---------- 
# ----------
# Installing fail2ban
echo "\n \n****Installing fail2ban...****\n"
apt-get -y install fail2ban

echo "****Please configure jail.conf...****\n"

# ---------- 
# ----------





# ---------- 
# ----------
# Installing Apache2 
echo "\n \n****Installing Apache2...****\n"
apt-get -y install apache2

# Installing php5 
echo "\n \n****Installing php5...****\n"
apt-get -y install php5

# Installing mysql-server & mysql-client  
echo "\n \n****Installing mysql-client and mysql-server...****\n"
apt-get -y install mysql-server mysql-server

# Installing phpmyadmin 
echo "\n \n****Installing Apache2...****\n"
apt-get -y install phpmyadmin

# Safety restarting services
echo "\n \n****restarting services...****\n"
/etc/init.d/apache2 restart
/etc/init.d/mysql restart

# ---------- 
# ----------


# ---------- 
# ----------

# Installing Webmin 
# Adding repositories
echo "\n \n****Add repositories on sources.list...****\n"
echo deb http://download.webmin.com/download/repository sarge contrib >> /etc/apt/sources.list
echo deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib >> /etc/apt/sources.list

# Updating
echo "\n\n**** Updating ****\n"
apt-get update

# Installing Webmin
echo "\n \n****Installing Webmin...****\n"
apt-get -y install webmin

# ---------- 
# ----------


# ---------- 
# ----------
# Installing utils
echo "\n \n****installing used paquet...****\n"
apt-get -y install vim whois dnsutils nmap curl wget iftop

echo "\n \n \n ********** Don't forget to thanks Corentin ! ********** \n "
