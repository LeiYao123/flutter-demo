#!/bin/bash
# 展示文件夹下所有文件的路径名
folder="./"

softfiles=$(find $PWD | xargs ls -ld $folder)
for sfile in ${softfiles}; do
    if [[ "$sfile" =~ svg$ ]]; then # 此处是获取.svg后缀的文件
        echo "${sfile}"
    fi
done