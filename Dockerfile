FROM alpine:3.7

ENV CLI_VERSION v2.2.0
ENV KUBECTL_VERSION v1.14.0
RUN apk add --no-cache ca-certificates \
    && wget https://releases.rancher.com/cli/$CLI_VERSION/rancher-linux-amd64-$CLI_VERSION.tar.gz \
    && tar -xvzf rancher-linux-amd64-$CLI_VERSION.tar.gz \
    && mv /rancher-$CLI_VERSION/rancher /usr/bin/rancher \
    && rm -rf /rancher-$CLI_VERSION \
    && rm rancher-linux-amd64-$CLI_VERSION.tar.gz \
    && wget https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv /kubectl /usr/bin/kubectl \
    && mkdir ~/.rancher
CMD ["/bin/sh"]
