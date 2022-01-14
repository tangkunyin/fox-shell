#!/bin/bash

echo "1.查看当前Git凭证存储信息"
echo "2.设置Git凭证存储为cache策略"
echo "3.设置Git凭证存储为store策略"
echo "4.设置Git凭证存储为osxkeychain策略"
echo "5.清除store策略信息"
echo "=== 任意键退出 ==="

function storeCredential(){
	echo "执行：git config --global credential.helper ${1}"
	git config --global credential.helper ${1}
}

function readConfig(){
	cd ~
	if [ -f ".git-credentials" ]; then
		echo ""
		cat .git-credentials
		echo ""
	else
		echo "您没有设置Git凭证存储信息"
	fi
}

read choose

if [ ! ${choose} ]; then
	echo "感谢使用，再见！！！"
	exit 1
fi

if [[ ${choose} == 1 ]]; then
	readConfig
elif [[ ${choose} == 2 ]]; then
	storeCredential "cache"
elif [[ ${choose} == 3 ]]; then
	storeCredential "store"
elif [[ ${choose} == 4 ]]; then
	storeCredential "osxkeychain"
elif [[ ${choose} == 5 ]]; then
	cd ~
	rm -rf .git-credentials
fi

echo ""
echo "操作完成"
echo ""

# 更多说明参见：
# 	http://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%87%AD%E8%AF%81%E5%AD%98%E5%82%A8