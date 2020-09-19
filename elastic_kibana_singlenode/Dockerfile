FROM ubuntu:16.04
USER root
RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y openssh-server default-jdk wget scala sudo
RUN apt-get -y update
RUN apt-get -y install zip 
RUN apt-get -y install vim
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

WORKDIR /opt

RUN adduser --system --group exia

RUN chown -R exia /opt
RUN chgrp -R exia /opt

USER exia

RUN wget -O elasticsearch.tar.gz -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.0-linux-x86_64.tar.gz
RUN tar xfz elasticsearch.tar.gz --one-top-level=elasticsearch --strip-components 1
RUN rm elasticsearch.tar.gz

RUN wget -O kibana.tar.gz -q https://artifacts.elastic.co/downloads/kibana/kibana-7.4.0-linux-x86_64.tar.gz 
RUN tar xfz kibana.tar.gz --one-top-level=kibana --strip-components 1
RUN rm kibana.tar.gz

ENV ES_HOME=/opt/elasticsearch
ENV KIBANA_HOME=/opt/kibana

EXPOSE 9200 9300 5601 

USER root
RUN apt-get -y install curl
USER exia

ENTRYPOINT bash


