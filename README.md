StatsD + Graphite + Grafana + Elasticsearch
---------------------------------------------
This is based of [cazcade](https://registry.hub.docker.com/u/cazcade/docker-grafana-graphite/dockerfile/)
This image contains a sensible default configuration of StatsD, Graphite Grafana and Elasticsearch.
The is also a vagrant file for running locally for testing things out

There are two ways for using this image:


### Using the Docker Index ###

This image is published under [Noel's repository on the Docker Index](https://registry.hub.docker.com/u/noel/grafana-docker/) and all you
need as a prerequisite is having Docker installed on your machine. The container exposes the following ports:

- `80`: the Grafana web interface.
- `8125`: the StatsD port.
- `8126`: the StatsD administrative port.

To start a container with this image you just need to run the following command:

```bash
docker run -d -p 80:80 -p 8000:8000 -p 9200:9200 -p 8125:8125/udp -p 8126:8126 --name grafana nmcg/grafana:1.0
```

### Building the image yourself ###

The Dockerfile and supporting configuration files are available in our [Github repository](https://github.com/noelmcgrath/grafana_docker).

```bash
docker build -t nmcg/grafana:1.0 .
docker run -d -p 80:80 -p 8000:8000 -p 9200:9200 -p 8125:8125/udp -p 8126:8126 nmcg/grafana:1.0
```

### Using the Dashboard ###

Once your container is running all you need to do is open your browser pointing to [Grafana](http://localhost/)

Learning:

[Good video](http://grafana.org/blog/2014/05/25/monitorama-video-and-update.html)

[Good examples](http://play.grafana.org/)
