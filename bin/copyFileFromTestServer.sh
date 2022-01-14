#!/bin/bash

echo "请输入测试服务器文件的绝对路径(0退出)："

read filePath

if [ 0 == ${filePath} ]; then
	exit 0
fi

scp -P5080 root@192.168.1.250:${filePath} .

open .
