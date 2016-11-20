#!/bin/bash

PREFIX=kodbasen
IMAGE=buildpack-deps

docker build --rm=true --no-cache -t $PREFIX/$IMAGE:curl -f Dockerfile.curl .
docker build --rm=true --no-cache -t $PREFIX/$IMAGE:scm -f Dockerfile.scm .

