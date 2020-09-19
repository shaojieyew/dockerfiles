FROM ubuntu:16.04
USER root
RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y openssh-server default-jdk wget scala sudo
RUN apt-get -y update
RUN apt-get -y install zip 
RUN apt-get -y install vim
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -P "" \
    && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
	 
COPY config/ssh_config $HOME/.ssh/config 

RUN adduser --system --group exia
RUN adduser exia sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chown -R exia /opt
RUN chgrp -R exia /opt

USER exia

WORKDIR /opt

RUN ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -P "" \
    && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

RUN wget -O hadoop.tar.gz -q https://archive.apache.org/dist/hadoop/core/hadoop-2.7.0/hadoop-2.7.0.tar.gz 
RUN tar xfz hadoop.tar.gz --one-top-level=hadoop --strip-components 1
RUN rm hadoop.tar.gz
	
RUN wget -O spark.tar.gz -q https://archive.apache.org/dist/spark/spark-2.4.1/spark-2.4.1-bin-hadoop2.7.tgz
RUN tar xfz spark.tar.gz --one-top-level=spark --strip-components 1
RUN rm spark.tar.gz	

RUN wget -O nifi.tar.gz -q https://archive.apache.org/dist/nifi/1.9.2/nifi-1.9.2-bin.tar.gz
RUN tar xfz nifi.tar.gz --one-top-level=nifi --strip-components 1
RUN rm nifi.tar.gz	

RUN wget -O apache-zookeeper.tar.gz -q https://downloads.apache.org/zookeeper/zookeeper-3.5.8/apache-zookeeper-3.5.8-bin.tar.gz
RUN tar xfz apache-zookeeper.tar.gz --one-top-level=zookeeper --strip-components 1
RUN rm apache-zookeeper.tar.gz	

RUN wget -O apache-kafka.tar.gz -q https://downloads.apache.org/kafka/2.6.0/kafka_2.12-2.6.0.tgz
RUN tar xfz apache-kafka.tar.gz --one-top-level=kafka --strip-components 1
RUN rm apache-kafka.tar.gz	

RUN wget -O elasticsearch.tar.gz -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.4.0-linux-x86_64.tar.gz
RUN tar xfz elasticsearch.tar.gz --one-top-level=elasticsearch --strip-components 1
RUN rm elasticsearch.tar.gz

RUN wget -O kibana.tar.gz -q https://artifacts.elastic.co/downloads/kibana/kibana-7.4.0-linux-x86_64.tar.gz 
RUN tar xfz kibana.tar.gz --one-top-level=kibana --strip-components 1
RUN rm kibana.tar.gz

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.20.1/prometheus-2.20.1.linux-amd64.tar.gz 
RUN tar xvf prometheus-2.20.1.linux-amd64.tar.gz 
RUN rm prometheus-2.20.1.linux-amd64.tar.gz
RUN mv prometheus-2.20.1.linux-amd64 prometheus

RUN wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz
RUN tar xvf grafana-7.1.5.linux-amd64.tar.gz 
RUN rm grafana-7.1.5.linux-amd64.tar.gz
RUN mv grafana-7.1.5 grafana

ENV HADOOP_HOME=/opt/hadoop
ENV SPARK_HOME=/opt/spark
ENV NIFI_HOME=/opt/nifi
ENV ZOOKEEPER_HOME=/opt/zookeeper
ENV KAFKA_HOME=/opt/kafka
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SPARK_HOME/bin:$SPARK_HOME:sbin
ENV ES_HOME=/opt/elasticsearch
ENV KIBANA_HOME=/opt/kibana
ENV PROMETHEUS_HOME=/opt/prometheus
ENV GRAFANA_HOME=/opt/grafana

COPY config/ /tmp/

RUN cp /tmp/ssh_config $HOME/.ssh/config 

#RUN cp /tmp/hadoop/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh 
#RUN cp /tmp/hadoop/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml 
#RUN cp /tmp/hadoop/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml 
#RUN cp /tmp/hadoop/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml.template 
#RUN cp $HADOOP_HOME/etc/hadoop/mapred-site.xml.template $HADOOP_HOME/etc/hadoop/mapred-site.xml 
#RUN cp /tmp/hadoop/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml 
#RUN cp /tmp/spark/spark-env.sh $SPARK_HOME/conf/spark-env.sh 
#RUN cp /tmp/spark/log4j.properties $SPARK_HOME/conf/log4j.properties 
#RUN cp /tmp/spark/spark.defaults.conf $SPARK_HOME/conf/spark.defaults.conf
#RUN cp /tmp/kafka/server.properties $KAFKA_HOME/config/server.properties
#RUN cp /tmp/zookeeper/zoo.cfg $ZOOKEEPER_HOME/conf/zoo.cfg
#RUN cp /tmp/elastic/kibana.yml $KIBANA_HOME/config/kibana.yml
#RUN cp /tmp/elastic/elasticsearch.yml $ES_HOME/config/elasticsearch.yml
#RUN cp /tmp/nifi/nifi.properties $NIFI_HOME/conf/nifi.properties
RUN cp $ZOOKEEPER_HOME/conf/zoo_sample.cfg $ZOOKEEPER_HOME/conf/zoo.cfg

RUN $HADOOP_HOME/bin/hdfs namenode -format

EXPOSE 50010 50020 50070 50075 50090 8020 9000
EXPOSE 10020 19888
EXPOSE 8030 8031 8032 8033 8040 8042 8088
EXPOSE 49707 2122 7001 7002 7003 7004 7005 7006 7007 8888
EXPOSE 8081 8443 10000 8000
EXPOSE 9092 9093
EXPOSE 9200 9300 5601
EXPOSE 9090 3000

ENTRYPOINT sudo service ssh start; bash

#sudo $HADOOP_HOME/sbin/start-dfs.sh
#sudo $HADOOP_HOME/sbin/start-yarn.sh
#$NIFI_HOME/bin/nifi.sh start
#$ZOOKEEPER_HOME/bin/zkServer.sh start
#nohup $KAFKA_HOME/bin/kafka-server-start.sh -daemon  $KAFKA_HOME/config/server.properties
#nohup $ES_HOME/bin/elasticsearch & 
#nohup $KIBANA_HOME/bin/kibana & 
#nohup $PROMETHEUS_HOME/prometheus --storage.tsdb.path=$PROMETHEUS_HOME/data &
#nohup $GRAFANA_HOME/bin/grafana-server &