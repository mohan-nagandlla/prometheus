FROM ubuntu:16.04

ENV TERM=xterm

RUN apt-get update && apt-get install -y openssh-server openssh-client curl wget software-properties-common python-software-properties vim net-tools

RUN apt-get install nginx -y

RUN mkdir /etc/prometheus

RUN mkdir /var/lib/prometheus

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.19.0/prometheus-2.19.0.linux-amd64.tar.gz

RUN tar -xzf prometheus-2.19.0.linux-amd64.tar.gz

#RUN mv prometheus-2.7.1.linux-amd64 /usr/local/.

RUN cp prometheus-2.19.0.linux-amd64/prometheus   /usr/local/bin/
RUN cp prometheus-2.19.0.linux-amd64/promtool       /usr/local/bin/

RUN cp -r prometheus-2.19.0.linux-amd64/console_libraries   /var/lib/prometheus
RUN cp -r prometheus-2.19.0.linux-amd64/consoles  /var/lib/prometheus

#COPY prometheus.yml  /etc/prometheus/prometheus.yml

RUN rm -rf prometheus-2.19.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64

EXPOSE     9090

COPY myaddition.sh /root

RUN chmod +x /root/myaddition.sh

COPY prometheus.yml /root

ENTRYPOINT [ "/root/myaddition.sh" ]
