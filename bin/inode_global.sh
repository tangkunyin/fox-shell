#!/bin/bash

## Base NPM Tools
npm install -g pnpm
npm install -g yarn
npm install -g node-gyp

# Usefull Dev tools
yarn global add cloc
yarn global add nrm
yarn global add pm2
yarn global add npm-check-updates
yarn global add npm-check # 一样的功能，不过表情比较多
yarn global add serve # 静态资源服务器
yarn global add json-server
yarn global add concurrently
yarn global add verdaccio #npm proxy
yarn global add lerna
yarn global add commitizen
yarn global add gitmoji-cli
yarn global add git-cz

# Lang & Framework-CLIs
yarn global add typescript
yarn global add hexo
yarn global add vuepress
yarn global add vitepress

yarn global add @nestjs/cli

yarn global add @vue/cli
yarn global add @tarojs/cli
yarn global add @warriorjs/cli

yarn global add create-react-app
yarn global add react-devtools
yarn global add @react-native-community/cli
yarn global add create-react-native-app
yarn global add create-react-native-module

# lint && babel plugins
yarn global add babel-eslint
yarn global add eslint
yarn global add tslint
yarn global add lint-staged
yarn global add eslint-plugin-html
yarn global add eslint-config-standard
yarn global add eslint-plugin-node
yarn global add eslint-plugin-promise
yarn global add eslint-plugin-standard
