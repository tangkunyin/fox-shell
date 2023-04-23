#!/bin/bash


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
    tldr
    # Lang & Framework-CLIs
    typescript
    hexo
    vuepress
    vitepress
    @nestjs/cli
    @vue/cli
    @tarojs/cli
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
npm config set registry https://registry.npmmirror.com/

npm install -g npm
npm install -g node-gyp --force

corepack enable
corepack enable npm

npm install -g yarn --force

## use yarn2
#yarn set version stable
yarn config set registry https://registry.npmmirror.com/

yarnGlobalAdd
