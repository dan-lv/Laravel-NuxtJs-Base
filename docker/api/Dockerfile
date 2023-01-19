FROM php:8.1.4-fpm-alpine3.15

WORKDIR /

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        shadow \
        freetype \
        freetype-dev \
        libpng-dev \
        jpeg-dev \
        libzip-dev \
        libc-dev \
        zip \
        curl \
        openssl \
        gettext \
        unzip \
        openssh \
        autoconf \
        gcc \
        make \
        dos2unix \
        supervisor

ENV PHPREDIS_VERSION 5.3.7
RUN wget http://pecl.php.net/get/redis-${PHPREDIS_VERSION}.tgz -O /tmp/redis.tar.tgz \
    && pecl install -o -f /tmp/redis.tar.tgz \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
    && rm -rf /tmp/redis.tar.tgz \
    && docker-php-ext-enable redis \
    && docker-php-ext-install gd \
        bcmath \
        pdo_mysql \
        zip \
        opcache

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

COPY ./api/docker-entrypoint.sh /docker-entrypoint.sh

ARG APP_ENV
ENV APP_ENV ${APP_ENV}
COPY ./api/php.ini-development /usr/local/etc/php/php.ini

RUN dos2unix /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

ARG DOCKER_UID
ARG DOCKER_GID
RUN if [ ${DOCKER_UID:-0} -ne 0 ] && [ ${DOCKER_GID:-0} -ne 0 ]; then \
    deluser www-data &&\
    if getent group www-data ; then delgroup www-data; fi &&\
    addgroup -g ${DOCKER_GID} www-data &&\
    adduser -u ${DOCKER_UID} -G www-data www-data --disabled-password &&\
    install -d -m 0755 -o www-data -g www-data /home/www-data \
;fi

RUN apk add --no-cache openssl

WORKDIR /app

RUN chown -R www-data:www-data /app

COPY ./api/supervisord.ini /etc/supervisor.d/supervisord.ini

RUN touch /worker.log
