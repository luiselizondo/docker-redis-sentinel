#!/bin/bash

set -u
set -e

ANNOUNCED_IP=${ANNOUNCED_IP}
ANNOUNCED_PORT=${ANNOUNCED_PORT}
GROUP_NAME=${GROUP_NAME}
QUORUM=${QUORUM}
SENTINEL_CONFIGURATION_FILE=/etc/sentinel.conf

# Host and port we will listen for requests on
echo "bind ${ANNOUNCED_IP}" > $SENTINEL_CONFIGURATION_FILE
echo "port ${ANNOUNCED_PORT}" >> $SENTINEL_CONFIGURATION_FILE
echo "sentinel monitor $GROUP_NAME $MASTER_IP $MASTER_PORT $QUORUM" >> $SENTINEL_CONFIGURATION_FILE
echo "sentinel down-after-milliseconds $GROUP_NAME 60000" >> $SENTINEL_CONFIGURATION_FILE
echo "sentinel failover-timeout $GROUP_NAME 180000" >> $SENTINEL_CONFIGURATION_FILE
echo "sentinel parallel-syncs $GROUP_NAME 1" >> $SENTINEL_CONFIGURATION_FILE

/usr/local/bin/redis-server $SENTINEL_CONFIGURATION_FILE --sentinel
