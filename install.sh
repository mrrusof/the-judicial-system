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

update-rc.d tbop.sh defaults
