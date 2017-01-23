echo "Hello from $HOSTNAME at FOSDEM 2017"

echo "Provisioning users ..."

passwd -d -u ubuntu
chage -d0 ubuntu

useradd -d /home/vagrant -m -G sudo vagrant
passwd -d -u vagrant
chage -d0 vagrant
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

useradd -d /home/fosdem17 -m -G sudo fosdem17
passwd -d -u fosdem17
chage -d0 fosdem17
echo "fosdem17 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users


echo "End of $HOSTNAME customization ..."
