#!/bin/sh
# Exit on fail
set -e

if [ "${APP_ENV}" = "local" ]; then
  composer install
else
  composer install --no-ansi --no-dev --no-interaction --no-plugins --no-progress --no-scripts --optimize-autoloader
fi

php artisan key:generate --force
php artisan migrate --force

# Clear cache
php artisan cache:clear && php artisan config:clear && php artisan route:clear

chown -R www-data:www-data /app/storage /app/bootstrap/cache

/usr/bin/supervisord

php-fpm
# Finally call command issued to the docker service
exec "$@"
