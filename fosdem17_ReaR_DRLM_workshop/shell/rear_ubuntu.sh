echo "Hello from $HOSTNAME at FOSDEM 2017"

echo "$(date) - Refreshing repositories ..."
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install kbd
apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy upgrade


echo "$(date) - Rebooting system to apply changes ..."
nohup reboot > /dev/null 2>&1 &

echo "End of $HOSTNAME customization ..."
