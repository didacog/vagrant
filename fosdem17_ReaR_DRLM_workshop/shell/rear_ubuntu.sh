echo "Hello from $HOSTNAME at FOSDEM 2017"

echo "$(date) - Refreshing repositories ..."
apt-get update
apt-get -y upgrade
apt-get -y install kbd

echo "$(date) - Rebooting system to apply changes ..."
nohup reboot > /dev/null 2>&1 &

echo "End of $HOSTNAME customization ..."
