#!/usr/bin/env bash

declare -A RAW_PLUGINS
declare -A GIT_PLUGINS

RAW_PLUGINS=(
    [python.vim]="http://www.vim.org/scripts/download_script.php?src_id=21056"
)

GIT_PLUGINS=(
    [nerdtree]="https://github.com/scrooloose/nerdtree.git"
    [ctrlp.vim]="https://github.com/kien/ctrlp.vim.git"
    [vim-python-pep8-indent]="https://github.com/hynek/vim-python-pep8-indent.git"
    [ack.vim]="https://github.com/mileszs/ack.vim.git"
    [molokai]="https://github.com/tomasr/molokai.git"
    [vim-javascript]="https://github.com/pangloss/vim-javascript.git"
    [vim-markdown]="https://github.com/tpope/vim-markdown.git"
)

DOT_DIR=$(cd $(dirname $0) && pwd)
AUTOLOAD_DIR="${DOT_DIR}/.vim/autoload"
BUNDLE_DIR="${DOT_DIR}/.vim/bundle"

for dir in ${AUTOLOAD_DIR} ${BUNDLE_DIR}; do
    mkdir $dir
    rm -rf ${dir}/*
done
for key in ${!GIT_PLUGINS[@]}; do
    echo $key
done
for key in ${!RAW_PLUGINS[@]}; do
    echo $key
done


function run {
    # Update pathogen first
    curl -L -s https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > ${AUTOLOAD_DIR}/pathogen.vim

    for key in ${!GIT_PLUGINS[@]}; do
        cd $BUNDLE_DIR
        rm -rf $key
        git clone ${GIT_PLUGINS[${key}]}
        cd $key
        rm -rf .git
    done

    for key in ${!RAW_PLUGINS[@]}; do
        cd $BUNDLE_DIR
        rm -rf $key
        curl -L ${RAW_PLUGINS[${key}]} > $key
    done

    # Link shit
    rm -rf ~/.vim
    ln -s ${DOT_DIR}/.vim ~/.vim
    rm -rf ~/.vimrc
    ln -s ${DOT_DIR}/.vimrc ~/.vimrc
}

run
