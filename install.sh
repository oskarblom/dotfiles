#!/bin/bash

dotdir=$(cd $(dirname $0) && pwd)
ln -s ${dotdir}/.vim ~/.vim
ln -s ${dotdir}/.vimrc ~/.vimrc
