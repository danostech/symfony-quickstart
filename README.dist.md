# [Project Title]

### System Requirements
* [docker](https://docs.docker.com/get-docker/)
* [docker-compose](https://docs.docker.com/compose/install/)
* [composer](https://getcomposer.org/download/) (see creating a Docker powered composer alias [here](https://gist.github.com/danostech/898256c58d3d563b44604487a30ebf93))

### Setup
1. Clone this repository
```shell
$ git clone git@github.com:[repo-owner]/[project].git
```
2. Run docker-compose
```shell
$ cd [project]/
$ docker-compose up -d
```
3. Run composer
```shell
$ cd app/
$ composer install
```
4. Check Symfony installation via the console [^1]
```shell
$ ../console about

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

5. Project is available at http://localhost:8080

---
### Next Steps
#### Speed up the initial build (for slower machines)
This will pull in an image identical what would be built using the current Dockerfile.

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

#### What is console?
`./console` is a simple shell script that calls Symfony's console command from your host machine.  
The line `ENV PATH="${PATH}:/app/bin"` in the Dockerfile makes this possible. 

Example from inside the app/ directory:
```shell
$ ../console make:controller

 Choose a name for your controller class (e.g. OrangePopsicleController):
 > 
```

#### Environment Variables
Any environment variables created in `.env` will be available in the [project]_php container. 

[^1]: If for some reason `./console` is not executable, run `chmod +x ./console` first.
