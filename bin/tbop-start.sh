#!/bin/bash

docker pull mrrusof/judge
docker pull mrrusof/ruby-sandbox
docker pull mrrusof/python-sandbox
docker pull mrrusof/elixir-sandbox
cd /opt/tbop/share && \
    docker-compose pull && \
    docker-compose up -d
