#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TINI_DIR=$BASEDIR/tini

if [ ! -f "$BASEDIR/tini-static" ]; then

  if [ ! -d "$TINI_DIR" ]; then
    echo "Cloning Tini!"
    git clone https://github.com/krallin/tini.git $TINI_DIR
  fi

  cd $TINI_DIR
  cmake . && make
  cp tini-static $BASEDIR/

fi

cd $BASEDIR

chmod +x tini-static

if [ ! -f "$BASEDIR/init.groovy" ]; then
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/init.groovy
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/jenkins.sh
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/install-plugins.sh
  wget https://raw.githubusercontent.com/jenkinsci/docker/195787dca586b41971e2037b48d3f6dca04c9667/plugins.sh
  chmod +rx *.sh *.groovy
fi

docker build --rm=true --no-cache=true -t kodbasen/jenkins-arm:2.7.1 .
