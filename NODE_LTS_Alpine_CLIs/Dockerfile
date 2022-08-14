FROM node:lts-alpine

ARG NEST_VERSION=9.0.0
ARG VUE_VERSION=5.0.8
ARG ANGULAR_VERSION=14.1.2

RUN apk add --no-cache bash
RUN npm -i --location=global @nestjs/cli@$NEST_VERSION @vue/cli@$VUE_VERSION @angular/cli@$ANGULAR_VERSION