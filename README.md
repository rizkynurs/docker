# Docker
In this repo mostly using docker-compose for running the container

## Prerequisites
- Install Docker, for step install the docker can view in [Official Docker](https://docs.docker.com/engine/install/)
- Install docker-compose:
	1. Install docker compose from source
	```bash 
	curl -SL https://github.com/docker/compose/releases/download/v2.36.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
	```
	2. Apply executable permissions to the standalone binary 
	```bash 
	chmod +x /usr/local/bin/docker-compose
	```
	3. Execute Docker Compose command using `docker-compose`. If that failed, run the symlink command to `/usr/bin`
	```bash
	ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
	```

## Build

For run/build the container, use this command
```bash
cd {folder}
docker-compose up -d
```
