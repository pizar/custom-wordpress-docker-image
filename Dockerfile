FROM wordpress:6.4.2

# enable https
RUN apt update && \
apt install -y --no-install-recommends ssl-cert && \
rm -r /var/lib/apt/lists/* && \
a2enmod ssl && \
a2ensite default-ssl

# install composer
RUN apt install -y curl && \
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php && \ 
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer