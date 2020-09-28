FROM debian:stable-slim
MAINTAINER dlawson@digital-panther.com

ENV DEBIAN_FRONTEND noninteractive
ENV GOROOT /opt/src/golang/go
ENV GOPATH /root/go

# RUN echo "deb-src http://deb.debian.org/debian buster main" >> /etc/apt/sources.list

RUN apt update && apt install golang wget unzip tmux git -y

WORKDIR /opt/src/golang
RUN wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
RUN tar zxfv go1.14.2.linux-amd64.tar.gz
RUN ln -s /opt/src/golang/go/bin/go /usr/local/bin/
RUN ln -s /opt/src/golang/go/bin/gofmt /usr/local/bin/
RUN mkdir /root/go

WORKDIR /opt/ngrok

RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip

RUN go get github.com/hacdias/webdav

COPY start.sh /usr/bin/start.sh
COPY start-tmux.sh /usr/bin/start-tmux.sh
RUN mkdir /etc/webdav
COPY config.yaml /etc/webdav/config.yaml

RUN chmod +x /usr/bin/start-tmux.sh /usr/bin/start.sh

WORKDIR /root/shared

ENTRYPOINT '/usr/bin/start-tmux.sh'