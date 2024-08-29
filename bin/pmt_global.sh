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
sudo corepack prepare yarn@latest
sudo corepack prepare pnpm@9.8.0 --activate

pnpm setup
pnpm add -g @antfu/ni

# ------- need to be installed globally ------
globalDeps=(
    # Dev tools
    zx
    cloc
    commitizen
    gitmoji-cli
    git-cz
    nrm
    taze
    vercel

    ## frontend frameworks
    create-next-app
    tauri-app


    ## backend services
    pm2
    

    # static site generators
    hexo-cli
    create-docusaurus
    
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
