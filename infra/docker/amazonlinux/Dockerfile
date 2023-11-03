FROM amazonlinux:2

RUN yum update -y \
    && yum install -y httpd \
    vim

RUN amazon-linux-extras enable php8.1 \
    && yum clean metadata \
    && yum install php \
    php-cli \
    php-pdo \
    php-json \
    php-mysqlnd \
    php-xml \
    php-mbstring \
    php-common \
    php-gd \
    -y

RUN echo "<?php phpinfo();" > /var/www/html/info.php

# start apache
CMD ["apachectl", "-D", "FOREGROUND"]
