#!/bin/bash


## ----------------------- Config tips ----------------------- 

# vim ~/.nirc

# ; fallback when no lock found
# defaultAgent=pnpm # default "prompt"
# ; for global installs
# globalAgent=pnpm

# vim ~/.bash_profile
# export NI_CONFIG_FILE="$HOME/.nirc"

sudo corepack enable
sudo corepack prepare yarn@1.22.22 # for old-projects use classisc version
sudo corepack prepare pnpm@9.1.2 --activate

pnpm setup
pnpm add -g @antfu/ni

# ------- need to be installed globally ------
globalDeps=(
    # Lang 
    typescript 

    # Dev tools
    cloc
    commitizen
    gitmoji-cli
    git-cz
    nrm
    taze

    ## frontend frameworks
    create-react-app
    create-next-app
    create-remix
    react-native
    expo-cli
    create-expo-module
    ### Build smaller, faster, and more secure desktop applications with a web frontend.
    #tauri-app@latest

    ## backend services
    pm2
    @nestjs/cli
    
    # purpular websites
    hexo-cli
    create-docusaurus
    create-gatsby
    
    # Interests
    emoj
)


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

#nunGlobalDeps
niGlobalInstall
