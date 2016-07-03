#!/bin/bash

git clone https://github.com/kubernetes/helm.git $GOPATH/src/k8s.io/helm
cd $GOPATH/src/k8s.io/helm
which go
pwd
ls -la
make bootstrap build
