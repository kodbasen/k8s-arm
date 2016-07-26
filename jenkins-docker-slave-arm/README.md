# Jenkins slave image with Docker

This image is mainly used for provisioning jenkins slaves in Kubernetes on ARM together
with the Kubernetes [plugin](https://wiki.jenkins-ci.org/display/JENKINS/Kubernetes+Plugin)
and running docker commands against the docker daemon on the host.

Mount the following volumes as `hostPath` in your pod-template:

```
-v /sys:/sys -v /var/run:/var/run -v /var/lib/docker:/var/lib/docker
```
