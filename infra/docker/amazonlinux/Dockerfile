FROM amazonlinux:2

# timezone enviroment
ENV TZ=Asia/Tokyo \
    # locale
    LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8

RUN yum update -y \
    && yum install -y \
    httpd \
    # japanese package
    glibc-langpack-ja \
    vim

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

# start apache
CMD ["apachectl", "-D", "FOREGROUND"]
