$ZOOKEEPER_HOME/bin/zkServer.sh start
nohup $KAFKA_HOME/bin/kafka-server-start.sh -daemon  $KAFKA_HOME/config/server.properties