#!/bin/zsh
source ~/.zshrc

# 接收项目名作为参数
WP_PROJECT_NAME=$1
FRONTEND_PROJECT_NAME="$1_fe"

# 确保脚本在出错时停止执行
set -e

# 切换目录
cd ~/sites

# 克隆Git仓库
git clone git@github.com:gxbsst/cms-wordpress-app.git "$FRONTEND_PROJECT_NAME"

# 进入项目目录
cd "$FRONTEND_PROJECT_NAME"

# 切换Node版本
nvm use 18

# 安装依赖
npm install

# 复制.env.local.example到.env.local
cp .env.local.example .env.local

# 修改.env.local文件中的WORDPRESS_API_URL
sed -i '' "s|WORDPRESS_API_URL=.*|WORDPRESS_API_URL=http://${WP_PROJECT_NAME}.home/graphql|" .env.local
tmux new-window -n $FRONTEND_PROJECT_NAME -d
tmux send-keys -t nginx:$FRONTEND_PROJECT_NAME "npm run dev" C-m
open "http://localhost:3000"


