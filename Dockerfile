FROM alpine

MAINTAINER zborisha

RUN apk update && apk upgrade
RUN apk add bash

RUN mkdir -p /opt/consul/ui/
RUN mkdir -p /opt/consul/data/

ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip /tmp/consul.zip
RUN cd /opt/consul/ && unzip /tmp/consul.zip && chmod +x /opt/consul/consul && rm /tmp/consul.zip

ADD https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_web_ui.zip /tmp/webui.zip
RUN cd /opt/consul/ui/ && unzip /tmp/webui.zip && rm /tmp/webui.zip

ADD ./startConsul.sh /opt/consul/
RUN chmod +x /opt/consul/startConsul.sh

# UI/Rest port
EXPOSE 8500 8500

EXPOSE 8300 8300

EXPOSE 8301 8301

EXPOSE 8301/udp 8301/udp

EXPOSE 8302 8302

EXPOSE 8302/udp 8302/udp

EXPOSE 8400 8400

# DNS
EXPOSE 53/udp 53/udp

ENV SHELL /bin/bash


ENTRYPOINT ["/opt/consul/startConsul.sh"]
