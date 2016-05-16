#!/bin/bash

set -e

BASEDIR=$PWD
K8S_BINARIES=${K8S_BINARIES:-$BASEDIR/output-armhf}
TAG="0.61"
PREFIX="kodbasen/nginx-ingress-controller-armhf"

if [ ! -f $K8S_BINARIES/nginx-ingress-controller ]; then
    echo "nginx-ingress-controller binaries not found, exiting!"
    exit 1
fi


git clone https://github.com/kubernetes/contrib.git
cd contrib/ingress/controllers/nginx
cp $K8S_BINARIES/nginx-ingress-controller .

sed -i -e "s;^FROM gcr.io/google_containers/nginx-slim:0\.6;FROM kodbasen/nginx-slim-armhf:0\.6;" "Dockerfile"

docker build -t $PREFIX:$TAG .

cd $BASEDIR
rm -Rf contrib
