ARG BUILD_FROM=php:7.2-apache
FROM ${BUILD_FROM}
MAINTAINER Dan Medhurst (danmed@gmail.com)
COPY . /var/www/html/
RUN echo "Start" \
 && mv /var/www/html/install.sh /usr/bin/ \
 && mv /var/www/html/qemu* /usr/bin/ \
 && chmod 755 /usr/bin/install.sh \
 && echo 'PassEnv DBTYPE'  >> /etc/apache2/conf-enabled/expose-env.conf \
 && echo 'PassEnv DBNAME'   >> /etc/apache2/conf-enabled/expose-env.conf \
 && echo 'PassEnv MYSQL_SERVER'  >> /etc/apache2/conf-enabled/expose-env.conf \
 && echo 'PassEnv MYSQL_USERNAME'  >> /etc/apache2/conf-enabled/expose-env.conf \
 && echo 'PassEnv MYSQL_PASSWORD'  >> /etc/apache2/conf-enabled/expose-env.conf \
 && echo "Done"
CMD [ "/usr/bin/install.sh", "apache2-foreground" ]
