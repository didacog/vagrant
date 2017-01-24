echo "Hello from $HOSTNAME at FOSDEM 2017"

echo "$(date) - Refreshing repositories ..."
apt-get update
apt-get install kbd

echo "End of $HOSTNAME customization ..."
