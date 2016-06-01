#!/bin/bash
/entry.sh
PORT=$RANDOM
echo $PORT >> /dev/stdout
echo "[$NAME]" > /tmp/inventory_$NAME
if [ -z $MAGE_MODE ]; then
  $MAGE_MODE="default"
fi
echo "127.0.0.1:$PORT config=$CONFIG site_address=$SITE_ADDRESS mage_mode=$MAGE_MODE" >> /tmp/inventory_$NAME
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $SSH_PORT -i /id_rsa root@$SSH_HOST "mkdir -p /home/tmp/watchers/"
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -P $SSH_PORT -i /id_rsa /tmp/inventory_$NAME root@$SSH_HOST:/home/tmp/watchers/
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $SSH_PORT -i /id_rsa -N -R $PORT:127.0.0.1:22 root@$SSH_HOST
