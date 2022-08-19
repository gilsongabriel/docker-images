FROM node:16.16.0-alpine3.16
LABEL maintainer="Gilson Gabriel <gilson@codemastersolucoes.com>"

RUN apk add --no-cache --update shadow sudo git nano
RUN yarn global add @vue/cli @angular/cli @nestjs/cli
RUN sh -c "echo 'node ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/node" \
  && chmod 0440 /etc/sudoers.d/node
RUN git config --global credential.helper 'cache --timeout=7200' && \
  git config --global init.defaultBranch main && \
  git config --global color.ui true
RUN wget https://github.com/eficode/wait-for/releases/download/v2.1.3/wait-for

ENV DV v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DV/dockerize-linux-amd64-$DV.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DV.tar.gz \
  && rm dockerize-linux-amd64-$DV.tar.gz

COPY ./chsh /etc/pam.d/
COPY ./passwd /etc/passwd
COPY ./docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER node

WORKDIR /home/node

RUN wget https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh
RUN sudo chmod +x zsh-in-docker.sh
RUN ./zsh-in-docker.sh -t 'half-life' -p git \
  -p https://github.com/zsh-users/zsh-autosuggestions \
  -p https://github.com/zsh-users/zsh-completions \
  -p https://github.com/zsh-users/zsh-history-substring-search \
  -p https://github.com/zsh-users/zsh-syntax-highlighting \
  -p 'history-substring-search' \
  -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
  -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

COPY ./.zshrc /home/node/.zshrc

RUN sudo chsh -s /bin/zsh

WORKDIR /home/node/app