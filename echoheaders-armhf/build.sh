#!/bin/bash

set -e

BASEDIR=$PWD

git clone https://github.com/kubernetes/contrib.git

cd contrib/ingress/echoheaders
sed -i -e "s;^FROM gcr\.io/google_containers/nginx-slim:0.3;FROM kodbasen/nginx-slim-armhf:0.6;" "Dockerfile"
sed -i -e "s;gcr\.io/google_containers/echoserver;kodbasen/echoserver-armhf;" "Makefile"
sed -i -e "s;gcloud;;" "Makefile"
make all

cd $BASEDIR
rm -Rf contrib
