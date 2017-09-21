#!/bin/bash

docker pull mrrusof/ruby-judge
docker pull mrrusof/ruby-sandbox
cd /opt/tbop/share && docker-compose up -d
