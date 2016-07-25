#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f "$BASEDIR/tini" ]; then
  wget --no-check-certificate -O tini https://helm.kodbasen.org/platforms/linux/arm/tini/tini-2496926
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/init.groovy
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/jenkins.sh
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/install-plugins.sh
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/plugins.sh
  chmod +rx *.sh *.groovy tini
fi

#docker build --rm=true --no-cache=true -t kodbasen/jenkins-arm:2.7.1 .
