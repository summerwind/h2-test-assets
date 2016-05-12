#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 [COUNT]"
  exit 1
fi

echo "File size: ${1} KiB"

for dir in "js" "css" "images"
do
  for path in `ls -1 ${dir}`
  do
    echo -n "Generating ${dir}/${path}..."
    dd if=/dev/zero of=${dir}/${path} bs=1024 count=${1} > /dev/null 2>&1
    echo "done"
  done
done

