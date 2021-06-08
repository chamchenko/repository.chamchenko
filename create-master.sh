#!/bin/bash
#rm  -r tmp-master/* 2> /dev/null
echo "Downloading addons .."
curl -sL --output - https://github.com/chamchenko/plugin.video.nbainternational/archive/refs/heads/dev.zip | busybox unzip -q - -d ../tmp-master/
echo "Creating Repository .."
./create_repository.py \
    --datadir ./zips/dev \
    --info ./xmls/dev/addons.xml \
    --checksum ./xmls/dev/addons.xml.md5 \
    ./srcs/dev/ \
    ../tmp-master/xbmc.plugin.video.nba-dev/ \
    ../tmp-master/plugin.video.cbsnetwork-dev/ \
    ../tmp-master/plugin.video.xtreamcodes-dev \
    ../tmp-master/plugin.video.adtv-dev \
    ../tmp-master/plugin.video.awaan-dev \
    ../tmp-master/plugin.video.maraya-dev \
    ../tmp-master/plugin.video.shahid-dev \
    ../tmp-master/plugin.video.nbainternational-dev 
echo "Removing temp files .."
#rm -r tmp-master/* 2> /dev/null
