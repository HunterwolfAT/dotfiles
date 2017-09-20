set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jdonaldson/vaxe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" air-line
set laststatus=2 "have air-line show up even with only one window

" syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_haxe_checkers = ['haxe']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" My old .vimrc:
set incsearch
set autoindent
set number
set showmatch
set showmode
"colorscheme distinguished
syntax on
""cp='".,;)]}
"set bg=light
set ignorecase
set smartcase
set scrolloff=3
set showbreak=↪
filetype on
filetype plugin on
filetype indent on
set hlsearch
set smarttab

map <C-h>  <C-W>h
map <C-j>  <C-W>j
map <C-k>  <C-W>k
map <C-l>  <C-W>l

map <F5> :tabnew<cr>
map <F6> :tabclose<cr>
map <F7> :tabp<cr>
map <F8> :tabn<cr>
