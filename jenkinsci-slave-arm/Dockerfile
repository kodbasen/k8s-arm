FROM kodbasen/java-jdk-arm:jdk-8u111-b14

ENV HOME /home/jenkins

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget \
		git \
		&& groupadd -g 10000 jenkins \
		&& useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins \
		&& rm -rf /var/lib/apt/lists/*

ARG VERSION=2.62

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

USER jenkins
RUN mkdir /home/jenkins/.jenkins
VOLUME /home/jenkins/.jenkins
WORKDIR /home/jenkins
