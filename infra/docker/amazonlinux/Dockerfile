FROM amazonlinux:2

# timezone enviroment
ENV TZ=Asia/Tokyo \
    # locale
    LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8

RUN yum update -y \
    && yum install -y \
    # japanese package
    glibc-langpack-ja \
    httpd \
    unzip \
    vim \
    zip

# php8.1 enable from amazon-linux-extras & php extension install
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

# composer install from image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY ./infra/docker/php/php.ini /etc/php.ini
COPY ./infra/docker/apache/vhost.conf /etc/httpd/conf.d/vhost.conf
COPY ./infra/docker/apache/rewrite.conf /etc/httpd/conf.modules.d/rewrite.conf

# start apache
CMD ["apachectl", "-D", "FOREGROUND"]

WORKDIR /work/laravel_project