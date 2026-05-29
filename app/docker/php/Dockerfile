FROM php:8.2-apache

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN a2enmod rewrite

RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80
