#!/bin/bash


## ----------------------- Config tips ----------------------- 

# vim ~/.nirc

# ; fallback when no lock found
# defaultAgent=pnpm # default "prompt"
# ; for global installs
# globalAgent=pnpm

# vim ~/.bash_profile
# export NI_CONFIG_FILE="$HOME/.nirc"

#sudo npm i -g npm@9.8.1 # npm10 not supported the node version that lower than v18.17.0
sudo npm i -g @antfu/ni

corepack enable
corepack enable npm
corepack prepare yarn@1.22.19  # for old-projects use classisc version
corepack prepare pnpm@latest --activate

pnpm setup

# ------- need to be installed globally ------
globalDeps=(
    # Dev tools
    cloc
    nrm
    pm2
    npm-check-updates
    json-server
    concurrently
    lerna
    commitizen
    gitmoji-cli
    git-cz
    tldr

    # Lang & Framework-CLIs
    typescript
    @vue/cli
    @react-native-community/cli
    create-react-app
    create-react-native-app
    create-react-native-module

    # build websites
    hexo-cli
    vuepress@1.9.10
)


# use yarn classic (v1.x) global scripts
function yarnClassicGlobalInstall() {
    echo "======= 本次通过 yarn global add 共计需要安装依赖 ${#globalDeps[*]} 个，请耐心等待 ======="
    for dependency in ${globalDeps[*]} 
    do
        sudo yarn global add $dependency --prefix /usr/local
    done
}

# use ni that all-in-one global install
function niGlobalInstall() {
    echo "======= 本次通过 'ni -g' 共计需要安装依赖 ${#globalDeps[*]} 个，请耐心等待 ======="
    for dependency in ${globalDeps[*]} 
    do
        ni -g $dependency
    done
}

# use ni that all-in-one global uninstall
function nunGlobalDeps() {
    echo "======= 本次通过 'nun -g' 共计需要移除依赖 ${#globalDeps[*]} 个，请耐心等待 ======="
    for dependency in ${globalDeps[*]} 
    do
        nun -g $dependency
    done
}

#yarnClassicGlobalAdd
#nunGlobalDeps
niGlobalInstall

