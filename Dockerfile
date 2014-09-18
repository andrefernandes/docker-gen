# CentOS 7 + Docker-gen

FROM andrefernandes/docker-centos7-base

MAINTAINER Andre Fernandes

# Based on the original work from "jwilder / nginx-proxy"
# Unlike the original nginx-proxy image, here I try to
# split nginx and docker-gen into separate containers.

RUN wget https://github.com/jwilder/docker-gen/releases/download/0.3.2/docker-gen-linux-amd64-0.3.2.tar.gz -q && \
    tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-0.3.2.tar.gz && \
    rm docker-gen-linux-amd64-0.3.2.tar.gz && \
    mkdir /app

WORKDIR /app

ADD start-docker-gen.sh /app/start-docker-gen.sh
ADD reload-nginx-container.sh /app/reload-nginx-container.sh
ADD nginx.tmpl /app/nginx.tmpl

ENV DOCKER_HOST unix:///var/run/docker.sock

VOLUME ["/etc/nginx/sites-enabled"]

CMD ["/app/start-docker-gen.sh"]

