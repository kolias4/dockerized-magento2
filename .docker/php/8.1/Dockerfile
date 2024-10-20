FROM php:8.1-fpm-buster

ENV COMPOSER_HOME /root/.composer/

RUN apt-get update && apt-get install -y \
  cron \
  git \
  gzip \
  libbz2-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  libsodium-dev \
  libssh2-1-dev \
  libxslt1-dev \
  libzip-dev \
  lsof \
  default-mysql-client \
  vim \
  zip \
  mc

RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN docker-php-ext-install \
  bcmath \
  bz2 \
  calendar \
  exif \
  gd \
  gettext \
  intl

RUN docker-php-ext-install \
  mysqli \
  opcache \
  pcntl \
  pdo_mysql \
  soap \
  sockets \
  sodium \
  sysvmsg \
  sysvsem \
  sysvshm \
  xsl \
  zip


RUN curl -sS https://getcomposer.org/installer | \
  php -- --version=2.0.12 --install-dir=/usr/local/bin --filename=composer

COPY ./www.conf /usr/local/etc/php-fpm.d/
COPY ./php.ini /usr/local/etc/php/
COPY ./php-fpm.conf /usr/local/etc/
COPY ./auth.json $COMPOSER_HOME
COPY ./install_magento.sh /usr/local/bin/install_magento.sh
RUN chmod +x /usr/local/bin/install_magento.sh

WORKDIR /var/www/html
