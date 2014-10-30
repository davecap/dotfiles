                  _
           __   _(_)_ __ ___  _ __ ___
           \ \ / / | '_ ` _ \| '__/ __|
            \ V /| | | | | | | | | (__
             \_/ |_|_| |_| |_|_|  \___|


## Install

Make sure you don't already have a `~/.vimrc` and `~/.vim/`. If you do, back
them up!

    git clone https://github.com/davecap/vimrc.git    
    cd vimrc
    mkdir ~/.vim
    cp .vimrc ~/

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall +qall


## (Extra) Special Powerline fonts

I use vim-airline instead of Powerline because it's written in 100% vimscript.

For the nice looking powerline symbols to appear, you will need to install a
patched font. Instructions can be found in the official powerline documentation.
Prepatched fonts can be found in the powerline-fonts repository:

    git clone https://github.com/Lokaltog/powerline-fonts.git


[Look here for instructions on how to install the patched fonts.](https://powerline.readthedocs.org/en/master/installation.html#patched-fonts)
