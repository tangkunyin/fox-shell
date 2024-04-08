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
corepack prepare yarn@1.22.22 # for old-projects use classisc version
corepack prepare pnpm@8.15.6 --activate

pnpm setup

# ------- need to be installed globally ------
globalDeps=(
    # Lang 
    typescript 

    ## frontend
    create-react-app
    create-next-app
    create-remix

    ## backend
    pm2
    nodemon
    think-cli
    
    # Dev tools
    cloc
    commitizen
    concurrently
    gitmoji-cli
    git-cz
    nrm
    npm-check-updates
    tldr

    # Interests
    emoj
    deepl-translator-cli

    # static website
    hexo-cli
    create-docusaurus
    create-gatsby
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

