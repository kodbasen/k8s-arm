#!/bin/bash

PREFIX="kodbasen"
VERSION=2.19.2

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RESOURCEDIR="$BASEDIR/resources"

if [ ! -d "$RESOURCEDIR" ]; then
  mkdir $RESOURCEDIR && cd $RESOURCEDIR
  #curl -sSLk -o tini https://helm.kodbasen.org/platforms/linux/arm/tini/tini-2496926
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/master/init.groovy
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/master/jenkins.sh
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh
  curl -sSLO https://raw.githubusercontent.com/jenkinsci/docker/master/plugins.sh
  chmod +rx *
  cd $BASEDIR
fi

docker build -t $PREFIX/jenkins-arm:$VERSION .
docker tag $PREFIX/jenkins-arm:$VERSION $PREFIX/jenkins-arm:latest

docker push $PREFIX/jenkins-arm:$VERSION
docker push $PREFIX/jenkins-arm:latest
