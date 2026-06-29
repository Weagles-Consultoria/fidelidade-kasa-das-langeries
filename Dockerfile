FROM php:8.5-apache-bookworm

RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql

RUN a2enmod rewrite

COPY . /var/www/html/
COPY docker/apache/security.conf /etc/apache2/conf-available/security-hardening.conf

RUN chown -R www-data:www-data /var/www/html \
    && a2enconf security-hardening
