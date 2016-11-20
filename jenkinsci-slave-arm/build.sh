#!/bin/bash

PREFIX="kodbasen"
VERSION=2.19.2
IMAGE="jenkinsci-slave-arm"

docker build -t $PREFIX/$IMAGE:$VERSION .
docker tag $PREFIX/$IMAGE:$VERSION $PREFIX/$IMAGE:latest

docker push $PREFIX/$IMAGE:$VERSION
docker push $PREFIX/$IMAGE:latest
