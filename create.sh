#!/bin/bash
echo "Downloading addons .."
curl -sL --output - https://github.com/chamchenko/plugin.video.cbsnetwork/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/xbmc.plugin.video.nba/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
echo "Creating Repository .."
./create_repository.py \
    --datadir ./zips/dev \
    --info ./xmls/dev/addons.xml \
    --checksum ./xmls/dev/addons.xml.md5 \
    ./srcs/dev/ \
    ../tmp/xbmc.plugin.video.nba-dev/ \
    ../tmp/plugin.video.cbsnetwork-dev/

echo "Removing temp files .."
rm -r ../tmp/*
