FROM kodbasen/jenkins-arm:2.19.2

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
	docker.io \
	&& apt-get clean \
#        && usermod -a -G docker jenkins \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#USER jenkins

