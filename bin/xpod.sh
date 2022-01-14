#!/bin/sh

# 在10.11的环境下，如果pod执行命令找不到，需要重新覆盖安装
# for os x 10.11 you may use the shell below
#sudo gem install -n /usr/local/bin cocoapods

if [ ! -f "Podfile" ]; then
	echo "Podfile 文件不存在，程序将不会执行"
	exit 1
fi

pod install --no-repo-update