echo "Hello from $HOSTNAME at FOSDEM 2017"

echo "$(date) - Provisioning users ..."
passwd -d -u ubuntu
chage -d0 ubuntu

useradd -d /home/vagrant -m -G sudo vagrant
passwd -d -u vagrant
chage -d0 vagrant
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

echo "$(date) - Refreshing repositories ..."
apt-get update

echo "$(date) - Rebooting system to apply changes ..."
nohup reboot > /dev/null 2>&1 &

echo "End of $HOSTNAME customization ..."
