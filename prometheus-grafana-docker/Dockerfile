FROM ubuntu:16.04

USER root

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y openssh-server default-jdk wget 
RUN  apt-get -y update
RUN  apt-get -y install zip 
RUN  apt-get -y install vim
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN cd /usr/local \
    && wget https://github.com/prometheus/prometheus/releases/download/v2.20.1/prometheus-2.20.1.linux-amd64.tar.gz \
	&& tar xvf prometheus-2.20.1.linux-amd64.tar.gz \
	&& rm prometheus-2.20.1.linux-amd64.tar.gz \
	&& cd prometheus-2.20.1.linux-amd64/ \
	&& groupadd --system prometheus \
	&& useradd -s /sbin/nologin -r -g prometheus prometheus \
	&& mkdir -p /etc/prometheus  /var/lib/prometheus \
	&& cp prometheus promtool /usr/local/bin/ \
	&& cp -r consoles/ console_libraries/ /etc/prometheus/

COPY prometheus.yml /etc/prometheus/prometheus.yml

RUN chown -R prometheus:prometheus /etc/prometheus/  /var/lib/prometheus/
RUN chmod -R 775 /etc/prometheus/ /var/lib/prometheus/


RUN cd /usr/local/ \
	&& wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
	&& tar xvf grafana-7.1.5.linux-amd64.tar.gz \
	&& rm grafana-7.1.5.linux-amd64.tar.gz \
	&& mv grafana-7.1.5 grafana && cd grafana/ \
	&& cp bin/grafana-server /usr/local/bin/ \
	&& mkdir -p /etc/grafana/conf/ \
	&& cp conf/defaults.ini /etc/grafana/conf/defaults.ini 
	
EXPOSE 9090 3000

ENTRYPOINT nohup /usr/local/bin/prometheus \
--config.file=/etc/prometheus/prometheus.yml \
--storage.tsdb.path=/var/lib/prometheus \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/console_libraries \
--web.listen-address=0.0.0.0:9090 & nohup /usr/local/bin/grafana-server --homepath=/usr/local/grafana --config=/etc/grafana/conf/defaults.ini & bash


