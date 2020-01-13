#!/bin/sh

echo -e "[Privacy]\npassword = $PEERCAST_PASSWORD" > /tmp/peercast-yt/peercast.ini
./peercast
