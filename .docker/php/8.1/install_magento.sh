#!/bin/bash

# Define environment variables
INSTALL_DIR="/var/www/html"
MAGENTO_VERSION="2.4.7-p3"

# Set the ownership of the /var/www directory to www-data
echo "Setting ownership of /var/www to www-data..."
chown -R www-data:www-data /var/www

# Run Composer as the www-data user to create a Magento project
echo "Running Composer to create Magento project in $INSTALL_DIR..."
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=$MAGENTO_VERSION  $INSTALL_DIR

# Change directory to the installation folder
cd $INSTALL_DIR

# Set the appropriate file and folder permissions
echo "Setting file and folder permissions for Magento..."
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +

# Set group ownership to www-data and make bin/magento executable
echo "Setting ownership and making bin/magento executable..."
chown -R :www-data .
chmod u+x bin/magento

echo "Magento installation and permissions setup complete!"
