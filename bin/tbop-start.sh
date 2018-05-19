#!/bin/bash

ROOT=/opt/tbop

$ROOT/tws/bin/the-witness-stand --download
cd $ROOT/share && \
    docker-compose pull && \
    docker-compose up -d
