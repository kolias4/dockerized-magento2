## Docker Configuration for Magento 2.4

<img src="https://img.shields.io/badge/magento-2.X-brightgreen.svg?logo=magento&longCache=true&style=flat-square" alt="Supported Magento Versions" />

## Versions

| Service       | Version |
| ------------- | ------: |
| Magento       |  latest |
| Nginx         |    1.19 |
| PHP           |     8.1 |
| MySQL         |  8.0.22 |
| Adminer       |  latest |
| Redis         |   6.0.6 |
| Elasticsearch |   7.6.2 |
| MailHog       |  latest |

## Quick Start

**Setup your Docker engine** (You can configure Docker resources from the [Docker Desktop](https://docs.docker.com/desktop/#configure-docker-desktop))**:**

- CPUs: 4
- Memory: 4.00 GB (min 4 GB)
- Swap: 2.00 GB
- Disk image size: 56 GB

**After clone this repository:**

1. Start by creating the working directory and within this folder, create the following directories:

   ```
   mkdir -p magento services/nginx_log services/phpfpm_log services/sock_data services/mysql_data services/mysql_log services/redis_data services/es_data services/es_log
   ```

2. Build and start all containers:

   ```
   docker-compose build && docker-compose up -d
   ```

3. Create a new Composer project using the Magento Open Source:

   ```
   docker-compose exec phpfpm install_magento.sh
   ```

4. Initialize Magento (Example. You can customize to you. [Installation Guide](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/advanced.html)):

   ```
   docker compose exec -T phpfpm bin/magento setup:install --base-url=http://axsoula.gr/ --db-host=db --db-name=magento --db-user=magento --db-password=magento --backend-frontname=admin  --admin-firstname=admin --admin-lastname=admin --admin-email=yourname@domain.com --admin-user=admin --admin-password=admin1234 --language=en_US --currency=EUR --timezone=Europe/Athens --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=elasticsearch --elasticsearch-port=9200 --elasticsearch-index-prefix=magento
   ```

5. Finalize magento config

```
docker-compose exec -T phpfpm bash -c "bin/magento module:disable Magento_AdminAdobeImsTwoFactorAuth Magento_TwoFactorAuth && bin/magento cache:flush"

```

After above completes running, you should be able to access your site at http://magento-dev.com and http://magento-dev.com/admin
