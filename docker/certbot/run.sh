#! /bin/sh
certbot certonly \
  --webroot -w /var/www \
  --agree-tos \
  --renew-by-default \
  -m mail.asselstine@gmail.com \
  -d ipfs.medcredits.io \
  > /proc/1/fd/1 2>/proc/1/fd/2
