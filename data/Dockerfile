FROM phusion/baseimage:0.9.15
MAINTAINER Brian Scully <scullduggery@gmail.com>

RUN groupadd -f -g 101 elasticsearch && useradd -u 1001 -g elasticsearch elasticsearch &&\
    mkdir -p /home/elasticsearch && chown -R elasticsearch:elasticsearch /home/elasticsearch

RUN mkdir -p /data/graphite && mkdir -p /data/elasticsearch &&\
    mkdir -p /logs/elasticsearch && mkdir -p /logs/supervisor && mkdir -p /logs/nginx &&\
    chown -R elasticsearch:elasticsearch /data/elasticsearch && chown -R elasticsearch:elasticsearch /logs/elasticsearch &&\
    chown -R www-data:www-data /data/graphite

VOLUME ["/data/graphite","/data/elasticsearch",]
VOLUME ["/logs/elasticsearch","/logs/supervisor","/logs/nginx"]

ENTRYPOINT /bin/ls -lh /data && /bin/ls -lh /logs
