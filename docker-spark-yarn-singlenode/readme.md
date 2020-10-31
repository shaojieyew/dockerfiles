#download and extract spark-2.4.1-bin-hadoop2.7
#set SPARK_HOME=./spark-2.4.1-bin-hadoop2.7/bin
#copy spark/conf/spark-defaults.conf  into ./spark-2.4.1-bin-hadoop2.7/conf

#docker-compose up -d
#docker-compose stop

#spark-submit --deploy-mode cluster --master yarn --class org.example.streamJoinBatch.Test sparkapp1-1.0-SNAPSHOT.jar




*****
#docker build -t hadoop/bdcluster:1.0 .
#docker run -d --hostname localhost -p 9000:9000 -p 9001:50070 -p 50010:50010 -p 8088:8088 -p 8080:8080 -p 18080:18080 -p 4040:4040 -p 8032:8032 -p 8042:8042 hadoop/bdcluster:1.0

