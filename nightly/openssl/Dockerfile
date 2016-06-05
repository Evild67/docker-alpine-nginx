FROM evild/alpine-base:3.0.0
MAINTAINER Dominique HAAS <contact@dominique-haas.fr>

ARG NGINX_VERSION=NIGHTLY

RUN \
  build_pkgs="build-base linux-headers openssl-dev pcre-dev curl zlib-dev gnupg" \
  && runtime_pkgs="ca-certificates openssl pcre zlib" \
  && apk --no-cache add ${build_pkgs} ${runtime_pkgs} \
  && for key in $GPG_KEYS; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done \
  && mkdir -p /tmp/src \
  && cd /tmp/src \
  && curl -fSL http://hg.nginx.org/nginx/archive/tip.tar.gz -o nginx.tar.gz \
  && tar -zxf nginx.tar.gz \
  && cd nginx-*/ \
  && ./auto/configure \
    --user=www-data \
    --group=www-data \
    --sbin-path=/usr/sbin/nginx \
    --with-http_ssl_module \
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
