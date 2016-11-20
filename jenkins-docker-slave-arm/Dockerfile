FROM kodbasen/jenkins-slave-arm:2.19.2

USER root

RUN apt-get update \
  && apt-get -y --no-install-recommends install docker.io \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Must be run as root for now
# RUN usermod -a -G docker jenkins
# USER jenkins
