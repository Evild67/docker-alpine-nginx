[![Docker Stars](https://img.shields.io/docker/stars/evild/alpine-nginx.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)
[![Docker Pulls](https://img.shields.io/docker/pulls/evild/alpine-nginx.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/evild/alpine-nginx/latest.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)

# Alpine Nginx

This image is based on [evild/alpine-base](https://hub.docker.com/r/evild/alpine-base/)

## Version

### Mainline
- `mainline-libressl`, `libressl`, [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/mainline/libressl/Dockerfile)
- `mainline-openssl`, `openssl`, `latest` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/mainline/openssl/Dockerfile)
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
- `1.8.1` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/94288e4964c8261729c4103e4ce24077c8a1e67a/stable/openssl/Dockerfile)

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
