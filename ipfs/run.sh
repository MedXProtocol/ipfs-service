#!/bin/sh
set -e
user=ipfs
repo="$IPFS_PATH"

if [ `id -u` -eq 0 ]; then
  echo "Changing user to $user"
  # ensure folder is writable
  su-exec "$user" test -w "$repo" || chown -R -- "$user" "$repo"
  # restart script with new privileges
  exec su-exec "$user" "$0" "$@"
fi

# 2nd invocation with regular user
ipfs version

if [ -e "$repo/config" ]; then
  echo "Found IPFS fs-repo at $repo"
else
  ipfs init
  ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
  ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
fi

echo "Using CORS origins: $IPFS_CONFIG_API_CORS_ORIGINS"


################ EVERYTHING ABOVE ORIGINAL

# Configure server_names origins here
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin $IPFS_CONFIG_API_CORS_ORIGINS

################ EVERYTHING BELOW ORIGINAL

# if the first argument is daemon
if [ "$1" = "daemon" ]; then
  # filter the first argument until
  # https://github.com/ipfs/go-ipfs/pull/3573
  # has been resolved
  shift
else
  # print deprecation warning
  # go-ipfs used to hardcode "ipfs daemon" in it's entrypoint
  # this workaround supports the new syntax so people start setting daemon explicitly
  # when overwriting CMD
  echo "DEPRECATED: arguments have been set but the first argument isn't 'daemon'" >&2
  echo "DEPRECATED: run 'docker run ipfs/go-ipfs daemon $@' instead" >&2
  echo "DEPRECATED: see the following PRs for more information:" >&2
  echo "DEPRECATED: * https://github.com/ipfs/go-ipfs/pull/3573" >&2
  echo "DEPRECATED: * https://github.com/ipfs/go-ipfs/pull/3685" >&2
fi

exec ipfs daemon "$@"
