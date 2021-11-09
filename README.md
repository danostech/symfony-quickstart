# Symfony5 Quickstart
A Docker and PHP 8 development environment with NGINX and MariaDB.  
This should get you up and running on a new Symfony5 project with the latest versions of PHP, MariaDB and NGINX in a matter of minutes, provided you have the required applications pre-installed.

### System Requirements
* [docker](https://docs.docker.com/get-docker/)
* [docker-compose](https://docs.docker.com/compose/install/)
* [composer](https://getcomposer.org/download/) (see creating a Docker powered composer alias [here](https://gist.github.com/danostech/898256c58d3d563b44604487a30ebf93))

### Setup
1. Clone this repository or create a new repository from this [template](https://github.com/danostech/docker-php8/generate) and follow the instructions below
```shell
# change danostech/symfony-quickstart.git to your repository if using this as a template
$ git clone git@github.com:danostech/symfony-quickstart.git your_app_name
```
2. Create your symfony project (make sure to call it app)
```shell
$ cd your_app_name
$ composer create-project symfony/skeleton app
```

3. Update ports, container names, and environment variables
```shell
# update container names in docker-compose.yml and the console helper file
# avoid using spaces or special characters here

# linux
$ sed -i s/quickstart/your_app_name/g {*.yml,console}

# OSX
$ sed -i '' s/quickstart/your_app_name/g {*.yml,console}

# .env (optional)
# make changes to your MYSQL_USER, MYSQL_PASSWORD, and MYSQL_DATABASE environment variables
```
4. Run docker-compose
```shell
$ docker-compose up -d
```
5. Check Symfony installation via the console
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

If for some reason `./console` is not executable, run `chmod +x ./console` first.

6. Go to http://localhost:8080 in your browser to view your new symfony app.

### Notes

Any environment variables created in `.env` will be available in the php-fpm container. 
