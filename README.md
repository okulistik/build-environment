# Okulistik Php Builder

Docker images to be used for CI Okulistik php projects.

## Build
- Php 7.1
    ```
    docker build -t okulistik/builder-php71 .
    ```
- Php 7.4
    ```
    docker build -t okulistik/builder-php74 .
    ```

## Push
    ```
    docker build -t okulistik/builder-php71:2.1 .
    ```
    ```
    docker push okulistik/builder-php71:2.1
    ```

## Usage 
- Npm Install
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 npm install
    ```
- Composer Install
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 composer install
    ```
- Vardump Checker    
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 var-dump-check /app/src
    ```
- Paralel Lint Checker    
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 parallel-lint /app/src
    ```
- Code Sniffer
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 phpcs /app/src
    ```
- Aws
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 aws
    ```
- Akamai Cdn
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 akami
    ```
- Minify
    ```
    docker run -v $(PWD):/app okulistik/builder-php71 /tools/minify minifylist
    ```

## Credits
Inspired by [Umut Işık](<https://github.com/umutphp/php-docker-images-for-ci>).
