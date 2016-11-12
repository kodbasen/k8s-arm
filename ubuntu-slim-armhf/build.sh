#!/bin/bash

set -e

ARCH=armhf
DIST=xenial
TAG=16.04
TARGET=ubuntu-$DIST-$ARCH
SOURCE=http://ports.ubuntu.com
PREFIX=kodbasen/ubuntu-$ARCH

if [ ! -f /usr/share/debootstrap/scripts/$DIST ]; then
    echo "File not found, copying trusty!"
    cp /usr/share/debootstrap/scripts/trusty /usr/share/debootstrap/scripts/$DIST
fi

sudo debootstrap --arch=$ARCH --variant=minbase $DIST $TARGET $SOURCE
echo "deb $SOURCE xenial universe multiverse" >> $TARGET/etc/apt/sources.list
echo "deb $SOURCE xenial-security universe multiverse" >> $TARGET/etc/apt/sources.list

tar -c -C $TARGET .|docker import - $TARGET
docker tag $TARGET $PREFIX:$TAG
docker tag $TARGET $PREFIX:$DIST
docker push $PREFIX:$TAG
docker push $PREFIX:$DIST

# Preparing for making slim image
rm -Rf $TARGET
rm -f Makefile Dockerfile* runlevel

wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/ubuntu-slim/Makefile
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/ubuntu-slim/Dockerfile.build
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/ubuntu-slim/Dockerfile
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/ubuntu-slim/runlevel
wget -q https://raw.githubusercontent.com/kubernetes/contrib/master/images/ubuntu-slim/excludes

sed -i -e "s;^FROM ubuntu:16.04;FROM ${TARGET};" "Dockerfile.build"
sed -i -e 's;docker create --name \$(BUILD_IMAGE) \$(BUILD_IMAGE);docker create --name \$(BUILD_IMAGE) \$(BUILD_IMAGE) true;' 'Makefile'

# Make slim image
PREFIX=kodbasen/ubuntu-slim-armhf make
