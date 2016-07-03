FROM hypriot/rpi-alpine-scratch:v3.3

ENV GOARM=7 \
    GOARCH=arm \
    GOPATH=/go \
    GOBIN=$GOPATH/bin \
    PATH=$PATH:$GOBIN

ADD build-helm.sh /go/build-helm.sh

RUN apk update; apk upgrade \
  && echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; apk update \
  && cat /etc/apk/repositories \
  && apk add bash build-base git mercurial go=1.6.2-r4 \
  && git clone https://github.com/kubernetes/helm.git $GOPATH/src/k8s.io/helm \
  && cd $GOPATH/src/k8s.io/helm \
  && make bootstrap build \
  && apk del bash build-base git mercurial go \
  && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* \
  && cp /go/src/k8s.io/helm/bin/* / \
  && rm -rf $GOPATH

EXPOSE 44134

CMD ["/tiller"]
