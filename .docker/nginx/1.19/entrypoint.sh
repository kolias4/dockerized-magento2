#!/bin/sh

# Substitute environment variables in default.conf template
envsubst '$SERVER_NAME' < /etc/nginx/templates/default.template > /etc/nginx/conf.d/default.conf


# Start NGINX
nginx -g 'daemon off;'