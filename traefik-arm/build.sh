#!/bin/bash

PREFIX="kodbasen"
VERSION="v1.1.1"
IMAGE="traefik-arm"

if [ ! -f "traefik_linux-arm" ]; then
  wget https://github.com/containous/traefik/releases/download/$VERSION/traefik_linux-arm
  chmod a+x traefik_linux-arm
fi

docker build -t $PREFIX/$IMAGE:$VERSION .
docker tag $PREFIX/$IMAGE:$VERSION $PREFIX/$IMAGE:latest

docker push $PREFIX/$IMAGE:$VERSION
docker push $PREFIX/$IMAGE:latest
