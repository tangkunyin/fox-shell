#!/bin/bash

# 证书配置
PROVISONNING_PROFILE_NAME="iPhone Distribution: tang kunyin (426U84EDEE)"

# 脚本配置
TEMP_TARGETS_FILE="ipaTool_tempTargetsInfo.txt"

function ipaPackaging(){
	if [ ! $1 ]; then
		echo "传入参数错误,终止执行"
		exit 1
	fi
	echo "=================== 打包启动,执行清理,稍等 =================="
	xcodebuild -target ${1} clean
	echo "=================== 清理完成,执行编译,稍等 =================="

	xcodebuild archive -workspace ${1}.xcworkspace -scheme ${1} -archivePath ${1}.xcarchive

	if [ $? != 0 ]
	then
		echo "编译可能出错，程序将终止打包操作"
		exit 1
	fi

	xcodebuild -exportArchive -archivePath ${1}.xcarchive -exportPath ${1} -exportFormat ipa -exportProvisioningProfile ${PROVISONNING_PROFILE_NAME}	
}

function removeTempFile(){
	if [ -f "${TEMP_TARGETS_FILE}" ]; then
		rm "${TEMP_TARGETS_FILE}"
	fi
}

# ----------------   定义结束,脚本开始   ----------------------

clear

removeTempFile

touch "${TEMP_TARGETS_FILE}"

xcodebuild -list | tail +3 >> "${TEMP_TARGETS_FILE}"

targetStringIndex=0
while read myLine; do
	if [[ $myLine ]]; then
		position=${#myLine}-5
		subString=${myLine:position}
		if [ "${subString}" != "Tests" ]; then
			# echo $myLine 
			targetArray[${targetStringIndex}]=$myLine
			targetStringIndex=`expr $targetStringIndex + 1`
			# echo $targetStringIndex
		fi
	else
		break
	fi
done < $TEMP_TARGETS_FILE

for (( i = 0; i < ${#targetArray[@]}; i++ )); do
		# echo "${targetArray[$i]}"
		ipaPackaging "${targetArray[$i]}"
done

echo "=================== 打包结束,谢谢使用,再见 =================="

removeTempFile

open .
