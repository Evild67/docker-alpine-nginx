FROM evild/alpine-base:1.0.0
MAINTAINER Dominique HAAS <contact@dominique-haas.fr>

ENV NGINX_VERSION nginx-1.9.9

RUN apk --no-cache add openssl-dev pcre-dev zlib-dev wget build-base && \
        mkdir -p /tmp/src && \
        cd /tmp/src && \
        wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
        tar -zxvf ${NGINX_VERSION}.tar.gz && \
        cd /tmp/src/${NGINX_VERSION} && \
        ./configure \
            --with-http_ssl_module \
            --with-http_gzip_static_module \
            --with-http_v2_module \
            --prefix=/etc/nginx \
            --http-log-path=/var/log/nginx/access.log \
            --error-log-path=/var/log/nginx/error.log \
            --sbin-path=/usr/local/sbin/nginx && \
        make && \
        make install && \
        apk del build-base && \
        rm -rf /tmp/src

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/log/nginx"]

# Add the files
ADD root /

# Expose the ports for nginx
EXPOSE 80 443
