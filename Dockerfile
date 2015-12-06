FROM centos:7
RUN yum install --assumeyes http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
      && yum install --enablerepo=remi-php56 --assumeyes \
           ca-certificates \
           php-fpm \
           php-gd \
           php-intl \
           php-mbstring \
           php-mysqlnd \
           php-opcache \
           php-pecl-apcu \
           php-pecl-imagick \
           php-pdo \
           php-xml \
      && yum clean all \
      && sed -i 's/;date.timezone =/date.timezone = UTC/' /etc/php.ini
COPY php-fpm.conf /etc/php-fpm.conf
WORKDIR /var/www/html
EXPOSE 9000
CMD ["php-fpm"]
