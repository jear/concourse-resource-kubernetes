FROM alpine:edge

RUN apk update & apk upgrade && \
    apk add --update python3 curl

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl

COPY assets/* /opt/resource/

RUN apk del curl
