#!/bin/sh

cd `dirname $0`
F=`pwd |sed -e "s#$HOME/\?##"`

for P in .*
do
    echo $P
    if [ "$P" = "." ]; then continue; fi
    if [ "$P" = ".." ]; then continue; fi
    # permissions
    chmod -R o-rwx,g-rwx $P
    # skip existing links
    if [ -h "$HOME/$P" ]; then continue; fi
    # backup existing dotfiles
    if [ -e "$HOME/$P" ]; then
        if [ -e "$HOME/${P}.backup" ]; then
            echo "Want to override $HOME/$P but backup already exists"
            continue;
        fi
        mv -v "$HOME/$P" "$HOME/${P}.backup"
    fi
    cp "$F/$P" "$HOME/$P"
done


mkdir ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
