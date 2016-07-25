#!/bin/bash

PREFIX="kodbasen"
VERSION=2.7.1

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RESOURCEDIR="$BASEDIR/resources"

if [ ! -d "$RESOURCEDIR" ]; then
  mkdir $RESOURCEDIR && cd $RESOURCEDIR
  curl -sSLk -o tini https://helm.kodbasen.org/platforms/linux/arm/tini/tini-2496926
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/init.groovy
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/jenkins.sh
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/install-plugins.sh
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/plugins.sh
  chmod +rx *
  cd $BASEDIR
fi

docker build -t $PREFIX/jenkins-arm:$VERSION .
docker tag $PREFIX/jenkins-arm:$VERSION $PREFIX/jenkins-arm:latest

docker push $PREFIX/jenkins-arm:$VERSION
docker push $PREFIX/jenkins-arm:latest
