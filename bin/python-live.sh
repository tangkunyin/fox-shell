#!/bin/bash
# https://stackoverflow.com/questions/30499795/how-can-i-make-homebrews-python-and-pyenv-live-together
pyenv-brew-relink() {
    rm -f "$HOME/.pyenv/versions/*-brew"
    for i in $(brew --cellar)/python* ; do
      for p in $i/*; do
        echo $p
        ln -s -f $p $HOME/.pyenv/versions/${p##/*/}-brew
      done  
    done
    pyenv rehash
}

pyenv-brew-relink
