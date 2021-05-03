FROM tugboatqa/php:7.4-apache

ENV COMPOSER_MEMORY_LIMIT=-1

RUN set -x && apt-get update && \
  apt-get -y install libzip-dev jq && \
  apt-get clean && \
  docker-php-ext-install zip sockets bcmath && \
  docker-php-ext-enable sockets bcmath

RUN rm -rf $DOCROOT/../html.original $DOCROOT
