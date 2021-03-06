set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'loremipsum'
Plugin 'kchmck/vim-coffee-script'


call vundle#end()            " required
filetype plugin indent on    " required
