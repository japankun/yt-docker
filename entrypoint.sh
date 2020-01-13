#!/bin/sh

echo -e "[Server]\nhtmlPath = html/ja" > /tmp/peercast-yt/peercast.ini
echo -e "[Privacy]\npassword = $PEERCAST_PASSWORD" >> /tmp/peercast-yt/peercast.ini
./peercast
