![php](https://img.shields.io/badge/PHP-8.0-777BB4?logo=php&style=for-the-badge)
![nginx](https://img.shields.io/badge/NGINX-1.21-009639?logo=NGINX&style=for-the-badge)
![mariadb](https://img.shields.io/badge/MariaDB-10.6-003545?logo=MariaDB&style=for-the-badge)  
# Symfony Quickstart Environment
A Symfony **development** environment with PHP8, NGINX and MariaDB.  
  
This should get you up and running on a new Symfony project in a matter of minutes, provided you have the required applications pre-installed.

## System Requirements
* [docker](https://docs.docker.com/get-docker/)
* [docker-compose](https://docs.docker.com/compose/install/)
* [composer](https://getcomposer.org/download/) (see creating a Docker powered composer alias [here](https://gist.github.com/danostech/898256c58d3d563b44604487a30ebf93))

## Setup
1. Clone this repository or create a new repository from this [template](https://github.com/danostech/symfony-quickstart/generate) and follow the instructions below
```shell
# change danostech/symfony-quickstart.git to your repository if using this as a template
$ git clone git@github.com:danostech/symfony-quickstart.git your_app_name
```
2. Create your symfony project. This **MUST** be called `app`.
```shell
$ cd your_app_name
$ composer create-project symfony/skeleton app
```

3. Update ports, container names, and environment variables [^1]
```shell
# update container names in docker-compose.yml and the console helper file
# avoid using spaces or special characters here

# linux
$ sed -i s/quickstart/your_app_name/g {.env,docker-compose.yml,console}

# OSX
$ sed -i '' s/quickstart/your_app_name/g {.env,docker-compose.yml,console}

# Windows (if you know what the proper command is, please comment or open a pull request)
$ ¯\_(ツ)_/¯ 

# .env (extra optional)
# make changes to your MYSQL_USER, MYSQL_PASSWORD, and MYSQL_DATABASE environment variables
```
4. Run docker-compose
```shell
$ docker-compose up -d
```
5. Check Symfony installation via the console [^2]
```shell
$ ./console about

 -------------------- --------------------------------- 
  Symfony                                               
 -------------------- --------------------------------- 
  Version              5.3.10                           
  Long-Term Support    No                               
  End of maintenance   01/2022 (in +83 days)            
  End of life          01/2022 (in +83 days)            
 -------------------- --------------------------------- 
  Kernel                                                
 -------------------- --------------------------------- 
  Type                 App\Kernel                       
  Environment          dev                              
  Debug                true                             
  Charset              UTF-8                            
  Cache directory      ./var/cache/dev (674 KiB)        
  Build directory      ./var/cache/dev (674 KiB)        
  Log directory        ./var/log (0 B)                  
 -------------------- --------------------------------- 
  PHP                                                   
 -------------------- --------------------------------- 
  Version              8.0.12                           
  Architecture         64 bits                          
  Intl locale          n/a                              
  Timezone             UTC (2021-11-09T06:36:12+00:00)  
  OPcache              false                            
  APCu                 false                            
  Xdebug               true                             
 -------------------- --------------------------------- 

```

6. Visit http://localhost:8080 in your browser to view your new symfony app.

## Next Steps
### Change your README
```shell
$ rm README.md
$ mv README.sample.md README.md
```

Edit the new `README.md` file. Make sure to change anything in [brackets] and change [project] to your project name.

### Speed up the initial build[^3]
Edit `Dockerfile` and change:
```Dockerfile
# The latest PHP fpm-buster image
FROM php:fpm-buster

# Path to Symfony's console
ENV PATH="${PATH}:/app/bin"

# Install PDO and PDO_MySQL extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install & Enable xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
```

to:
```Dockerfile
# The latest Symfony Quickstart image
FROM danostech/php:symfony-quickstart 
```

### What is console?
`./console` is a simple shell script that calls Symfony's console command from your host machine.  
The line `ENV PATH="${PATH}:/app/bin"` in the Dockerfile makes this possible. 

Example from inside the app/ directory:
```shell
$ ../console make:controller

 Choose a name for your controller class (e.g. OrangePopsicleController):
 > 
```

### Environment Variables
Any environment variables created in `.env` will be available in your Symfony application.


[^1]: Modifying these values is completely optional.
_**However**_, creating multiple networks from this template on the same host machine will require you to change ports and container names.
[^2]: If for some reason `./console` is not executable, run `chmod +x ./console` first.
[^3]: I did not include this in the original Dockerfile because I'm not a fan of learning packages/tutorials that don't give you the "bare bones" information and suggest that you use their images instead.
That being said if you're on a slower computer, use the image I built to speed things up.
If not, you'll be waiting a while for the PHP extensions to be compiled when you first run `docker-compose up`
