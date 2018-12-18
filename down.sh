#! /bin/sh
cd docker && docker-compose down --remove-orphans && cd ..
rm /docker/var/ipfs/data/api
