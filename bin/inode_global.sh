#!/bin/bash

## Base NPM Tools
npm install -g pnpm
npm install -g yarn
npm install -g node-gyp

# Usefull Dev tools
pnpm --global add cloc
pnpm --global add nrm
pnpm --global add pm2
pnpm --global add npm-check-updates
pnpm --global add npm-check # 一样的功能，不过表情比较多
pnpm --global add serve # 静态资源服务器
pnpm --global add json-server
pnpm --global add concurrently
pnpm --global add verdaccio #npm proxy
pnpm --global add lerna
pnpm --global add commitizen
pnpm --global add gitmoji-cli
pnpm --global add git-cz

# Lang & Framework-CLIs
pnpm --global add typescript
pnpm --global add hexo
pnpm --global add vuepress
pnpm --global add vitepress

pnpm --global add @nestjs/cli

pnpm --global add @vue/cli
pnpm --global add @tarojs/cli
pnpm --global add @warriorjs/cli

pnpm --global add create-react-app
pnpm --global add react-devtools
pnpm --global add @react-native-community/cli
pnpm --global add create-react-native-app
pnpm --global add create-react-native-module

# lint && babel plugins
pnpm --global add babel-eslint
pnpm --global add eslint
pnpm --global add tslint
pnpm --global add lint-staged
pnpm --global add eslint-plugin-html
pnpm --global add eslint-config-standard
pnpm --global add eslint-plugin-node
pnpm --global add eslint-plugin-promise
pnpm --global add eslint-plugin-standard
