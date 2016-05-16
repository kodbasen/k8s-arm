#!/bin/bash

set -e

BASEDIR=$PWD
K8S_BINARIES=${K8S_BINARIES:-$BASEDIR/output-armhf}


git clone https://github.com/kubernetes/contrib.git

# Build nginx-ingress-controller image
if [ ! -f $K8S_BINARIES/nginx-ingress-controller ]; then
    echo "nginx-ingress-controller binaries not found, exiting!"
    exit 1
fi
cd contrib/ingress/controllers/nginx
cp $K8S_BINARIES/nginx-ingress-controller .
sed -i -e "s;^FROM gcr.io/google_containers/nginx-slim:0\.6;FROM kodbasen/nginx-slim-armhf:0\.6;" "Dockerfile"
#docker build -t kodbasen/nginx-ingress-controller-armhf:0.61 .

# Build 404-server
if [ ! -f $K8S_BINARIES/404-server ]; then
    echo "404-server binaries not found, exiting!"
    exit 1
fi
cd $BASEDIR/contrib/404-server
cp $K8S_BINARIES/404-server ./server
sed -i -e "s;^FROM busybox;FROM hypriot/armhf-busybox;" "Dockerfile"
docker build -t kodbasen/defaultbackend-armhf:0.0 .

cd $BASEDIR
rm -Rf contrib
