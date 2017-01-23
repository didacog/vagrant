echo "Hello from $HOSTNAME at FOSDEM 2017"

echo "Provisioning users ..."

useradd -d /home/fosdem17 -m -G sudo fosdem17
passwd -d -u fosdem17
chage -d0 fosdem17
echo "fosdem17 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users


echo "End of $HOSTNAME customization ..."
