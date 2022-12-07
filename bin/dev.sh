#!/usr/bin/env bash
usage() { echo "使用方法: $0 dev (core|jjz) (wx|my) [-p (home|order|groupBuy|store|love|center)]" 1>&2; exit 1;}

dir=`pwd`
platform=$2
project=$1

case "${project}" in 
	core | jjz)	
		shift
	;;
esac

case "${platform}" in 
	my | wx)	
		shift
	;;
esac

while getopts ":p:" arg; do
  case "${arg}" in
    p)
      p=${OPTARG}
      echo "p is ${OPTARG}"
      ;;
    *)
       usage
      ;;
  esac
done

echo "$project"
if [ "$project" = "core" ];then
  if [ "$platform" = "my" ];then
    echo "开始编译支付宝..."
    sh "$dir/script/devMy.sh" 
  else
    echo "开始编译微信..."
		if [ -n "$p" ];then
			p="$(tr '[:lower:]' '[:upper:]' <<< ${p:0:1})${p:1}"
			sh "$dir/script/devWx${p}.sh"
		else
    	sh "$dir/script/devWx.sh"
		fi
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
  if [[ "$platform" = "sqb" ]]; then
   cli auto --auto-port=9420 --project="$dir"
  else 
   cli auto --auto-port=9420 --project="$dir/weapp"
  fi
fi


