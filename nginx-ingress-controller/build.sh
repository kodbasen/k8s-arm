#!/bin/bash

set -e

BASEDIR=$PWD
K8S_BINARIES=${K8S_BINARIES:-$BASEDIR/output-armhf}
INGRESS_CONTROLLER_IMAGE="kodbasen/nginx-ingress-controller-armhf:0.8.1"
DEFAULTBACKEND_IMAGE="kodbasen/defaultbackend-armhf:1.0"

git clone https://github.com/kubernetes/contrib.git

# Build nginx-ingress-controller image
if [ ! -f $K8S_BINARIES/nginx-ingress-controller ]; then
    echo "nginx-ingress-controller binaries not found, exiting!"
    exit 1
fi
cd contrib/ingress/controllers/nginx
cp $K8S_BINARIES/nginx-ingress-controller .
sed -i -e "s;^FROM gcr.io/google_containers/nginx-slim;FROM kodbasen/nginx-slim-armhf;" "Dockerfile"
docker build -t $INGRESS_CONTROLLER_IMAGE .
docker push $INGRESS_CONTROLLER_IMAGE

# Build 404-server
if [ ! -f $K8S_BINARIES/404-server ]; then
    echo "404-server binaries not found, exiting!"
    exit 1
fi
cd $BASEDIR/contrib/404-server
cp $K8S_BINARIES/404-server ./server
sed -i -e "s;^FROM BASEIMAGE;FROM armel/busybox;" "Dockerfile"
docker build -t $DEFAULTBACKEND_IMAGE .
docker push $DEFAULTBACKEND_IMAGE

cd $BASEDIR
rm -rf contrib

rm -f rc.yaml
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/ingress/controllers/nginx/rc.yaml \
&& sed -i -e "s;gcr\.io/google_containers/nginx-ingress-controller;kodbasen/nginx-ingress-controller-armhf;" "rc.yaml" \
&& sed -i -e "s;gcr\.io/google_containers/defaultbackend;kodbasen/defaultbackend-armhf;" "rc.yaml"
