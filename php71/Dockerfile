FROM php:7.1.1

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN curl -L https://deb.nodesource.com/setup_12.x -o nodesetup && \
    chmod a+x nodesetup && \
    ./nodesetup

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
    libmcrypt-dev \
    libreadline-dev \
    zlib1g-dev \
    libxml2-dev \
    libpng-dev \
    apt-utils \
    curl \
    git \
    zip \
    ssh \
    unzip
RUN apt-get install -y --force-yes nodejs
RUN apt-get -y install \
    default-jre && \
    rm -rf /var/lib/apt/lists/*

# install docker php extension
RUN docker-php-ext-install \
    mbstring \
    mcrypt \
    zip \
    pdo_mysql \
    mysqli \
    xml \
    soap \
    gd \
    sockets
#RUN lsb_release -a && python --version && java -version && node --version

# Install PHP Code Sniffer
RUN curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o phpcs && \
    curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar -o phpcbf && \
    chmod a+x phpcs && \
    chmod a+x phpcbf && \
    mv phpcs /usr/local/bin/phpcs && \
    mv phpcbf /usr/local/bin/phpcbf


# Install Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Set global bin-dir for composer packages
ENV COMPOSER_BIN_DIR="/usr/local/bin"
# Install PHP-Var-Dump-Check
RUN mkdir -p /tools/php-parallel-lint/php-var-dump-check && \
    cd /tools/php-parallel-lint/php-var-dump-check && \
    composer require --dev php-parallel-lint/php-var-dump-check && \
    cd -

# Install PHP-Parallel-Lint
RUN mkdir -p /tools/php-parallel-lint/php-parallel-lint && \
    cd /tools/php-parallel-lint/php-parallel-lint && \
    composer require --dev php-parallel-lint/php-parallel-lint && \
    cd -

# Unset COMPOSER_BIN_DIR
ENV COMPOSER_BIN_DIR=""
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle-1.16.312.zip" -o "awscli-bundle-1.16.312.zip" && \
    unzip awscli-bundle-1.16.312.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

RUN curl -L https://github.com/yui/yuicompressor/releases/download/v2.4.8/yuicompressor-2.4.8.jar -o /tools/yuicompressor-2.4.8.jar
COPY minify.sh /tools/minify
RUN chmod a+x /tools/minify

RUN curl -L https://github.com/akamai/cli/releases/download/1.2.1/akamai-1.2.1-linuxamd64 -o akamai && \
    chmod +x akamai && \
    mv  akamai /usr/local/bin/akamai && akamai install property

RUN curl -L https://github.com/fabpot/local-php-security-checker/releases/download/v1.2.0/local-php-security-checker_1.2.0_linux_amd64 -o local-php-security-checker && \
    chmod +x local-php-security-checker && \
    mv local-php-security-checker /usr/local/bin/local-php-security-checker


RUN curl -L https://github.com/akamai/cli-purge/releases/download/1.0.1/akamai-purge-1.0.1-linuxamd64 -o akamai-purge && \
    chmod +x akamai-purge && \
    mv  akamai-purge /usr/local/bin/akamai-purge

RUN docker-php-ext-install bcmath exif
WORKDIR /app
# Unset the entry point
ENTRYPOINT []
