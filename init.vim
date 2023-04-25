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
set formatoptions-=o
set formatoptions+=r

" for neovide
set guifont=Jetbrains\ Mono:h11

let mapleader = ' '

luafile ~/.config/nvim/start.lua
