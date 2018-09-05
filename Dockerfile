FROM alpine:3.7

ENV CLI_VERSION v0.6.11
RUN apk add --no-cache ca-certificates \
    && apk add --virtual build-dependencies curl \
    && curl https://releases.rancher.com/cli/$CLI_VERSION/rancher-linux-amd64-$CLI_VERSION.tar.gz | tar -xz \
    && mv /rancher-$CLI_VERSION/* /usr/bin/ \
    && rm -rf /rancher-$CLI_VERSION \
    && apk del build-dependencies
CMD ["/bin/sh"]