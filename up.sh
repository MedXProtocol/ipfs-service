#! /bin/sh
mkdir -p /docker/etc/nginx/conf.d
cp nginx.conf.d/dev-proxy.conf /docker/etc/nginx/conf.d/proxy.conf
cd docker
docker-compose up --build
cd ..
