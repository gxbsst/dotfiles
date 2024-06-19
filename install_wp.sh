#!/bin/bash

# 更新系统包
echo "Updating system packages..."
apt-get update
apt-get upgrade -y

# 安装 Nginx
echo "Installing Nginx..."
apt-get install -y nginx

# 安装 MariaDB
echo "Installing MariaDB..."
apt-get install -y mariadb-server

# 添加 PHP 8 源并安装 PHP 8
echo "Installing PHP 8 and required PHP extensions..."
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install -y php8.1 php8.1-fpm php8.1-mysql php8.1-xml php8.1-gd php8.1-curl php8.1-mbstring php8.1-zip unzip curl

# 启动 Nginx 和 MariaDB 服务
echo "Starting Nginx and MariaDB services..."
systemctl start nginx
systemctl enable nginx
systemctl start mariadb
systemctl enable mariadb

# 安全配置 MariaDB
echo "Securing MariaDB..."
mysql_secure_installation

# 创建 WordPress 项目目录
echo "Creating WordPress project directory..."
mkdir -p /var/www/bedrock
cd /var/www/bedrock

# 安装 Bedrock
echo "Installing Bedrock..."
composer create-project roots/bedrock .

# 配置环境变量
echo "Configuring environment..."
cp .env.example .env
sed -i "s/database_name/your_db_name/g" .env
sed -i "s/database_user/your_db_user/g" .env
sed -i "s/database_password/your_db_password/g" .env
sed -i "s#WP_HOME=http://example.com#WP_HOME=http://your_domain_or_IP#g" .env
sed -i "s#WP_SITEURL=\${WP_HOME}/wp#WP_SITEURL=\${WP_HOME}/wp#g" .env

# 设置 Nginx 服务
echo "Setting up Nginx for Bedrock..."
tee /etc/nginx/sites-available/bedrock <<EOF
server {
    listen 80;
    server_name 107.175.115.232;

    root /var/www/bedrock/web;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \\.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\\.ht {
        deny all;
    }
}
EOF

# 激活站点并重启 Nginx
ln -s /etc/nginx/sites-available/bedrock /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx

# 修正权限
echo "Adjusting permissions..."
chown -R www-data:www-data /var/www/bedrock

echo "Bedrock WordPress installation is complete."
