# IPFS Service

This service containerizes IPFS using Docker.  We can configure IPFS to allow requests from certain hosts.

# Setup

1. Copy over config file

```
cp ipfs-service.env.example ipfs-service.env
```

2. Update config to reflect your environment.  By default the config accepts all requests from http://localhost:3000.  If you are deploying remotely you'll want to ensure that only certain domains are allowed; i.e. `http://hippocrates.netlify.com`

# Running Locally

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

# Running remotely

To launch a remote instance, make sure you have an AWS MedCredits IAM account with the 'developer' group.  Ensure your credentials have been added to your [~/.aws/credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html) file.

If you have placed the IAM user credentials under a named profile, then be sure to set it as the default for a terminal session:

```
export AWS_PROFILE=<the name of the profile>
```

First create a new EC2 Docker instance:

```
./scripts/docker-machine-create.sh ipfs-server
```

The service is named ipfs-server in the above script.  Now make the remote machine the 'active' Docker daemon:

```
eval $(docker-machine env ipfs-server)
```

Check that it's active:

```
docker-machine active
```

You should see the output `ipfs-server`

Here you should double-check your `ipfs-service.env` to make sure it allows the right hostnames.

Now deploy your Docker composition:

```
docker-compose up -d
```

IPFS will now be available at the IP address of the EC2 instance.

# Connecting to IPFS

Once the service is running, you can connect to IPFS as you would normally.  The container exposes the ports 4001, 4002, 5001 and 8080.

## Troubleshooting

If after running `docker-compose up` you see an error like `Error: api not running` you will need to delete
the 'api' file in the IPFS repo directory.  The docker-compose.yml places this at *~/.ipfs-service/data/api*
