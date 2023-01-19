# Start Up

## Getting started

## Installation

1. Setup env

- `cp .env.docker .env` and edit the `.env` file as:

  Example

  ```dotenv
    APP_ENV=local
    DB_DATABASE=startup
    DB_ROOT_PASSWORD=root
    MYSQL_HOST_PORT=33066

    REDIS_HOST_PORT=6379
    NGINX_HOST_PORT=8000
    CLIENT_HOST_PORT=3000

    DOCKER_UID=1000
    DOCKER_GID=1000
  ```

- `cp client/.env.example client/.env` and edit the `client/.env` file as:

  Example

  ```dotenv
    NUXT_ENV_BASE_URL=http://nginx
    NUXT_ENV_BASE_API_URL=http://localhost:8000

    YAYOI_URL=
    YAYOI_CALLBACK_URL=
    YAYOI_SERVICE_ID=
    YAYOI_USER_INFORMATION_URL=

  ```

- `cp api/.env.example api/.env` and edit the `api/.env` file as:

  Important action is edit connection to DB that is created by `mysql` container

  <!-- Example edit DB connection -->

  `
    DB_CONNECTION=mysql
    DB_HOST=mysql
    DB_PORT=3306
    DB_DATABASE=startup
    DB_USERNAME=root
    DB_PASSWORD=root
  `
 
  Example

  ```dotenv
    APP_NAME=Laravel
    APP_ENV=local
    APP_KEY=
    APP_DEBUG=true
    APP_URL=http://localhost

    LOG_CHANNEL=stack
    LOG_DEPRECATIONS_CHANNEL=null
    LOG_LEVEL=debug

    DB_CONNECTION=mysql
    DB_HOST=mysql
    DB_PORT=3306
    DB_DATABASE=startup
    DB_USERNAME=root
    DB_PASSWORD=root

    BROADCAST_DRIVER=log
    CACHE_DRIVER=file
    FILESYSTEM_DISK=local
    QUEUE_CONNECTION=sync
    SESSION_DRIVER=file
    SESSION_LIFETIME=120

    MEMCACHED_HOST=127.0.0.1

    REDIS_HOST=127.0.0.1
    REDIS_PASSWORD=null
    REDIS_PORT=6379

    MAIL_MAILER=smtp
    MAIL_HOST=
    MAIL_PORT=1025
    MAIL_USERNAME=null
    MAIL_PASSWORD=null
    MAIL_ENCRYPTION=null
    MAIL_FROM_ADDRESS="hello@example.com"
    MAIL_FROM_NAME="${APP_NAME}"
    MAIL_ADMIN_ADDRESS=
    MAIL_ADMIN_NAME=

    AWS_ACCESS_KEY_ID=
    AWS_SECRET_ACCESS_KEY=
    AWS_DEFAULT_REGION=us-east-1
    AWS_BUCKET=
    AWS_USE_PATH_STYLE_ENDPOINT=false

    PUSHER_APP_ID=
    PUSHER_APP_KEY=
    PUSHER_APP_SECRET=
    PUSHER_HOST=
    PUSHER_PORT=443
    PUSHER_SCHEME=https
    PUSHER_APP_CLUSTER=mt1

    VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
    VITE_PUSHER_HOST="${PUSHER_HOST}"
    VITE_PUSHER_PORT="${PUSHER_PORT}"
    VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
    VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"

    ALLOWED_ORIGINS=http://localhost:3000
  ```

  2.Build and up

- Bring up containers

  ```shell
  docker-compose up -d --build
  ```

- Setting secret key

  ```shell
  docker-compose exec api php artisan jwt:secret
  ```

- Run seeds

  ```shell
  docker-compose exec api php artisan db:seed
  ```
