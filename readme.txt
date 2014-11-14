https://registry.hub.docker.com/u/cazcade/docker-grafana-graphite/dockerfile/


docker build -t nmcg/grafana:1.0 .
docker run -d -p 80:80 -p 8000:8000 -p 9200:9200 -p 8125:8125/udp -p 8126:8126 nmcg/grafana:2.0 /usr/bin/supervisord
docker run -d -p 80:80 -p 8000:8000 -p 9200:9200 -p 8125:8125/udp -p 8126:8126 nmcg/grafana:2.0



echo "stats" | nc localhost 8126   -q 2
echo "mycount:1|c" | nc -w 1 -u localhost 8125

curl http://localhost/
curl http://localhost/graphite/
curl http://localhost/elasticsearch/


docker rmi $(docker images | grep "^<none>" | awk "{print $3}")


docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)


====================================
docker exec -it [container-id] bash



=====
Notes
Removed cabot - doesnt work
Updated version of grafana