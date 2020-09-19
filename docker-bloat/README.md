# dockerfiles


1. copy initial_vol to a new directory, eg. D:\DockerVol\bigdata\vol
2. build docker image, run below cmd at the folder where dockerfile is
```
docker build -t dev/bigdata:0.1 .
```
3. create and start docker container
```
docker run -it -d --name dev --hostname=localhost -p 5010:50010 -p 5020:50020 -p 5070:50070 -p 5075:50075 -p 5090:50090 -p 8020:8020 -p 9000:9000 -p 10020:10020 -p 19888:19888 -p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8033:8033 -p 8040:8040 -p 8042:8042 -p 8088:8088 -p 5707:49707 -p 2122:2122 -p 7001:7001 -p 7002:7002 -p 7003:7003 -p 7004:7004 -p 7005:7005 -p 7006:7006 -p 7007:7007 -p 8888:8888 -p 8081:8081 -p 8443:8443 -p 10000:10000 -p 8000:8000 -p 9092:9092 -p 9093:9093 -p 9200:9200 -p 9300:9300 -p 5601:5601 -p 9090:9090 -p 3000:3000 -v D:/DockerVol/bigdata/vol/hadoop/hdfs:/opt/hadoop/hdfs -v D:/DockerVol/bigdata/vol/nifi/nifi.properties:/opt/nifi/conf/nifi.properties -v D:/DockerVol/bigdata/vol/nifi/data:/opt/nifi/data -v D:/DockerVol/bigdata/vol/kafka/server.properties:/opt/kafka/config/server.properties -v D:/DockerVol/bigdata/vol/kafka/kafka-logs:/tmp/kafka-logs -v D:/DockerVol/bigdata/vol/elasticsearch/data:/opt/elasticsearch/data -v D:/DockerVol/bigdata/vol/elasticsearch/elasticsearch.yml:/opt/elasticsearch/config/elasticsearch.yml -v D:/DockerVol/bigdata/vol/kibana/data:/opt/kibana/data -v D:/DockerVol/bigdata/vol/kibana/kibana.yml:/opt/kibana/config/kibana.yml -v D:/DockerVol/bigdata/vol/prometheus/prometheus.yml:/opt/prometheus/prometheus.yml -v D:/DockerVol/bigdata/vol/prometheus/data:/opt/prometheus/data -v D:/DockerVol/bigdata/vol/grafana/defaults.ini:/opt/grafana/conf/defaults.ini -v D:/DockerVol/bigdata/vol/grafana/data:/opt/grafana/data -v D:/DockerVol/bigdata/vol/hadoop/hadoop-env.sh:/opt/hadoop/etc/hadoop/hadoop-env.sh -v D:/DockerVol/bigdata/vol/hadoop/core-site.xml:/opt/hadoop/etc/hadoop/core-site.xml -v D:/DockerVol/bigdata/vol/hadoop/hdfs-site.xml:/opt/hadoop/etc/hadoop/hdfs-site.xml -v D:/DockerVol/bigdata/vol/hadoop/mapred-site.xml:/opt/hadoop/etc/hadoop/mapred-site.xml -v D:/DockerVol/bigdata/vol/hadoop/mapred-site.xml:/opt/hadoop/etc/hadoop/mapred-site.xml.template -v D:/DockerVol/bigdata/vol/hadoop/yarn-site.xml:/opt/hadoop/etc/hadoop/yarn-site.xml -v D:/DockerVol/bigdata/vol/spark/spark-env.sh:/opt/spark/conf/spark-env.sh -v D:/DockerVol/bigdata/vol/spark/log4j.properties:/opt/spark/conf/log4j.properties -v D:/DockerVol/bigdata/vol/spark/spark.defaults.conf:/opt/spark/conf/spark.defaults.conf dev/bigdata:0.1
```
4. start services via docker exec -it <container id> bash
```
sudo $HADOOP_HOME/sbin/start-dfs.sh #start hdfs
sudo $HADOOP_HOME/sbin/start-yarn.sh #start yarn
$NIFI_HOME/bin/nifi.sh start #start nifi
$ZOOKEEPER_HOME/bin/zkServer.sh start #start zookeeper for kafka
nohup $KAFKA_HOME/bin/kafka-server-start.sh -daemon  $KAFKA_HOME/config/server.properties #start kafka
nohup $ES_HOME/bin/elasticsearch &  #start es
nohup $KIBANA_HOME/bin/kibana & #start kibana
nohup $PROMETHEUS_HOME/prometheus --storage.tsdb.path=$PROMETHEUS_HOME/data & #start prometheus
nohup $GRAFANA_HOME/bin/grafana-server & #start grafana
```

