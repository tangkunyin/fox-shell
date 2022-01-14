#!/bin/sh

echo 'Welcome use React Native OffLine Package Manager Tool(iOS only so far...)'

if [ ! -f "index.ios.js" ]; then
	echo "index.ios.js file not exists. shell exit"
	exit 1
fi

read -p "input develop mode(true or false): " devModel

if [ -f "./ios/main.jsbundle" ]; then
	rm "./ios/main.jsbundle"
	rm -rf "./ios/assets"
fi

react-native bundle --entry-file index.ios.js --bundle-output ./ios/main.jsbundle --platform ios --assets-dest ./ios --dev {devModel}


if [ $? != 0 ]
then
	echo "react-native bundle command may excuted error..."
	exit 1
fi

echo 'Packaging over. Don not forget add sources(media) to project'

open .
