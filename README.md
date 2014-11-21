StatsD + Graphite + Grafana + Elasticsearch + Logstash + Kibana
---------------------------------------------------------------
This is based of [cazcade](https://registry.hub.docker.com/u/cazcade/docker-grafana-graphite/dockerfile/)
This image contains a sensible default configuration of StatsD, Graphite Grafana and Elasticsearch.
The is also a vagrant file for running locally for testing things out

There are two ways for using this image:


### Using the Docker Index ###

Pull from docker hub with `docker pull scullxbones/docker-grafana-statsd-elk`

The container exposes the following ports:

- `80`: the Grafana web interface.
- `81`: the Kibana web interface.
- `2003`: the Graphite direct interface to Carbon
- `8000`: the Graphite web-ui (currently borked)
- `6379`: Redis for logstash shipping (use list `logstash`)
- `9200`: Direct access to elasticsearch
- `8125/udp`: the StatsD port.
- `8126`: the StatsD administrative port.

To start a container with this image you just need to run the following command:

```bash
docker run -d -p 80:80 -p 81:81 -p 8125:8125/udp --name grafana scullxbones/docker_grafana_statsd_elk
```

### Building the image yourself ###

The Dockerfile and supporting configuration files are available in our [Github repository](https://github.com/scullxbones/docker_grafana_statsd_elk).

```bash
docker build -t scullxbones/docker_grafana_statsd_elk:1.0 .
docker run -d -p 80:80  -p 81:81 -p 8125:8125/udp --name grafana scullxbones/docker_grafana_statsd_elk
```

### Using the Dashboard ###

Once your container is running all you need to do is open your browser pointing to [Grafana](http://localhost/) or [Kibana](http://localhost:81/)

Learning:

[Good video](http://grafana.org/blog/2014/05/25/monitorama-video-and-update.html)

[Good examples](http://play.grafana.org/)
