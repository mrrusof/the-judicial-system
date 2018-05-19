#!/bin/bash

ROOT=/opt/tbop

mkdir -vp $ROOT/{bin,share}

cp -va \
   bin \
   share \
   $ROOT/

cp -va \
   init.d/tbop.sh \
   /etc/init.d/

rm -f $ROOT/*.tar.gz
wget --directory-prefix=$ROOT https://github.com/mrrusof/the-witness-stand/releases/download/0.2.0-2018.05.20/the-witness-stand-0.2.0-2018.05.20.tar.gz
(cd $ROOT && tar -xzf the-witness-stand-0.2.0-2018.05.20.tar.gz)

update-rc.d tbop.sh defaults
