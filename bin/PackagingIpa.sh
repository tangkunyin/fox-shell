#!/bin/bash

#	
#	说明：对指定的target进行打包，成功后的ipa文件保存在家目录中
#

# 证书配置
DEVELOPPER_NAME="iPhone Distribution: tang kunyin (426U84EDEE)"
PROVISONNING_PROFILE="~/mobileprovisions/iOS_APP_Distribution.mobileprovision"

# 1、执行清理工作
xcodebuild -list
echo "=================== 请在上面复制您要操作的Target =================="
read inputTarget
echo "=================== 正在执行清理工作，稍等 =================="
xcodebuild -target ${inputTarget} clean
echo "=================== 清理完成，执行编译，稍等 =================="

# 2、根据情况执行编译操作
if [ -d "${inputTarget}.xcworkspace" ]; then
	xcodebuild -workspace ${inputTarget}.xcworkspace -scheme ${inputTarget} -configuration Release -derivedDataPath build
	appFilePath="./build/Build/Products/Release-iphoneos"
elif [ -d "${inputTarget}.xcodeproj" ]; then
	xcodebuild -target ${inputTarget} -derivedDataPath ${inputTarget}/build
	appFilePath="./build/Release-iphoneos"
else
	echo "当前文件夹没有可被编译的项目，程序自动退出"
	exit 0
fi

# 检查编译是否成功
if [ $? != 0 ]
then
	echo "编译可能出错，程序将终止打包操作"
	exit 1
fi

# 3、打包
echo "=================== 编译完成，执行打包，稍等 =================="
xcrun -sdk iphoneos PackageApplication -v ${appFilePath}/${inputTarget}.app -o ~/${inputTarget}.ipa --sign "${DEVELOPPER_NAME}"  --embed "${PROVISONNING_PROFILE}"

# 4、结束
echo "=================== 打包完成，谢谢使用 =================="
open ~
