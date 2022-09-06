FROM tugboatqa/php:7.4-apache

ENV COMPOSER_MEMORY_LIMIT=-1

RUN set -x && apt-get update && \
  apt-get -y install libzip-dev jq ssh libxml2-dev && \
  apt-get clean && \
  docker-php-ext-install zip sockets bcmath soap && \
  docker-php-ext-enable sockets bcmath soap

RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

RUN echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/my-php.ini

RUN rm -rf $DOCROOT/../html.original $DOCROOT
