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

# install local plugin
cp -rvf /Users/weston/sites/wp_plugins/* ./wp-content/plugins/

# install all plugins
 wp plugin activate --all

# delete other themes
wp theme delete twentysixteen twentytwentythree twentytwentytwo

# Open the site in the browser
open http://$1.home

dev_php 

# 指定会话名称
SESSION="nginx"
FRONTEND_PROJECT_NAME = $1_fe

tmux send-keys -t nginx:$FRONTEND_PROJECT_NAME  "sh ~/dotfiles/bin/create_wp_nextjs_frontend.sh $1" C-m


# 创建新窗口并运行命令，同时命名新窗口为"npmdev"
#tmux new-window -t $SESSION -n npmdev "npm run dev"

# 发送通知
osascript -e 'display notification "npm run dev 已在tmux会话中运行" with title "运行通知"'






