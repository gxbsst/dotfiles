#!/bin/zsh
source ~/.zshrc
cd ~/sites/

# Create a new WordPress app
mkdir $1 && cd $1

# Create a new database
/opt/homebrew/bin/mysql  -u root -e "CREATE DATABASE $1"
# Download WordPress
wp core download --locale=zh_CN

# Create wp-config.php
 wp config create --dbname=$1 --dbuser=root --dbpass="" --locale=zh_CN

# Install WordPress
wp core install --url=$1.home --title=$1 --admin_user=gxbsst --admin_password=51448888 --admin_email=gxbsst@gmail.com

# Install plugin wpgraphql
wp plugin install wp-graphql --activate

# Open the site in the browser
open http://$1.home

