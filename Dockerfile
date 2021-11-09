# The latest PHP fpm-buster image
FROM php:fpm-buster

# Install PDO and PDO_MySQL extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install & Enable xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
