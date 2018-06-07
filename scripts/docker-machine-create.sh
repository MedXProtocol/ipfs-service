#! /bin/sh
docker-machine create \
  -d amazonec2 \
  --amazonec2-security-group ipfs-nginx-sg \
  --amazonec2-vpc-id vpc-47ad3423 \
  ipfs-nginx-server
