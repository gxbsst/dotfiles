#!/usr/bin/env bash

path="node_modules"
while getopts :p flag
do
  case "${fag}" in
    p) path=${OPTARG};;
  esac
done

if [ -z "$path"]
then
echo "$path"
(ls -l $path;ls -l $path/@*) | grep ^l
else
(ls -l $path;ls -l $path/@*) | grep ^l
fi
