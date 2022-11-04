#!/usr/bin/env bash
dir=`pwd`
project=$1
platform=$2
echo "$project"
if [ "$project" = "core" ];then
  if [ "$platform" = "my" ];then
    echo "开始编译支付宝..."
    sh "$dir/script/devMy.sh" 
  else
    echo "开始编译微信..."
    sh "$dir/script/devWx.sh"
  fi
fi

if [ "$project" = "jjz" ];then
  if [ "$platform" = "my" ];then
    echo "开始编译支付宝..."
    sh "$dir/scripts/devNextMy.sh"
  else
    echo "开始编译微信..."
    sh "$dir/scripts/devNextWx.sh"
  fi
fi
# 打开IDE
if [ "$project" = "auto" ];then
   cli auto --auto-port=9420 --project="$dir/weapp"
fi
