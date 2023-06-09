let loaded_netrw = 1
let loaded_netrwPlugin = 1
let loaded_matchit = 1
set wildmenu
set mouse=a
set noswapfile
set nu
set rnu
set ts=4
set sw=4
set sts=0
set expandtab
set shiftround
set ignorecase
set smartcase
set termguicolors
set hlsearch
set clipboard=unnamedplus
set updatetime=100
set foldmethod=indent
set foldlevelstart=99
set signcolumn=yes

" Disable auto insert commentstring when pressing o in a comment line.
" Auto insert commentstring when pressing <Enter> in insert mode in a comment
" line.
au BufEnter * set fo-=o fo+=r

" for neovide
set guifont=Jetbrains\ Mono:h11

let mapleader = ' '

luafile ~/.config/nvim/start.lua
