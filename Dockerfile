FROM php:7.0-apache

RUN apt-get update && apt-get install --no-install-recommends -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
    && docker-php-ext-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
        pdo_mysql \
        gd \
        opcache \
        zip \
        mysqli \
    && apt-get remove -y \
        gcc \
        g++ \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

ARG DOMAIN
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=CA/ST=ON/L=Toronto/O=Security/OU=Development/CN=${DOMAIN}"
RUN a2enmod rewrite
RUN a2ensite default-ssl
RUN a2enmod ssl
