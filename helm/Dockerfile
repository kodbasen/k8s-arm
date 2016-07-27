FROM hypriot/rpi-alpine-scratch:v3.4

ENV GOARM=7 \
    GOARCH=arm \
    GOPATH=/go \
    GOBIN=$GOPATH/bin \
    PATH=$PATH:$GOBIN \
    VERSION=v2.0.0-alpha.2

RUN apk update; apk upgrade \
  && echo "http://dl-3.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories; apk update \
  && cat /etc/apk/repositories \
  && apk add bash build-base git mercurial go=1.6.3-r0 \
  && git clone https://github.com/kubernetes/helm.git $GOPATH/src/k8s.io/helm \
  && cd $GOPATH/src/k8s.io/helm \
  && git checkout $VERSION \
  && make bootstrap build \
  && apk del bash build-base git mercurial go \
  && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* \
  && cp /go/src/k8s.io/helm/bin/* / \
  && rm -rf $GOPATH

EXPOSE 44134

CMD ["/tiller"]
