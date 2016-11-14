FROM kodbasen/java-jdk-arm:jdk-8u111-b14

ENV HOME /home/jenkins

RUN apt-get update \
  && apt-get -y install bash git curl zip \
  && useradd -c "Jenkins user" -d $HOME -m jenkins \
  && curl --create-dirs -ksSLo /usr/share/jenkins/slave.jar https://jenkins.kodbasen.org/jnlpJars/slave.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave

RUN chmod +rx /usr/local/bin/jenkins-slave

VOLUME /home/jenkins

WORKDIR /home/jenkins

USER jenkins

ENTRYPOINT ["jenkins-slave"]
