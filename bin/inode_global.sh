#!/bin/bash

corepack enable

# ------- need to be installed globally ------
globalDeps=(
    # Dev tools
    cloc
    nrm
    pm2
    npm-check-updates
    npm-check
    serve
    json-server
    concurrently
    verdaccio
    lerna
    commitizen
    gitmoji-cli
    git-cz
    # Lang & Framework-CLIs
    typescript
    hexo
    vuepress
    vitepress
    @nestjs/cli
    @vue/cli
    @tarojs/cli
    @warriorjs/cli
    create-react-app
    react-devtools
    @react-native-community/cli
    create-react-native-app
    create-react-native-module
    # lint && babel plugins
    babel-eslint
    eslint
    tslint
    lint-staged
    eslint-plugin-html
    eslint-config-standard
    eslint-plugin-node
    eslint-plugin-promise
    eslint-plugin-standard
)

function yarnGlobalAdd() {
    echo "======= 本次通过 yarn global add 共计需要安装依赖 ${#globalDeps[*]} 个，请耐心等待 ======="
    for dependency in ${globalDeps[*]} 
    do
        yarn global add $dependency --prefix /usr/local
    done
}


## Base NPM Tools
npm install -g yarn
npm install -g pnpm
npm install -g node-gyp


## use yarn2
#yarn set version stable

yarnGlobalAdd