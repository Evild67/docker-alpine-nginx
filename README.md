[![Docker Stars](https://img.shields.io/docker/stars/evild/alpine-nginx.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)
[![Docker Pulls](https://img.shields.io/docker/pulls/evild/alpine-nginx.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/evild/alpine-nginx/latest.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)

# Alpine Nginx

This image is based on [evild/alpine-base](https://hub.docker.com/r/evild/alpine-base/)

## Version

### Nightly
- `nightly-libressl` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/nightly/libressl/Dockerfile)
- `nightly-openssl`, `nightly` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/nightly/openssl/Dockerfile)

### Mainline
- `mainline-libressl`, `libressl`, [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/mainline/libressl/Dockerfile)
- `mainline-openssl`, `openssl`, `latest` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/mainline/openssl/Dockerfile)
- `1.9.15-libressl`  [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/26f2f9939c0d706b532749530499da069572783a/mainline/libressl/Dockerfile)
- `1.9.15`, `1.9.15-openssl` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/26f2f9939c0d706b532749530499da069572783a/maineline/openssl/Dockerfile)
- `1.9.14-libressl`  [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/546d83c12ab16e5c997900d0bf473b8ca97f2c30/mainline/libressl/Dockerfile)
- `1.9.14`, `1.9.14-openssl` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/6db861c6b14d45b1357e27ec90613b533196f43c/maineline/openssl/Dockerfile)
- `1.9.13-libressl` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/libressl/Dockerfile)
- `1.9.13`, `1.9.13-openssl` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/openssl/Dockerfile)
- `1.9.12` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/03e9f3eaf49961ac482bd0eb462562f3f5809a50/Dockerfile)
- `1.9.11` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/121a9b9d36a6f895d3af8d5ffcad7d751beec444/Dockerfile)
- `1.9.10` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/e939de5fe2d82092c45d97379d681875d9f2e533/Dockerfile)
- `1.9.9` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/69d6179fa9f4d939a73422ceaf31c9dd56f41d96/Dockerfile)

### Stable

- `stable` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/stable/openssl/Dockerfile)
- `1.10.0` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/a1afaef62c34dfd67f40616c2e4d3a59913ce14a/stable/openssl/Dockerfile)
- `1.8.1` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/94288e4964c8261729c4103e4ce24077c8a1e67a/stable/openssl/Dockerfile)



## What is Nginx?
Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other nix flavors. It also has a proof of concept port for Microsoft Window..

## Installation
Automated builds of the image are available on Dockerhub and is the recommended method of installation.
```
docker pull evild/alpine-nginx:1.9.15
```

You can also pull the latest tag which is built from the repository HEAD : Nginx Mainline with Openssl.
```
docker pull evild/alpine-nginx:latest
```

If you are crazy, you can also pull nightly tag witch is build every day from nginx git source.
```
docker pull evild/alpine-nginx:nightly
```


## Basic usage
```docker run -p 80:80 -p 443:443 --name nginx evild/alpine-nginx```

### with docker-compose.yml v1

```yml
nginx:
  image: evild/alpine-nginx
  restart: always
  ports:
    - 80:80
    - 443:443
  #volumes: #Overwrite nginx configuration
  #  - /your/path/to/nginx.conf:/etc/nginx/conf/nginx.conf:ro
```

## Custom Nginx configuration

You can overwrite nginx configuration:

Create your own nginx.conf. Make sure your nginx.conf file has a volume to ```/etc/nginx/conf/nginx.conf```

```docker run -p 80:80 -p 443:443 -v /your/path/to/nginx.conf:/etc/nginx/conf/nginx.conf:ro --name nginx evild/alpine-nginx```


Make sure you set ```daemon off``` in your configuration otherwise the container will exit.
