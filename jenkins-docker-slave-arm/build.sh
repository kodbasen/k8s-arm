#!/bin/bash

PREFIX="kodbasen"
VERSION=2.7.1
IMAGE="jenkins-docker-slave-arm"

docker build -t $PREFIX/$IMAGE:$VERSION .
docker tag $PREFIX/$IMAGE:$VERSION $PREFIX/$IMAGE:latest

docker push $PREFIX/$IMAGE:$VERSION
docker push $PREFIX/$IMAGE:latest
