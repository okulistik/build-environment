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
    nodejs \
    unzip && \
    rm -rf /var/lib/apt/lists/*
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

# Install PHP Code Sniffer
RUN curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o phpcs && \
    curl -L https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar -o phpcbf && \
    chmod a+x phpcs && \
    chmod a+x phpcbf && \
    mv phpcs /usr/local/bin/phpcs && \
    mv phpcbf /usr/local/bin/phpcbf

# Install PHP Security Checker
RUN curl -L http://get.sensiolabs.org/security-checker.phar -o security-checker.phar && \
    chmod +x security-checker.phar && \
    mv security-checker.phar /usr/local/bin/security-checker

# Install Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    composer config -g repo.packagist composer https://packagist.phpcomposer.com

# Set global bin-dir for composer packages
ENV COMPOSER_BIN_DIR="/usr/local/bin"

# Install PHP-Var-Dump-Check
RUN mkdir -p /tools/jakub-onderka/php-var-dump-check && \
    cd /tools/jakub-onderka/php-var-dump-check && \
    composer require --dev jakub-onderka/php-var-dump-check && \
    cd -

# Install PHP-Parallel-Lint
RUN mkdir -p /tools/jakub-onderka/php-parallel-lint && \
    cd /tools/jakub-onderka/php-parallel-lint && \
    composer require --dev jakub-onderka/php-parallel-lint && \
    cd -

# Unset COMPOSER_BIN_DIR
ENV COMPOSER_BIN_DIR=""

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# E2E test tool, chromedriver
RUN npm i -g nightwatch@1.3.7

WORKDIR /app
# Unset the entry point
ENTRYPOINT []
