# IPFS Service

This service containerizes IPFS.  We can configure IPFS to allow requests from certain hosts.

# Setup

1. Copy over config file

```
cp ipfs-service.env.example ipfs-service.env
```

2. Update config to reflect your environment.  By default the config accepts all requests from http://localhost:3000

# Running

First [Docker](https://www.docker.com/) must be installed.

To run the environment locally run:

```
docker-compose up -d
```

`-d` will start it in detached mode.  It's easier to shut it down cleanly this way.

To view logs:

```
docker-compose logs -f
```

Then to shut it down:

```
docker-compose down
```

## Troubleshooting

If after running `docker-compose up` you see an error like `Error: api not running` you will need to delete
the 'api' file in the IPFS repo directory.  The docker-compose.yml places this at *~/.ipfs-service/data/api*
