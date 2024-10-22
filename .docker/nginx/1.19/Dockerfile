FROM nginx:1.27.2-alpine

# Install gettext to enable envsubst
# RUN apk add --no-cache gettext


# Copy NGINX configuration templates
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/templates/default.template
COPY ./magento2-cors.conf /etc/nginx/magento2-cors.conf

# Copy entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/www/html
