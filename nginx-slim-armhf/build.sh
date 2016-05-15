#!/bin/bash

BASE_IMG="kodbasen/ubuntu-slim-armhf:0\.2"
BUILD_DIR=nginx-slim

mkdir -p $BUILD_DIR
cd $BUILD_DIR
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/nginx-slim/Dockerfile
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/nginx-slim/Makefile
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/nginx-slim/build.sh
chmod a+x build.sh

sed -i -e "s;^FROM gcr.io/google_containers/ubuntu-slim:0.2;FROM ${BASE_IMG};" "Dockerfile"
sed -i -e "s;gcr.io/google_containers/nginx-slim;kodbasen/nginx-slim-armhf;" "Makefile"

make container

cd ..
rm -Rf $BUILD_DIR
