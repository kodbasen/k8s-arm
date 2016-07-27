#!/bin/bash

git clone https://github.com/kubernetes/helm.git $GOPATH/src/k8s.io/helm
cd $GOPATH/src/k8s.io/helm
git checkout v2.0.0-alpha.2

make bootstrap build
