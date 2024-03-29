<p align="center">
  <a href="https://codemastersolucoes.com" target="_blank">
    <img data-testid="logo" src="https://cms-public-images.s3.amazonaws.com/logo.png">
  </a>
</p>

# About this custom image

This image is customized from the official [PHP 8.1.4 FPM Alpine 3.15](https://hub.docker.com/_/php) image,
and added some packages to run applications [Laravel](https://laravel.com), along with some official packages:

- [Horizon](https://laravel.com/docs/9.x/horizon)
- [Telescope](https://laravel.com/docs/9.x/telescope)
- [Socialite](https://laravel.com/docs/9.x/socialite)

# What's included

##### This image contains these packages by default:

- Wait-for v2.2.3 [Github Repository (jwilder/dockerize)](https://github.com/eficode/wait-for)
- Dockerize v0.6.1 [Github Repository (jwilder/dockerize)](https://github.com/jwilder/dockerize)
- PhpUnit Watcher [Github Repository (spatie/phpunit-watcher)](https://github.com/spatie/phpunit-watcher)
- Oh My Zsh for Docker [Github Repository (deluan/zsh-in-docker)](https://github.com/deluan/zsh-in-docker)
- Composer
- Git
- Nano Text Editor
- PHP FPM exposed in the port 9000
- Supervisor
- Supervisor Web Server, exposed in the port 9001
- Unzip

# PHP Extensions Enabled

##### By default, these extensions are enabled

- bcmath
- mbstring
- mysqli
- pcntl
- pdo
- pdo_mysql
- pdo_sqlsrv
- redis
- sqlsrv
- xdebug
- xml
- xmlrpc
- xsl
- zip

# How to use

### Create a Dockerfile in your PHP project

```dockerfile
FROM codemastersolutions/php:8.1.4-fpm-alpine3.15
#The application files directory
WORKDIR /app
#Set permission to user www-data
RUN usermod -u 1000 www-data
#Set default user to image
USER www-data
#Default port to FPM server
EXPOSE 9000
#Default port to supervisor web server
EXPOSE 9001
```

##### Then, run the commands to build and run the Docker image:

```shell script
docker build -t my-php-app .
docker run -it --rm --name my-running-app my-php-app
```

# Using with Docker Composer

```yaml
version: '3.8'
services:
  my-service-name:
    image: codemastersolutions/php:8.1.4-fpm-alpine3.15
    container_name: my-container-name
    volumes:
      - ./app-src:/app
      #Path containing supervisor ini files with supervisor programs
      - ./supervisor-ini-path:/etc/supervisor.d
    ports:
      #Default port to PHP FMP
      - '9000:9000'
      #Default Port to Supervisor Web Server
      - '9001:9001'
    restart: always
    tty: true
```

# Accessing Supervisor Web Server

##### URL: http://localhost:9001

##### User: admin

##### Password: 123

You can change the port, user and password in the supervisord config file, located in /etc/supervisord.conf.
