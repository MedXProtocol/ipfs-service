#! /bin/sh

# NOTE: This script is for MedCredits AWS.
docker-machine create \
  -d amazonec2 \
  --amazonec2-security-group ipfs-service \
  --amazonec2-vpc-id vpc-ba1e33c1 \
  ipfs-server
