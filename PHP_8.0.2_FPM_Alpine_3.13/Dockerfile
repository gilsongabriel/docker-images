FROM php:8.0.2-fpm-alpine3.13
LABEL maintainer="Gilson Gabriel <gilson@codemastersolucoes.com>"

RUN apk add --no-cache shadow yarn nano git unzip supervisor zsh-vcs libxml2-dev libxslt-dev \
    oniguruma-dev libzip-dev icu-dev unixodbc-dev autoconf make build-base openrc python3 make g++

RUN git config --global credential.helper 'cache --timeout=7200' && \
    git config --global init.defaultBranch main && \
    git config --global color.ui true

RUN yarn global add nodejs node-gyp @vue/cli

RUN mkdir /run/openrc && \
    mkdir /home/www-data/logs && \
    touch /run/openrc/softlevel
    
RUN docker-php-ext-install intl bcmath pdo pdo_mysql xml xsl mbstring zip pcntl mysqli
    
RUN rm -rf /var/www/html \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis \
    && docker-php-ext-install redis

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --filename=composer --install-dir=/usr/bin \
    && php -r "unlink('composer-setup.php');"

RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.7.1.1-1_amd64.apk

RUN apk add --allow-untrusted msodbcsql17_17.7.1.1-1_amd64.apk

RUN pecl install sqlsrv-5.9.0 pdo_sqlsrv-5.9.0 xmlrpc xdebug-3.0.2
    
RUN docker-php-ext-enable sqlsrv pdo_sqlsrv xdebug

RUN rm -rf msodbcsql17_17.5.2.2-1_amd64.apk

ENV DV v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DV/dockerize-linux-amd64-$DV.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DV.tar.gz \
    && rm dockerize-linux-amd64-$DV.tar.gz

RUN composer global require spatie/phpunit-watcher

RUN apk del --purge libxml2-dev oniguruma-dev unixodbc-dev autoconf make build-base

RUN wget https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh

RUN chmod +x zsh-in-docker.sh

RUN ./zsh-in-docker.sh \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-history-substring-search \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p 'history-substring-search' \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

COPY ./.zshrc /root/.zshrc
COPY ./chsh /etc/pam.d/
COPY ./supervisord.conf /etc/
COPY ./docker-php-entrypoint /usr/local/bin/
COPY ./docker-php-entrypoint /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/docker-php-entrypoint
RUN chmod +x /usr/local/bin/entrypoint
RUN chsh -s /bin/zsh

EXPOSE 9000
EXPOSE 9001
