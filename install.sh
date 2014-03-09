#!/bin/bash

plugins=(
    "nerdtree"
    "ctrlp.vim"
)

plugin_urls=(
    "git@github.com:scrooloose/nerdtree.git"
    "git@github.com:kien/ctrlp.vim.git"
)

dot_dir=$(cd $(dirname $0) && pwd)
autoload_dir="${dot_dir}/.vim/autoload"
bundle_dir="${dot_dir}/.vim/bundle"

# Update pathogen first
curl -L -s https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > "${autoload_dir}/pathogen.vim"

for i in ${!plugins[*]}; do
    cd "$bundle_dir"
    rm -rf "${plugins[$i]}"
    git clone "${plugin_urls[$i]}"
    cd "${plugins[$i]}"
    rm -rf .git
done

# Link shit
rm -rf ~/.vim
ln -s "${dot_dir}/.vim" ~/.vim
rm -rf ~/.vimrc
ln -s "${dot_dir}/.vimrc" ~/.vimrc

