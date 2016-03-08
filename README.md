[![Docker Stars](https://img.shields.io/docker/stars/evild/alpine-nginx.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)
[![Docker Pulls](https://img.shields.io/docker/pulls/evild/alpine-nginx.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/evild/alpine-nginx/latest.svg?style=flat-square)](https://hub.docker.com/r/evild/alpine-nginx/)

# Alpine Nginx

This image is based on [evild/alpine-base](https://hub.docker.com/r/evild/alpine-base/)

## Version

- `1.9.12`, `latest` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/master/Dockerfile)
- `1.9.11` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/121a9b9d36a6f895d3af8d5ffcad7d751beec444/Dockerfile)
- `1.9.10` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/e939de5fe2d82092c45d97379d681875d9f2e533/Dockerfile)
- `1.9.9` [(Dockerfile)](https://github.com/Evild67/docker-alpine-nginx/blob/69d6179fa9f4d939a73422ceaf31c9dd56f41d96/Dockerfile)

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
