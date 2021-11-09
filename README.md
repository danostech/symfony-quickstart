# php8 development environment w/ Docker
A Docker and PHP 8 development environment with NGINX and MariaDB.  
This is a minimal development environment. 
Take a look at the included files to learn more if you're interested.   
Quick setup instructions can be found below.

### System Requirements
* [docker](https://docs.docker.com/get-docker/)
* [docker-compose](https://docs.docker.com/compose/)

### Setup
Clone this repository or create a new repository from this [template](https://github.com/danostech/docker-php8/generate) and follow the insructions below
```shell
git clone git@github.com:danostech/docker-php8.git your_app_name
```
Create your public directory
```shell
cd your_app_name
mkdir -p app/public
```
Create index.php file
```shell
echo '<?php phpinfo(); ?>' >> app/public/index.php
```
Update ports, container names, and environment variables
```shell
# docker-compose.yml
# change the names of the containers from `demo_*` to your app.
# change ports in the web and/or php containers

# .env
# change the MYSQL_USER, MYSQL_PASSWORD, and MYSQL_DATABASE environment variables
```
Run docker-compose
```shell
docker-compose up -d
```

If using the default ports in `docker-compose.yml`
go to http://localhost:8080 in your browser to view your php config.

### Notes

Any environment variables created in `.env` will be available in the php-fpm container. 
