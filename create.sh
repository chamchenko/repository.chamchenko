#!/bin/bash
rm  -r ../tmp/* 2> /dev/null
echo "Downloading addons .."
curl -sL --output - https://github.com/chamchenko/plugin.video.cbsnetwork/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/xbmc.plugin.video.nba/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/plugin.video.xtreamcodes/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/plugin.video.adtv/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/plugin.video.awaan/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/plugin.video.maraya/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
curl -sL --output - https://github.com/chamchenko/plugin.video.shahid/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp/
echo "Creating Repository .."
./create_repository.py \
    --datadir ./zips/dev \
    --info ./xmls/dev/addons.xml \
    --checksum ./xmls/dev/addons.xml.md5 \
    ./srcs/dev/ \
    ../tmp/xbmc.plugin.video.nba-dev/ \
    ../tmp/plugin.video.cbsnetwork-dev/ \
    ../tmp/plugin.video.xtreamcodes-dev \
    ../tmp/plugin.video.adtv-dev \
    ../tmp/plugin.video.awaan-dev \
    ../tmp/plugin.video.maraya-dev \
    ../tmp/plugin.video.shahid-dev
echo "Removing temp files .."
rm -r ../tmp/*
