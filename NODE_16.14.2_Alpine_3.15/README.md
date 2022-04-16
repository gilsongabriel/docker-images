<p align="center">
  <a href="https://codemastersolucoes.com" target="_blank">
    <img data-testid="logo" src="https://cms-public-images.s3.amazonaws.com/logo.png">
  </a>
</p>

# About this custom image

This image is customized from the official [Node 16.14.2 Alpine 3.15](https://hub.docker.com/_/node) image,
and we added some packages.

# What's included

## This image contain these packages by default

- Dockerize [Github Repository (jwilder/dockerize)](https://github.com/jwilder/dockerize)
- Wait-for [Github Repository (eficode/wait-for)](https://github.com/eficode/wait-for)
- Oh My Zsh for Docker [Github Repository (deluan/zsh-in-docker)](https://github.com/deluan/zsh-in-docker)
- Git
- Nano Text Editor
- Vue CLI
- Angular CLI

# How to use

## Create a Dockerfile in your Node project

```dockerfile
FROM codemastersolutions/node:16.14.2-alpine3.15
#The application files directory
WORKDIR /home/node/app
#Set permission to user node
RUN usermod -u 1000 node
#Set default user to image
USER node
```

## Then, run the commands to build and run the Docker image

```shell script
docker build -t my-node-app .
docker run -it --rm --name my-running-app my-node-app
```

# Using with Docker Composer

```yaml
version: "3.8"
services:
  app:
    image: codemastersolutions/node:16.14.2-alpine3.15
    container_name: my-container-name
    volumes:
      - .:/home/node/app
    ports:
      - "<host-port>:<container-port>"
    restart: always
    tty: true
```
