## haproxy Dockerfile

[![Docker Hub](https://img.shields.io/badge/docker-mkaag%2Fhaproxy-008bb8.svg)](https://registry.hub.docker.com/u/mkaag/haproxy/)

This repository contains the **Dockerfile** and the configuration files of [Haproxy](http://haproxy.1wt.eu/) for [Docker](https://www.docker.com/).

### Base Docker Image

* [phusion/baseimage](https://github.com/phusion/baseimage-docker), the *minimal Ubuntu base image modified for Docker-friendliness*...
* ...[including image's enhancement](https://github.com/racker/docker-ubuntu-with-updates) from [Paul Querna](https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/)

### Installation

```bash
docker build -t mkaag/haproxy github.com/mkaag/docker-haproxy
```

### Usage

#### Basic usage

```bash
docker run -d -p 443:443 -p 80:80 -p 1936:1936 mkaag/haproxy
```

The TCP 1936 is used here for Haproxy stats only.

#### Using SSL

The PEM file must contains the public, private keys as well as any intermediary certificate.

```bash
docker run -d \
-v /opt/haproxy/ssl:/etc/ssl/private \
-e "SSL_CERT=/etc/ssl/private/cert.pem" \
-p 443:443 -p 80:80 -p 1936:1936 \
mkaag/haproxy
```

#### Using custom config file

```bash
docker run -d \
-v /opt/haproxy/etc:/apps \
-e "HAPROXY_CONFIG=/apps/haproxy.cfg" \
-p 443:443 -p 80:80 -p 1936:1936 \
mkaag/haproxy
```

#### Custom config w/ SSL

```bash
docker run -d \
-v /opt/haproxy/etc:/apps \
-v /opt/haproxy/ssl:/etc/ssl/private \
-e "HAPROXY_CONFIG=/apps/haproxy.cfg" \
-e "SSL_CERT=/etc/ssl/private/cert.pem" \
-p 443:443 -p 80:80 -p 1936:1936 \
mkaag/haproxy
```

