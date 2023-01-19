FROM node:16.18.1-alpine3.15

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat dos2unix
WORKDIR /app

ARG APP_ENV
ENV APP_ENV ${APP_ENV}

COPY ./client/docker-entrypoint.sh /docker-entrypoint.sh
RUN dos2unix /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

EXPOSE 3000
