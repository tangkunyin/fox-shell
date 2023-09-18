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
    vuepress@next
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

function yarnGlobalRemove() {
    echo "======= 本次通过 yarn global remove 将移除 ${#globalDeps[*]} 个类库，请耐心等待 ======="
    for dependency in ${globalDeps[*]} 
    do
        yarn global remove $dependency
    done

    echo "======= 正在清理yarn cache，请稍等 ======="
    yarn cache clean
}

yarnGlobalRemove
