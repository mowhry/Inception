FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
      php7.4-fpm php7.4-mysql \
      wget curl less mariadb-client \
      && rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html && \
    cd /var/www/html && \
    wp core download --path=/var/www/html --allow-root

RUN chown -R www-data:www-data /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wpscript.sh /wpscript.sh
RUN chmod +x /wpscript.sh

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

ENTRYPOINT ["bash", "/wpscript.sh"]

EXPOSE 9000
