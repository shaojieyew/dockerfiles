docker build . -t nifi:0.1
docker run -it -p 8080:8080 nifi:0.1