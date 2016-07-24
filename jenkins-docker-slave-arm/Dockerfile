FROM kodbasen/jenkins-slave-arm:2.7.1

USER root

ADD https://downloads.hypriot.com/docker-hypriot_1.10.3-1_armhf.deb docker-hypriot_1.10.3-1_armhf.deb
RUN apt-get update \
  && apt-get -y install iptables libdevmapper1.02.1 libdevmapper-event1.02.1 \
  && dpkg -i docker-hypriot_1.10.3-1_armhf.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN usermod -a -G docker jenkins

# USER jenkins
