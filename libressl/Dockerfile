FROM evild/alpine-base:1.0.0
MAINTAINER Dominique HAAS <contact@dominique-haas.fr>

ENV NGINX_VERSION 1.9.13
ENV LIBRESSL_VERSION 2.3.3

RUN \
  build_pkgs="build-base linux-headers openssl-dev pcre-dev curl zlib-dev gnupg" \
  && runtime_pkgs="ca-certificates openssl pcre zlib" \
  && apk --no-cache add ${build_pkgs} ${runtime_pkgs} \
  && mkdir /tmp/libressl \
  && cd /tmp/libressl \
  && curl -O http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${LIBRESSL_VERSION}.tar.gz \
  && curl -O http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${LIBRESSL_VERSION}.tar.gz.asc \
  && gpg --keyserver ha.pool.sks-keyservers.net --recv-key 4B708F96 \
  && gpg --verify libressl-${LIBRESSL_VERSION}.tar.gz.asc libressl-${LIBRESSL_VERSION}.tar.gz \
  && tar -zxf libressl-${LIBRESSL_VERSION}.tar.gz \
  && cd libressl-${LIBRESSL_VERSION} \
  && ./configure \
    LDFLAGS=-lrt \
    --prefix=/tmp/libressl/.openssl/ \
  && make install-strip -j $(getconf _NPROCESSORS_ONLN) \
  && mkdir -p /tmp/src \
  && cd /tmp/src \
  && curl -O http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
  && curl -O http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz.asc \
  && gpg --keyserver ha.pool.sks-keyservers.net --recv-key A1C052F8 \
  && gpg --verify nginx-${NGINX_VERSION}.tar.gz.asc nginx-${NGINX_VERSION}.tar.gz \
  && tar -zxf nginx-${NGINX_VERSION}.tar.gz \
  && cd nginx-${NGINX_VERSION} \
  && ./configure \
    --user=www-data \
    --group=www-data \
    --sbin-path=/usr/sbin/nginx \
    --with-openssl=/tmp/libressl/libressl-${LIBRESSL_VERSION} \
    --with-ld-opt="-lrt" \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_stub_status_module \
    --with-http_auth_request_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-file-aio \
    --with-ipv6 \
    --with-threads \
    --with-stream \
    --with-stream_ssl_module \
    --with-http_v2_module \
    --prefix=/etc/nginx \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
  && make -j $(getconf _NPROCESSORS_ONLN) \
  && make install \
  && make clean \
  && rm -rf /tmp/ /root/.gnupg \
  && strip -s /usr/sbin/nginx \
  && apk del ${build_pkgs} \
  && adduser -D www-data \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

ADD root /

EXPOSE 80 443
