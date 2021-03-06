FROM php:5.6-fpm
RUN apt-get update && apt-get install -y \
    libz-dev \
    libmemcached-dev \
    libmcrypt-dev \
    && pecl install redis-2.2.8 \
    && docker-php-ext-enable redis

RUN curl https://phar.phpunit.de/phpunit-5.7.phar -L -o phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql mbstring bcmath mcrypt sockets calendar intl
