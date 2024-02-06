FROM php:8.2-fpm

RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        zip \
        libzip-dev \
        libpng-dev && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install zip gd
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

    
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalação do Node.js 6.9.0
RUN curl -sL https://nodejs.org/dist/v12.2.0/node-v12.2.0-linux-x64.tar.xz | tar -xJ --directory /usr/local --strip-components 1

WORKDIR /var/www/html