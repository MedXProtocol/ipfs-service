#! /bin/sh
cd docker && docker-compose down && cd ..
rm /docker/var/ipfs/data/api
