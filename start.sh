#!/bin/sh
# Default PORT to 80 if not set by Railway
export PORT="${PORT:-80}"

# Replace ${PORT} in Nginx config
envsubst '${PORT}' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default

# Start Supervisor (which starts Nginx, PHP-FPM, and Memcached)
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
