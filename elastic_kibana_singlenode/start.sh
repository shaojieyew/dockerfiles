docker build -t es:1.0 .
docker run -it --hostname localhost -p 9300:9300 -p 9200:9200 -p 5601:5601 es:1.0