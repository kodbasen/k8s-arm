## ubuntu-armhf and ubuntu-slim-armhf Docker images

This script builds two Ubuntu Docker images. First it generates an ARMv7 base
image for ubuntu: [`ubuntu-armhf`](https://hub.docker.com/r/kodbasen/ubuntu-armhf/)
and then downloads and modifies [`ubuntu-slim`](https://github.com/kubernetes/contrib/tree/master/images/ubuntu-slim)
files for building an ARMv7 version: [`ubuntu-slim-armhf`](https://hub.docker.com/r/kodbasen/ubuntu-slim-armhf/).

This script is tested on `Raspberry-Pi`
