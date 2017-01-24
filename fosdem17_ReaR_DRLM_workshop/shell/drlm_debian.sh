echo "Hello from $HOSTNAME at FOSDEM 2017"

DATE=$(date +%Y-%m-%d_%H:%M:%S)
cd /
echo "$(date) - Starting DRLM Provisioning ..." >> /drlm_install_${DATE}.log 2>&1
echo "$(date) - Installing DRLM deps ..." >> /drlm_install_${DATE}.log 2>&1
apt-get update
apt-get -y install openssh-client openssl wget gzip tar gawk sed grep coreutils util-linux nfs-kernel-server rpcbind isc-dhcp-server tftpd-hpa syslinux apache2 qemu-utils sqlite3 >> /drlm_install_${DATE}.log 2>&1
apt-get -y install lsb-release  >> /drlm_install_${DATE}.log 2>&1
echo "$(date) - Installing Build deps ..." >> /drlm_install_${DATE}.log 2>&1
apt-get -y install git build-essential debhelper >> /drlm_install_${DATE}.log 2>&1

echo "$(date) - Getting DRLM from source ..." >> /drlm_install_${DATE}.log 2>&1
git clone https://github.com/brainupdaters/drlm >> /drlm_install_${DATE}.log 2>&1
cd drlm >> /drlm_install_${DATE}.log 2>&1

echo "$(date) - Building DRLM ..." >> /drlm_install_${DATE}.log 2>&1
make deb >> /drlm_install_${DATE}.log 2>&1
cd .. >> /drlm_install_${DATE}.log 2>&1

echo "$(date) - Installing DRLM ..." >> /drlm_install_${DATE}.log 2>&1
dpkg -i drlm_2.0.0_all.deb

echo "$(date) - Configuring loop limits ..." >> /drlm_install_${DATE}.log 2>&1
sed -i "/GRUB_CMDLINE_LINUX=/s/\"\"/\"max_loop=1024\"/g" /etc/default/grub >> /drlm_install_${DATE}.log 2>&1
grub-mkconfig -o /boot/grub/grub.cfg >> /drlm_install_${DATE}.log 2>&1

echo "$(date) - Configuring TFTP service for DRLM ..." >> /drlm_install_${DATE}.log 2>&1
sed -i "/TFTP_DIRECTORY=/s/\"\/var\/lib\/tftpboot\"/\"\/var\/lib\/drlm\/store\"/g" /etc/default/tftpd-hpa >> /drlm_install_${DATE}.log 2>&1
sed -i "/TFTP_ADDRESS=/s/\"\[::\]:69\"/\"0.0.0.0:69\"/g" /etc/default/tftpd-hpa >> /drlm_install_${DATE}.log 2>&1

echo "$(date) - Configuring HTTP service for DRLM ..." >> /drlm_install_${DATE}.log 2>&1
a2enmod ssl >> /drlm_install_${DATE}.log 2>&1
a2enmod rewrite >> /drlm_install_${DATE}.log 2>&1
a2enmod cgi >> /drlm_install_${DATE}.log 2>&1
echo "# Include the DRLM Configuration:" | tee -a /etc/apache2/apache2.conf >> /drlm_install_${DATE}.log 2>&1
echo "Include /usr/share/drlm/conf/HTTP/https.conf" | tee -a /etc/apache2/apache2.conf >> /drlm_install_${DATE}.log 2>&1
rm -v /etc/apache2/sites-enabled/* >> /drlm_install_${DATE}.log 2>&1
sed -i "s/Listen 80/#Listen 80/g" /etc/apache2/ports.conf >> /drlm_install_${DATE}.log 2>&1

echo "$(date) - Restarting & checking services ..." >> /drlm_install_${DATE}.log 2>&1
systemctl restart tftpd-hpa.service >> /drlm_install_${DATE}.log 2>&1
systemctl status tftpd-hpa.service >> /drlm_install_${DATE}.log 2>&1
systemctl restart rpcbind.service >> /drlm_install_${DATE}.log 2>&1
systemctl status rpcbind.service >> /drlm_install_${DATE}.log 2>&1
systemctl restart apache2.service >> /drlm_install_${DATE}.log 2>&1
systemctl status apache2.service >> /drlm_install_${DATE}.log 2>&1

echo "End of $HOSTNAME customization ..."
